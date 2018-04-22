package llvm;

import llvm.value.Register;
import llvm.value.Value;

public class InvocationCall implements Instruction {

    private Register storedRegister;
    private String retType;
    private String functionName;
    private Value[] args;
    private String[] types;

    public InvocationCall(Register storedRegister, String retType, String functionName, Value[] args, String[] types) {
        this.storedRegister = storedRegister;
        this.retType = retType;
        this.functionName = functionName;
        this.args = args;
        this.types = types;
    }

    public InvocationCall(String retType, String functionName, Value[] args, String[] types) {
        this.storedRegister = null;
        this.retType = retType;
        this.functionName = functionName;
        this.args = args;
        this.types = types;
    }

    @Override
    public String toLLVM() {
        StringBuilder output = new StringBuilder();
        if(this.storedRegister != null) {
            output.append(storedRegister.toLLVM() + " = ");
        }
        output.append("call " + retType + " @" + functionName + "(");
        for(int i = 0; i<args.length; i++) {
            output.append(types[i] + " " + args[i].toLLVM() + ", ");
        }
        if(output.lastIndexOf(",") != -1)
            output.deleteCharAt(output.lastIndexOf(","));
        output.append(')');
        return output.toString();
    }
}
