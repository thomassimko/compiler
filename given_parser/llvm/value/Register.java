package llvm.value;

import arm.ArmInstruction;
import arm.ArmValue.ArmVirtualRegister;
import llvm.Instruction;
import llvm.lattice.LatticeValue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Register implements Value {

    private String registerLoc;
    private ArmVirtualRegister register;
    private Instruction def;
    private List<Instruction> uses;

    public Register() {
        this.registerLoc = "%" + RegisterCounter.getNextRegister();
        this.register = null;
        this.uses = new ArrayList<>();
    }

    public Register(String name) {
        this.registerLoc = "%" + name;
        this.uses = new ArrayList<>();
        this.register = null;
    }

    public String toLLVM() {
        return registerLoc;
    }

    @Override
    public ArmVirtualRegister toArmRegister(List<ArmInstruction> instructions) {
        if(this.register == null) {
            register = ValueToArm.convertValueToArm(this, instructions);
        }
        return register;
    }

    public void setDef(Instruction def) {
        this.def = def;
    }

    public Instruction getDef() {
        return def;
    }

    public void addUse(Instruction use) {
        this.uses.add(use);
    }

    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        Register reg = lattice.keySet().stream().filter(register1 -> register1.toLLVM().equals(this.toLLVM())).toArray(Register[]::new)[0];
        return lattice.get(reg);
    }

    public List<Instruction> getUses() {
        return this.uses;
    }
}
