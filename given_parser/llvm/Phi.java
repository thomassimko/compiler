package llvm;

import arm.ArmInstruction;
import arm.ArmValue.ArmRegister;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.PhiCounter;
import arm.Move;
import arm.MoveType;
import ast.Type;
import cfg.Block;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;
import llvm.value.ValueToArm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Phi implements Instruction {

    private Value target;
    private Block block;
    private List<Value> operands;
    private List<Block> operandFrom;
    private String name;
    private Type type;
    private ArmVirtualRegister phiValue;

    public Phi(Block block, String name, Type type) {

        this.block = block;
        this.name = name;
        this.type = type;
        target = RegisterCounter.getNextRegister();
        phiValue = PhiCounter.getNextPhi();
        operands = new ArrayList<>();
        operandFrom = new ArrayList<>();
        //this.target = new Register(target);
    }

    @Override
    public String toLLVM() {
        //%num0 = phi i32 [%u60, %LU13], [%num, %LU12]

        List<String> operandsString = new ArrayList<>();
        for (int i = 0; i < operands.size(); i++) {
            //System.err.println(operands.size() + " : " + i + " : " + operands.get(i).toLLVM());
            operandsString.add("[" + operands.get(i).toLLVM() + ", %" + operandFrom.get(i).getLlvmLabel() + "]");
        }
        return target.toLLVM() + " = phi " + type.getCFGType() + " " + String.join(", ", operandsString);
    }

    @Override
    public void toArm(List<ArmInstruction> instructions, HashMap<String, Integer> offsets) {
//        System.out.println(target.toLLVM());
        ArmVirtualRegister store = target.toArmRegister(instructions);
//        System.out.println(store.toArm());
        instructions.add(new Move(MoveType.DEFAULT, store, phiValue, 0, false));
    }

    public Value getTarget() {
        return target;
    }

    public Block getBlock() {
        return block;
    }

    public void appendOperand(Value value, Block block) {
        operands.add(value);
        operandFrom.add(block);
    }

    public List<Value> getOperands() {
        return operands;
    }

    public List<Block> getOperandFrom() {
        return operandFrom;
    }

    public String getName() {
        return name;
    }

    public Type getType() {
        return type;
    }

    public ArmVirtualRegister getPhiValue() {
        return phiValue;
    }
}
