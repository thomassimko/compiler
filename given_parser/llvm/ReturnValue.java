package llvm;

import arm.ArmInstruction;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;
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

public class ReturnValue extends AbstactInstruction {

    private String type;
    private Value value;

    public ReturnValue(String type, Value value) {
        super();
        this.type = type;
        this.value = value;
        this.addInstructionToRegisters();

    }
    @Override
    public String toLLVM() {
        return "ret " + type + " " + value.toLLVM();
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister reg = value.toArmRegister(instructions);
        ArmFinalRegister r0 = new ArmFinalRegister("r0");
        Move move = new Move(MoveType.DEFAULT, r0, reg, 0, false);
        instructions.add(move);
    }

    @Override
    public void addInstructionToRegisters() {
        if(value instanceof Register) {
            ((Register)value).addUse(this);
        }
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        return value.getLatticeValue(lattice);
    }

    @Override
    public Register[] getUsedRegisters() {
        if(value instanceof Register) {
            return new Register[]{((Register) value)};
        }
        return new Register[0];
    }

    @Override
    public Register getTarget() {
        return null;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {
        if(value instanceof Register) {
            LatticeValue latvalue = lattice.get(value);
            if(latvalue instanceof LatticeInteger) {
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

    public Value getValue() {
        return value;
    }
}
