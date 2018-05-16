package arm;

import java.util.Map;

public class ArmFunctionEnd extends AbstractArmInstruction {
    private String name;

    public ArmFunctionEnd(String name) {
        this.name = name;
    }

    @Override
    public String toArm() {
        return ".size " + name + ", .-" + name;
    }

    @Override
    public void replaceRegisters(Map<String, String> colorMap) {
        //do nothing
    }
}
