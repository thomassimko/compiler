package llvm.declarations;

import llvm.Instruction;

public class StructDeclaration implements Instruction {

    private String name;
    private String[] typeList;

    public StructDeclaration(String name, String[] typeList) {
        this.name = name;
        this.typeList = typeList;
    }

    @Override
    public String toLLVM() {
        return "%struct." + name + " = type {" + String.join(", ", typeList) + "}";
    }
}
