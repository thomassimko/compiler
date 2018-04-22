package llvm.ArithmeticBool;

import llvm.value.Register;
import llvm.value.Value;

public class Divide extends ArithmeticBoolOp {

    public Divide(Value value1, Value value2, Register storedRegister) {
        super(value1, value2, "sdiv", storedRegister);
    }
}

