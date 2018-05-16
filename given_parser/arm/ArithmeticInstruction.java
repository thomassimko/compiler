package arm;

import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmValue;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;

import java.util.Map;

public class ArithmeticInstruction extends AbstractArmInstruction {
    private ArmRegister storeReg;
    private ArmRegister r1;
    private ArmValue r2;
    private String instruction;

    public ArithmeticInstruction(ArithInstructionType inst, ArmRegister storeReg, ArmRegister r1, ArmValue r2) {
        this.storeReg = storeReg;
        this.r1 = r1;
        this.r2 = r2;
        switch(inst) {
            case ADD:
                this.instruction = "add";
                break;
            case MUL:
                this.instruction = "mul";
                break;
            case SUB:
                this.instruction = "sub";
                break;
            case OR:
                this.instruction = "orr";
                break;
            case AND:
                this.instruction = "and";
                break;
            case XOR:
                this.instruction = "eor";
                break;
        }
    }

    public String toArm() {
        return this.instruction + " " + storeReg.toArm() + ", " + r1.toArm() + ", " + r2.toArm();
    }

    @Override
    public ArmValue[] getSources() {
        return new ArmValue[]{r1, r2};
    }

    @Override
    public ArmRegister[] getTargets() {
        return new ArmRegister[]{storeReg};
    }

    @Override
    public void replaceRegisters(Map<String, String> colorMap) {
        storeReg = new ArmFinalRegister(colorMap.get(storeReg.toArm()));
        r1 = new ArmFinalRegister(colorMap.get(r1.toArm()));
        if (r2 instanceof ArmRegister)
            r2 = new ArmFinalRegister(colorMap.get(r2.toArm()));
    }
}
