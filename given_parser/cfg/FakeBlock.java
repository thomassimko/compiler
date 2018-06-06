package cfg;

public class FakeBlock extends Block {
    public FakeBlock(String label, String function) {
        super("fake" + label, function);
        super.sealBlock();
    }
}
