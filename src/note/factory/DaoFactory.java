package note.factory;

import note.dao.courseDao;
import note.dao.userDao;
import note.dao.impl.courseDaoImpl;
import note.dao.impl.userDaoImpl;

public class DaoFactory {
	public static userDao getuserDaoInstance(){
		return new userDaoImpl();
	}
	public static courseDao getcourseDaoInstance(){
		return  new courseDaoImpl();
	}
}
