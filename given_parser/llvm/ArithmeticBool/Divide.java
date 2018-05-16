package llvm.ArithmeticBool;

import arm.*;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;
import arm.ArmValue.ArmVirtualRegister;
import llvm.value.Register;
import llvm.value.Value;
import llvm.value.ValueToArm;

import java.util.HashMap;
import java.util.List;

public class Divide extends ArithmeticBoolOp {

    public Divide(Value value1, Value value2, Register storedRegister) {
        super(value1, value2, "sdiv", storedRegister);
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
//        mov r1, r0
//        mov r0, r2
//        bl __aeabi_idiv
        ArmVirtualRegister r0 = ValueToArm.convertValueToArm(value1, instructions);
        ArmVirtualRegister r1 = ValueToArm.convertValueToArm(value2, instructions);
        ArmVirtualRegister store = ValueToArm.convertValueToArm(storedRegister, instructions);
        Move move1 = new Move(MoveType.DEFAULT, new ArmFinalRegister("r1"), r1, 0, false);
        Move move2 = new Move(MoveType.DEFAULT, new ArmFinalRegister("r0"), r0, 0, false);

        Branch branch = new Branch(BranchType.L, "__aeabi_idiv", 0);

        Move move3 = new Move(MoveType.DEFAULT, store, new ArmFinalRegister("r0"), 0 , false);

        instructions.add(move1);
        instructions.add(move2);
        instructions.add(branch);
        instructions.add(move3);
    }
}

