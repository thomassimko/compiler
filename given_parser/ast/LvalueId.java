package ast;

import cfg.Block;
import llvm.Instruction;
import llvm.value.Global;
import llvm.value.Register;
import llvm.value.SSA;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public class LvalueId implements Lvalue {
    private final int lineNum;
    private final String id;
    private boolean isLocal;

    public LvalueId(int lineNum, String id) {
        this.lineNum = lineNum;
        this.id = id;
        isLocal = false;
    }

    public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
        if (currentFunctionName != null) {
            assert globalTable.get(currentFunctionName) instanceof FunctionType : "cannot find function " + currentFunctionName;
            FunctionType curFunction = (FunctionType) globalTable.get(currentFunctionName);

            assert globalTable.containsKey(id) || curFunction.getLocalScope().containsKey(id) : "No variable " + id + " found : line " + lineNum;

            if (curFunction.getLocalScope().containsKey(id)) {
                isLocal = true;
                return curFunction.getLocalScope().get(id);
            }
        }
        assert globalTable.containsKey(id) : "No variable " + id + " found : line " + lineNum;
        return globalTable.get(id);
    }

    @Override
    public Value getCFGValue(Block block, List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
        Value val;
        if (isLocal) {
            val = new Register(id);
        }
        else {
            val = new Global(id);
        }
//        if(SSA.isSSA) {
//            System.out.println(val.toLLVM() + " : " + this.lineNum);
//            SSA.writeVariable(block, id, val);
//        }
        return val;
    }

    public boolean isLocal() {
        return isLocal;
    }
}
