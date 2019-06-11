package note.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.standard.NumberUp;

import note.dao.courseDirDao;
import note.util.DataBaseConnection;
import note.vo.courseDir;

public class courseDirDaoImpl implements courseDirDao{

	@Override
	public List<courseDir> searchByCourseName(String name, String schapter) {
		// TODO Auto-generated method stub
		List all=new ArrayList();//新建List all接收查询结果
		String sql = "SELECT * FROM coursedir where course_name=? and classHour_id LIKE ?" ;
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		String chapter="%"+schapter+"%";
		dbc=new DataBaseConnection();
		try
		{
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, chapter);
		/*	System.out.println("查询课程目录的sql语句："+pstmt);*/
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){//有下个就执行，没有跳出
				courseDir tCourseDir=new courseDir();
				tCourseDir.setId(rs.getInt(1));
				tCourseDir.setCourseName(rs.getString(2));
				tCourseDir.setChapterId(rs.getString(3));
				tCourseDir.setChapterName(rs.getString(4));
				tCourseDir.setClassHourId(rs.getString(5));
				tCourseDir.setClassHourName(rs.getString(6));
				tCourseDir.setResources(rs.getString(7));
				all.add(tCourseDir);
			}
			rs.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		
		return all;//返回all
	}

	@Override
	public int searchAllChapterNum(String name) throws Exception {
		// TODO Auto-generated method stub
		int number=0;
		String sql = "SELECT  COUNT(DISTINCT chapter_id) FROM coursedir WHERE course_name=?" ;
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		try
		{
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, name);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){//有下个就执行，没有跳出
				number=rs.getInt(1);
			}
			rs.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		
		return number;
	}

	@Override
	public int searchClaHouNum(String name, String schapter) throws Exception {
		// TODO Auto-generated method stub
		int number=0;
		String sql = "SELECT COUNT(id) FROM coursedir WHERE course_name=? AND classHour_id LIKE ?" ;
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		String chapter="%"+schapter+"%";
		dbc=new DataBaseConnection();
		try
		{
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, chapter);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){//有下个就执行，没有跳出
				number=rs.getInt(1);
			}
			rs.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		
		return number;
	}

	@Override
	public void deleteDir(String name, String id) throws Exception {
		// TODO Auto-generated method stub
		String sql="DELETE FROM coursedir WHERE course_name=? AND classHour_id =?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		pstmt=dbc.getConnection().prepareStatement(sql);
		pstmt.setString(1,name);
		pstmt.setString(2,id);
		pstmt.executeUpdate();
	}

	@Override
	public void insertDir(courseDir courseDir) throws Exception {
		// TODO Auto-generated method stub
		String sql="INSERT INTO coursedir(id,course_name,chapter_id,chapter_name,classHour_id,classHour_name,resources) VALUE(id,?,?,?,?,?,?)";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		try{
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,courseDir.getCourseName());
			pstmt.setString(2,courseDir.getChapterId());
			pstmt.setString(3,courseDir.getChapterName());
			pstmt.setString(4,courseDir.getClassHourId());
			pstmt.setString(5,courseDir.getClassHourName());
			pstmt.setString(6,courseDir.getResources());
			pstmt.executeUpdate();
			pstmt.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			dbc.close();
		}
	}

}
