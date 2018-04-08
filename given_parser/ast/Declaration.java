package ast;

import java.util.HashMap;

public class Declaration
{
   private final int lineNum;
   private final Type type;
   private final String name;

   public Declaration(int lineNum, Type type, String name)
   {
      this.lineNum = lineNum;
      this.type = type;
      this.name = name;
   }
   
   public void addToTable(HashMap<String, Type> table) {
      assert !table.containsKey(name) : "Variable " + name + " is already defined line : " + lineNum;
      table.put(name, type);
   }

   public Type getType() {
      return this.type;
   }

   public String getName() {
      return name;
   }
}
