package llvm;

public class FunctionEnd  implements Instruction {

    @Override
    public String toLLVM() {
        return "}\n";
    }
}
