package note.factory;

import java.util.List;

import note.dao.courseDao;
import note.dao.courseDirDao;
import note.dao.electiveCourseDao;
import note.dao.noteDao;
import note.dao.userDao;
import note.dao.impl.courseDaoImpl;
import note.dao.impl.userDaoImpl;
import note.dao.impl.courseDirDaoImpl;
import note.dao.impl.electiveCourseDaoImpl;
import note.dao.impl.noteDaoImpl;
import note.vo.courseDir;
import note.vo.electivecourse;

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
	public static electiveCourseDao getelectiveCourseDaoInstance(){
		return  new electiveCourseDaoImpl();
	}
}
