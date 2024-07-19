package multishop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class Shop {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public Shop() throws Exception
	{
		
		Class.forName("com.mysql.jdbc.Driver"); // 라이브러리를 찾아라
		String db="jdbc:mysql://localhost:3306/second";
		conn=DriverManager.getConnection(db,"root","1234");
		
	}
	
	
	
	public void shopwriteOk(HttpServletRequest request, MultipartRequest multi, HttpServletResponse response) throws Exception
	{
		String clothes_type=multi.getParameter("clothes_type");
		String price=multi.getParameter("price");
	    String itemname=multi.getParameter("itemname");
	    String itemline=multi.getParameter("itemline");
	    String detail=multi.getParameter("detail");
	    
		Enumeration files=multi.getFileNames();//멀티의 파일 이름들을 가져온다.
		String fname="";
		while(files.hasMoreElements())
		{
			String imsi=files.nextElement().toString();
			fname=fname+multi.getFilesystemName(imsi)+"/";
		}
		
		fname=fname.replace("null/", "");
		
		String sql="insert into clothes(clothes_type,price,itemname,itemline,detail,filname,writeday)";
		sql=sql+" values (?,?,?,?,?,?,now())";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, clothes_type);
		pstmt.setString(2, price);
		pstmt.setString(3, itemname);
		pstmt.setString(4, itemline);
		pstmt.setString(5, detail);
		pstmt.setString(6,fname);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("list.jsp");
		
	}
	
}
