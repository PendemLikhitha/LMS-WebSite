<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
if (session == null || session.getAttribute("user") == null) 
{%><jsp:include page="links.html"/>

<jsp:include page="login2.html" /><%
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile - learning management system</title>
    <link rel="stylesheet" href="styles9.css">
	<script>
        function validatePassword() {
            var password = document.getElementById("newPassword").value;

            
            var regex = /^(?=.*[a-zA-Z])(?=.*\d).{6,}$/;

            if (!regex.test(password)) {
                alert("Password must be at least 6 characters long and contain both alphabets and numbers.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <nav>
        <header class="header">
        <div class="menu">
          <div class="logo">
            <i style='font-size:24px' class='fas'>&#xf1b2;</i>
            <a href="#">LittleLearner</a>
          </div>
          <ul>
            <li><a href="login.html">LogIn</a></li>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="update.jsp">Update</a></li>
            <li><a href="logout.jsp">LogOut</a></li>
         
        </div>
        </ul>
       </div>
      </nav><br><br><br><br><br>
<div class="container">
    <center><h2>Update Password</h2></center>
    <form action="update.jsp" method="post" name="passform" onsubmit="return validatePassword()" >
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="<%=session.getAttribute("user")%>" readonly>
        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword">
        <input type="submit" value="Update Password">
    </form>
</div>

</body>

        <% 
        String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");

        if (username != null && newPassword != null && !newPassword.isEmpty()) {
            Connection con = null;
            PreparedStatement pstmt = null;
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "lucky123");
                String query = "UPDATE signup SET password= ? WHERE username = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, newPassword);
                pstmt.setString(2, username);
                int result = pstmt.executeUpdate();
                if (result > 0) {
                    out.println("<h1><center><p>Password updated successfully.</p></center></h1>");
                } else {
                    out.println("<p>Error updating password. Please try again.</p>");
                }
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
                }
            }
        }
        %>
    </div>
    <footer><p>copyrights@PendemLikhitha22761A05B0</p></footer>
</body>
</html>
