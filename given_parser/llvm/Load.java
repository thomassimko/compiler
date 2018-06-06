package llvm;

import arm.ArmInstruction;
import arm.ArmLoad;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.FinalRegisters.StackPointer;
import llvm.lattice.LatticeBottom;
import llvm.lattice.LatticeValue;
import llvm.value.Register;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public class Load extends AbstactInstruction {

    private Register storedRegister;
    private String type;
    private Value value;

    public Load(Register storedRegister, String type, Value value) {
        super();
        this.storedRegister = storedRegister;
        this.type = type;
        this.value = value;
        this.addInstructionToRegisters();

    }

    @Override
    public String toLLVM() {
        return storedRegister.toLLVM() + " = load " + type +", " + type + "* " + value.toLLVM();
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister store = storedRegister.toArmRegister(instructions);
        String valueAsString = value.toLLVM().replace("%", "");

        ArmInstruction load;

        if (offsets.containsKey(valueAsString)) {
            load = new ArmLoad(store, StackPointer.getInstance(), new ArmImmediate(offsets.get(valueAsString) + ""));
        }
        else {
            ArmVirtualRegister valueReg = value.toArmRegister(instructions);
            load = new ArmLoad(store, valueReg);
        }
        instructions.add(load);

    }

    @Override
    public void addInstructionToRegisters() {
        storedRegister.setDef(this);
        if(value instanceof Register) {
            ((Register)value).addUse(this);
        }
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        return new LatticeBottom();
    }

    @Override
    public Register[] getUsedRegisters() {
        if(value instanceof Register) {
            return new Register[]{((Register)value), storedRegister};
        }
        return new Register[]{storedRegister};

    }

    @Override
    public Register getTarget() {
        return storedRegister;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {

    }

    @Override
    public Value[] getSources() {
        return new Value[]{value};
    }

    @Override
    public void replaceSource(HashMap<Value, Value> newValueMappings) {
        if(newValueMappings.containsKey(value)) {

            if(newValueMappings.containsKey(value)) {

                if(value instanceof Register) {
                    ((Register) value).removeUse(this);
                }
                value = newValueMappings.get(value);

                if(value instanceof Register) {
                    ((Register) value).addUse(this);
                }
            }
        }
    }
}
