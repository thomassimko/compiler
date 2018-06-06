package ast;

import cfg.BasicBlock;
import cfg.Block;
import cfg.FakeBlock;
import llvm.Branch;
import llvm.Truncate;
import llvm.UnconditionalBranch;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.SSA;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public class ConditionalStatement extends AbstractStatement
{
   private final Expression guard;
   private final Statement thenBlock;
   private final Statement elseBlock;
   private boolean thenReturns, elseReturns;

   public ConditionalStatement(int lineNum, Expression guard,
      Statement thenBlock, Statement elseBlock)
   {
      super(lineNum);
      this.guard = guard;
      this.thenBlock = thenBlock;
      this.elseBlock = elseBlock;
      this.elseReturns = false;
      this.thenReturns = false;
   }

   @Override
   public boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      assert guard.getType(globalTable, structTable, currentFunctionName) instanceof BoolType : "Guard is not of type boolean : line " + lineNum;

      thenReturns = thenBlock.checkTypes(globalTable, structTable, currentFunctionName);
      elseReturns = elseBlock.checkTypes(globalTable, structTable, currentFunctionName);
      return thenReturns && elseReturns;

   }

   @Override
   public Block getCFG(Block curNode, Block endNode, List<Block> blockList, HashMap<String, HashMap<String, Type>> structTable) {

      Block thenBasicBlock = new BasicBlock("thenBlock" + this.lineNum, curNode.getFunction());
      Block elseBasicBlock = new BasicBlock("elseBlock" + this.lineNum, curNode.getFunction());
      curNode.addSuccessor(thenBasicBlock);
      curNode.addSuccessor(elseBasicBlock);
      Block joinBlock = new BasicBlock("joinBlock" + this.lineNum, curNode.getFunction());
      blockList.add(thenBasicBlock);
      blockList.add(elseBasicBlock);
      blockList.add(joinBlock);


      Value val = guard.getCFGValue(curNode, curNode.getLLVM(), structTable);
      Register reg1 = RegisterCounter.getNextRegister();
      Truncate trunc = new Truncate(val, reg1);
      Branch branch = new Branch(reg1, thenBasicBlock.getLlvmLabel(), elseBasicBlock.getLlvmLabel());
      curNode.addInstructionToLLVM(trunc);
      curNode.addInstructionToLLVM(branch);

      Block thenRetBlock = thenBlock.getCFG(thenBasicBlock, endNode, blockList, structTable);

      if (!thenReturns) {
         thenRetBlock.addSuccessor(joinBlock);
         //System.err.println("2 branching to " + joinBlock.getLlvmLabel() + " from " + thenRetBlock.getLlvmLabel());

         thenRetBlock.addInstructionToLLVM(new UnconditionalBranch(joinBlock.getLlvmLabel()));
      }


      Block elseRetBlock = elseBlock.getCFG(elseBasicBlock, endNode, blockList, structTable);

      if (!elseReturns) {
         elseRetBlock.addSuccessor(joinBlock);
         //System.err.println("3 branching to " + joinBlock.getLlvmLabel() + " from " + elseRetBlock.getLlvmLabel());

         elseRetBlock.addInstructionToLLVM(new UnconditionalBranch(joinBlock.getLlvmLabel()));
      }

      if(elseReturns && thenReturns) {
         blockList.remove(joinBlock);
         return endNode;
      }

      return joinBlock;
   }
}
