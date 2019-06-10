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

/**
 * Servlet implementation class updateUserPasswordServlet
 */
@WebServlet("/updateUserPasswordServlet")
public class updateUserPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateUserPasswordServlet() {
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
		HttpSession session=request.getSession();
		
		String oldPassword=request.getParameter("j-input-origin-pwd");
		String newPassword=request.getParameter("j-input-new-pwd");
		
		String name=(String)session.getAttribute("username");
		
		try {
			if(DaoFactory.getuserDaoInstance().searchUserPassword(name).equals(oldPassword)){
				DaoFactory.getuserDaoInstance().updateUserPassword(name, newPassword);
				out.print("<script language=javascript>alert('密码修改成功，请重新登录');" +
						"window.location.href='stu/login.html';</script>");
			}else{
				out.print("<script language=javascript>alert('请重新输入你的密码！！与当前密码不匹配！！');" +
						"window.location.href='stu/ManAccoNum.jsp';</script>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
