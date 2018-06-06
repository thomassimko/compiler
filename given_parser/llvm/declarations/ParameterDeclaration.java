package llvm.declarations;

import arm.ArmInstruction;
import llvm.AbstactInstruction;
import llvm.Allocation;
import llvm.Instruction;
import llvm.Store;
import llvm.lattice.LatticeBottom;
import llvm.lattice.LatticeValue;
import llvm.value.Register;
import llvm.value.SSA;

import java.util.HashMap;
import java.util.List;

public class ParameterDeclaration extends AbstactInstruction {
    private String name;
    private String type;
    private Register reg;

    public ParameterDeclaration(String name, String type) {
        super();
        this.name = name;
        this.type = type;
        this.reg = new Register(name);
        reg.setDef(this);
    }

    @Override
    public String toLLVM() {
        if (SSA.isSSA) {
            return type + " %" + name;
        }
        return type + " %_P_" + name;
    }

    public Instruction getAllocation() {
        return new Allocation(type, reg);
    }

    public Instruction getStore() {
        return new Store(type, reg, new Register("_P_" + name));
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        //todo: this
    }

    public String getName() {
        if (SSA.isSSA) {
            return "%" + name;
        }
        return "%_P_" + name;
    }

    @Override
    public void addInstructionToRegisters() {
        //do nothing
    }

    @Override
    public Register[] getUsedRegisters() {
        return new Register[]{reg};
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        return new LatticeBottom();
    }

    @Override
    public Register getTarget() {
        return reg;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {

    }
}
