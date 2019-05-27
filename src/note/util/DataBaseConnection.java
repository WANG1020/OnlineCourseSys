package note.util ;

import java.sql.* ;

public class DataBaseConnection
{
	private String DBDRIVER	= "com.mysql.jdbc.Driver" ;
	private String DBURL = "jdbc:mysql://localhost:3306/onlinecourse" ;
	private String DBUSER	= "root" ;
	private String DBPASSWORD = "Root" ;
	private Connection conn	= null ;

	public DataBaseConnection()
	{
		try
		{
			Class.forName(DBDRIVER) ;
			this.conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
		}
		catch (Exception e)
		{
		}
	}
	public Connection getConnection()
	{
		return this.conn ;
	}
	public void close()
	{
		try
		{
			this.conn.close() ;
		}
		catch (Exception e)
		{
		}
	}
};