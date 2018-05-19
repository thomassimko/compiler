package llvm;

import arm.ArmInstruction;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;
import arm.ArmValue.ArmVirtualRegister;
import arm.Move;
import arm.MoveType;
import llvm.value.Value;
import llvm.value.ValueToArm;

import java.util.HashMap;
import java.util.List;

public class ReturnValue implements Instruction {

    private String type;
    private Value value;

    public ReturnValue(String type, Value value) {
        this.type = type;
        this.value = value;
    }
    @Override
    public String toLLVM() {
        return "ret " + type + " " + value.toLLVM();
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister reg = value.toArmRegister(instructions);
        ArmFinalRegister r0 = new ArmFinalRegister("r0");
        Move move = new Move(MoveType.DEFAULT, r0, reg, 0, false);
        instructions.add(move);
    }
}
