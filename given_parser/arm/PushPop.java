package arm;

import arm.ArmValue.ArmRegister;

import java.util.List;
import java.util.Map;

public class PushPop extends AbstractArmInstruction {
    List<ArmRegister> registers;
    PushPopType type;

    public PushPop(PushPopType type, List<ArmRegister> registers) {
        this.registers = registers;
        this.type = type;
    }

    @Override
    public String toArm() {
        String pushOrPop = "push";
        if(this.type == PushPopType.POP) {
            pushOrPop = "pop";
        }
        return pushOrPop + " {" +
                String.join(", ", registers.stream().map(register -> register.toArm()).toArray(String[]::new)) +
                "}";
    }

    @Override
    public void replaceRegisters(Map<String, String> colorMap) {
        //do nothing
    }
}
