package llvm;

import arm.*;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.FinalRegisters.FramePointer;
import arm.ArmValue.FinalRegisters.ProgramCounter;
import arm.ArmValue.FinalRegisters.StackPointer;
import llvm.declarations.AbstactInstruction;
import llvm.lattice.LatticeValue;
import llvm.value.Register;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class FunctionEnd  extends AbstactInstruction {

    private String name;

    public FunctionEnd(String name) {
        super();
        this.name = name;
        this.addInstructionToRegisters();
        this.setUseful(true);

    }

    @Override
    public String toLLVM() {
        return "}\n";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {

        ArithmeticInstruction fpsub = new ArithmeticInstruction(ArithInstructionType.SUB, FramePointer.getInstance(), StackPointer.getInstance(), new ArmImmediate("4"));
        instructions.add(fpsub);

        //push {r4,r5,r6,r8,r9,r10,r11}
        List<ArmRegister> popRegisters = new ArrayList<>();
//        popRegisters.add(new ArmVirtualRegister("r0"));
//        popRegisters.add(new ArmVirtualRegister("r1"));
//        popRegisters.add(new ArmVirtualRegister("r2"));
//        popRegisters.add(new ArmVirtualRegister("r3"));
        popRegisters.add(new ArmVirtualRegister("r4"));
        popRegisters.add(new ArmVirtualRegister("r5"));
        popRegisters.add(new ArmVirtualRegister("r6"));
        popRegisters.add(new ArmVirtualRegister("r7"));
        popRegisters.add(new ArmVirtualRegister("r8"));
        popRegisters.add(new ArmVirtualRegister("r9"));
        popRegisters.add(new ArmVirtualRegister("r10"));
        instructions.add(new PushPop(PushPopType.POP, popRegisters));

        popRegisters = new ArrayList<>();
        popRegisters.add(FramePointer.getInstance());
        popRegisters.add(ProgramCounter.getInstance());
        instructions.add(new PushPop(PushPopType.POP, popRegisters));

        instructions.add(new ArmFunctionEnd(this.name));
    }

    @Override
    public void addInstructionToRegisters() {
        //do nothing
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        System.err.println("Shouldnt be called");
        return null;
    }

    @Override
    public Register[] getUsedRegisters() {
        return new Register[0];
    }

    @Override
    public Register getTarget() {
        return null;
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {
    }
}
