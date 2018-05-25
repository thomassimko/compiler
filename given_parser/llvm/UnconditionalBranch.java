package llvm;

import arm.ArmInstruction;
import arm.Branch;
import arm.BranchType;
import llvm.lattice.LatticeValue;
import llvm.value.Register;

import java.util.HashMap;
import java.util.List;

public class UnconditionalBranch implements Instruction{
    private String dest;

    public UnconditionalBranch(String dest) {
        this.dest = dest;
        this.addInstructionToRegisters();

    }

    public String toLLVM() {
        return "br label %" + dest;
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        instructions.add(new Branch(BranchType.DEFAULT, "." + dest, 0));
    }

    @Override
    public void addInstructionToRegisters() {
        //do nothing
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        System.err.println("Uncon Branch lattice called");
        return null;
    }

    @Override
    public Register[] getUsedRegisters() {
        return new Register[0];
    }

    @Override
    public Register getTarget() {
        return null;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {
    }
}
