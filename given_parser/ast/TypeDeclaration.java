package ast;

import java.util.List;
import java.util.HashMap;

public class TypeDeclaration
{
   private final int lineNum;
   private final String name;
   private final List<Declaration> fields;

   public TypeDeclaration(int lineNum, String name, List<Declaration> fields)
   {
      this.lineNum = lineNum;
      this.name = name;
      this.fields = fields;
   }

   public void addToTable(HashMap<String, HashMap<String, Type>> structTable) {
      HashMap<String, Type> newStruct = new HashMap<String, Type>();
      assert !structTable.containsKey(name) : "Struct with name " + name + " is already defined : line " + lineNum;
      structTable.put(name, newStruct);
      for(Declaration field: fields) {
         field.addToTable(newStruct);
      }
      structTable.put(name, newStruct);
   }
}
