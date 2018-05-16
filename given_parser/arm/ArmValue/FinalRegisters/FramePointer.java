package arm.ArmValue.FinalRegisters;

public class FramePointer extends NotInterferingRegister {
    private static FramePointer single_instance = null;

    private FramePointer() {
        super("fp");
    }

    public static FramePointer getInstance()
    {
        if (single_instance == null)
            single_instance = new FramePointer();

        return single_instance;
    }
}
