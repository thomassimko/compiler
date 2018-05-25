package llvm.value;

import arm.ArmInstruction;
import arm.ArmValue.ArmVirtualRegister;
import llvm.lattice.LatticeBottom;
import llvm.lattice.LatticeInteger;
import llvm.lattice.LatticeValue;

import java.util.HashMap;
import java.util.List;

public class ValueLiteral implements Value {

    private String value;
    private ArmVirtualRegister register;

    public ValueLiteral(String value) {
        this.value = value;
        this.register = null;
    }

    public String toLLVM() {
        return value;
    }

    @Override
    public ArmVirtualRegister toArmRegister(List<ArmInstruction> instructions) {
        if(this.register == null) {
            register = ValueToArm.convertValueToArm(this, instructions);
        }
        return register;
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        try {
            return new LatticeInteger(Integer.parseInt(value));
        } catch(Exception ex) {
            //System.out.println("Literal with value " + value);
            return new LatticeBottom();
        }
    }
}
