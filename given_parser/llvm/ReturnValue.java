package llvm;

import llvm.value.Value;

public class ReturnValue implements Instruction {

    private String type;
    private Value value;

    public ReturnValue(String type, Value value) {
        this.type = type;
        this.value = value;
    }
    @Override
    public String toLLVM() {
        return "ret " + type + " " + value.toLLVM();
    }
}
