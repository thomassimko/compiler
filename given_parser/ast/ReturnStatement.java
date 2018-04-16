package ast;

import cfg.Block;

import java.util.HashMap;
import java.util.List;

public class ReturnStatement
   extends AbstractStatement
{
   private final Expression expression;

   public ReturnStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   @Override
   public boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      assert currentFunctionName != null : "Cannot return from outside of a function : line " + lineNum;
      assert globalTable.get(currentFunctionName) instanceof FunctionType;
      FunctionType fType = (FunctionType) globalTable.get(currentFunctionName);
      assert expression.getType(globalTable, structTable, currentFunctionName).getClass() == fType.getReturnType().getClass()
              : "Return type does not match value returned : line " + lineNum;
      return true;
   }

   @Override
   public Block getCFG(Block curNode, Block endNode, List<Block> blockList) {
      curNode.addSuccessor(endNode);
      return curNode;
   }
}
