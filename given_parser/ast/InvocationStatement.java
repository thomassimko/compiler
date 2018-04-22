package ast;

import cfg.Block;
import llvm.InvocationCall;

import java.util.HashMap;
import java.util.List;

public class InvocationStatement extends AbstractStatement
{
   private final Expression expression;

   public InvocationStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   @Override
   public boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      assert expression instanceof InvocationExpression : "Expressions is not an invocation expression : line " + lineNum;
      expression.getType(globalTable, structTable, currentFunctionName);
      return false;
   }

   @Override
   public Block getCFG(Block curNode, Block endNode, List<Block> blockList, HashMap<String, HashMap<String, Type>> structTable) {
      InvocationExpression exp = (InvocationExpression) expression;
      exp.setIsStatement();
      exp.getCFGValue(curNode.getInstructionList(), structTable);
      return curNode;
   }
}
