package ast;

import cfg.BasicBlock;
import cfg.Block;
import cfg.WhileBlock;

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
   public Block getCFG(Block curNode, Block endNode, List<Block> blockList) {

      Block whileBlock = new WhileBlock("whileBlock" + lineNum);
      curNode.addSuccessor(whileBlock);
      whileBlock.addSuccessor(whileBlock);

      Block lastBlock = body.getCFG(whileBlock, endNode, blockList);
      Block exitBlock = new BasicBlock("whileExitBlock" + lineNum);

      //blockList.add(whileBlock);
      blockList.add(lastBlock);
      blockList.add(exitBlock);

      lastBlock.addSuccessor(exitBlock);
      return exitBlock;
   }
}
