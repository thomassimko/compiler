package llvm;

import arm.ArmInstruction;
import arm.ArmValue.ArmVirtualRegister;
import arm.Move;
import arm.MoveType;
import llvm.lattice.LatticeBottom;
import llvm.lattice.LatticeInteger;
import llvm.lattice.LatticeValue;
import llvm.value.*;

import java.util.HashMap;
import java.util.List;

public class BitCast extends AbstactInstruction {

    private Register storedRegister;
    private Value sourceRegister;
    private String sourceType;
    private String targetType;

    public BitCast(Register storedRegister, Value sourceRegister, String sourceType, String targetType) {
        super();
        this.sourceRegister = sourceRegister;
        this.storedRegister = storedRegister;
        this.sourceType = sourceType;
        this.targetType = targetType;
        this.addInstructionToRegisters();

    }

    @Override
    public String toLLVM() {
        return storedRegister.toLLVM() + " = bitcast " + sourceType + " " + sourceRegister.toLLVM() + " to " + targetType;
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister source = sourceRegister.toArmRegister(instructions);
        ArmVirtualRegister target = storedRegister.toArmRegister(instructions);

        ArmInstruction move = new Move(MoveType.DEFAULT, target, source, 0, false);
        instructions.add(move);
    }

    @Override
    public void addInstructionToRegisters() {
        storedRegister.setDef(this);
        if(sourceRegister instanceof Register) {
            ((Register) sourceRegister).addUse(this);
        }
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        return new LatticeBottom();
    }

    @Override
    public Register[] getUsedRegisters() {
        if(sourceRegister instanceof Register) {
            return new Register[]{storedRegister, (Register) sourceRegister};
        }
        return new Register[]{storedRegister};
    }

    @Override
    public Register getTarget() {
        return storedRegister;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {
        if(sourceRegister instanceof Register) {
            LatticeValue value = lattice.get(storedRegister);
            if(value instanceof LatticeInteger) {
                sourceRegister = new ValueLiteral(((LatticeInteger) value).getValue() + "");
            }
        }
    }

    @Override
    public Value[] getSources() {
        return new Value[]{sourceRegister};
    }

    @Override
    public void replaceSource(HashMap<Value, Value> newValueMappings) {
        if(newValueMappings.containsKey(sourceRegister)) {

            if(sourceRegister instanceof Register) {
                ((Register) sourceRegister).removeUse(this);
            }

            sourceRegister = newValueMappings.get(sourceRegister);

            if(sourceRegister instanceof Register) {
                ((Register) sourceRegister).addUse(this);
            }
        }
    }
}
