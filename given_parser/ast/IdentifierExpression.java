package ast;

import java.util.HashMap;

public class IdentifierExpression
   extends AbstractExpression
{
   private final String id;

   public IdentifierExpression(int lineNum, String id)
   {
      super(lineNum);
      this.id = id;
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      if (currentFunctionName != null) {
         FunctionType fType = (FunctionType) globalTable.get(currentFunctionName);

         assert fType.getLocalScope().containsKey(id) || globalTable.containsKey(id) : "Id not defined at line " + this.lineNum;

         if (fType.getLocalScope().containsKey(id)) {
            return fType.getLocalScope().get(id);
         }
      }
      assert globalTable.containsKey(id) : "Id not defined at line " + this.lineNum;
      return globalTable.get(id);
   }
}
