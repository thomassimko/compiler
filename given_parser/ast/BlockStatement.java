package ast;

import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

public class BlockStatement extends AbstractStatement
{
   private final List<Statement> statements;

   public BlockStatement(int lineNum, List<Statement> statements)
   {
      super(lineNum);
      this.statements = statements;
   }

   public static BlockStatement emptyBlock()
   {
      return new BlockStatement(-1, new ArrayList<>());
   }

   @Override
   public boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      boolean willReturn = false;
      for (Statement stmt : statements) {
         assert !willReturn: "Unreachable code detected : line " + lineNum;
         willReturn = stmt.checkTypes(globalTable, structTable, currentFunctionName);
      }
      return willReturn;
   }
}
