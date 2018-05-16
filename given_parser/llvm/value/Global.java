package llvm.value;

import arm.ArmInstruction;
import arm.ArmValue.ArmGlobalDeclaration;
import arm.ArmValue.ArmImmediate;

public class Global implements Value {
    private String name;

    public Global(String name) {
        this.name = name;
    }

    @Override
    public String toLLVM() {
        return "@" + name;
    }

    public ArmImmediate armDeclaration() {
        return new ArmImmediate(name);
    }
}
