package llvm;

import llvm.value.Register;

public class Allocation implements Instruction {

    private String type;
    private Register retValue;

    public Allocation(String type, Register retValue) {
        this.type = type;
        this.retValue = retValue;
    }

    @Override
    public String toLLVM() {
        return retValue.toLLVM() + " = alloca " + type;
    }
}
