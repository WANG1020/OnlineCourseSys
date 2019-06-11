package note.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import note.factory.DaoFactory;
import note.vo.electivecourse;
import note.vo.note;

/**
 * Servlet implementation class startStudyServlet
 */
@WebServlet("/startStudyServlet")
public class startStudyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public startStudyServlet() {
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
		
		String method=request.getParameter("method");
		String username=request.getParameter("username");
		String coursename=request.getParameter("courseName");
		electivecourse electivecourse=new electivecourse();
		electivecourse.setName(username);
		electivecourse.setClass_name(coursename);
		try {
			DaoFactory.getelectiveCourseDaoInstance().insertRecord(electivecourse);
			if(method.equals("teatar")){
				out.print("<script language=javascript>alert('参与成功！');" +
						"window.location.href='teacher/oc_home.jsp';</script>");
			}
			if(method.equals("stutar")){
				out.print("<script language=javascript>alert('参与成功！');" +
						"window.location.href='stu/oc_home.jsp';</script>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
