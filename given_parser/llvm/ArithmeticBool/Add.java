package llvm.ArithmeticBool;

import llvm.lattice.LatticeValue;
import llvm.value.*;

import java.util.HashMap;

public class Add extends ArithmeticBoolOp {

    public Add(Value value1, Value value2, Register storedRegister) {
        super(value1, value2, "add", storedRegister);
    }
}
