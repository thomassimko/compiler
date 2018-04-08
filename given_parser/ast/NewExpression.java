package ast;

import java.util.HashMap;

public class NewExpression
   extends AbstractExpression
{
   private final String id;

   public NewExpression(int lineNum, String id)
   {
      super(lineNum);
      this.id = id;
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      assert structTable.containsKey(id) : "No structure " + id + " defined : line " + lineNum;
      return new StructType(lineNum, id);
   }
}
