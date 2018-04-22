package cfg;

import llvm.Instruction;

import java.util.ArrayList;
import java.util.List;

public abstract class Block {

    private List<Block> predecessors;
    private List<Block> successors;
    private String label;
    private List<Instruction> llvmCode;
    private String llvmLabel;
    private boolean hasReturn;


    public Block(String label) {
        this.label = label;
        this.successors = new ArrayList<Block>();
        this.predecessors = new ArrayList<Block>();
        llvmCode = new ArrayList<Instruction>();
        this.llvmLabel = BlockCounter.getNextBlockLabel();
    }

    public List<Block> getSuccessors() {
        return this.successors;
    }

    public String getLabel() {
        return this.label;
    }

    public String getGraphVisFormat() {
        StringBuilder output = new StringBuilder();
        for (Block successor: successors) {
                output.append(this.label + " -> " + successor.getLabel() + "\n");
        }
        for (Block predecessor: predecessors) {
            output.append(this.label + " -> " + predecessor.getLabel() + " [style=dashed]\n");
        }
        return output.toString();
    }

    public void addSuccessor(Block block) {
        this.successors.add(block);
        block.addPredecessor(this);
    }

    public void addPredecessor(Block block) {
        this.predecessors.add(block);
    }

    public boolean hasEndBlockSuccessor() {
        for(Block block: this.successors) {
            if (block instanceof EndBlock) {
                return true;
            }
        }
        return false;
    }

    public List<Instruction> getLLVM() {

        return llvmCode;
    }

    public void addInstructionToLLVM(Instruction instruction) {
        llvmCode.add(instruction);
    }

    public List<Instruction> getInstructionList() {
        return this.llvmCode;
    }

    public String getLlvmLabel() {
        return this.llvmLabel;
    }

    public boolean getHasReturn() {
        return this.hasReturn;
    }

    public void setHasReturn() {
        hasReturn = true;
    }

}
