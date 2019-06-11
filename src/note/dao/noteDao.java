package note.dao;

import java.util.List;

import note.vo.note;

public interface noteDao {
	public List<note> searchQueByName(String name,String cHString)throws Exception;
	public List<note> findQueAnsByTitle(String title,String cHString)throws Exception;
	
	public void updateNote(note note)throws Exception;
	public List<note> findDirQue(String name)throws Exception;
}
