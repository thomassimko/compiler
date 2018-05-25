package llvm;

import arm.ArmCompare;
import arm.ArmInstruction;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmValue;
import arm.ArmValue.ArmVirtualRegister;
import arm.Move;
import arm.MoveType;
import ast.Type;
import llvm.declarations.AbstactInstruction;
import llvm.lattice.LatticeInteger;
import llvm.lattice.LatticeTop;
import llvm.lattice.LatticeValue;
import llvm.lattice.SSCP;
import llvm.value.*;

import java.util.HashMap;
import java.util.List;

public class Comparison extends AbstactInstruction {

    private Value value1;
    private Value value2;
    private Register storedRegister;
    private String compareOp;
    private Type type;

    public Comparison(Value value1, Value value2, String compareOp, Register storedRegister, Type type) {
        super();
        this.value1 = value1;
        this.value2 = value2;
        this.storedRegister = storedRegister;
        this.compareOp = compareOp;
        this.type = type;
        this.addInstructionToRegisters();

    }

    public String toLLVM() {
        return storedRegister.toLLVM() + " = icmp " + compareOp + " " + type.getCFGType() + " " +
                value1.toLLVM() + ", " + value2.toLLVM();
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister armStore = storedRegister.toArmRegister(instructions);
        ArmVirtualRegister reg1 = value1.toArmRegister(instructions);
        ArmValue reg2;
        if(value2 instanceof ValueLiteral && !value2.toLLVM().equals("null")) {
            try {
                int value = Integer.parseInt(value2.toLLVM());
                if(value < 127 && value > -128)
                    reg2 = new ArmImmediate(value2.toLLVM());
                else
                    reg2 = value2.toArmRegister(instructions);
            } catch (Exception e) {
                reg2 = value2.toArmRegister(instructions);
            }
        } else {
            reg2 = value2.toArmRegister(instructions);
        }
        ArmInstruction move = new Move(MoveType.DEFAULT, armStore, new ArmImmediate("0"), 0, false);
        ArmInstruction compare = new ArmCompare(reg1, reg2);

        MoveType type = MoveType.DEFAULT;
        switch (compareOp) {
            case "eq":
                type = MoveType.EQ;
                break;
            case "ne":
                type = MoveType.NE;
                break;
            case "sgt":
                type = MoveType.GT;
                break;
            case "sge":
                type = MoveType.GE;
                break;
            case "slt":
                type = MoveType.LT;
                break;
            case "sle":
                type = MoveType.LE;
                break;
            default:
                System.err.println("Type not defined");
                System.exit(1);
        }
        ArmInstruction conditionalMove = new Move(type, armStore, new ArmImmediate("1"), 0, true);
        instructions.add(move);
        instructions.add(compare);
        instructions.add(conditionalMove);
    }

    @Override
    public void addInstructionToRegisters() {
        if(value1 instanceof Register) {
            ((Register) value1).addUse(this);
        }
        if(value2 instanceof Register) {
            ((Register) value2).addUse(this);
        }
        this.storedRegister.setDef(this);
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        LatticeValue latticeValue1 = value1.getLatticeValue(lattice);
        LatticeValue latticeValue2 = value2.getLatticeValue(lattice);

        if(latticeValue1 instanceof LatticeInteger && latticeValue2 instanceof LatticeInteger) {
            int latIntVal1 = ((LatticeInteger) latticeValue1).getValue();
            int latIntVal2 = ((LatticeInteger) latticeValue2).getValue();
            switch (compareOp) {
                case "eq":
                    return new LatticeInteger(latIntVal1 == latIntVal2 ? 1 : 0);
                case "ne":
                    return new LatticeInteger(latIntVal1 != latIntVal2 ? 1 : 0);
                case "sgt":
                    return new LatticeInteger(latIntVal1 > latIntVal2 ? 1 : 0);
                case "sge":
                    return new LatticeInteger(latIntVal1 >= latIntVal2 ? 1 : 0);
                case "slt":
                    return new LatticeInteger(latIntVal1 < latIntVal2 ? 1 : 0);
                case "sle":
                    return new LatticeInteger(latIntVal1 <= latIntVal2 ? 1 : 0);
                default:
                    System.err.println("Type not defined");
                    System.exit(1);
            }
        }
        //return new LatticeTop();
        return SSCP.matchTypes(value1.getLatticeValue(lattice), value2.getLatticeValue(lattice));
    }

    @Override
    public Register[] getUsedRegisters() {
        if(value1 instanceof Register && value2 instanceof Register) {
            return new Register[]{((Register) value1), ((Register) value2), storedRegister};
        }
        else if(value1 instanceof Register) {
            return new Register[]{((Register) value1), storedRegister};
        }
        else if(value2 instanceof Register) {
            return new Register[]{((Register) value2), storedRegister};
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
            LatticeValue value = value1.getLatticeValue(lattice);
            if(value instanceof LatticeInteger) {
                value1 = new ValueLiteral(((LatticeInteger) value).getValue() + "");
            }
        }
        if(value2 instanceof Register) {
            LatticeValue value = value2.getLatticeValue(lattice);
            if(value instanceof LatticeInteger) {
                value2 = new ValueLiteral(((LatticeInteger) value).getValue() + "");
            }
        }
    }
}
