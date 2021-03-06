package llvm;

import arm.*;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;
import arm.ArmValue.ArmImmediate;
import arm.Branch;
import llvm.lattice.LatticeInteger;
import llvm.lattice.LatticeValue;
import llvm.value.Register;
import llvm.value.Value;
import llvm.value.ValueLiteral;

import java.util.HashMap;
import java.util.List;

public class Print extends AbstactInstruction {

    private Value value;
    private boolean printLine;

    public Print(Value value, boolean printLine) {
        super();
        this.value = value;
        this.printLine = printLine;
        this.addInstructionToRegisters();

    }
    @Override
    public String toLLVM() {
        String inst = this.printLine ? "println" : "print";
        return "call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @." + inst +
                ", i32 0, i32 0), i32 " + value.toLLVM() + ")";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        //mov r1, %r8
//        movw r0, #:lower16:.PRINTLN_FMT
//        movt r0, #:upper16:.PRINTLN_FMT
//        bl printf
        String printType = this.printLine ? ".PRINTLN_FMT": ".PRINT_FMT";

        ArmInstruction moveVal = new Move(MoveType.DEFAULT, new ArmFinalRegister("r1"), value.toArmRegister(instructions), 0, false);
        ArmInstruction movw = new Move(MoveType.W, new ArmFinalRegister("r0"), new ArmImmediate(printType), 1, false);
        ArmInstruction movt = new Move(MoveType.T, new ArmFinalRegister("r0"), new ArmImmediate(printType), 2, false);
        ArmInstruction branch = new Branch(BranchType.L, "printf", 1);

        instructions.add(moveVal);
        instructions.add(movw);
        instructions.add(movt);
        instructions.add(branch);
    }

    @Override
    public void addInstructionToRegisters() {
        if(value instanceof Register) {
            //System.out.println("adding use " + value.toLLVM());
            ((Register) value).addUse(this);
        }
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        System.err.println("print lattice called");
        return null;
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
}
