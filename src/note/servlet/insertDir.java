package note.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.SmartUpload;

import note.factory.DaoFactory;
import note.vo.course;
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		
		JspFactory fac=JspFactory.getDefaultFactory();
		PageContext pageContext=fac.getPageContext(this, request,response, null, false, JspWriter.NO_BUFFER, true);
		com.jspsmart.upload.File file = null;
		
		courseDir courseDir=new courseDir();
		out.println("<html>");
		out.println("<body><center><h3>");
		//System.out.println("<%=id%>"+id);
		//新建上传对象
		SmartUpload su=new SmartUpload();
		// 上传初始化
		su.initialize(pageContext);
		// 设定上传限制
		// 限制每个上传文件的最大长度。
		 su.setMaxFileSize(1024*30*1000);
		// 限制总上传数据的长度。
		su.setTotalMaxFileSize(80000);
		//通过扩展名限制设定允许上传的文件,这里仅允许doc,txt文件。
		 su.setAllowedFilesList("gif,bmp,jpg,mp4");
		// 通过扩展名限制设定禁止上传的文件,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
		// su.setDeniedFilesList("exe,bat,jsp,htm,html,,");
		// 实现文件上传
		try {
			su.upload();
			// 将上传文件全部保存到指定目录,必须保证upload目录在应用程序根文件夹中存在
			su.save("./images", su.SAVE_VIRTUAL);
			//提示成功上传文件数量
			//out.println(count+"个文件上传成功！<br>");
				// 逐一提取上传文件信息，同时可保存文件。
			for (int i=0;i<su.getFiles().getCount();i++)
			{
				file = su.getFiles().getFile(i);
				// 若文件不存在则继续
				if (file.isMissing()) continue;
				// 显示当前文件信息
				//out.println("<br>文件长度" + file.getSize());
				//out.println("<br>文件名：" + file.getFileName()+"　长度："+file.getSize());
				}
				
				courseDir.setResources("../images/"+file.getFileName());
				
				com.jspsmart.upload.Request req = su.getRequest();
		
				String coursename=req.getParameter("courseName");
				String chapterId=req.getParameter("chapterId");
				String chapterName=req.getParameter("chapterName");
				String classHId=req.getParameter("classHId");
				String classHName=req.getParameter("classHName");
				
				courseDir.setChapterId(chapterId);
				courseDir.setCourseName(coursename);
				courseDir.setChapterName(chapterName);
				courseDir.setClassHourId(classHId);
				courseDir.setClassHourName(classHName);
				
				DaoFactory.getcourseDirDaoInstance().insertDir(courseDir);
				out.print("<script language=javascript>alert('发布成功！！');" +
						"window.location.href='teacher/containStu.jsp?course_name="+coursename+"';</script>");
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.println("</h3></center></body></html>");
	}
}
