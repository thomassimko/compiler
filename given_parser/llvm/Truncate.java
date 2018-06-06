package llvm;

import arm.ArmInstruction;
import arm.ArmValue.ArmVirtualRegister;
import arm.Move;
import arm.MoveType;
import llvm.lattice.LatticeInteger;
import llvm.lattice.LatticeValue;
import llvm.value.Register;
import llvm.value.Value;
import llvm.value.ValueLiteral;

import java.util.HashMap;
import java.util.List;

public class Truncate extends AbstactInstruction {

    private Value value;
    private Register saveReg;

    public Truncate(Value value, Register saveReg) {
        super();
        this.value = value;
        this.saveReg = saveReg;
        this.addInstructionToRegisters();

    }

    @Override
    public String toLLVM() {
        return this.saveReg.toLLVM() + " = trunc i32 " + value.toLLVM() + " to i1";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister r1 = saveReg.toArmRegister(instructions);
        ArmVirtualRegister r2 = value.toArmRegister(instructions);
        ArmInstruction move = new Move(MoveType.DEFAULT, r1, r2, 0, false);
        instructions.add(move);
    }

    @Override
    public void addInstructionToRegisters() {
        saveReg.setDef(this);
        if(value instanceof Register) {
            ((Register)value).addUse(this);
        }
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        //System.out.println(value.toLLVM() + " " + value.getLatticeValue(lattice));
        return value.getLatticeValue(lattice);
    }

    @Override
    public Register[] getUsedRegisters() {
        if(value instanceof Register) {
            return new Register[]{saveReg, ((Register)value)};
        }
        return new Register[]{saveReg};
    }

    @Override
    public Register getTarget() {
        return saveReg;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {
        if (value instanceof Register) {
            LatticeValue latvalue = value.getLatticeValue(lattice);
            if (latvalue instanceof LatticeInteger) {
                value = new ValueLiteral(((LatticeInteger) latvalue).getValue() + "");
            }
        }
    }

    @Override
    public Value[] getSources() {
        return new Value[]{value};
    }

    @Override
    public void replaceSource(HashMap<Value, Value> newValueMappings) {
        if(newValueMappings.containsKey(value)) {

            if(newValueMappings.containsKey(value)) {

                if(value instanceof Register) {
                    ((Register) value).removeUse(this);
                }
                value = newValueMappings.get(value);

                if(value instanceof Register) {
                    ((Register) value).addUse(this);
                }
            }
        }
    }
}
