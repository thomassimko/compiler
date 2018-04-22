package llvm;

import llvm.value.Value;

public class Store implements Instruction {

    private String type;
    private Value targetPtr;
    private Value source;

    public Store(String type, Value targetPtr, Value source) {
        this.targetPtr = targetPtr;
        this.source = source;
        this.type = type;
    }
    @Override
    public String toLLVM() {
        return "store " + type + " " + source.toLLVM() + ", " + type + "* " + targetPtr.toLLVM();
    }
}
