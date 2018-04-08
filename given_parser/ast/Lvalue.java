package ast;

import java.util.HashMap;

public interface Lvalue
{
    Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName);
}
