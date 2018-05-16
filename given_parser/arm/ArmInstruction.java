package arm;

import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmValue;

import java.util.Map;

public interface ArmInstruction {
    String toArm();
    ArmValue[] getSources();
    ArmRegister[] getTargets();
    void replaceRegisters(Map<String, String> colorMap);
}
