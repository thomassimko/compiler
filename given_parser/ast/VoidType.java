package ast;

public class VoidType
   implements Type
{
    @Override
    public String getCFGType() {
        return "void";
    }
}
