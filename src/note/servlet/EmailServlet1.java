package note.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.catalina.realm.UserDatabaseRealm;

import javafx.scene.control.Alert;
import note.factory.DaoFactory;
import note.vo.user;
import sun.security.action.PutAllAction;
/**
 * Servlet implementation class EmailServlet1
 */
@WebServlet("/EmailServlet1")
public class EmailServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		user user=new user();
		user.setName(name);
		user.setEmail(email);
		
		System.out.println("姓名为："+name);
		System.out.println("\n邮箱为："+email);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<body><center><h3>");
		try {
			if(DaoFactory.getuserDaoInstance().checkUserByName(name)){
				DaoFactory.getuserDaoInstance().updateUserEmail(user);
				out.print("账号绑定成功！<a href='http://localhost:8086/OnlineCourse/stu/login.html'>请登录</a>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
