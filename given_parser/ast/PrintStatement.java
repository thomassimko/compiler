package ast;

import cfg.Block;
import llvm.Print;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public class PrintStatement
   extends AbstractStatement
{
   private final Expression expression;

   public PrintStatement(int lineNum, Expression expression)
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
      Value val = expression.getCFGValue(curNode, curNode.getLLVM(), structTable);
      curNode.addInstructionToLLVM(new Print(val, false));
      return curNode;
   }
}
