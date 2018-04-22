package llvm.ArithmeticBool;

import llvm.value.Register;
import llvm.value.Value;

public class And extends ArithmeticBoolOp {

    public And(Value value1, Value value2, Register storedRegister) {
        super(value1, value2, "and", storedRegister);
    }
}
