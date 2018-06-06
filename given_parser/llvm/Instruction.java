package llvm;

import arm.ArmInstruction;
import llvm.lattice.LatticeValue;
import llvm.value.Register;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public interface Instruction {
    String toLLVM();
    void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets);
    void addInstructionToRegisters();
    LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice);
    Register[] getUsedRegisters();
    Register getTarget();
    void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice);
    boolean isUseful();
    void setUseful(boolean useful);
    Value[] getSources();
    void replaceSource(HashMap<Value, Value> newValueMappings);
}
