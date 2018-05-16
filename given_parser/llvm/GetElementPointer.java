package llvm;

import arm.ArithInstructionType;
import arm.ArithmeticInstruction;
import arm.ArmInstruction;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmVirtualRegister;
import llvm.value.Register;
import llvm.value.Value;
import llvm.value.ValueLiteral;
import llvm.value.ValueToArm;

import java.util.HashMap;
import java.util.List;

public class GetElementPointer implements Instruction {

    private Register storedRegister;
    private String type;
    private Value source;
    private int arrLoc;

    public GetElementPointer(Register storedRegister, String type, Value source, int arrLoc) {
        this.storedRegister = storedRegister;
        this.type = type;
        this.source = source;
        this.arrLoc = arrLoc;
    }
    @Override
    public String toLLVM() {
        return this.storedRegister.toLLVM() + " = getelementptr " + type.replace('*', ' ') + ", " + type + " " + source.toLLVM() + ", i1 0, i32 " + arrLoc;
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister r1 = ValueToArm.convertValueToArm(storedRegister, instructions);
        ArmVirtualRegister r2 = ValueToArm.convertValueToArm(source, instructions);
        ArmImmediate r3 = new ArmImmediate(arrLoc * 4 + "");
        ArmInstruction add = new ArithmeticInstruction(ArithInstructionType.ADD, r1, r2, r3);

        instructions.add(add);
    }
}
