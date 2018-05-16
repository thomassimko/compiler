package llvm.value;

import arm.ArmInstruction;
import arm.ArmLoad;
import arm.ArmValue.ArmImmediate;
import arm.ArmValue.ArmVirtualRegister;
import arm.Move;
import arm.MoveType;

import java.util.List;

public class ValueToArm {
    public static ArmVirtualRegister convertValueToArm(Value val, List<ArmInstruction> armInstructionList) {
        if (val instanceof Register) {
            return new ArmVirtualRegister(val.toLLVM());
        }
        else if (val instanceof Global) {
//            movw %r136, #:lower16:0
//            movt %r136, #:upper16:0
//            load %r137, [%r136]
            Global global = (Global) val;
            ArmVirtualRegister tempReg = convertValueToArm(RegisterCounter.getNextRegister(), armInstructionList);
            ArmVirtualRegister tempSaveReg = convertValueToArm(RegisterCounter.getNextRegister(), armInstructionList);
            Move movew = new Move(MoveType.W, tempReg, global.armDeclaration(), 1, false);
            Move movet = new Move(MoveType.T, tempReg, global.armDeclaration(), 2, false);
            ArmLoad globalLoad = new ArmLoad(tempSaveReg, tempReg);

            armInstructionList.add(movew);
            armInstructionList.add(movet);
            //armInstructionList.add(globalLoad);

            return tempReg;
        }
        else {
            int immediate = 0;
            try {
                immediate = Integer.parseInt(val.toLLVM());
            } catch (Exception ex) {
                //System.err.println("not an int");
                //It isnt an int
            }
            ArmVirtualRegister storeRegister = new ArmVirtualRegister(RegisterCounter.getNextRegister().toLLVM());
            ArmImmediate armImmed = new ArmImmediate(immediate + "");

            if(immediate < 128 && immediate >= -128) {
                ArmInstruction move = new Move(MoveType.DEFAULT, storeRegister, armImmed, 0, false);
                armInstructionList.add(move);
            }
            else {
                ArmInstruction moveLower = new Move(MoveType.W, storeRegister, armImmed, 1, false);
                ArmInstruction moveUpper = new Move(MoveType.T, storeRegister, armImmed, 2, false);
                armInstructionList.add(moveLower);
                armInstructionList.add(moveUpper);
            }
            return storeRegister;
        }
    }
}
