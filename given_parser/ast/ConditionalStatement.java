package ast;

import cfg.BasicBlock;
import cfg.Block;
import cfg.EndBlock;
import cfg.FakeBlock;
import llvm.Branch;
import llvm.Comparison;
import llvm.Truncate;
import llvm.UnconditionalBranch;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public class ConditionalStatement extends AbstractStatement
{
   private final Expression guard;
   private final Statement thenBlock;
   private final Statement elseBlock;

   public ConditionalStatement(int lineNum, Expression guard,
      Statement thenBlock, Statement elseBlock)
   {
      super(lineNum);
      this.guard = guard;
      this.thenBlock = thenBlock;
      this.elseBlock = elseBlock;
   }

   @Override
   public boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      assert guard.getType(globalTable, structTable, currentFunctionName) instanceof BoolType : "Guard is not of type boolean : line " + lineNum;

      boolean thenCheck = thenBlock.checkTypes(globalTable, structTable, currentFunctionName);
      boolean elseCheck = elseBlock.checkTypes(globalTable, structTable, currentFunctionName);
      return thenCheck && elseCheck;

   }

   @Override
   public Block getCFG(Block curNode, Block endNode, List<Block> blockList, HashMap<String, HashMap<String, Type>> structTable) {

      Block thenBasicBlock = new BasicBlock("thenBlock" + this.lineNum);
      Block elseBasicBlock = new BasicBlock("elseBlock" + this.lineNum);
      curNode.addSuccessor(thenBasicBlock);
      curNode.addSuccessor(elseBasicBlock);
      Block joinBlock = new BasicBlock("joinBlock" + this.lineNum);
      blockList.add(thenBasicBlock);
      blockList.add(elseBasicBlock);
      blockList.add(joinBlock);


      Value val = guard.getCFGValue(curNode.getInstructionList(), structTable);
      Register reg1 = RegisterCounter.getNextRegister();
      Truncate trunc = new Truncate(val, reg1);
      Branch branch = new Branch(reg1, thenBasicBlock.getLlvmLabel(), elseBasicBlock.getLlvmLabel());
      curNode.addInstructionToLLVM(trunc);
      curNode.addInstructionToLLVM(branch);


      Block thenRetBlock = thenBlock.getCFG(thenBasicBlock, endNode, blockList, structTable);

      if (thenRetBlock.hasEndBlockSuccessor()) {
         //System.out.println("fake then");
         Block newFakeBlock = new FakeBlock("fakeThenBlock" + this.lineNum);
         blockList.add(newFakeBlock);
         newFakeBlock.addSuccessor(joinBlock);
      } else {
         thenRetBlock.addSuccessor(joinBlock);
         thenRetBlock.addInstructionToLLVM(new UnconditionalBranch(joinBlock.getLlvmLabel()));
      }

      Block elseRetBlock = elseBlock.getCFG(elseBasicBlock, endNode, blockList, structTable);

      if (elseRetBlock.hasEndBlockSuccessor()) {
         //System.out.println("fake else");
         Block newFakeBlock = new FakeBlock("fakeElseBlock" + this.lineNum);
         blockList.add(newFakeBlock);
         newFakeBlock.addSuccessor(joinBlock);
      } else {
         elseRetBlock.addSuccessor(joinBlock);
         elseRetBlock.addInstructionToLLVM(new UnconditionalBranch(joinBlock.getLlvmLabel()));
      }

      return joinBlock;
   }
}
