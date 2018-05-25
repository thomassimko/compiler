package llvm.ArithmeticBool;

import arm.ArithInstructionType;
import arm.ArithmeticInstruction;
import arm.ArmInstruction;
import arm.ArmValue.ArmRegister;
import llvm.Instruction;
import llvm.lattice.LatticeBottom;
import llvm.lattice.LatticeInteger;
import llvm.lattice.LatticeValue;
import llvm.lattice.SSCP;
import llvm.value.Register;
import llvm.value.Value;
import llvm.value.ValueLiteral;

import java.util.HashMap;
import java.util.List;

public class ArithmeticBoolOp implements Instruction {
    protected Value value1;
    protected Value value2;
    protected Register storedRegister;
    protected String instruction;


    public ArithmeticBoolOp(Value value1, Value value2, String instruction, Register storedRegister) {
        this.value1 = value1;
        this.value2 = value2;
        this.storedRegister = storedRegister;
        this.instruction = instruction;
        this.addInstructionToRegisters();
    }

    public String toLLVM() {
        return storedRegister.toLLVM() + " = " + instruction + " i32 " + value1.toLLVM() + ", " + value2.toLLVM();
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmRegister armReg1 = value1.toArmRegister(instructions);
        ArmRegister armReg2 = value2.toArmRegister(instructions);
        ArmRegister storeReg = storedRegister.toArmRegister(instructions);

        switch (instruction) {
            case "add":
                instructions.add(new ArithmeticInstruction(ArithInstructionType.ADD, storeReg, armReg1, armReg2));
                break;
            case "mul":
                instructions.add(new ArithmeticInstruction(ArithInstructionType.MUL, storeReg, armReg1, armReg2));
                break;
            case "sub":
                instructions.add(new ArithmeticInstruction(ArithInstructionType.SUB, storeReg, armReg1, armReg2));
                break;
            case "and":
                instructions.add(new ArithmeticInstruction(ArithInstructionType.AND, storeReg, armReg1, armReg2));
                break;
            case "or":
                instructions.add(new ArithmeticInstruction(ArithInstructionType.OR, storeReg, armReg1, armReg2));
                break;
            case "xor":
                instructions.add(new ArithmeticInstruction(ArithInstructionType.XOR, storeReg, armReg1, armReg2));
                break;
            default:
                System.err.println("No case for instruction: " + instruction);
                System.exit(1);
        }
    }

    @Override
    public void addInstructionToRegisters() {
        storedRegister.setDef(this);
        if(value1 instanceof Register) {
            ((Register) value1).addUse(this);
        }
        if(value2 instanceof Register) {
            ((Register) value2).addUse(this);
        }
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {

        LatticeValue latticeValue1 = value1.getLatticeValue(lattice);
        LatticeValue latticeValue2 = value2.getLatticeValue(lattice);

//        System.out.println("latticeValue1: " + latticeValue1 + " from value: " + value1.toLLVM());
//        System.out.println("latticeValue2: " + latticeValue2 + " from value: " + value2.toLLVM());

        boolean val1IsInt = latticeValue1 instanceof LatticeInteger;
        boolean val2IsInt = latticeValue2 instanceof LatticeInteger;

        if(val1IsInt && val2IsInt) {

            int latticeInt1 = ((LatticeInteger) latticeValue1).getValue();
            int latticeInt2 = ((LatticeInteger) latticeValue2).getValue();

            switch (instruction) {
                case "add":
                    return new LatticeInteger(latticeInt1 + latticeInt2);
                case "mul":
                    return new LatticeInteger(latticeInt1 * latticeInt2);
                case "sub":
                    return new LatticeInteger(latticeInt1 - latticeInt2);
                case "sdiv":
                    if (latticeInt2 == 0) {
                        return new LatticeBottom();
                    }
                    return new LatticeInteger(latticeInt1 / latticeInt2);
                case "and":
                    return new LatticeInteger(latticeInt1 & latticeInt2);
                case "or":
                    return new LatticeInteger(latticeInt1 | latticeInt2);
                case "xor":
                    return new LatticeInteger(latticeInt1 ^ latticeInt2);
                default:
                    System.err.println("No case for instruction: " + instruction);
                    System.exit(1);
            }

        }

        return SSCP.matchTypes(value1.getLatticeValue(lattice), value2.getLatticeValue(lattice));
    }

    @Override
    public Register[] getUsedRegisters() {

        if(value1 instanceof Register && value2 instanceof Register) {
            return new Register[]{(Register) value1, (Register) value2, storedRegister};
        }
        else if(value1 instanceof Register) {
            return new Register[]{(Register) value1, storedRegister};
        }
        else if(value2 instanceof Register) {
            return new Register[]{(Register) value2, storedRegister};
        }
        return new Register[]{storedRegister};

    }

    @Override
    public Register getTarget() {
        return storedRegister;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {
        if(value1 instanceof Register) {
            LatticeValue latvalue = lattice.get(value1);
            if(latvalue instanceof LatticeInteger) {
                value1 = new ValueLiteral(((LatticeInteger) latvalue).getValue() + "");
            }
        }
        if(value2 instanceof Register) {
            LatticeValue latvalue = lattice.get(value2);
            if(latvalue instanceof LatticeInteger) {
                value2 = new ValueLiteral(((LatticeInteger) latvalue).getValue() + "");
            }
        }
    }
}
