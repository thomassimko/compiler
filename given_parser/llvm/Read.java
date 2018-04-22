package llvm;

import llvm.value.Value;

public class Read implements Instruction {

    private Value target;

    public Read(Value target) {
        this.target = target;
    }
    @Override
    public String toLLVM() {
        return "call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i32* " +
            target.toLLVM() + ")";
    }


    //call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @intList)

}
