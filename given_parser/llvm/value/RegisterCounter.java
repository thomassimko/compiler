package llvm.value;

public class RegisterCounter {

    private static int currentRegister = 0;
    private static int phiCount = 0;

    public static Register getNextRegister() {
        int register = currentRegister;
        currentRegister++;
        return new Register("r" + register);
    }
}
