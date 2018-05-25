package llvm;

import arm.ArmInstruction;
import llvm.declarations.AbstactInstruction;
import llvm.lattice.LatticeValue;
import llvm.value.Register;

import java.util.HashMap;
import java.util.List;

public class ReturnVoid extends AbstactInstruction {

    public ReturnVoid() {
        super();
        this.setUseful(true);
    }

    @Override
    public String toLLVM() {
        return "ret void";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        //todo: doing nothing here
    }

    @Override
    public void addInstructionToRegisters() {
        //do nothing
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        System.err.println("Return void lattice called");
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
