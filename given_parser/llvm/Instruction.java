package llvm;

import arm.ArmInstruction;

import java.util.HashMap;
import java.util.List;

public interface Instruction {
    String toLLVM();
    void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets);
}
