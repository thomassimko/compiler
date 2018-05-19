package llvm.declarations;

import arm.ArmInstruction;
import llvm.Allocation;
import llvm.Instruction;
import llvm.Store;
import llvm.value.Register;
import llvm.value.SSA;

import java.util.HashMap;
import java.util.List;

public class ParameterDeclaration implements Instruction {
    private String name;
    private String type;

    public ParameterDeclaration(String name, String type) {
        this.name = name;
        this.type = type;
    }

    @Override
    public String toLLVM() {
        if (SSA.isSSA) {
            return type + " %" + name;
        }
        return type + " %_P_" + name;
    }

    public Instruction getAllocation() {
        return new Allocation(type, new Register(name));
    }

    public Instruction getStore() {
        return new Store(type, new Register(name), new Register("_P_" + name));
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        //todo: this
    }

    public String getName() {
        if (SSA.isSSA) {
            return "%" + name;
        }
        return "%_P_" + name;
    }
}
