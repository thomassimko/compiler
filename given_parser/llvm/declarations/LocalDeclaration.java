package llvm.declarations;

import llvm.Instruction;

public class LocalDeclaration implements Instruction {
    private String name;
    private String type;

    public LocalDeclaration(String name, String type) {
        this.name = name;
        this.type = type;
    }

    @Override
    public String toLLVM() {
        return "%" + name + " = alloca " + type;
    }
}
