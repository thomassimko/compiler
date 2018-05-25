package llvm.declarations;

import arm.ArmInstruction;
import llvm.Instruction;
import llvm.lattice.LatticeValue;
import llvm.value.Register;

import java.util.HashMap;
import java.util.List;

public class StructDeclaration implements Instruction {

    private String name;
    private String[] typeList;

    public StructDeclaration(String name, String[] typeList) {
        this.name = name;
        this.typeList = typeList;
    }

    @Override
    public String toLLVM() {
        return "%struct." + name + " = type {" + String.join(", ", typeList) + "}";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        //todo: this
    }

    @Override
    public void addInstructionToRegisters() {
        //do nothing
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
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
