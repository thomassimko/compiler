package arm;

import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmValue;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;

import java.util.Map;

public class Branch extends AbstractArmInstruction {
    private BranchType branchType;
    private String label;
    private String branchString;
    private int paramCount;

    public Branch(BranchType type,  String label, int paramCount) {
        this.paramCount = paramCount;
        this.label = label;
        this.branchType = type;
        switch(type) {
            case LE:
                this.branchString = "le";
                break;
            case LT:
                this.branchString = "lt";
                break;
            case GE:
                this.branchString = "ge";
                break;
            case GT:
                this.branchString = "gt";
                break;
            case NE:
                this.branchString = "ne";
                break;
            case EQ:
                this.branchString = "eq";
                break;
            case L:
                this.branchString = "l";
                break;
            default:
                this.branchString = "";
        }
    }

    @Override
    public String toArm() {
        return "b" + this.branchString + " " + this.label;
    }

    @Override
    public void replaceRegisters(Map<String, String> colorMap) {
        // do nothing
    }

    @Override
    public ArmRegister[] getTargets() {
        if(this.branchType == BranchType.L) {
            return new ArmRegister[]{
                    new ArmFinalRegister("r0"),
                    new ArmFinalRegister("r1"),
                    new ArmFinalRegister("r2"),
                    new ArmFinalRegister("r3")
            };
        }
        return new ArmRegister[]{};
    }

    @Override
    public ArmValue[] getSources() {
        ArmRegister[] sources = new ArmRegister[paramCount];
        if(this.branchType == BranchType.L) {
            for (int i = 0; i < paramCount; i++) {
                if(i > 4) {
                    //throw new RuntimeException("spill");
                }
                else {
                    sources[i] = new ArmFinalRegister("r" + i);
                }
            }
        }
        return sources;
    }

    public BranchType getBranchType() {
        return branchType;
    }
}
