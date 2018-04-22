package ast;

import llvm.Instruction;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public interface Lvalue
{
    Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName);
    Value getCFGValue(List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable);
}
