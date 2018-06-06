package llvm;

import arm.*;
import arm.ArmValue.*;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;
import arm.ArmValue.FinalRegisters.FramePointer;
import arm.ArmValue.FinalRegisters.LinkVirtualRegister;
import arm.ArmValue.FinalRegisters.StackPointer;
import llvm.declarations.ParameterDeclaration;
import llvm.lattice.LatticeValue;
import llvm.value.Register;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public class FunctionDefine extends AbstactInstruction {

    private String functionName;
    private List<ParameterDeclaration> parameters;
    private String retType;

    public FunctionDefine(String name, List<ParameterDeclaration> parameters, String retType) {
        super();
        this.functionName = name;
        this.parameters = parameters;
        this.retType = retType;
        this.addInstructionToRegisters();
        this.setUseful(true);
    }
    @Override
    public String toLLVM() {
        String[] paramString = parameters.stream().map(param -> param.toLLVM()).toArray(String[]::new);
        return "define " + retType + " @" + functionName + "(" + String.join(", ", paramString) + ")\n{\n";
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
        instructions.add(new ArmFunction(functionName));

        //push {fp,lr}
        List<ArmRegister> pushFrameLink = new ArrayList<>();
        pushFrameLink.add(FramePointer.getInstance());
        pushFrameLink.add(LinkVirtualRegister.getInstance());
        instructions.add(new PushPop(PushPopType.PUSH, pushFrameLink));

        //push {r4,r5,r6,r8,r9,r10,r11}
        List<ArmRegister> pushRegisters = new ArrayList<>();
        pushRegisters.add(new ArmFinalRegister("r4"));
        pushRegisters.add(new ArmFinalRegister("r5"));
        pushRegisters.add(new ArmFinalRegister("r6"));
        pushRegisters.add(new ArmFinalRegister("r7"));
        pushRegisters.add(new ArmFinalRegister("r8"));
        pushRegisters.add(new ArmFinalRegister("r9"));
        pushRegisters.add(new ArmFinalRegister("r10"));
        instructions.add(new PushPop(PushPopType.PUSH, pushRegisters));

        //add fp,sp,#4
        instructions.add(new ArithmeticInstruction(ArithInstructionType.ADD, FramePointer.getInstance(), StackPointer.getInstance(), new ArmImmediate("4")));

        int frameOffset = 32;
        for (int i = 0 ; i < parameters.size(); i++) {
            String paramName = parameters.get(i).getName();
            if (i < 4) {
                instructions.add(
                        new Move(
                                MoveType.DEFAULT,
                                new ArmVirtualRegister(paramName),
                                new ArmFinalRegister("r" + i),
                                0,
                                false
                        ));
            }
            else {
                ArmLoad load = new ArmLoad(new ArmVirtualRegister(paramName), FramePointer.getInstance(), new ArmImmediate(frameOffset + ""));
                instructions.add(load);
                frameOffset += 4;
            }
        }
    }

    @Override
    public void addInstructionToRegisters() {
        //todo: figure out what to do here
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
