package llvm.ArithmeticBool;

import llvm.value.Register;
import llvm.value.Value;

public class ExclusiveOr extends ArithmeticBoolOp {

    public ExclusiveOr(Value value1, Value value2, Register storedRegister) {
        super(value1, value2, "xor", storedRegister);
    }
}
