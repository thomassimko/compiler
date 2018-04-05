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
      table.add(name, type);
   }
}
