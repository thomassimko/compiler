package llvm;

import arm.*;
import arm.ArmValue.ArmValue;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;
import arm.Branch;
import llvm.value.Register;
import llvm.value.Value;
import llvm.value.ValueToArm;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class InvocationCall implements Instruction {

    private Register storedRegister;
    private String retType;
    private String functionName;
    private Value[] args;
    private String[] types;

    public InvocationCall(Register storedRegister, String retType, String functionName, Value[] args, String[] types) {
        this.storedRegister = storedRegister;
        this.retType = retType;
        this.functionName = functionName;
        this.args = args;
        this.types = types;
    }

    public InvocationCall(String retType, String functionName, Value[] args, String[] types) {
        this.storedRegister = null;
        this.retType = retType;
        this.functionName = functionName;
        this.args = args;
        this.types = types;
    }

    @Override
    public String toLLVM() {
        StringBuilder output = new StringBuilder();
        if(this.storedRegister != null) {
            output.append(storedRegister.toLLVM() + " = ");
        }
        output.append("call " + retType + " @" + functionName + "(");
        for(int i = 0; i<args.length; i++) {
            output.append(types[i] + " " + args[i].toLLVM() + ", ");
        }
        if(output.lastIndexOf(",") != -1)
            output.deleteCharAt(output.lastIndexOf(","));
        output.append(')');
        return output.toString();
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        for(int i = 0; i<args.length; i++) {
            if (i < 4) {
                ArmFinalRegister reg = new ArmFinalRegister("r" + i);
                ArmValue valueReg = args[i].toArmRegister(instructions);
                ArmInstruction move = new Move(MoveType.DEFAULT, reg, valueReg, 0, true);
                instructions.add(move);

                //if(this.functionName.equals("placePiece"))
                    //System.out.println(args[i].toLLVM());
                    //System.out.println(move.toArm());
            }
            else {
                throw new RuntimeException("spill");
                //todo: use stack
            }
        }
        ArmInstruction branch = new Branch(BranchType.L, functionName, args.length);
        instructions.add(branch);

        if (storedRegister != null) {
            ArmInstruction move = new Move(
                    MoveType.DEFAULT,
                    storedRegister.toArmRegister(instructions),
                    new ArmFinalRegister("r0"),
                    0,
                    false);
            instructions.add(move);
        }
    }
}
