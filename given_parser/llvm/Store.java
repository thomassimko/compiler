package llvm;

import arm.ArmInstruction;
import arm.ArmStore;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.FinalRegisters.StackPointer;
import llvm.value.Value;
import llvm.value.ValueToArm;

import java.util.HashMap;
import java.util.List;

public class Store implements Instruction {

    private String type;
    private Value targetPtr;
    private Value source;

    public Store(String type, Value targetPtr, Value source) {
        this.targetPtr = targetPtr;
        this.source = source;
        this.type = type;
    }
    @Override
    public String toLLVM() {
        return "store " + type + " " + source.toLLVM() + ", " + type + "* " + targetPtr.toLLVM();
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister r1 = ValueToArm.convertValueToArm(targetPtr, instructions);
        ArmVirtualRegister r2 = ValueToArm.convertValueToArm(source, instructions);
        if (offsets.containsKey(targetPtr.toLLVM().replace("%", ""))) {
            instructions.add(new ArmStore(r2, StackPointer.getInstance(),
                    new ArmImmediate("" + offsets.get(targetPtr.toLLVM().replace("%", "")))));
        }
        else {
            instructions.add(new ArmStore(r1,r2));

        }
    }
}
