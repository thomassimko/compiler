package llvm.ArithmeticBool;

import llvm.value.Register;
import llvm.value.Value;

public class Or extends ArithmeticBoolOp {

    public Or(Value value1, Value value2, Register storedRegister) {
        super(value1, value2, "or", storedRegister);
    }
}

