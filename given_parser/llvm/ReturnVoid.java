package llvm;

import arm.ArmInstruction;

import java.util.HashMap;
import java.util.List;

public class ReturnVoid implements Instruction {
    @Override
    public String toLLVM() {
        return "ret void";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        //todo: doing nothing here
    }
}
