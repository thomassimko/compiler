package llvm.value;

import arm.ArmInstruction;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmValue;
import arm.ArmValue.ArmVirtualRegister;
import llvm.value.Value;

import java.util.List;

public class ValueLiteral implements Value {

    private String value;
    private ArmVirtualRegister register;

    public ValueLiteral(String value) {
        this.value = value;
        this.register = null;
    }

    public String toLLVM() {
        return value;
    }

    @Override
    public ArmVirtualRegister toArmRegister(List<ArmInstruction> instructions) {
        if(this.register == null) {
            register = ValueToArm.convertValueToArm(this, instructions);
        }
        return register;
    }
}
