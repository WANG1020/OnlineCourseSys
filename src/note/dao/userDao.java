package note.dao;

import note.vo.user;

public interface userDao {
	public boolean login(user user)throws Exception;
	public String userImg(String name)throws Exception;
	public boolean checkUser(user user)throws Exception;
	public void registeruser(user user)throws Exception;
	public boolean checkUserByName(String name)throws Exception;
	public user checkUserByName1(user user)throws Exception;
	public void updateflag(String name)throws Exception;//激活用户
	public void updateUserImg(user user)throws Exception;
	public String getUserEmail(String name)throws Exception;
	public void updateUserEmail(user user)throws Exception;
	public String searchUserPassword(String name)throws Exception;
	public void updateUserPassword(String name,String password)throws Exception;
}
