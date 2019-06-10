package note.vo;

public class courseDir {
	private int id;
	private String courseName;
	private String chapterId;
	private String chapterName;
	private String classHourId;
	private String classHourName;
	private String resources;
	
	public String getResources() {
		return resources;
	}
	public void setResources(String resources) {
		this.resources = resources;
	}
	public courseDir() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getChapterId() {
		return chapterId;
	}
	public void setChapterId(String chapterId) {
		this.chapterId = chapterId;
	}
	public String getChapterName() {
		return chapterName;
	}
	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}
	public String getClassHourId() {
		return classHourId;
	}
	public void setClassHourId(String classHourId) {
		this.classHourId = classHourId;
	}
	public String getClassHourName() {
		return classHourName;
	}
	public void setClassHourName(String classHourName) {
		this.classHourName = classHourName;
	}
}
