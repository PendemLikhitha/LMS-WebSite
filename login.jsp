<%@ page import="java.sql.*" %>
<jsp:include page="links.html" />
<%
   
   String un=request.getParameter("username");
   String pwd=request.getParameter("password");
   try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
     Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","lucky123");
	 String qry="select * from signup where username=? and password=?";
	 PreparedStatement pstmt=con.prepareStatement(qry);
	 pstmt.setString(1,un);
	 pstmt.setString(2,pwd);
	 ResultSet rs=pstmt.executeQuery();
	 if(rs.next())
			{
                session.setAttribute("user",un);
				%>

                <jsp:forward page="welcome.jsp">
				<jsp:param name="uname" value="<%= un %>"/>
				</jsp:forward>
			<%
			}
		else
			{
				boolean notLoggedIn = true;
    %>
    <script>
        // Check the flag and display an alert if the user is not logged in
        if (<%= notLoggedIn %>) {
            alert("Invalid username and password.");
        }
    </script>
				
				<jsp:include page="login2.html" />
				<%

			}
		con.close();
		}
		catch(Exception e)
		{
			out.print(e);
		}
	%>