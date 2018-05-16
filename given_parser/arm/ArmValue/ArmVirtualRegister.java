package arm.ArmValue;


public class ArmVirtualRegister extends ArmRegister{

    private String register;

    public ArmVirtualRegister(String register) {
        super();
        this.register = register;
    }

    public String toArm() {
        return register;

    }

}
