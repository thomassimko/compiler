package llvm;

import arm.ArmCompare;
import arm.ArmInstruction;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmVirtualRegister;
import arm.BranchType;
import llvm.lattice.LatticeInteger;
import llvm.lattice.LatticeTop;
import llvm.lattice.LatticeValue;
import llvm.value.Register;
import llvm.value.Value;
import llvm.value.ValueLiteral;

import java.util.HashMap;
import java.util.List;

public class Branch extends AbstactInstruction {

    private Value check;
    private String trueLabel;
    private String falseLabel;

    public Branch(Value check, String trueLabel, String falseLabel) {
        super();
        this.check = check;
        this.trueLabel = trueLabel;
        this.falseLabel = falseLabel;
        this.addInstructionToRegisters();

    }

    public String toLLVM() {
        return "br i1 " + check.toLLVM() + ", label %" + trueLabel + ", label %" + falseLabel + "\n";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister checkReg = check.toArmRegister(instructions);
        ArmCompare compare = new ArmCompare(checkReg, new ArmImmediate("1"));
        arm.Branch branchTrue = new arm.Branch(BranchType.EQ, "." + trueLabel, 0);
        arm.Branch branchFalse = new arm.Branch(BranchType.DEFAULT, "." + falseLabel, 0);

        instructions.add(compare);
        instructions.add(branchTrue);
        instructions.add(branchFalse);
    }

    @Override
    public void addInstructionToRegisters() {
        //Do nothing
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        return new LatticeTop();
    }

    @Override
    public Register[] getUsedRegisters() {
        if(check instanceof Register)
            return new Register[]{(Register) check};
        return new Register[0];
    }

    @Override
    public Register getTarget() {
        return null;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {
        if (check instanceof Register) {
            LatticeValue value = check.getLatticeValue(lattice);
            if(value instanceof LatticeInteger) {
                check = new ValueLiteral(((LatticeInteger) value).getValue() + "");
            }
        }
    }

    @Override
    public Value[] getSources() {
        return new Value[]{check};
    }

    @Override
    public void replaceSource(HashMap<Value, Value> newValueMappings) {

        if(newValueMappings.containsKey(check)) {

            if(check instanceof Register) {
                ((Register) check).removeUse(this);
            }
            check = newValueMappings.get(check);

            if(check instanceof Register) {
                ((Register) check).addUse(this);
            }
        }
    }
}
