package llvm.ArithmeticBool;

import llvm.value.Register;
import llvm.value.Value;

public class Subtract extends ArithmeticBoolOp {

    public Subtract(Value value1, Value value2, Register storedRegister) {
        super(value1, value2, "sub", storedRegister);
    }
}