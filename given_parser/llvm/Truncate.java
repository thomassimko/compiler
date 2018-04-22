package llvm;

import llvm.value.Register;
import llvm.value.Value;

public class Truncate implements Instruction {

    private Value value;
    private Register saveReg;

    public Truncate(Value value, Register saveReg) {
        this.value = value;
        this.saveReg = saveReg;
    }

    @Override
    public String toLLVM() {
        return this.saveReg.toLLVM() + " = trunc i32 " + value.toLLVM() + " to i1";
    }
}
