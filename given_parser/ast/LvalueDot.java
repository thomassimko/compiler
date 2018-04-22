package ast;

import llvm.GetElementPointer;
import llvm.Instruction;
import llvm.Load;
import llvm.Store;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

public class LvalueDot implements Lvalue {
    private final int lineNum;
    private final Expression left;
    private final String id;
    private StructType type;

    public LvalueDot(int lineNum, Expression left, String id) {
        this.lineNum = lineNum;
        this.left = left;
        this.id = id;
    }

    public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
        Type leftType = left.getType(globalTable, structTable, currentFunctionName);

        assert leftType instanceof StructType : "Left hand side is not of type Struct : line " + lineNum;

        StructType leftStruct = (StructType) leftType;
        this.type = (StructType) leftType;

        assert structTable.containsKey(leftStruct.getName()) : "No Struct " + leftStruct.getName() + " found : line " + lineNum;

        HashMap<String, Type> struct = structTable.get(leftStruct.getName());

        assert struct.containsKey(id) : "No value " + id + " found in type Struct " + leftStruct.getName() + " : line " + lineNum;

        return struct.get(id);
    }

    @Override
    public Value getCFGValue(List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
        Value leftReg = left.getCFGValue(instructionList, structTable);
        Register r1 = RegisterCounter.getNextRegister();
        //Register r2 = RegisterCounter.getNextRegister();

        List<String> sortedList = new ArrayList<>(structTable.get(type.getName()).keySet());
        Collections.sort(sortedList);
        int index = sortedList.indexOf(id);

        GetElementPointer getElem = new GetElementPointer(r1, type.getCFGType(), leftReg, index);
        //Load loadStruct = new Load(r2, type.getCFGType(), r1);

        instructionList.add(getElem);
        //instructionList.add(loadStruct);

        return r1;

    }
}
