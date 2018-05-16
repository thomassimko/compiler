package arm;

import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.ArmValue;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;

import java.util.Map;

public class Move extends AbstractArmInstruction {
    private String moveString;
    private ArmRegister target;
    private ArmValue source;
    private MoveType moveType;
    private int mode;
    private boolean isSourceAndTarget;

    public Move(MoveType type, ArmRegister target, ArmValue source, int mode, boolean isSourceAndTarget) {
        this.moveType = type;
        this.target = target;
        this.source = source;
        this.mode = mode;
        this.isSourceAndTarget = isSourceAndTarget;
        switch(type) {
            case LE:
                this.moveString = "le";
                break;
            case LT:
                this.moveString = "lt";
                break;
            case GE:
                this.moveString = "ge";
                break;
            case GT:
                this.moveString = "gt";
                break;
            case NE:
                this.moveString = "ne";
                break;
            case EQ:
                this.moveString = "eq";
                break;
            case T:
                this.moveString = "t";
                break;
            case W:
                assert source instanceof ArmImmediate : "Source not of type ArmValue for movw";
                this.moveString = "w";
                break;
            case DEFAULT:
                this.moveString = "";

        }
    }

    @Override
    public String toArm() {
        String secondVal;
        switch (mode) {
            case 1:
                secondVal = ((ArmImmediate) source).getLower();
                break;
            case 2:
                secondVal = ((ArmImmediate) source).getUpper();
                break;
            default:
                secondVal = source.toArm();
        }

        return "mov" + this.moveString + " " + target.toArm() + ", " + secondVal;
    }

    @Override
    public ArmValue[] getSources() {
        if(isSourceAndTarget) {
            return new ArmValue[]{source, target};
        }
        return new ArmValue[]{source};
    }

    @Override
    public ArmRegister[] getTargets() {
        return new ArmRegister[]{target};
    }


    @Override
    public void replaceRegisters(Map<String, String> colorMap) {
        target = new ArmFinalRegister(colorMap.get(target.toArm()));
        if (source instanceof ArmRegister)
            source = new ArmFinalRegister(colorMap.get(source.toArm()));
    }
}
