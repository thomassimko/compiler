package llvm;

import arm.ArmInstruction;
import arm.ArmStore;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.FinalRegisters.StackPointer;
import llvm.lattice.LatticeValue;
import llvm.value.Register;
import llvm.value.Value;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Store extends AbstactInstruction {

    private String type;
    private Value targetPtr;
    private Value source;

    public Store(String type, Value targetPtr, Value source) {
        super();
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
            ((Register)targetPtr).addUse(this);
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
        List<Register> registers = new ArrayList<>();
        if(targetPtr instanceof Register) {
            registers.add((Register) targetPtr);
        }
        if(source instanceof Register) {
            registers.add((Register) source);
        }
        Register[] regArray = new Register[registers.size()];
        return registers.toArray(regArray);
    }

    @Override
    public Register getTarget() {
//        if(targetPtr instanceof Register) {
//            return (Register) targetPtr;
//        }
        return null;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {
    }

    @Override
    public Value[] getSources() {
        return new Value[]{source, targetPtr};
    }

    @Override
    public void replaceSource(HashMap<Value, Value> newValueMappings) {

        if(newValueMappings.containsKey(source)) {
            if(source instanceof Register) {
                ((Register) source).removeUse(this);
            }
            source = newValueMappings.get(source);

            if(source instanceof Register) {
                ((Register) source).addUse(this);
            }
        }
        if(newValueMappings.containsKey(targetPtr)) {
            if(targetPtr instanceof Register) {
                ((Register) targetPtr).removeUse(this);
            }
            targetPtr = newValueMappings.get(targetPtr);

            if(targetPtr instanceof Register) {
                ((Register) targetPtr).addUse(this);
            }
        }
    }
}
