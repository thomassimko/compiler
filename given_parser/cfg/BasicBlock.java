package cfg;

public class BasicBlock extends Block {

    public BasicBlock(String label, String function) {
        super(label, function);
        super.sealBlock();
    }

}