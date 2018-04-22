package llvm.value;

public class Global implements Value {
    private String name;

    public Global(String name) {
        this.name = "@" + name;
    }

    @Override
    public String toLLVM() {
        return name;
    }
}
