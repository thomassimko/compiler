package arm.ArmValue;

import arm.AbstractArmInstruction;

import java.util.Map;

public class ArmGlobalDeclaration extends AbstractArmInstruction {
    private String name;

    public ArmGlobalDeclaration(String name) {
        this.name = name;
    }
    @Override
    public String toArm() {
        return ".comm\t" + name + ",4,4";
    }

    @Override
    public ArmRegister[] getTargets() {
        return new ArmRegister[0];
    }

    @Override
    public ArmValue[] getSources() {
        return new ArmValue[0];
    }

    @Override
    public void replaceRegisters(Map<String, String> colorMap) {
        //do nothing
    }
}
