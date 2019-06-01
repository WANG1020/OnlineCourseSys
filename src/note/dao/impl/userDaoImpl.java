package note.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.catalina.User;

import note.dao.userDao;
import note.util.DataBaseConnection;
import note.vo.user;

public class userDaoImpl implements userDao{

	@Override
	public boolean login(user user) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="select name,password from user where name=? and password=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		pstmt=dbc.getConnection().prepareStatement(sql);
		pstmt.setString(1,user.getName());
		pstmt.setString(2,user.getPassword());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next())
		{
			flag=true;
		}
		return flag;
	}

	@Override
	public String userImg(String name) throws Exception {
		// TODO Auto-generated method stub
		String bString="";
		String sql="SELECT headpor FROM user WHERE name=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		pstmt=dbc.getConnection().prepareStatement(sql);
		pstmt.setString(1,name);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			bString=rs.getString(1);
		}
		return bString;
	}

	@Override
	public boolean checkUser(user user) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="select name FROM user WHERE name=? and flag=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		pstmt=dbc.getConnection().prepareStatement(sql);
		pstmt.setString(1,user.getName());
		pstmt.setString(2,user.getFlag());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next())
		{
			flag=true;
		}
		return flag;
	}

	@Override
	public void registeruser(user user) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into user(id,name,password,email,headpor,flag,active) values (id,?,?,?,?,?,?)";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		pstmt=dbc.getConnection().prepareStatement(sql);
		pstmt.setString(1,user.getName());
		pstmt.setString(2,user.getPassword());
		pstmt.setString(3,user.getEmail());
		pstmt.setString(4,user.getHeadpor());
		pstmt.setString(5, user.getFlag());
		pstmt.setString(6, user.getActive());
		pstmt.executeUpdate();
	}

	@Override
	public boolean checkUserByName(String name) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="SELECT id FROM user WHERE name=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		try{
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,name);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				flag=true;
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
		return flag;
	}

	@Override
	public user checkUserByName1(user user) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="SELECT * FROM user WHERE name=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		
		pstmt=dbc.getConnection().prepareStatement(sql);
		pstmt.setString(1,user.getName());
		ResultSet rs=pstmt.executeQuery();
		user tUser=new user();
		if(rs.next())
		{
			flag=true;
			tUser.setId(rs.getInt(1));
			tUser.setName(rs.getString(2));
			tUser.setPassword(rs.getString(3));
			tUser.setEmail(rs.getString(4));
			tUser.setHeadpor(rs.getString(5));
			tUser.setFlag(rs.getString(6));
			tUser.setActive(rs.getString(7));
		}
		return tUser;
	}

	@Override
	public void updateflag(String name) throws Exception {
		//激活用户
		// TODO Auto-generated method stub
		String sql="UPDATE user SET active=? WHERE name=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		try{
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,"1");
			pstmt.setString(2,name);
			pstmt.executeUpdate();
			pstmt.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			dbc.close();
		}
	}

	@Override
	public void updateUserImg(user user) throws Exception {
		// TODO Auto-generated method stub
		String sql="update user set headpor=? where name=?";
		System.out.print("impl测试：\n用户修改的头像路径："+user.getHeadpor());
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		try{
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, user.getHeadpor());
			pstmt.setString(2, user.getName());
			pstmt.executeUpdate();
			pstmt.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			dbc.close();
		}
	}

	@Override
	public String searchUserPassword(String name) throws Exception {
		// TODO Auto-generated method stub
		String bString="";
		String sql="select password from user wherer name=?";
		PreparedStatement psmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		try{
			psmt=dbc.getConnection().prepareStatement(sql);
			psmt.setString(1, name);
			ResultSet rs=psmt.executeQuery();
			if(rs.next()){
				bString=rs.getString(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			dbc.close();
		}
		return bString;
	}

	@Override
	public void updateUserEmail(user user) throws Exception {
		// TODO Auto-generated method stub
		String sql="UPDATE user SET email=? where name=?";
		PreparedStatement psmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		try{
			psmt=dbc.getConnection().prepareStatement(sql);
			psmt.setString(1, user.getEmail());
			psmt.setString(2, user.getName());
			psmt.executeUpdate();
			psmt.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			dbc.close();
		}
	}

}
