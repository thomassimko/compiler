package llvm;

import arm.ArmInstruction;
import llvm.lattice.LatticeTop;
import llvm.lattice.LatticeValue;
import llvm.value.Register;

import java.util.HashMap;
import java.util.List;

public class Allocation extends AbstactInstruction {

    private String type;
    private Register retValue;

    public Allocation(String type, Register retValue) {
        super();
        this.type = type;
        this.retValue = retValue;
        this.addInstructionToRegisters();
    }

    @Override
    public String toLLVM() {
        return retValue.toLLVM() + " = alloca " + type;
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        String valueAsString = retValue.toLLVM().replace("%", "");
        if(!offsets.containsKey(valueAsString)) {
            int offset = offsets.size() * 4;
            offsets.put(retValue.toLLVM().replace("%", ""), offset);
        }
    }

    @Override
    public void addInstructionToRegisters() {
        retValue.setDef(this);
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        return new LatticeTop();
    }

    @Override
    public Register[] getUsedRegisters() {
        return new Register[]{retValue};
    }

    @Override
    public Register getTarget() {
        return retValue;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {
    }
}
