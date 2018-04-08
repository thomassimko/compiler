package ast;

import java.util.HashMap;

public class DeleteStatement extends AbstractStatement
{
   private final Expression expression;

   public DeleteStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   @Override
   public boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      assert expression.getType(globalTable, structTable, currentFunctionName) instanceof StructType : "Statement is not of type Struct : line " + lineNum;
      return false;
   }
}
