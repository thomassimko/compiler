package llvm;

import llvm.value.Value;

public class BitCast implements Instruction {

    private Value storedRegister;
    private Value sourceRegister;
    private String sourceType;
    private String targetType;

    public BitCast(Value storedRegister, Value sourceRegister, String sourceType, String targetType) {
        this.sourceRegister = sourceRegister;
        this.storedRegister = storedRegister;
        this.sourceType = sourceType;
        this.targetType = targetType;
    }

    @Override
    public String toLLVM() {
        return storedRegister.toLLVM() + " = bitcast " + sourceType + " " + sourceRegister.toLLVM() + " to " + targetType;
    }
}
