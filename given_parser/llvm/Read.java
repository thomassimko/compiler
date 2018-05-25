package llvm;

import arm.*;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;
import arm.ArmValue.FinalRegisters.StackPointer;
import arm.Branch;
import llvm.declarations.AbstactInstruction;
import llvm.lattice.LatticeBottom;
import llvm.lattice.LatticeValue;
import llvm.value.*;

import java.util.HashMap;
import java.util.List;

public class Read extends AbstactInstruction {

    private Value target;

    public Read(Value target) {
        super();
        this.target = target;
        this.addInstructionToRegisters();

    }
    @Override
    public String toLLVM() {
        return "call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* " +
            target.toLLVM() + ")";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
//        movw r1, #:lower16:.read_scratch
//        movt r1, #:upper16:.read_scratch
//        movw r0, #:lower16:.READ_FMT
//        movt r0, #:upper16:.READ_FMT
//        bl scanf
//        movw r6, #:lower16:.read_scratch
//        movt r6, #:upper16:.read_scratch
//        ldr r6, [r6]
        Move movwr1 = new Move(MoveType.W, new ArmFinalRegister("r1"), new ArmImmediate(".read_scratch"), 1, false);
        Move movtr1 = new Move(MoveType.T, new ArmFinalRegister("r1"), new ArmImmediate(".read_scratch"), 2, false);

        Move movwr0 = new Move(MoveType.W, new ArmFinalRegister("r0"), new ArmImmediate(".READ_FMT"), 1, false);
        Move movtr0 = new Move(MoveType.T, new ArmFinalRegister("r0"), new ArmImmediate(".READ_FMT"), 2, false);

        Branch branch = new Branch(BranchType.L, "scanf", 2);

        Register tempReg = RegisterCounter.getNextRegister();
        ArmVirtualRegister tempArmReg = tempReg.toArmRegister(instructions);

        Move movwr6 = new Move(MoveType.W, tempArmReg, new ArmImmediate(".read_scratch"), 1, false);
        Move movtr6 = new Move(MoveType.T, tempArmReg, new ArmImmediate(".read_scratch"), 2, false);

        ArmLoad load = new ArmLoad(tempArmReg, tempArmReg);

        //System.out.println("target: " + target.toLLVM());
        //System.out.println("offsets: " + String.join(", ", offsets.keySet()));

        instructions.add(movwr1);
        instructions.add(movtr1);
        instructions.add(movwr0);
        instructions.add(movtr0);
        instructions.add(branch);
        instructions.add(movwr6);
        instructions.add(movtr6);
        instructions.add(load);


        ArmImmediate immediate = new ArmImmediate("0");
        ArmRegister storeLoc;

        if(target instanceof Global) {
            storeLoc = target.toArmRegister(instructions);
        }
        else {
            String key = target.toLLVM().replace("%", "");

            if (offsets.containsKey(key)) {
                storeLoc = StackPointer.getInstance();
                immediate = new ArmImmediate(offsets.get(key) + "");
            }
            else {
                storeLoc = target.toArmRegister(instructions);
            }
        }

        ArmStore store = new ArmStore(tempArmReg, storeLoc, immediate);
        instructions.add(store);
    }

    @Override
    public void addInstructionToRegisters() {
        if(target instanceof Register) {
            ((Register)target).setDef(this);
        }
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        return new LatticeBottom();
    }

    @Override
    public Register[] getUsedRegisters() {
        if(target instanceof Register) {
            return new Register[]{((Register) target)};
        }
        return new Register[0];
    }

    @Override
    public Register getTarget() {
        if(target instanceof Register) {
            return (Register) target;

        }
        return null;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {
    }
}
