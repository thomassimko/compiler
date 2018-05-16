package arm.ArmValue.FinalRegisters;

public class LinkVirtualRegister extends NotInterferingRegister {
    private static LinkVirtualRegister single_instance = null;

    private LinkVirtualRegister() {
        super("lr");
    }

    public static LinkVirtualRegister getInstance()
    {
        if (single_instance == null)
            single_instance = new LinkVirtualRegister();

        return single_instance;
    }
}
