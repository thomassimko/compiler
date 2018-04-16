package cfg;

import java.util.ArrayList;
import java.util.List;

public abstract class Block {

    private List<Block> predecessors;
    private List<Block> successors;
    private String label;

    public Block(String label) {
        this.label = label;
        this.successors = new ArrayList<Block>();
        this.predecessors = new ArrayList<Block>();
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

}
