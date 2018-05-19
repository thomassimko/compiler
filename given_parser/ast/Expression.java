package ast;

import cfg.Block;
import llvm.Instruction;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public interface Expression
{
    Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName);
    Value getCFGValue(Block block, List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable);
}
