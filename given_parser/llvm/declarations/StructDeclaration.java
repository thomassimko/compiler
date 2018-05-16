package llvm.declarations;

import arm.ArmInstruction;
import llvm.Instruction;

import java.util.HashMap;
import java.util.List;

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

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        //todo: this
    }
}
