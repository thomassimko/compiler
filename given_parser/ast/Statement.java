package ast;

import java.util.HashMap;

public interface Statement
{
    boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName);
}
