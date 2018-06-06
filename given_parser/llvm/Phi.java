package llvm;

import arm.ArmInstruction;
import arm.ArmValue.ArmVirtualRegister;
import arm.ArmValue.PhiCounter;
import arm.Move;
import arm.MoveType;
import ast.Type;
import cfg.Block;
import llvm.lattice.LatticeInteger;
import llvm.lattice.LatticeTop;
import llvm.lattice.LatticeValue;
import llvm.lattice.SSCP;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;
import llvm.value.ValueLiteral;

import java.util.*;

public class Phi extends AbstactInstruction {

    private Register target;
    private Block block;
    private List<Value> operands;
    private List<Block> operandFrom;
    private String name;
    private Type type;
    private ArmVirtualRegister phiValue;
    private Set<Register> usedRegisters;

    public Phi(Block block, String name, Type type) {
        super();
        this.block = block;
        this.name = name;
        this.type = type;
        target = RegisterCounter.getNextRegister();
        phiValue = PhiCounter.getNextPhi();
        operands = new ArrayList<>();
        operandFrom = new ArrayList<>();
        usedRegisters = new HashSet<>();

        //this.target = new Register(target);
        this.addInstructionToRegisters();

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

    public Register getTarget() {
        return target;
    }

    public Block getBlock() {
        return block;
    }

    public void appendOperand(Value value, Block block) {
        operands.add(value);
        operandFrom.add(block);
        if(value instanceof Register) {
            usedRegisters.add((Register)value);
            ((Register)value).addUse(this);
        }
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

    @Override
    public void addInstructionToRegisters() {
        usedRegisters.add(target);
        target.setDef(this);
    }

    @Override
    public LatticeValue getLatticeValue(HashMap<Register, LatticeValue> lattice) {
        LatticeValue value = new LatticeTop();
        for(Value val: operands) {
            value = SSCP.matchTypes(value, val.getLatticeValue(lattice));
        }
        return value;
    }

    @Override
    public Register[] getUsedRegisters() {
        Register[] registers = new Register[usedRegisters.size()];
        return usedRegisters.toArray(registers);
    }

    @Override
    public void replaceRegisterWithLattice(HashMap<Register, LatticeValue> lattice) {
        for(int i = 0; i < operands.size(); i++) {
            Value val = operands.get(i);
            if(val instanceof Register) {
                LatticeValue value = lattice.get(val);
                if(value instanceof LatticeInteger) {
                    operands.remove(val);
                    operands.add(i, new ValueLiteral(((LatticeInteger) value).getValue() + ""));
                }
            }
        }
    }

    @Override
    public Value[] getSources() {
        return operands.toArray(new Value[operands.size()]);
    }

    @Override
    public void replaceSource(HashMap<Value, Value> newValueMappings) {
        for(int i = 0; i < operands.size(); i++) {
            Value arg = operands.get(i);
            if(newValueMappings.containsKey(arg)) {

                operands.remove(i);
                operands.add(i, newValueMappings.get(arg));
            }
        }
    }
}
