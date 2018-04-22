package llvm.ArithmeticBool;

import llvm.Instruction;
import llvm.value.Register;
import llvm.value.Value;

public class ArithmeticBoolOp implements Instruction {
    private Value value1;
    private Value value2;
    private Register storedRegister;
    private String instruction;


    public ArithmeticBoolOp(Value value1, Value value2, String instruction, Register storedRegister) {
        this.value1 = value1;
        this.value2 = value2;
        this.storedRegister = storedRegister;
        this.instruction = instruction;
    }

    public String toLLVM() {
        return storedRegister.toLLVM() + " = " + instruction + " i32 " + value1.toLLVM() + ", " + value2.toLLVM();
    }
}
