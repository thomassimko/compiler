package arm;

import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.ArmValue;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;

import java.util.Map;

public class ArmLoad extends AbstractArmInstruction {
    private ArmRegister r1;
    private ArmRegister addr;
    private ArmImmediate offset;
    public ArmLoad(ArmVirtualRegister r1, ArmVirtualRegister addr) {
        this.r1 = r1;
        this.addr = addr;
        this.offset = null;
    }

    public ArmLoad(ArmRegister r1, ArmRegister addr, ArmImmediate offset) {
        this.r1 = r1;
        this.addr = addr;
        this.offset = offset;
    }

    @Override
    public String toArm() {
        if (this.offset == null)
            return "ldr " + r1.toArm() + ", [" + addr.toArm() + "]";
        return "ldr " + r1.toArm() + ", [" + addr.toArm() + ", " + offset.toArm() + "]";
    }

    @Override
    public ArmRegister[] getTargets() {
        return new ArmRegister[]{r1};
    }

    @Override
    public ArmValue[] getSources() {
        return new ArmRegister[]{addr};
    }

    @Override
    public void replaceRegisters(Map<String, String> colorMap) {
        r1 = new ArmFinalRegister(colorMap.get(r1.toArm()));
        addr = new ArmFinalRegister(colorMap.get(addr.toArm()));
    }
}
