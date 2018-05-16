package arm.ArmValue;

import arm.ArmValue.FinalRegisters.ArmFinalRegister;
import arm.ArmValue.FinalRegisters.NotInterferingRegister;

import java.util.*;
import java.util.stream.Collectors;

public abstract class ArmRegister implements ArmValue, Comparable<ArmRegister> {

    private Set<ArmRegister> interferences;

    public ArmRegister() {
        interferences = new HashSet<>();
    }

    public void addInterference(ArmRegister node) {

        if(!this.stringEquals(node)
                && !(node instanceof NotInterferingRegister)
                && !(this instanceof NotInterferingRegister)) {
            interferences.add(node);
        }
    }

    public Set<ArmRegister> getInterferences() {
        return this.interferences;
    }


    public boolean stringEquals(ArmRegister o) {
        String v0 = o.toArm().replace("%", "v");
        String thisOne = toArm().replace("%", "v");
        return thisOne.equals(v0);
    }

    public boolean hasInterference(ArmRegister o) {
        return interferences.stream().anyMatch(armRegister -> armRegister.stringEquals(o));
    }

    public boolean existsInSet(Set<ArmRegister> set) {
        return set.stream().anyMatch(armRegister -> armRegister.stringEquals(this));
    }

    public Set<ArmRegister> removeFromSet(Set<ArmRegister> set) {
        return set.stream().filter(armRegister -> !armRegister.stringEquals(this)).collect(Collectors.toSet());
    }

    public void removeInterference(ArmRegister reg) {
        this.interferences = interferences.stream().filter(armRegister -> !armRegister.stringEquals(reg)).collect(Collectors.toSet());
    }

    public void removeRegister(List<ArmRegister> set) {
        for (ArmRegister register: set) {
            if(register.hasInterference(this)) {
                register.removeInterference(this);
            }

        }

    }

    @Override
    public int compareTo(ArmRegister o) {
        if(this instanceof ArmFinalRegister && o instanceof ArmFinalRegister) {
            return 0;
        }
        else if(this instanceof ArmFinalRegister) {
            return 1;
        }
        else if(o instanceof ArmFinalRegister) {
            return -1;
        }
        return this.interferences.size() - o.interferences.size();
    }

    public Set<String> findInterferenceColors(Map<String, String> regColors) {
        Set<String> colorInterferences = new HashSet<>();
        //System.out.print(this.toArm() + " -- interferes with : ");
        for(ArmRegister reg:interferences) {
            //System.out.print(regColors.get(reg.toArm()) + " ");
            colorInterferences.add(regColors.get(reg.toArm()));
        }
        //System.out.println();
        return colorInterferences;
    }
}
