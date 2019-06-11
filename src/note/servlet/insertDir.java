package note.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import note.factory.DaoFactory;
import note.vo.courseDir;

/**
 * Servlet implementation class insertDir
 */
@WebServlet("/insertDir")
public class insertDir extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertDir() {
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
		
		
		String coursename=request.getParameter("courseName");
		String chapterId=request.getParameter("chapterId");
		String chapterName=request.getParameter("chapterName");
		String classHId=request.getParameter("classHId");
		String classHName=request.getParameter("classHName");
		String reString=request.getParameter("res");
		
		courseDir courseDir=new courseDir();
		courseDir.setChapterId(chapterId);
		courseDir.setCourseName(coursename);
		courseDir.setChapterName(chapterName);
		courseDir.setClassHourId(classHId);
		courseDir.setClassHourName(classHName);
		courseDir.setResources(reString);
		
		try {
			DaoFactory.getcourseDirDaoInstance().insertDir(courseDir);
			out.print("<script language=javascript>alert('发布成功！！');" +
					"window.location.href='teacher/containStu.jsp?course_name="+coursename+"';</script>");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
