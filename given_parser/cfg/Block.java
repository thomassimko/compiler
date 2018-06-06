package cfg;

import arm.ArmInstruction;
import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmValue;
import arm.ArmValue.FinalRegisters.NotInterferingRegister;
import arm.Branch;
import arm.BranchType;
import llvm.Instruction;
import llvm.InvocationCall;
import llvm.Phi;
import llvm.value.Register;
import llvm.value.Value;

import java.util.*;

public abstract class Block {

    private List<Block> predecessors;
    private List<Block> successors;
    private String label;
    private List<Instruction> llvmCode;
    private String llvmLabel;
    private boolean hasReturn;
    private List<ArmInstruction> armCode;
    private Set<ArmRegister> liveOut;
    private Set<ArmRegister> genSet;
    private Set<ArmRegister> killSet;
    private HashMap<String, Value> currentDef;
    private boolean sealed;
    private List<Phi> incompletePhis;
    private List<Phi> completedPhis;
    private List<Block> allSuccessors;
    private boolean touchedSuccessor;
    private String function;


    public Block(String label, String function) {
        this.label = label;
        this.successors = new ArrayList<>();
        this.predecessors = new ArrayList<>();
        llvmCode = new ArrayList<>();
        this.llvmLabel = BlockCounter.getNextBlockLabel();
        liveOut = new HashSet<>();
        genSet = new HashSet<>();
        killSet = new HashSet<>();
        currentDef = new HashMap<>();
        sealed = false;
        incompletePhis = new ArrayList<>();
        completedPhis = new ArrayList<>();
        this.function = function;
    }

    public List<Block> getSuccessors() {
        return this.successors;
    }

    public String getLabel() {
        return this.label;
    }

    public String getGraphVisFormat() {
        StringBuilder output = new StringBuilder();
        for (Block successor: successors) {
            output.append(this.label + " -> " + successor.getLabel() + "\n");
        }
        for (Block predecessor: predecessors) {
            output.append(this.label + " -> " + predecessor.getLabel() + " [style=dashed]\n");
        }
        return output.toString();
    }

    public void addSuccessor(Block block) {
        this.successors.add(block);
        block.addPredecessor(this);
    }

    public void addPredecessor(Block block) {
        this.predecessors.add(block);
    }

    public boolean hasEndBlockSuccessor() {
        for(Block block: this.successors) {
            if (block instanceof EndBlock) {
                return true;
            }
        }
        return false;
    }

    public List<Instruction> getLLVM() {
        return llvmCode;
//        List<Instruction> finalList = new ArrayList<>();
//        finalList.addAll(this.completedPhis);
//        finalList.addAll(llvmCode);
//
//        for(Instruction inst : llvmCode) {
//            System.out.println(inst.toLLVM());
//        }
//
//        return finalList;
    }

    public List<Instruction> getLLVMWithPhis() {
        List<Instruction> finalList = new ArrayList<>();
        finalList.addAll(this.completedPhis);
        finalList.addAll(llvmCode);
        return finalList;
    }

    public void addInstructionToLLVM(Instruction instruction) {
        llvmCode.add(instruction);
    }

    public String getLlvmLabel() {
        return this.llvmLabel;
    }

    public boolean getHasReturn() {
        return this.hasReturn;
    }

    public void setHasReturn() {
        hasReturn = true;
    }

    public void setArmCode(List<ArmInstruction> armCode) {
        this.armCode = armCode;
    }

    public List<ArmInstruction> getArmCode() {
        return armCode;
    }

    public Set<ArmRegister> getLiveOut() {
        return this.liveOut;
    }

    public Set<ArmRegister> getGenSet() {
        return this.genSet;
    }

    public Set<ArmRegister> getKillSet() {
        return this.killSet;
    }



    public void setGenKillSets() {
        for(ArmInstruction instruction : this.armCode) {
            for(ArmValue value: instruction.getSources()) {
                if(value instanceof ArmRegister) {
                    ArmRegister register = (ArmRegister) value;
                    if(!register.existsInSet(killSet)
                            && !register.existsInSet(genSet)
                            && !(register instanceof NotInterferingRegister)) {
                        genSet.add(register);
                    }
                }
            }
            for(ArmRegister register:instruction.getTargets()) {
                if (!register.existsInSet(killSet)
                        && !(register instanceof NotInterferingRegister)) {

                    killSet.add(register);
                }
            }
        }
    }

    public boolean setLiveOut() {
        Set<ArmRegister> newLiveOut = new HashSet<>();

        for(Block successor: successors) {
            Set<ArmRegister> tempSet = new HashSet<>();
            tempSet.addAll(successor.getLiveOut());
            tempSet.removeAll(successor.getKillSet());
            tempSet.addAll(successor.getGenSet());
            newLiveOut.addAll(tempSet);
        }

        boolean equals = newLiveOut.size() == liveOut.size();

        if(equals) {
            String[] liveOutArr = liveOut.stream().map(armRegister -> armRegister.toArm()).toArray(String[]::new);
            String[] newLiveOutArr = newLiveOut.stream().map(armRegister -> armRegister.toArm()).toArray(String[]::new);
            Arrays.sort(liveOutArr);
            Arrays.sort(newLiveOutArr);

            for(int i = 0; i < liveOutArr.length; i++) {
                if (!liveOutArr[i].equals(newLiveOutArr[i])) {
                    equals = false;
                }
            }
        }

        if(!equals) {
            this.liveOut.addAll(newLiveOut);
            return true;
        }
        return false;
    }

