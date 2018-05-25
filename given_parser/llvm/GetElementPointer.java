package llvm;

import arm.ArithInstructionType;
import arm.ArithmeticInstruction;
import arm.ArmInstruction;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmVirtualRegister;
import llvm.declarations.AbstactInstruction;
import llvm.lattice.LatticeBottom;
import llvm.lattice.LatticeValue;
import llvm.value.*;

import java.util.HashMap;
import java.util.List;

public class GetElementPointer extends AbstactInstruction {

    private Register storedRegister;
    private String type;
    private Value source;
    private int arrLoc;

    public GetElementPointer(Register storedRegister, String type, Value source, int arrLoc) {
        super();
        this.storedRegister = storedRegister;
        this.type = type;
        this.source = source;
        this.arrLoc = arrLoc;
        this.addInstructionToRegisters();

    }
    @Override
    public String toLLVM() {
        return this.storedRegister.toLLVM() + " = getelementptr " + type.replace('*', ' ') + ", " + type + " " + source.toLLVM() + ", i1 0, i32 " + arrLoc;
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        ArmVirtualRegister r1 = storedRegister.toArmRegister(instructions);
        ArmVirtualRegister r2 = source.toArmRegister(instructions);
        ArmImmediate r3 = new ArmImmediate(arrLoc * 4 + "");
        ArmInstruction add = new ArithmeticInstruction(ArithInstructionType.ADD, r1, r2, r3);

        instructions.add(add);
    }

    @Override
    public void addInstructionToRegisters() {
        storedRegister.setDef(this);
        if(source instanceof Register) {
            ((Register) source).addUse(this);
        }
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        return new LatticeBottom();
    }

    @Override
    public Register[] getUsedRegisters() {
        if (source instanceof Register) {
            return new Register[]{storedRegister, (Register) source};
        }
        return new Register[]{storedRegister};
    }

    @Override
    public Register getTarget() {
        return storedRegister;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {
    }
}
