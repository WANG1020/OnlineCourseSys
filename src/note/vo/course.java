package note.vo;

public class course {
	private int id;
	private String name;
	private String into;
	private String Deintro;
	private String teacher;
	private String img;
	
	public course() {
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
	public String getInto() {
		return into;
	}
	public void setInto(String into) {
		this.into = into;
	}
	public String getDeintro() {
		return Deintro;
	}
	public void setDeintro(String deintro) {
		Deintro = deintro;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
}