    public void buildInterferenceGraph(Set<ArmRegister> registers) {
//        System.out.println(label);
//        System.out.println("gen: " + String.join(", ", genSet.stream().map(armRegister -> armRegister.toArm()).toArray(String[]::new)));
//        System.out.println("kill: " + String.join(", ", killSet.stream().map(armRegister -> armRegister.toArm()).toArray(String[]::new)));
//        System.out.println("live: " + String.join(", ", liveOut.stream().map(armRegister -> armRegister.toArm()).toArray(String[]::new)));
//        System.out.println();
        for(int i = armCode.size() - 1; i >= 0; i--) {
            ArmInstruction curInstruction = armCode.get(i);

            for(ArmRegister curTarget:curInstruction.getTargets()) {

                ArmRegister curRegister = curTarget;

//                System.out.println("curInst: " + curInstruction.getTargets().toArm());
//                System.out.println("curLive: " + String.join(", ", liveOut.stream().map(armRegister -> armRegister.toArm()).toArray(String[]::new)));
                liveOut = curRegister.removeFromSet(liveOut);
                if(!curRegister.existsInSet(registers))
                    registers.add(curRegister);
                else {
                    //string exists find current
                    curRegister = registers.stream().filter(armRegister -> armRegister.stringEquals(curTarget)).toArray(ArmRegister[]::new)[0];

                }

                for (ArmRegister reg : this.liveOut) {
                    ArmRegister setReg = reg;
                    if(!reg.existsInSet(registers))
                        registers.add(reg);
                    else {
                        setReg = registers.stream().filter(armRegister -> armRegister.stringEquals(reg)).toArray(ArmRegister[]::new)[0];
                    }

                    if(!this.checkIfEdgeExists(registers, curRegister, setReg)
                            && !curRegister.hasInterference(setReg)) {
                        curRegister.addInterference(setReg);
                        setReg.addInterference(curRegister);
                    }
                }
            }


            for(ArmValue value: curInstruction.getSources()) {
                if (value instanceof ArmRegister) {
                    ArmRegister register = (ArmRegister) value;
                    if(!register.existsInSet(liveOut)) {
                        liveOut.add(register);
                    }
                }
            }

        }

    }

    private boolean checkIfEdgeExists(Set<ArmRegister> registers, ArmRegister reg1, ArmRegister reg2) {
        Iterator<ArmRegister> iter = registers.iterator();
        while(iter.hasNext()) {
            ArmRegister current = iter.next();
            if(current.stringEquals(reg1)) {
                if(current.hasInterference(reg2)) {
                    return true;
                }
            }
        }
        return false;

    }

    public HashMap<String, Value> getCurrentDef() {
        return this.currentDef;
    }

    public void sealBlock() {
        this.sealed = true;
    }

    public boolean isSealed() {
        return sealed;
    }

    public List<Block> getPredecessors() {
        return predecessors;
    }

    public List<Phi> incompletePhis() {
        return incompletePhis;
    }
    public List<Phi> completedPhis() {
        return completedPhis;
    }

    public void addCompletedPhi(Phi phi) {
        completedPhis.add(phi);
    }

    public void addIncompletePhi(Phi phi) {
        incompletePhis.add(phi);
    }

    public void addPhiMove(List<ArmInstruction> inst) {
        boolean set = false;
        for(int i = this.armCode.size() - 1; i >= 0 && !set ; i--) {
            ArmInstruction curInst = this.armCode.get(i);
//            for(ArmRegister reg:curInst.getTargets()) {
//                if(inst.getSources()[0].equals(reg)) {
//                    set = true;
//                    this.armCode.add(i, inst);
//                    break;
//                }
//            }
            if((!(curInst instanceof Branch)) || ((curInst instanceof Branch) && ((Branch) curInst).getBranchType() == BranchType.L)) {
                set = true;
                this.armCode.addAll(i + 1, inst);
            }
        }
        if(!set) {
            this.armCode.addAll(0, inst);
        }
    }

    public Set<Register> getRegisters() {
        Set<Register> registers = new HashSet<>();

        for(Instruction inst: this.getLLVMWithPhis()) {
            for(Register reg: inst.getUsedRegisters()) {
                registers.add(reg);
            }
        }
        return registers;
    }

    public List<Instruction> getFinalLLVM() {
        List<Instruction> usefulInstructions = new ArrayList<>();
        for(Instruction inst: this.getLLVMWithPhis()) {
            if(inst.isUseful()) {
                usefulInstructions.add(inst);
            }
        }
        return usefulInstructions;
    }

    public void inlineFunction(InvocationCall call, List<Instruction> instructions) {
        //remove the branch
        instructions.remove(instructions.size() - 1);

        int index = this.llvmCode.indexOf(call);
        this.llvmCode.addAll(index, instructions);
        this.llvmCode.remove(call);
    }

    public String getFunction() {
        return this.function;
    }
}
