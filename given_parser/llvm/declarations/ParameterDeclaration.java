package llvm.declarations;

import llvm.Allocation;
import llvm.Instruction;
import llvm.Store;
import llvm.value.Register;

public class ParameterDeclaration implements Instruction {
    private String name;
    private String type;

    public ParameterDeclaration(String name, String type) {
        this.name = name;
        this.type = type;
    }

    @Override
    public String toLLVM() {
        return type + " %_P_" + name;
    }

    public Instruction getAllocation() {
        return new Allocation(type, new Register(name));
    }

    public Instruction getStore() {
        return new Store(type, new Register(name), new Register("_P_" + name));
    }

}
