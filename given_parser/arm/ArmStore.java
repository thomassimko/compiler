package arm;

import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.ArmValue;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;

import java.util.Map;

public class ArmStore extends AbstractArmInstruction {
    private ArmRegister r1;
    private ArmRegister addr;
    private ArmImmediate offset;

    public ArmStore(ArmVirtualRegister addr, ArmVirtualRegister r1) {
        this.r1 = r1;
        this.addr = addr;
    }

    public ArmStore(ArmRegister r1, ArmRegister addr, ArmImmediate offset) {
        this.r1 = r1;
        this.addr = addr;
        this.offset = offset;
    }

    @Override
    public String toArm() {
        if (this.offset == null)
            return "str " + r1.toArm() + ", [" + addr.toArm() + "]";
        return "str " + r1.toArm() + ", [" + addr.toArm() + ", " + offset.toArm() + "]";
    }

    @Override
    public ArmValue[] getSources() {
        return new ArmValue[]{r1, addr};
    }

    @Override
    public void replaceRegisters(Map<String, String> colorMap) {
        r1 = new ArmFinalRegister(colorMap.get(r1.toArm()));
        addr = new ArmFinalRegister(colorMap.get(addr.toArm()));
    }
}
