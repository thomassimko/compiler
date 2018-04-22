package ast;

public class BoolType
   implements Type
{
    @Override
    public String getCFGType() {
        return "i32";
    }
}
