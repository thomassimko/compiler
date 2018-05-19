package llvm;

import arm.ArmInstruction;
import arm.ArmLoad;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.FinalRegisters.StackPointer;
import llvm.value.Register;
import llvm.value.Value;
import llvm.value.ValueToArm;

import java.util.HashMap;
import java.util.List;

public class Load implements Instruction {

    private Register storedRegister;
    private String type;
    private Value value;

    public Load(Register storedRegister, String type, Value value) {
        this.storedRegister = storedRegister;
        this.type = type;
        this.value = value;
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
}
