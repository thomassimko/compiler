package llvm;

import llvm.value.Value;

public class Print implements Instruction {

    private Value value;
    private boolean printLine;

    public Print(Value value, boolean printLine) {
        this.value = value;
        this.printLine = printLine;
    }
    @Override
    public String toLLVM() {
        String inst = this.printLine ? "println" : "print";
        return "call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @." + inst +
                ", i32 0, i32 0), i32 " + value.toLLVM() + ")";
    }
}
