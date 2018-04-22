package llvm;

public class UnconditionalBranch implements Instruction{
    private String dest;

    public UnconditionalBranch(String dest) {
        this.dest = dest;
    }

    public String toLLVM() {
        return "br label %" + dest;
    }
}
