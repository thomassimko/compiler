package ast;

import llvm.Instruction;
import llvm.declarations.GlobalDeclaration;
import llvm.declarations.LocalDeclaration;
import llvm.declarations.ParameterDeclaration;

import java.util.HashMap;

public class Declaration implements Comparable<Declaration>
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

   public String getLLVMType() {
      return type.getCFGType();
   }

   public Instruction getGlobalCFGValue() {
      return new GlobalDeclaration(name, type);
   }

   public Instruction getLocalCFGValue() {
      return new LocalDeclaration(name, type.getCFGType());
   }

   public ParameterDeclaration getParamCFGValue() {
      return new ParameterDeclaration(name, type.getCFGType());
   }

   @Override
   public int compareTo(Declaration other) {
      return name.compareTo(other.getName());
   }


}
