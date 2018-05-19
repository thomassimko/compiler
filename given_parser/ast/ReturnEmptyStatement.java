package ast;

import cfg.Block;
import llvm.ReturnVoid;
import llvm.UnconditionalBranch;
import llvm.value.SSA;

import java.util.HashMap;
import java.util.List;

public class ReturnEmptyStatement
   extends AbstractStatement
{
   public ReturnEmptyStatement(int lineNum)
   {
      super(lineNum);
   }

   @Override
   public boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      assert currentFunctionName != null : "Cannot call return when not inside a function : line " + lineNum;
      assert globalTable.get(currentFunctionName) instanceof FunctionType : "Variable is not of type function : line " + lineNum;
      assert ((FunctionType) globalTable.get(currentFunctionName)).getReturnType() instanceof VoidType
              : "Return type does not match value returned : line " + lineNum;
      return true;
   }

   @Override
   public Block getCFG(Block curNode, Block endNode, List<Block> blockList, HashMap<String, HashMap<String, Type>> structTable) {
      //System.err.println("1 branching to " + endNode.getLlvmLabel() + " from " + curNode.getLlvmLabel());

      curNode.addSuccessor(endNode);
      curNode.addInstructionToLLVM(new UnconditionalBranch(endNode.getLlvmLabel()));
      if(!endNode.getHasReturn()) {
         endNode.addInstructionToLLVM(new ReturnVoid());
         endNode.setHasReturn();
      }
      return curNode;
   }
}
