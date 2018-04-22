package llvm;

import llvm.value.Value;

public class Malloc implements Instruction {

    private Value storedReg;
    private int bytes;

    public Malloc(Value storedReg, int bytes) {
        this.storedReg = storedReg;
        this.bytes = bytes;
    }

    @Override
    public String toLLVM() {
        return storedReg.toLLVM() + " = call i8* @malloc(i32 " + (8*bytes) + ")";
    }
}
