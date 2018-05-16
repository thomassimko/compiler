package arm.ArmValue;

public class ArmImmediate implements ArmValue {
    private String value;
    public ArmImmediate(String value) {
        this.value = value;
    }

    @Override
    public String toArm() {
        return "#" + value;
    }

    public String getUpper() {
        return "#:upper16:" + value;
    }

    public String getLower() {
        return "#:lower16:" + value;
    }

    public String getValue() {
        return value;
    }
}
