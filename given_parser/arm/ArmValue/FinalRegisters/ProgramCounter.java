package arm.ArmValue.FinalRegisters;

public class ProgramCounter extends NotInterferingRegister {
    private static ProgramCounter single_instance = null;

    private ProgramCounter() {
        super("pc");
    }

    public static ProgramCounter getInstance()
    {
        if (single_instance == null)
            single_instance = new ProgramCounter();

        return single_instance;
    }
}
