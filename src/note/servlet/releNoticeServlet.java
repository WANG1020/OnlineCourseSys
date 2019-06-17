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
 * Servlet implementation class releNoteServlet
 */
@WebServlet("/releNoticeServlet")
public class releNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public releNoticeServlet() {
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
		
		String username=request.getParameter("username");
		String coursename=request.getParameter("text");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		note note=new note();
		note.setAuthor(username);
		note.setContent(content);
		note.setTitle(title);
		note.setCourse_name(coursename);
		note.setFlag("2");
		
		try {
			DaoFactory.getnoteDaoInstance().releNotice(note);
			out.print("<script language=javascript>alert('发布公告成功！');" +
					"window.location.href='teacher/releNotice.jsp';</script>");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
