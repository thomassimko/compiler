package ast;

import java.util.HashMap;

public class IntegerExpression
   extends AbstractExpression {
   private final String value;

   public IntegerExpression(int lineNum, String value) {
      super(lineNum);
      this.value = value;
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      return new IntType();
   }
}
