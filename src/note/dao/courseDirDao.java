package note.dao;

import java.util.List;

import note.vo.courseDir;

public interface courseDirDao {
	public List<courseDir> searchByCourseName(String name,String chapter)throws Exception; 
	public int searchAllChapterNum(String name)throws Exception;
	public int searchClaHouNum(String name,String chapter)throws Exception;
}
