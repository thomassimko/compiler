package llvm;

public class ReturnVoid implements Instruction {
    @Override
    public String toLLVM() {
        return "ret void";
    }
}
