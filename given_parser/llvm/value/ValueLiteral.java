package llvm.value;

import llvm.value.Value;

public class ValueLiteral implements Value {

    private String value;

    public ValueLiteral(String value) {
        this.value = value;
    }

    public String toLLVM() {
        return value;
    }
}
