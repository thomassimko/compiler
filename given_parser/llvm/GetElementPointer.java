package llvm;

import llvm.value.Register;
import llvm.value.Value;

public class GetElementPointer implements Instruction {

    private Register storedRegister;
    private String type;
    private Value source;
    private int arrLoc;

    public GetElementPointer(Register storedRegister, String type, Value source, int arrLoc) {
        this.storedRegister = storedRegister;
        this.type = type;
        this.source = source;
        this.arrLoc = arrLoc;
    }
    @Override
    public String toLLVM() {
        return this.storedRegister.toLLVM() + " = getelementptr " + type.replace('*', ' ') + ", " + type + " " + source.toLLVM() + ", i1 0, i32 " + arrLoc;
    }
}
