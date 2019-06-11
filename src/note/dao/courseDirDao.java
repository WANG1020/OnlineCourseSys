package note.dao;

import java.util.List;

import com.sun.org.apache.xml.internal.resolver.helpers.PublicId;

import note.vo.courseDir;

public interface courseDirDao {
	public List<courseDir> searchByCourseName(String name,String chapter)throws Exception; 
	public int searchAllChapterNum(String name)throws Exception;
	public int searchClaHouNum(String name,String chapter)throws Exception;
	
	public void deleteDir(String name,String id)throws Exception;
	public void insertDir(courseDir courseDir)throws Exception;
}
