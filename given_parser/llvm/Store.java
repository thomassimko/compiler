package llvm;

import arm.ArmInstruction;
import arm.ArmStore;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.FinalRegisters.StackPointer;
import llvm.lattice.LatticeValue;
import llvm.value.Register;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public class Store implements Instruction {

    private String type;
    private Value targetPtr;
    private Value source;

    public Store(String type, Value targetPtr, Value source) {
        this.targetPtr = targetPtr;
        this.source = source;
        this.type = type;
        this.addInstructionToRegisters();

    }
    @Override
    public String toLLVM() {
        return "store " + type + " " + source.toLLVM() + ", " + type + "* " + targetPtr.toLLVM();
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister r1 = targetPtr.toArmRegister(instructions);
        ArmVirtualRegister r2 = source.toArmRegister(instructions);
        if (offsets.containsKey(targetPtr.toLLVM().replace("%", ""))) {
            instructions.add(new ArmStore(r2, StackPointer.getInstance(),
                    new ArmImmediate("" + offsets.get(targetPtr.toLLVM().replace("%", "")))));
        }
        else {
            instructions.add(new ArmStore(r1,r2));

        }
    }

    @Override
    public void addInstructionToRegisters() {
        if(targetPtr instanceof Register) {
            ((Register)targetPtr).setDef(this);
        }
        if(source instanceof Register) {
            ((Register)source).addUse(this);
        }
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        return null;
    }

    @Override
    public Register[] getUsedRegisters() {
        //shouldnt matter
        return new Register[0];
    }

    @Override
    public Register getTarget() {
        return null;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {
    }
}
