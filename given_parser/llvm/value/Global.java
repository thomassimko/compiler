package llvm.value;

import arm.ArmInstruction;
import arm.ArmValue.ArmGlobalDeclaration;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmVirtualRegister;

import java.util.List;

public class Global implements Value {
    private String name;
    private ArmVirtualRegister register;

    public Global(String name) {
        this.name = name;
        this.register = null;
    }

    @Override
    public String toLLVM() {
        return "@" + name;
    }

    public ArmImmediate armDeclaration() {
        return new ArmImmediate(name);
    }

    @Override
    public ArmVirtualRegister toArmRegister(List<ArmInstruction> instructions) {
        if(this.register == null) {
            register = ValueToArm.convertValueToArm(this, instructions);
        }
        return register;
    }
}
