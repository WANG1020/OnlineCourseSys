package note.dao;

import java.util.List;

import note.vo.course;

public interface courseDao {
	public List<course> checkCourse()throws Exception;
	
	public List<course> searchAllCourseByName(String name)throws Exception;
	public boolean existCourse(String courseName,String name)throws Exception;
	public List<course> searchThrCourseByName()throws Exception;
	public  List<course> studyCourse(String course_name)throws Exception;//taParInStu页面引用
	
	public List<course> searchCourse(String search)throws Exception;
	
	public void insert(course course)throws Exception;
	
}
