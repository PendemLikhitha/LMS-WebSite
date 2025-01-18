<jsp:include page="links.html" />
<%
String uname = (String)session.getAttribute("user");
if(uname != null)
{
  
        response.sendRedirect("pro.jsp?uname=" + uname); 
}

else
{
    boolean notLoggedIn = true;
    %>
    <script>
        // Check the flag and display an alert if the user is not logged in
        if (<%= notLoggedIn %>) {
            alert("Please login first.");
        }
    </script>
    <jsp:include page="login2.html" />
    <%
}
%>