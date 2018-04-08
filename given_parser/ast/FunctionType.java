package ast;

import java.util.*;
import java.util.stream.Stream;

public class FunctionType implements Type {

    private final int lineNum;
    private final HashMap<String, Type> localScope;
    private final String name;
    private final List<Declaration> params;
    private final Type retType;

    public FunctionType(int lineNum, String name, HashMap<String, Type> localScope, List<Declaration> params, Type retType)
    {
        this.lineNum = lineNum;
        this.name = name;
        this.localScope = localScope;
        this.params = params;
        this.retType = retType;
    }

    public Type getReturnType() {
        return this.retType;
    }

    public List<Type> getParamTypes() {
        List<Type> typeList = new ArrayList<Type>();
        for (Declaration param : params) {
            typeList.add(param.getType());
        }
        return typeList;
    }

    public HashMap<String, Type> getLocalScope() {
        return this.localScope;
    }

}
