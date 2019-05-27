package note.dao;

import note.vo.user;

public interface userDao {
	public boolean login(user user)throws Exception;
	public String userImg(String name)throws Exception;
	public boolean checkUser(user user)throws Exception;
	public void registeruser(user user)throws Exception;
	public boolean checkUserById(String id)throws Exception;
	public user checkUserById1(String id)throws Exception;
	public void updateflag(String id)throws Exception;
}
