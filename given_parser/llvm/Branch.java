package llvm;

import llvm.value.Value;

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
}
