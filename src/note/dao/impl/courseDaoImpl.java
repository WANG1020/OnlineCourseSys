package note.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import note.dao.courseDao;
import note.util.DataBaseConnection;
import note.vo.course;

public class courseDaoImpl implements courseDao{

	@Override
	public List<course> checkCourse() throws Exception {
		// TODO Auto-generated method stub
		List all=new ArrayList();//新建List all接收查询结果
		String sql = "SELECT id,name,intro,Deintro,teacher,img FROM course" ;
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		try
		{
			pstmt=dbc.getConnection().prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){//有下个就执行，没有跳出
				course tCourse=new course();//新建临时变量为了接收每一个Note,并逐个将信息“存入”tempnote
				tCourse.setId(rs.getInt(1));//给每一个tempnote赋值
				tCourse.setName(rs.getString(2));
				tCourse.setInto(rs.getString(3));
				tCourse.setDeintro(rs.getString(4));
				tCourse.setTeacher(rs.getString(5));
				tCourse.setImg(rs.getString(6));
				all.add(tCourse);//将tCourse存入all
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
	public List<course> searchAllCourseByName(String name) throws Exception {
		// TODO Auto-generated method stub
		List all=new ArrayList();//新建List all接收查询结果
		String sql = "SELECT course.name,course.intro,course.Deintro,course.teacher,course.img\r\n"+ 
				"FROM electivecourse  INNER JOIN course  ON electivecourse.class_name=course.name\r\n"+ 
				"WHERE electivecourse.name=?" ;
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		try
		{
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,name);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				course tcourse=new course();
				tcourse.setName(rs.getString(1));
				tcourse.setInto(rs.getString(2));
				tcourse.setDeintro(rs.getString(3));
				tcourse.setTeacher(rs.getString(4));
				tcourse.setImg(rs.getString(5));
				all.add(tcourse);
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
	public boolean existCourse(String courseName, String name) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="SELECT NAME,class_name FROM electivecourse WHERE NAME=? AND class_name=?";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		try {
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, courseName);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		return flag;
	}

	@Override
	public List<course> studyCourse(String course_name) throws Exception {
		// TODO Auto-generated method stub
		List all=new ArrayList();//新建List all接收查询结果
		String sql = "SELECT id,name,intro,Deintro,teacher,img FROM course where name=?" ;
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		try
		{
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, course_name);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				course tCourse=new course();
				tCourse.setId(rs.getInt(1));
				tCourse.setName(rs.getString(2));
				tCourse.setInto(rs.getString(3));
				tCourse.setDeintro(rs.getString(4));
				tCourse.setTeacher(rs.getString(5));
				tCourse.setImg(rs.getString(6));
				all.add(tCourse);
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
	public List<course> searchCourse(String search) throws Exception {
		// TODO Auto-generated method stub
		List all=new ArrayList();//新建List all接收查询结果
		String sql = "SELECT * FROM course WHERE NAME LIKE ? OR intro LIKE ? " ;
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		String ssearch='%'+search+'%';
		dbc=new DataBaseConnection();
		try
		{
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, ssearch);
			pstmt.setString(2, ssearch);
			System.out.println("搜索课程的sql语句为\n"+pstmt);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				course tCourse=new course();
				tCourse.setId(rs.getInt(1));
				tCourse.setName(rs.getString(2));
				tCourse.setInto(rs.getString(3));
				tCourse.setDeintro(rs.getString(4));
				tCourse.setTeacher(rs.getString(5));
				tCourse.setImg(rs.getString(6));
				all.add(tCourse);
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
	public List<course> searchThrCourseByName() throws Exception {
		// TODO Auto-generated method stub
		List all=new ArrayList();//新建List all接收查询结果
		String sql = "SELECT id,name,intro,Deintro,teacher,img FROM course limit 0,3" ;
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		dbc=new DataBaseConnection();
		try
		{
			pstmt=dbc.getConnection().prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){//有下个就执行，没有跳出
				course tCourse=new course();//新建临时变量为了接收每一个Note,并逐个将信息“存入”tempnote
				tCourse.setId(rs.getInt(1));//给每一个tempnote赋值
				tCourse.setName(rs.getString(2));
				tCourse.setInto(rs.getString(3));
				tCourse.setDeintro(rs.getString(4));
				tCourse.setTeacher(rs.getString(5));
				tCourse.setImg(rs.getString(6));
				all.add(tCourse);//将tCourse存入all
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
	
	
	

}
