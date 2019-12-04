package qualk.beans;

public class Role {
	private String iD;
	private String roleName;
	private Boolean view;
	private Boolean modify;
	private Boolean delete;
	public Role() {
	}
	public Role(String iD, String roleName, Boolean view, Boolean modify, Boolean delete) {
		this.iD = iD;
		this.roleName = roleName;
		this.view = view;
		this.modify = modify;
		this.delete = delete;
	}
	public String getiD() {
		return iD;
	}
	public void setiD(String iD) {
		this.iD = iD;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Boolean getView() {
		return view;
	}
	public void setView(Boolean view) {
		this.view = view;
	}
	public Boolean getModify() {
		return modify;
	}
	public void setModify(Boolean modify) {
		this.modify = modify;
	}
	public Boolean getDelete() {
		return delete;
	}
	public void setDelete(Boolean delete) {
		this.delete = delete;
	}
	
}
