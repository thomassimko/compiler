import arm.ArmValue.ArmRegister;
import arm.ArmValue.FinalRegisters.ArmFinalRegister;

import java.util.*;

public class GraphColorer {

    public static Map<String, String> allocateRegisters(Set<ArmRegister> registers) {
        List<ArmRegister> registerList = new ArrayList<>(registers);

        Stack<ArmRegister> regStack = new Stack<>();

        while(registerList.size() > 0) {
            Collections.sort(registerList);
            ArmRegister curRegister = registerList.get(0);

            //System

//            if(curRegister.toArm().equals("%r413")) {
//                System.out.println(String.join(", ", curRegister.getInterferences().stream().map(armRegister -> armRegister.toArm()).toArray(String[]::new)));
//            }

//            System.out.println(curRegister.toArm() + " : " + curRegister.getInterferences().size());
            regStack.push(curRegister);

            curRegister.removeRegister(registerList);
            registerList.remove(curRegister);
        }

        Map<String, String> regColors = new HashMap<>();
        while(!regStack.empty()) {
            applyColor(regStack.pop(), regColors);
        }

        return regColors;

    }

    private static void applyColor(ArmRegister curReg, Map<String, String> regColors) {
        if (curReg instanceof ArmFinalRegister) {
            regColors.put(curReg.toArm(), curReg.toArm());
        }
        else {
            String[] possibleColors = {"r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10"};
            List<String> colors = new ArrayList<>(Arrays.asList(possibleColors));


            colors.removeAll(curReg.findInterferenceColors(regColors));

            if(colors.size() == 0) {
                System.err.println("Spill");
                System.exit(1);
            }

            regColors.put(curReg.toArm(), colors.iterator().next());

            //System.out.println(curReg.toArm() + " -- color : " + regColors.get(curReg.toArm()));
        }

    }
}
