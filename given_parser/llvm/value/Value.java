package llvm.value;

import arm.ArmInstruction;
import arm.ArmValue.ArmVirtualRegister;
import llvm.lattice.LatticeValue;

import java.util.HashMap;
import java.util.List;

public interface Value {

    String toLLVM();
    ArmVirtualRegister toArmRegister(List<ArmInstruction> instructions);
    LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice);
}
