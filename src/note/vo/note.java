package note.vo;

public class note {
	private String id;
	private String course_name;
	private String classHour_name;
	private String titile;
	private String author;
	private String content;
	private String flag;
	
	public note() {
		super();
	}
	
	public String getClassHour_name() {
		return classHour_name;
	}

	public void setClassHour_name(String classHour_name) {
		this.classHour_name = classHour_name;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getTitile() {
		return titile;
	}
	public void setTitile(String titile) {
		this.titile = titile;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
