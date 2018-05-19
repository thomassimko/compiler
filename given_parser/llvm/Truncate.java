package llvm;

import arm.ArmInstruction;
import arm.ArmValue.ArmVirtualRegister;
import arm.Move;
import arm.MoveType;
import llvm.value.Register;
import llvm.value.Value;
import llvm.value.ValueToArm;

import java.util.HashMap;
import java.util.List;

public class Truncate implements Instruction {

    private Value value;
    private Register saveReg;

    public Truncate(Value value, Register saveReg) {
        this.value = value;
        this.saveReg = saveReg;
    }

    @Override
    public String toLLVM() {
        return this.saveReg.toLLVM() + " = trunc i32 " + value.toLLVM() + " to i1";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister r1 = saveReg.toArmRegister(instructions);
        ArmVirtualRegister r2 = value.toArmRegister(instructions);
        ArmInstruction move = new Move(MoveType.DEFAULT, r1, r2, 0, false);
        instructions.add(move);
    }
}
