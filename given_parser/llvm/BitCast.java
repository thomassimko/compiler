package llvm;

import arm.ArmInstruction;
import arm.ArmValue.ArmVirtualRegister;
import arm.Move;
import arm.MoveType;
import llvm.value.Value;
import llvm.value.ValueToArm;

import java.util.HashMap;
import java.util.List;

public class BitCast implements Instruction {

    private Value storedRegister;
    private Value sourceRegister;
    private String sourceType;
    private String targetType;

    public BitCast(Value storedRegister, Value sourceRegister, String sourceType, String targetType) {
        this.sourceRegister = sourceRegister;
        this.storedRegister = storedRegister;
        this.sourceType = sourceType;
        this.targetType = targetType;
    }

    @Override
    public String toLLVM() {
        return storedRegister.toLLVM() + " = bitcast " + sourceType + " " + sourceRegister.toLLVM() + " to " + targetType;
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister source = ValueToArm.convertValueToArm(sourceRegister, instructions);
        ArmVirtualRegister target = ValueToArm.convertValueToArm(storedRegister, instructions);

        ArmInstruction move = new Move(MoveType.DEFAULT, target, source, 0, false);
        instructions.add(move);
    }
}
