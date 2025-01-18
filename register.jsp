<%@  page import="java.sql.*" %>
<jsp:include page="links.html"/>
<%
   String sname=request.getParameter("sname");
   String suname=request.getParameter("suname");
   String spwd=request.getParameter("spwd");
   int sage=Integer.parseInt(request.getParameter("sage"));
   String sgender=request.getParameter("sgender");
   String saddr=request.getParameter("saddr");
   String lang=request.getParameter("slang");
   String edu=request.getParameter("edu");
   

   try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","lucky123");
			String sql="insert into signup values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,sname);
			pst.setString(2,suname);
			pst.setString(3,spwd);
            pst.setInt(4,sage);
	        pst.setString(5,sgender);
			pst.setString(6,saddr);
			pst.setString(7,lang);
            pst.setString(8,edu);
			pst.executeUpdate();
			%>
			
			<jsp:include page="login1.html" />
			<%
			con.close();
		}
		catch(Exception e)
		{
			out.print(e);
		}
%>