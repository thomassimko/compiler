package llvm.declarations;

import arm.ArmInstruction;
import arm.ArmValue.ArmGlobalDeclaration;
import ast.StructType;
import ast.Type;
import llvm.Instruction;
import llvm.lattice.LatticeBottom;
import llvm.lattice.LatticeValue;
import llvm.value.Register;

import java.util.HashMap;
import java.util.List;

public class GlobalDeclaration implements Instruction {
    private String name;
    private Type type;

    public GlobalDeclaration(String name, Type type) {
        this.name = name;
        this.type = type;
    }

    @Override
    public String toLLVM() {
        String defaultVal = (type instanceof StructType) ? "null" : "0";
        return "@" + name + " = common global " + type.getCFGType() + " " + defaultVal + ", align 8";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        instructions.add(new ArmGlobalDeclaration(name));
    }

    @Override
    public void addInstructionToRegisters() {
        //do nothing
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        return new LatticeBottom();
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
