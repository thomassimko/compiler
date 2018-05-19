package llvm.value;

import arm.ArmInstruction;
import arm.ArmValue.ArmVirtualRegister;

import java.util.List;

public interface Value {

    String toLLVM();
    ArmVirtualRegister toArmRegister(List<ArmInstruction> instructions);
}
