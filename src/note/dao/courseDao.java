package note.dao;

import java.util.List;

import note.vo.course;

public interface courseDao {
	public List<course> checkCourse()throws Exception;
}
