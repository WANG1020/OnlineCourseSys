package note.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import note.factory.DaoFactory;
import note.util.Mail1;
import note.vo.user;

/**
 * Servlet implementation class updateEmailServlet
 */
@WebServlet("/updateEmailServlet")
public class updateEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		
		String newEmail=request.getParameter("email");
		
		String name=(String)session.getAttribute("username");
		user user=new user();
		user.setEmail(newEmail);
		user.setName(name);
		try {
		/*	DaoFactory.getuserDaoInstance().updateUserEmail(user);*/
			
			new Mail1(user);
			
			int i=newEmail.indexOf("@");
			out.println("<a href='http://mail.'+newEmail.substring(i+1)+''></a>");
			out.print("<script language=javascript>alert('邮箱修改成功,绑定邮箱邮件将发送至您的邮箱！！');" +
					"window.location.href='stu/ManAccoNum.jsp';</script>");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
