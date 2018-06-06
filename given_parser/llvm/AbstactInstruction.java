package llvm;

import llvm.value.Value;

import java.util.HashMap;

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

    @Override
    public Value[] getSources() {
        return new Value[0];
    }

    @Override
    public void replaceSource(HashMap<Value, Value> newValueMappings) {

    }
}
