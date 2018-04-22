package llvm.ArithmeticBool;

import llvm.value.Register;
import llvm.value.Value;

public class Add extends ArithmeticBoolOp {

    public Add(Value value1, Value value2, Register storedRegister) {
        super(value1, value2, "add", storedRegister);
    }
}