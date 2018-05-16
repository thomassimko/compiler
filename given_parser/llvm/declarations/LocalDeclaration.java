package llvm.declarations;

import arm.ArmInstruction;
import llvm.Instruction;

import java.util.HashMap;
import java.util.List;

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

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        if(!offsets.containsKey(name)) {
            int offset = offsets.size() * 4;
            offsets.put(name, offset);
        }
    }
}
