package note.vo;

import com.sun.media.sound.SoftInstrument;

public class user {
	private int id;
	private String name;
	private String password;
	private String email;
	private String headpor;
	private String flag;
	private String active;
	
	
	public user() {
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
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
}
