package note.dao;

import note.vo.electivecourse;

public interface electiveCourseDao {
	public void insertRecord(electivecourse electivecourse)throws Exception;
	public void insertReRecord(electivecourse electivecourse)throws Exception;
	public boolean existRecord(String name,String courseName)throws Exception;
}
