package ast;

import cfg.BasicBlock;
import cfg.Block;
import cfg.EndBlock;
import cfg.StartBlock;

import java.util.HashMap;
import java.util.List;

public class Function implements Type
{
   private final int lineNum;
   private final String name;
   private final Type retType;
   private final List<Declaration> params;
   private final List<Declaration> locals;
   private final Statement body;

   public Function(int lineNum, String name, List<Declaration> params,
      Type retType, List<Declaration> locals, Statement body)
   {
      this.lineNum = lineNum;
      this.name = name;
      this.params = params;
      this.retType = retType;
      this.locals = locals;
      this.body = body;
   }

   public void addToTable(HashMap<String, Type> globalTable) {

      HashMap<String, Type> localTable = new HashMap<String, Type>();
      for(Declaration param: params) {
         param.addToTable(localTable);
      }
      for(Declaration local: locals) {
         local.addToTable(localTable);
      }
      FunctionType fType = new FunctionType(lineNum, name, localTable, params, retType);
      assert !globalTable.containsKey(name) : "Variable with name " + name + " is already defined : line " + lineNum;
      globalTable.put(name, fType);
   }

   public void checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable) {
      boolean doesReturn = body.checkTypes(globalTable, structTable, name);
      if (!(retType instanceof VoidType)) {
         assert doesReturn : "Function " + name + " does not return along all paths";
      }
   }

   public StartBlock getCFG(List<Block> blockList) {
      StartBlock start = new StartBlock(this.name);
      BasicBlock block = new BasicBlock(this.name + "Block1");
      start.addSuccessor(block);
      EndBlock end = new EndBlock(this.name);

      blockList.add(start);
      blockList.add(block);
      blockList.add(end);

      Block lastNode = body.getCFG(block, end, blockList);

      if(!lastNode.hasEndBlockSuccessor()) {
         lastNode.addSuccessor(end);
      }

      return start;
   }
}
