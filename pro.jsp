<%@ page import="java.sql.*"%>
<style>
  table
  {
     text-align:center;
  }
  table.profile-table {
     width: 45%;
     margin: 20px auto; /* Center the table on the page */
     border-collapse: collapse; /* Collapse borders */
     border: 2px solid #3498db; /* Add a border around the table */
     border-radius: 10px; /* Rounded corners for the table */
  }
  .profile-table th, .profile-table td {
     padding: 10px; /* Add padding to cells */
     border-bottom: 1px solid #ccc; /* Add bottom border to cells */
  }
  .profile-table th {
     background-color: #3498db; /* Blue background for header cells */
     color: white; /* White text color for header cells */
  }
  .profile-table tr:nth-child(even) {
     background-color: #f9f9f9; /* Light gray background for even rows */
  }
  .profile-table tr:hover {
     background-color: #f1f1f1; /* Lighter gray background on hover */
  

</style>
<jsp:include page="links.html"></jsp:include>
<%
		String un=request.getParameter("uname");
		out.print("<br><br><br><br><div style='text-align:center ;'>This is your PROFILE<br><br>Your are Mr/Ms. "+un+"</div>");
        
        try 
	    {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "lucky123");
                String query = "SELECT * FROM signup WHERE username = ?";
                 PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, un);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    String gender = rs.getString("gender");
                    String pwd=rs.getString("password");
                    String name= rs.getString("name");
                    String address = rs.getString("address");
                    int age = rs.getInt("age");
                    String lang = rs.getString("LANGUAGES_KNOWN");
					String edu = rs.getString("education");


                    
        %>
        <center>
    <table class="profile-table" border="1" cellspacing="0" height="70%" width="36%">
        <tr>
            <th>Username</th>
            <td><%= un %></td>
        </tr>
        <tr>
            <th>Password</th>
            <td><%= pwd %></td>
        </tr>
        <tr>
            <th>Name</th>
            <td><%= name %></td>
        </tr>
        <tr>
            <th>Age</th>
            <td><%=age %></td>
        </tr>
        <tr>
            <th>Gender</th>
            <td><%= gender %></td>
        </tr>
        <tr>
            <th>Address</th>
            <td><%= address %></td>
        </tr>
		<tr>
            <th>Languages known</th>
            <td><%= lang%></td>
        </tr>
		<tr>
            <th>Education</th>
            <td><%= edu %></td>
        </tr>
    </table>
</center>
<%
                }
		else {
                    out.println("<p>User not found.</p>");
                }
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } 
        %>
