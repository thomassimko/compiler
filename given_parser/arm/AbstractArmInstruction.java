package arm;

import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmValue;

public abstract class AbstractArmInstruction implements ArmInstruction {
    @Override
    public ArmValue[] getSources() {
        return new ArmValue[0];
    }

    @Override
    public ArmRegister[] getTargets() {
        return new ArmRegister[]{};
    }
}
