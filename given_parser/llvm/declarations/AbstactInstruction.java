package llvm.declarations;

import llvm.Instruction;

public abstract class AbstactInstruction  implements Instruction {
    private boolean isUseful;

    public AbstactInstruction() {
        isUseful = false;
    }

    @Override
    public void setUseful(boolean useful) {
        isUseful = useful;
    }

    @Override
    public boolean isUseful() {
        return isUseful;
    }
}
