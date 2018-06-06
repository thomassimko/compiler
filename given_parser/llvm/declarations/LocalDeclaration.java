package llvm.declarations;

import arm.ArmInstruction;
import llvm.AbstactInstruction;
import llvm.lattice.LatticeBottom;
import llvm.lattice.LatticeValue;
import llvm.value.Register;

import java.util.HashMap;
import java.util.List;

public class LocalDeclaration extends AbstactInstruction {
    private String name;
    private String type;
    private Register savedReg;

    public LocalDeclaration(String name, String type) {
        super();
        this.name = name;
        this.type = type;
        savedReg = new Register(name);
        savedReg.setDef(this);
    }

    @Override
    public String toLLVM() {
        return savedReg.toLLVM() + " = alloca " + type;
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        if(!offsets.containsKey(name)) {
            int offset = offsets.size() * 4;
            offsets.put(name, offset);
        }
    }

    @Override
    public void addInstructionToRegisters() {
        //do nothing
    }

    @Override
    public Register[] getUsedRegisters() {
        return new Register[]{savedReg};
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        return new LatticeBottom();
    }

    @Override
    public Register getTarget() {
        return savedReg;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {

    }
}
