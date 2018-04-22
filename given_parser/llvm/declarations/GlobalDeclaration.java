package llvm.declarations;

import ast.StructType;
import ast.Type;
import llvm.Instruction;

public class GlobalDeclaration implements Instruction {
    private String name;
    private Type type;

    public GlobalDeclaration(String name, Type type) {
        this.name = name;
        this.type = type;
    }

    @Override
    public String toLLVM() {
        String defaultVal = (type instanceof StructType) ? "null" : "0";
        return "@" + name + " = common global " + type.getCFGType() + " " + defaultVal + ", align 8";
    }
}
