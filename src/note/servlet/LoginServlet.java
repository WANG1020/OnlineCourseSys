package note.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import note.dao.userDao;
import note.dao.impl.userDaoImpl;
import note.factory.DaoFactory;
import note.vo.user;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static  int number=0;//全局变量计算访客人数
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		String name=request.getParameter("username");
		String password=request.getParameter("password");
		String flag=request.getParameter("flag");
		//验证验证码是否匹配
		String checkcode=request.getParameter("check");
		HttpSession session=request.getSession();
		String rightcode=(String)session.getAttribute("rand");
		//验证输入用户名密码是否在表中
		user user=new user();
		user.setName(name);
		user.setPassword(password);
		user.setFlag(flag);
		/*userDao userDao=new userDaoImpl();*/
		try {
			if(DaoFactory.getuserDaoInstance().login(user)&&checkcode.equals(rightcode)){			
				number++;
				HttpSession hs=request.getSession(true);
				hs.setMaxInactiveInterval(160);
				hs.setAttribute("username",name);
				hs.setAttribute("upass", password);
				//flag为1的话为true,为0的话是false
				hs.setAttribute("flag", flag);
				/*request.getRequestDispatcher("stu/oc_home.jsp").forward(request, response);*/
				hs.setAttribute("fkNumber",number);
				response.sendRedirect("stu/oc_home.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	
	}
}
