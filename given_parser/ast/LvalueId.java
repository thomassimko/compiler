package ast;

import java.util.HashMap;

public class LvalueId implements Lvalue {
    private final int lineNum;
    private final String id;

    public LvalueId(int lineNum, String id) {
        this.lineNum = lineNum;
        this.id = id;
    }

    public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
        if (currentFunctionName != null) {
            assert globalTable.get(currentFunctionName) instanceof FunctionType : "cannot find function " + currentFunctionName;
            FunctionType curFunction = (FunctionType) globalTable.get(currentFunctionName);

            assert globalTable.containsKey(id) || curFunction.getLocalScope().containsKey(id) : "No variable " + id + " found : line " + lineNum;

            if (curFunction.getLocalScope().containsKey(id)) {
                return curFunction.getLocalScope().get(id);
            }
        }
        assert globalTable.containsKey(id) : "No variable " + id + " found : line " + lineNum;
        return globalTable.get(id);
    }
}
