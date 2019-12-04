package qualk.beans;

public class RoleFunction {
	private String iD;
	private String roleID;
	private String functionID;
	public RoleFunction() {
	}
	public RoleFunction(String iD, String roleID, String functionID) {
		this.iD = iD;
		this.roleID = roleID;
		this.functionID = functionID;
	}
	public String getiD() {
		return iD;
	}
	public void setiD(String iD) {
		this.iD = iD;
	}
	public String getRoleID() {
		return roleID;
	}
	public void setRoleID(String roleID) {
		this.roleID = roleID;
	}
	public String getFunctionID() {
		return functionID;
	}
	public void setFunctionID(String functionID) {
		this.functionID = functionID;
	}
	
}
