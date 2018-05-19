package llvm.ArithmeticBool;

import arm.ArithInstructionType;
import arm.ArithmeticInstruction;
import arm.ArmInstruction;
import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmVirtualRegister;
import llvm.Instruction;
import llvm.value.Register;
import llvm.value.Value;
import llvm.value.ValueToArm;

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
            case "sdiv":
                //todo: this
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
}
