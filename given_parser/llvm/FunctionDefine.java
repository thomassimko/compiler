package llvm;

import arm.*;
import arm.ArmValue.*;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;
import arm.ArmValue.FinalRegisters.FramePointer;
import arm.ArmValue.FinalRegisters.LinkVirtualRegister;
import arm.ArmValue.FinalRegisters.StackPointer;
import cfg.StartBlock;
import llvm.declarations.ParameterDeclaration;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public class FunctionDefine implements Instruction {

    private String functionName;
    private List<ParameterDeclaration> parameters;
    private String retType;

    public FunctionDefine(String name, List<ParameterDeclaration> parameters, String retType) {
        this.functionName = name;
        this.parameters = parameters;
        this.retType = retType;
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

        //add fp,sp,#4
        instructions.add(new ArithmeticInstruction(ArithInstructionType.ADD, FramePointer.getInstance(), StackPointer.getInstance(), new ArmImmediate("4")));

        //push {r4,r5,r6,r8,r9,r10,r11}
        List<ArmRegister> pushRegisters = new ArrayList<>();
//        pushRegisters.add(new ArmVirtualRegister("r0"));
//        pushRegisters.add(new ArmVirtualRegister("r1"));
//        pushRegisters.add(new ArmVirtualRegister("r2"));
//        pushRegisters.add(new ArmVirtualRegister("r3"));
        pushRegisters.add(new ArmVirtualRegister("r4"));
        pushRegisters.add(new ArmVirtualRegister("r5"));
        pushRegisters.add(new ArmVirtualRegister("r6"));
        pushRegisters.add(new ArmVirtualRegister("r7"));
        pushRegisters.add(new ArmVirtualRegister("r8"));
        pushRegisters.add(new ArmVirtualRegister("r9"));
        pushRegisters.add(new ArmVirtualRegister("r10"));
        instructions.add(new PushPop(PushPopType.PUSH, pushRegisters));

        for (int i = 0; i < parameters.size(); i++) {
            if (i < 4) {
                instructions.add(
                        new Move(
                                MoveType.DEFAULT,
                                new ArmVirtualRegister(parameters.get(i).getName()),
                                new ArmFinalRegister("r" + i),
                                0,
                                false
                        ));
            }
            else {
                //todo: spill
            }
        }
    }
}
