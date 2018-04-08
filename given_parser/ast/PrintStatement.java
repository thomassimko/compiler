package ast;

import java.util.HashMap;

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
}
