package llvm;

import arm.ArmInstruction;
import arm.Branch;
import arm.BranchType;

import java.util.HashMap;
import java.util.List;

public class UnconditionalBranch implements Instruction{
    private String dest;

    public UnconditionalBranch(String dest) {
        this.dest = dest;
    }

    public String toLLVM() {
        return "br label %" + dest;
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        instructions.add(new Branch(BranchType.DEFAULT, "." + dest, 0));
    }
}
