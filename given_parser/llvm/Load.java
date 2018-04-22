package llvm;

import llvm.value.Register;
import llvm.value.Value;

public class Load implements Instruction {

    private Register storedRegister;
    private String type;
    private Value value;

    public Load(Register storedRegister, String type, Value value) {
        this.storedRegister = storedRegister;
        this.type = type;
        this.value = value;
    }

    @Override
    public String toLLVM() {
        return storedRegister.toLLVM() + " = load " + type + "* " + value.toLLVM();
    }
}
