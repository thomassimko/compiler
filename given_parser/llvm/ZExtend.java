package llvm;

import llvm.value.Register;
import llvm.value.Value;

public class ZExtend implements Instruction {

    private Value source;
    private Register target;

    public ZExtend(Value source, Register target) {
        this.source = source;
        this.target = target;
    }

    @Override
    public String toLLVM() {
        return this.target.toLLVM() + " = zext i1 " + source.toLLVM() + " to i32";
    }
}
