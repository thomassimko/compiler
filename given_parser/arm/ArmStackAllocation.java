package arm;

import arm.ArmValue.ArmImmediate;
import arm.ArmValue.FinalRegisters.StackPointer;

import java.util.Map;

public class ArmStackAllocation extends AbstractArmInstruction {
    private int size;
    private ArithInstructionType type;
    public ArmStackAllocation(boolean add, int size) {
        this.size = size;
        type = ArithInstructionType.SUB;
        if(add) {
            type = ArithInstructionType.ADD;
        }
    }

    @Override
    public String toArm() {
        ArithmeticInstruction spAdd = new ArithmeticInstruction(
                this.type,
                StackPointer.getInstance(),
                StackPointer.getInstance(),
                new ArmImmediate((size * 4) + ""));
        return spAdd.toArm();
    }

    public void setStackSize(int size) {
        this.size = size;
    }

    @Override
    public void replaceRegisters(Map<String, String> colorMap) {
        //do nothing
    }
}
