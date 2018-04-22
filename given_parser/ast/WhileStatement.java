package ast;

import cfg.BasicBlock;
import cfg.Block;
import cfg.WhileBlock;
import llvm.Branch;
import llvm.Truncate;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public class WhileStatement
   extends AbstractStatement
{
   private final Expression guard;
   private final Statement body;

   public WhileStatement(int lineNum, Expression guard, Statement body)
   {
      super(lineNum);
      this.guard = guard;
      this.body = body;
   }

   @Override
   public boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      assert guard.getType(globalTable, structTable, currentFunctionName) instanceof BoolType : "Guard is not of type boolean : line " + lineNum;
      body.checkTypes(globalTable, structTable, currentFunctionName);
      return false;
   }

   @Override
   public Block getCFG(Block curNode, Block endNode, List<Block> blockList, HashMap<String, HashMap<String, Type>> structTable) {

      Block whileBlock = new WhileBlock("whileBlock" + lineNum);
      curNode.addSuccessor(whileBlock);

      Block lastBlock = body.getCFG(whileBlock, endNode, blockList, structTable);

      whileBlock.addSuccessor(lastBlock);

      Block exitBlock = new BasicBlock("whileExitBlock" + lineNum);

      blockList.add(whileBlock);
      //blockList.add(lastBlock);
      blockList.add(exitBlock);

      evaluateCondition(curNode, structTable, whileBlock.getLlvmLabel(), exitBlock.getLlvmLabel());
      evaluateCondition(lastBlock, structTable, whileBlock.getLlvmLabel(), exitBlock.getLlvmLabel());

      lastBlock.addSuccessor(exitBlock);
      return exitBlock;
   }

   private void evaluateCondition(Block block, HashMap<String, HashMap<String, Type>> structTable, String trueLabel, String falseLabel) {
      Value val1 = guard.getCFGValue(block.getInstructionList(), structTable);
      Register reg1 = RegisterCounter.getNextRegister();
      Truncate trunc = new Truncate(val1, reg1);
      Branch branch = new Branch(reg1, trueLabel, falseLabel);
      block.addInstructionToLLVM(trunc);
      block.addInstructionToLLVM(branch);
   }
}
