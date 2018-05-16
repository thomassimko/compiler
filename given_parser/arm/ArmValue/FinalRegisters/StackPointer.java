package arm.ArmValue.FinalRegisters;

public class StackPointer extends NotInterferingRegister {

    private static StackPointer single_instance = null;

    private StackPointer() {
        super("sp");
    }

    public static StackPointer getInstance()
    {
        if (single_instance == null)
            single_instance = new StackPointer();

        return single_instance;
    }
}
