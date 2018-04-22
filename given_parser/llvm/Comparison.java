package llvm;

import ast.Type;
import llvm.value.Register;
import llvm.value.Value;

public class Comparison implements Instruction {

    private Value value1;
    private Value value2;
    private Register storedRegister;
    private String compareOp;
    private Type type;

    public Comparison(Value value1, Value value2, String compareOp, Register storedRegister, Type type) {
        this.value1 = value1;
        this.value2 = value2;
        this.storedRegister = storedRegister;
        this.compareOp = compareOp;
        this.type = type;
    }

    public String toLLVM() {
        return storedRegister.toLLVM() + " = icmp " + compareOp + " " + type.getCFGType() + " " +
                value1.toLLVM() + ", " + value2.toLLVM();
    }

}
