package qualk.beans;

public class Function {
	private String iD;
	private String functionName;
	private String code;
	public Function() {
	}
	public Function(String iD, String functionName, String code) {
		this.iD = iD;
		this.functionName = functionName;
		this.code = code;
	}
	public String getiD() {
		return iD;
	}
	public void setiD(String iD) {
		this.iD = iD;
	}
	public String getFunctionName() {
		return functionName;
	}
	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
