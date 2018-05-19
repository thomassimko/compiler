package arm.ArmValue;

public class PhiCounter {
    private static int phiCount = 0;

    public static ArmRegister getNextPhi() {
        int register = phiCount;
        phiCount++;
        return new ArmVirtualRegister("phi" + register);
    }
}
