package arm.ArmValue.FinalRegisters;

import arm.ArmValue.ArmRegister;

public class ArmFinalRegister extends ArmRegister {

    private String register;

    public ArmFinalRegister(String register) {
        super();
        this.register = register;
    }

    public String toArm() {
        return register;
    }

}
