package note.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import note.dao.noteDao;
import note.util.DataBaseConnection;
import note.vo.note;

public class noteDaoImpl implements noteDao{

	@Override
	public List<note> searchQueByName(String name,String clString) throws Exception {
		// TODO Auto-generated method stub
		List notes=new ArrayList();
		String sql="SELECT * FROM note WHERE course_name=? AND classHour_name LIKE ? AND flag='0'";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		String scl="%"+clString+"%";
		dbc=new DataBaseConnection();
		try
		{
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, scl);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){//有下个就执行，没有跳出
				note note=new note();
				note.setCourse_name(rs.getString(2));
				note.setClassHour_name(rs.getString(3));
				note.setTitile(rs.getString(4));
				note.setAuthor(rs.getString(5));
				note.setContent(rs.getString(6));
				notes.add(note);
			}
			rs.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		
		return notes;
	}

	@Override
	public List<note> findQueAnsByTitle(String title, String cHString) throws Exception {
		// TODO Auto-generated method stub
		List notes=new ArrayList();
		String sql="SELECT * FROM note WHERE title=? AND classHour_name LIKE ?  AND flag='1'";
		PreparedStatement pstmt=null;
		DataBaseConnection dbc=null;
		String schString="%"+cHString+"%";
		dbc=new DataBaseConnection();
		try
		{
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, schString);
			/*System.out.println("根据问题和课程id来查询问题的答案的sql语句"+pstmt);*/
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){//有下个就执行，没有跳出
				note note=new note();
				note.setCourse_name(rs.getString(2));
				note.setClassHour_name(rs.getString(3));
				note.setTitile(rs.getString(4));
				note.setAuthor(rs.getString(5));
				note.setContent(rs.getString(6));
				notes.add(note);
			}
			rs.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		
		return notes;
	}
	
}
