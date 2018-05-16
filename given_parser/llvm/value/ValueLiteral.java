package llvm.value;

import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmValue;
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
