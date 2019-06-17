package note.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import note.factory.DaoFactory;
import note.vo.note;

/**
 * Servlet implementation class updateNoteServlet
 */
@WebServlet("/updateNoteServlet")
public class updateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String course_name=request.getParameter("course_name");
		String class_name=request.getParameter("class_name");
		String author=request.getParameter("author");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String flag=request.getParameter("flag");
		String location=request.getParameter("location");
		note note=new note();
		note.setCourse_name(course_name);
		note.setClassHour_name(class_name);
		note.setAuthor(author);
		note.setTitle(title);
		note.setContent(content);
		note.setFlag(flag);
		
		try {
			DaoFactory.getnoteDaoInstance().updateNote(note);
			if(location.equals("tea")||location=="tea"){
				out.print("<script language=javascript>alert('发布成功！');" +
						"window.location.href='teacher/containStu.jsp?course_name="+course_name+"';</script>");
			}else{
				out.print("<script language=javascript>alert('发布成功！');" +
						"window.location.href='stu/containStu.jsp?course_name="+course_name+"';</script>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if(location.equals("tea")||location=="tea"){
				out.print("<script language=javascript>alert('发布成功！');" +
						"window.location.href='teacher/containStu.jsp?course_name="+course_name+"';</script>");
			}else{
				out.print("<script language=javascript>alert('发布成功！');" +
						"window.location.href='stu/containStu.jsp?course_name="+course_name+"';</script>");
			}
		}
		
	}

}
