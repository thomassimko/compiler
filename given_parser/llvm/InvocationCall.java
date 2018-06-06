package llvm;

import arm.*;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmRegister;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;
import arm.ArmValue.FinalRegisters.StackPointer;
import arm.Branch;
import llvm.lattice.LatticeBottom;
import llvm.lattice.LatticeInteger;
import llvm.lattice.LatticeValue;
import llvm.value.Register;
import llvm.value.Value;
import llvm.value.ValueLiteral;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class InvocationCall extends AbstactInstruction {

    private Register storedRegister;
    private String retType;
    private String functionName;
    private Value[] args;
    private String[] types;

    public InvocationCall(Register storedRegister, String retType, String functionName, Value[] args, String[] types) {
        super();
        this.storedRegister = storedRegister;
        this.retType = retType;
        this.functionName = functionName;
        this.args = args;
        this.types = types;
        this.addInstructionToRegisters();

    }

    public InvocationCall(String retType, String functionName, Value[] args, String[] types) {
        this.storedRegister = null;
        this.retType = retType;
        this.functionName = functionName;
        this.args = args;
        this.types = types;
        this.addInstructionToRegisters();
    }

    @Override
    public String toLLVM() {
        StringBuilder output = new StringBuilder();
        if(this.storedRegister != null) {
            output.append(storedRegister.toLLVM() + " = ");
        }
        output.append("call " + retType + " @" + functionName + "(");
        for(int i = 0; i<args.length; i++) {
            output.append(types[i] + " " + args[i].toLLVM() + ", ");
        }
        if(output.lastIndexOf(",") != -1)
            output.deleteCharAt(output.lastIndexOf(","));
        output.append(')');
        return output.toString();
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {

        int stackSize = (offsets.size()) * 4;
        for(int i = 0; i<args.length; i++) {
            ArmRegister valueReg = args[i].toArmRegister(instructions);

            if (i < 4) {
                ArmFinalRegister reg = new ArmFinalRegister("r" + i);
                ArmInstruction move = new Move(MoveType.DEFAULT, reg, valueReg, 0, true);
                instructions.add(move);
            }
            else {
                ArmStore store = new ArmStore(valueReg, StackPointer.getInstance(), new ArmImmediate(stackSize + ""));
                instructions.add(store);
                offsets.put(valueReg.toArm(), stackSize);
                stackSize += 4;
            }
        }
        ArmInstruction branch = new Branch(BranchType.L, functionName, args.length);
        instructions.add(branch);

        if (storedRegister != null) {
            ArmInstruction move = new Move(
                    MoveType.DEFAULT,
                    storedRegister.toArmRegister(instructions),
                    new ArmFinalRegister("r0"),
                    0,
                    false);
            instructions.add(move);
        }
    }

    @Override
    public void addInstructionToRegisters() {
        if(storedRegister != null) {
            storedRegister.setDef(this);

        }
        for(Value val: args) {
            if(val instanceof Register) {
                ((Register)val).addUse(this);
            }
        }
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        return new LatticeBottom();
    }

    @Override
    public Register[] getUsedRegisters() {
        List<Register> registers = new ArrayList<>();
        if(storedRegister != null) {
            registers.add(storedRegister);
        }
        for(Value val:args) {
            if(val instanceof Register) {
                registers.add((Register) val);
            }
        }
        Register[] regArr = new Register[]{};
        return registers.toArray(regArr);
    }

    @Override
    public Register getTarget() {
        return storedRegister;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {

        for(int i = 0; i < args.length; i++) {
            Value val = args[i];
            if(val instanceof Register) {
                LatticeValue value = lattice.get(val);
                if(value instanceof LatticeInteger) {
                    args[i] = new ValueLiteral(((LatticeInteger) value).getValue() + "");
                }
            }
        }
    }

    public String getFunctionName() {
        return this.functionName;
    }

    public int getNumArgs() {
        return args.length;
    }

    public Value[] getArgs() {
        return this.args;
    }

    @Override
    public Value[] getSources() {
        return args;
    }

    @Override
    public void replaceSource(HashMap<Value, Value> newValueMappings) {
        for(int i = 0; i < args.length; i++) {
            Value arg = args[i];
            if(newValueMappings.containsKey(arg)) {

                if(arg instanceof Register) {
                    ((Register) arg).removeUse(this);
                }
                args[i] = newValueMappings.get(arg);

                if(arg instanceof Register) {
                    ((Register) arg).addUse(this);
                }
            }
        }
    }
}
