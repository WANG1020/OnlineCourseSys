package note.vo;

public class electivecourse {
	private int id;
	private String name;
	private String password;
	private String email;
	private String headpor;
	private String class_name;
	
	
	public electivecourse() {
		super();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHeadpor() {
		return headpor;
	}
	public void setHeadpor(String headpor) {
		this.headpor = headpor;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
}
