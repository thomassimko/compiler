package ast;

import cfg.Block;

import java.util.HashMap;
import java.util.List;

public interface Statement
{
    boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName);
    Block getCFG(Block curNode, Block endNode, List<Block> blockList, HashMap<String, HashMap<String, Type>> structTable);
}
