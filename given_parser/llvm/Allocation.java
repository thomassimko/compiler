package llvm;

import arm.ArmInstruction;
import llvm.value.Register;

import java.util.HashMap;
import java.util.List;

public class Allocation implements Instruction {

    private String type;
    private Register retValue;

    public Allocation(String type, Register retValue) {
        this.type = type;
        this.retValue = retValue;
    }

    @Override
    public String toLLVM() {
        return retValue.toLLVM() + " = alloca " + type;
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        String valueAsString = retValue.toLLVM().replace("%", "");
        if(!offsets.containsKey(valueAsString)) {
            int offset = offsets.size() * 4;
            offsets.put(retValue.toLLVM().replace("%", ""), offset);
        }
    }
}
