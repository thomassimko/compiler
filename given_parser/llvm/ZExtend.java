package llvm;

import arm.ArmInstruction;
import arm.ArmValue.ArmVirtualRegister;
import arm.Move;
import arm.MoveType;
import llvm.declarations.AbstactInstruction;
import llvm.lattice.LatticeInteger;
import llvm.lattice.LatticeValue;
import llvm.value.Register;
import llvm.value.Value;
import llvm.value.ValueLiteral;

import java.util.HashMap;
import java.util.List;

public class ZExtend extends AbstactInstruction {

    private Value source;
    private Register target;

    public ZExtend(Value source, Register target) {
        super();
        this.source = source;
        this.target = target;
        this.addInstructionToRegisters();

    }

    @Override
    public String toLLVM() {
        return this.target.toLLVM() + " = zext i1 " + source.toLLVM() + " to i32";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister r1 = target.toArmRegister(instructions);
        ArmVirtualRegister r2 = source.toArmRegister(instructions);
        ArmInstruction move = new Move(MoveType.DEFAULT, r1, r2, 0, false);
        instructions.add(move);
    }

    @Override
    public void addInstructionToRegisters() {
        target.setDef(this);
        if(source instanceof Register) {
            ((Register)source).addUse(this);
        }
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        return source.getLatticeValue(lattice);
    }

    @Override
    public Register[] getUsedRegisters() {
        if(source instanceof Register) {
            return new Register[]{target, ((Register)source)};
        }
        return new Register[]{target};
    }

    @Override
    public Register getTarget() {
        return target;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {
        if(source instanceof Register) {
            LatticeValue latvalue = lattice.get(source);
            if(latvalue instanceof LatticeInteger) {
                source = new ValueLiteral(((LatticeInteger) latvalue).getValue() + "");
            }
        }
    }
}
