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

public class ZExtend implements Instruction {

    private Value source;
    private Register target;

    public ZExtend(Value source, Register target) {
        this.source = source;
        this.target = target;
    }

    @Override
    public String toLLVM() {
        return this.target.toLLVM() + " = zext i1 " + source.toLLVM() + " to i32";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister r1 = ValueToArm.convertValueToArm(target, instructions);
        ArmVirtualRegister r2 = ValueToArm.convertValueToArm(source, instructions);
        ArmInstruction move = new Move(MoveType.DEFAULT, r1, r2, 0, false);
        instructions.add(move);
    }
}
