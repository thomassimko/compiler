package llvm.value;

import arm.ArmInstruction;
import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmVirtualRegister;

import java.util.List;

public class Register implements Value {

    private String registerLoc;
    private ArmVirtualRegister register;

    public Register() {
        this.registerLoc = "%" + RegisterCounter.getNextRegister();
        this.register = null;
    }

    public Register(String name) {
        this.registerLoc = "%" + name;
    }

    public String toLLVM() {
        return registerLoc;
    }

    @Override
    public ArmVirtualRegister toArmRegister(List<ArmInstruction> instructions) {
        if(this.register == null) {
            register = ValueToArm.convertValueToArm(this, instructions);
        }
        return register;
    }
}
