package arm;

import java.util.Map;

public class ArmFunction extends AbstractArmInstruction
{
    private String name;
    public ArmFunction(String name) {
        this.name = name;
    }

    @Override
    public String toArm() {
        return "\t.align 2\n" +
                "\t.global " + name + "\n" +
                name + ":";
    }

    @Override
    public void replaceRegisters(Map<String, String> colorMap) {
        //do nothing
    }
}
