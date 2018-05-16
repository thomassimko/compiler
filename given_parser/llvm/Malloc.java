package llvm;

import arm.*;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmValue;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;
import arm.Branch;
import llvm.value.Value;
import llvm.value.ValueToArm;

import java.util.HashMap;
import java.util.List;

public class Malloc implements Instruction {

    private Value storedReg;
    private int bytes;

    public Malloc(Value storedReg, int bytes) {
        this.storedReg = storedReg;
        this.bytes = bytes;
    }

    @Override
    public String toLLVM() {
        return storedReg.toLLVM() + " = call i8* @malloc(i32 " + (8*bytes) + ")";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {

        ArmImmediate mallocByte = new ArmImmediate(bytes * 4 + "");
        if(bytes * 4 < 127 && bytes * 4 > -128) {
            Move moveArg = new Move(MoveType.DEFAULT, new ArmFinalRegister("r0"), mallocByte, 0, false);
            instructions.add(moveArg);
        }
        else {
            Move moveArgW = new Move(MoveType.W, new ArmFinalRegister("r0"), mallocByte, 1, false);
            Move moveArgT = new Move(MoveType.T, new ArmFinalRegister("r0"), mallocByte, 2, false);

            instructions.add(moveArgW);
            instructions.add(moveArgT);
        }

        ArmVirtualRegister target = ValueToArm.convertValueToArm(storedReg, instructions);
        instructions.add(new Branch(BranchType.L, "malloc", 0));
        ArmInstruction move = new Move(MoveType.DEFAULT, target, new ArmFinalRegister("r0"), 0, false);
        instructions.add(move);
    }
}
