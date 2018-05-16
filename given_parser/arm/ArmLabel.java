package arm;

import java.util.Map;

public class ArmLabel extends AbstractArmInstruction{
    private String label;

    public ArmLabel(String label) {
        this.label = label;
    }

    @Override
    public String toArm() {
        return "." + label + ":";
    }

    @Override
    public void replaceRegisters(Map<String, String> colorMap) {
        //do nothing
    }
}
