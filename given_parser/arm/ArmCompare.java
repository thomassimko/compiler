package arm;

import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.ArmValue;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;

import java.util.Map;

public class ArmCompare extends AbstractArmInstruction {

    private ArmRegister reg1;
    private ArmValue value;

    public ArmCompare(ArmRegister r1, ArmValue value) {
        this.reg1 = r1;
        this.value = value;
    }

    @Override
    public String toArm() {
        return "cmp " + reg1.toArm() + ", " + value.toArm();
    }

    @Override
    public ArmRegister[] getTargets() {
        return new ArmRegister[]{};
    }

    @Override
    public ArmValue[] getSources() {
        return new ArmValue[]{reg1, value};
    }

    @Override
    public void replaceRegisters(Map<String, String> colorMap) {
        reg1 = new ArmFinalRegister(colorMap.get(reg1.toArm()));
        if (value instanceof ArmRegister) {
            value = new ArmFinalRegister(colorMap.get(value.toArm()));
        }
    }
}
