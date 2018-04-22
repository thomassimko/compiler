package ast;

public class IntType
   implements Type
{
    @Override
    public String getCFGType() {
        return "i32";
    }
}
