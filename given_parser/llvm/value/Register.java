package llvm.value;

public class Register implements Value {

    private String registerLoc;

    public Register() {
        this.registerLoc = "%" + RegisterCounter.getNextRegister();
    }

    public Register(String name) {
        this.registerLoc = "%" + name;
    }

    public String toLLVM() {
        return registerLoc;
    }

}
