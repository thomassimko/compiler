package llvm.ArithmeticBool;

import llvm.value.*;

public class Add extends ArithmeticBoolOp {

    public Add(Value value1, Value value2, Register storedRegister) {
        super(value1, value2, "add", storedRegister);
    }
}
