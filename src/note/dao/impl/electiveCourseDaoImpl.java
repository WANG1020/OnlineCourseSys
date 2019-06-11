package note.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import note.dao.electiveCourseDao;
import note.util.DataBaseConnection;
import note.vo.electivecourse;

public class electiveCourseDaoImpl implements electiveCourseDao {

	@Override
	public void insertRecord(electivecourse electivecourse) throws Exception {
		// TODO Auto-generated method stub
		String sql="INSERT INTO electivecourse(id,name,class_name) VALUE(id,?,?)";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		try{
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,electivecourse.getName());
			pstmt.setString(2, electivecourse.getClass_name());
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
	public void insertReRecord(electivecourse electivecourse) throws Exception {
		// TODO Auto-generated method stub
		String sql="INSERT INTO teacher(id,name,class_name) VALUE(id,?,?)";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		try{
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,electivecourse.getName());
			pstmt.setString(2, electivecourse.getClass_name());
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
	public boolean existRecord(String name, String courseName) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="select name,class_name from teacher where name=? and class_name=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		pstmt=dbc.getConnection().prepareStatement(sql);
		pstmt.setString(1,name);
		pstmt.setString(2,courseName);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next())
		{
			flag=true;
		}
		return flag;
	}

}
