package note.factory;

import java.util.List;

import note.dao.courseDao;
import note.dao.courseDirDao;
import note.dao.noteDao;
import note.dao.userDao;
import note.dao.impl.courseDaoImpl;
import note.dao.impl.userDaoImpl;
import note.dao.impl.courseDirDaoImpl;
import note.dao.impl.noteDaoImpl;
import note.vo.courseDir;

public class DaoFactory {
	public static userDao getuserDaoInstance(){
		return new userDaoImpl();
	}
	public static courseDao getcourseDaoInstance(){
		return  new courseDaoImpl();
	}
	public static courseDirDao getcourseDirDaoInstance(){
		return  new courseDirDaoImpl();
	}
	public static noteDao getnoteDaoInstance(){
		return  new noteDaoImpl();
	}
}
