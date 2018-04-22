package llvm;

import llvm.declarations.ParameterDeclaration;

import java.util.List;


public class FunctionDefine implements Instruction {

    private String functionName;
    private List<ParameterDeclaration> parameters;
    private String retType;

    public FunctionDefine(String name, List<ParameterDeclaration> parameters, String retType) {
        this.functionName = name;
        this.parameters = parameters;
        this.retType = retType;
    }
    @Override
    public String toLLVM() {
        String[] paramString = parameters.stream().map(param -> param.toLLVM()).toArray(String[]::new);
        return "define " + retType + " @" + functionName + "(" + String.join(", ", paramString) + ")\n{\n";
    }
}
