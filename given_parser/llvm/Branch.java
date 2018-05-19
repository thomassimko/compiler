package llvm;

import arm.ArmCompare;
import arm.ArmInstruction;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmVirtualRegister;
import arm.BranchType;
import llvm.value.Value;
import llvm.value.ValueToArm;

import java.util.HashMap;
import java.util.List;

public class Branch implements Instruction {

    private Value check;
    private String trueLabel;
    private String falseLabel;

    public Branch(Value check, String trueLabel, String falseLabel) {
        this.check = check;
        this.trueLabel = trueLabel;
        this.falseLabel = falseLabel;
    }

    public String toLLVM() {
        return "br i1 " + check.toLLVM() + ", label %" + trueLabel + ", label %" + falseLabel + "\n";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister checkReg = check.toArmRegister(instructions);
        ArmCompare compare = new ArmCompare(checkReg, new ArmImmediate("1"));
        arm.Branch branchTrue = new arm.Branch(BranchType.EQ, "." + trueLabel, 0);
        arm.Branch branchFalse = new arm.Branch(BranchType.DEFAULT, "." + falseLabel, 0);

        instructions.add(compare);
        instructions.add(branchTrue);
        instructions.add(branchFalse);
    }
}
