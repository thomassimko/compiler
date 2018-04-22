package ast;

import cfg.Block;
import llvm.Print;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public class PrintLnStatement
   extends AbstractStatement
{
   private final Expression expression;

   public PrintLnStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   @Override
   public boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      assert expression.getType(globalTable, structTable, currentFunctionName) instanceof IntType : "Expression is not of type Int : line " + lineNum;
      return false;
   }

   @Override
   public Block getCFG(Block curNode, Block endNode, List<Block> blockList, HashMap<String, HashMap<String, Type>> structTable) {
      Value val = expression.getCFGValue(curNode.getInstructionList(), structTable);
      curNode.addInstructionToLLVM(new Print(val, true));
      return curNode;
   }
}
