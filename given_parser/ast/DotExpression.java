package ast;

import java.util.HashMap;

public class DotExpression
   extends AbstractExpression
{
   private final Expression left;
   private final String id;

   public DotExpression(int lineNum, Expression left, String id)
   {
      super(lineNum);
      this.left = left;
      this.id = id;
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      Type leftType = left.getType(globalTable, structTable, currentFunctionName);
      assert leftType instanceof StructType : "Left hand operator does not match type Struct on line " + this.lineNum;
      StructType structLeft = (StructType) left.getType(globalTable, structTable, currentFunctionName);
      assert structTable.get(structLeft.getName()).containsKey(id) : "Id does not exist in type Struct " + id + " on line " + this.lineNum;
      return structTable.get(structLeft.getName()).get(id);
   }
}
