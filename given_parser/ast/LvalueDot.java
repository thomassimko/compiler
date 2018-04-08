package ast;

import java.util.HashMap;

public class LvalueDot implements Lvalue {
    private final int lineNum;
    private final Expression left;
    private final String id;

    public LvalueDot(int lineNum, Expression left, String id) {
        this.lineNum = lineNum;
        this.left = left;
        this.id = id;
    }

    public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
        Type leftType = left.getType(globalTable, structTable, currentFunctionName);

        assert leftType instanceof StructType : "Left hand side is not of type Struct : line " + lineNum;

        StructType leftStruct = (StructType) leftType;

        assert structTable.containsKey(leftStruct.getName()) : "No Struct " + leftStruct.getName() + " found : line " + lineNum;

        HashMap<String, Type> struct = structTable.get(leftStruct.getName());

        assert struct.containsKey(id) : "No value " + id + " found in type Struct " + leftStruct.getName() + " : line " + lineNum;

        return struct.get(id);
    }
}
