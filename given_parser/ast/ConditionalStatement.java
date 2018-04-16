package ast;

import cfg.BasicBlock;
import cfg.Block;
import cfg.EndBlock;

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

      return thenBlock.checkTypes(globalTable, structTable, currentFunctionName)
              && elseBlock.checkTypes(globalTable, structTable, currentFunctionName);

   }

   @Override
   public Block getCFG(Block curNode, Block endNode, List<Block> blockList) {
      System.out.println("if");
      Block thenBasicBlock = new BasicBlock("thenBlock" + this.lineNum);
      Block elseBasicBlock = new BasicBlock("elseBlock" + this.lineNum);
      curNode.addSuccessor(thenBasicBlock);
      curNode.addSuccessor(elseBasicBlock);
      Block joinBlock = new BasicBlock("joinBlock" + this.lineNum);

      blockList.add(thenBasicBlock);
      blockList.add(elseBasicBlock);
      blockList.add(joinBlock);

      Block thenRetBlock = thenBlock.getCFG(thenBasicBlock, endNode, blockList);

      if (thenRetBlock.hasEndBlockSuccessor()) {
         System.out.println("fake then");
         Block newFakeBlock = new BasicBlock("fakeThenBlock" + this.lineNum);
         blockList.add(newFakeBlock);
         newFakeBlock.addSuccessor(joinBlock);
      } else {
         thenRetBlock.addSuccessor(joinBlock);
      }

      Block elseRetBlock = elseBlock.getCFG(elseBasicBlock, endNode, blockList);

      if (elseRetBlock.hasEndBlockSuccessor()) {
         System.out.println("fake else");
         Block newFakeBlock = new BasicBlock("fakeElseBlock" + this.lineNum);
         blockList.add(newFakeBlock);
         newFakeBlock.addSuccessor(joinBlock);
      } else {
         elseRetBlock.addSuccessor(joinBlock);
      }

      return joinBlock;
   }
}
