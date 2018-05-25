package llvm.lattice;

public class LatticeInteger implements LatticeValue {

    private int value;
    public LatticeInteger(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
