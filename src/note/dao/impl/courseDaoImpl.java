package note.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

}
