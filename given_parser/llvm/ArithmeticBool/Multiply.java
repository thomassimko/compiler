package llvm.ArithmeticBool;

import llvm.value.Register;
import llvm.value.Value;

public class Multiply extends ArithmeticBoolOp {

    public Multiply(Value value1, Value value2, Register storedRegister) {
        super(value1, value2, "mul", storedRegister);
    }
}
