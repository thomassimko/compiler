package llvm;

import arm.ArmCompare;
import arm.ArmInstruction;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmValue;
import arm.ArmValue.ArmVirtualRegister;
import arm.Move;
import arm.MoveType;
import ast.Type;
import llvm.value.Register;
import llvm.value.Value;
import llvm.value.ValueLiteral;
import llvm.value.ValueToArm;

import java.util.HashMap;
import java.util.List;

public class Comparison implements Instruction {

    private Value value1;
    private Value value2;
    private Register storedRegister;
    private String compareOp;
    private Type type;

    public Comparison(Value value1, Value value2, String compareOp, Register storedRegister, Type type) {
        this.value1 = value1;
        this.value2 = value2;
        this.storedRegister = storedRegister;
        this.compareOp = compareOp;
        this.type = type;
    }

    public String toLLVM() {
        return storedRegister.toLLVM() + " = icmp " + compareOp + " " + type.getCFGType() + " " +
                value1.toLLVM() + ", " + value2.toLLVM();
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister armStore = ValueToArm.convertValueToArm(storedRegister, instructions);
        ArmVirtualRegister reg1 = ValueToArm.convertValueToArm(value1, instructions);
        ArmValue reg2;
        if(value2 instanceof ValueLiteral && !value2.toLLVM().equals("null")) {
            try {
                int value = Integer.parseInt(value2.toLLVM());
                if(value < 127 && value > -128)
                    reg2 = new ArmImmediate(value2.toLLVM());
                else
                    reg2 = ValueToArm.convertValueToArm(value2, instructions);
            } catch (Exception e) {
                reg2 = ValueToArm.convertValueToArm(value2, instructions);
            }
        } else {
            reg2 = ValueToArm.convertValueToArm(value2, instructions);
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
}
