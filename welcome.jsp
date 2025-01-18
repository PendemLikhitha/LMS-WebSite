<jsp:include page="links.html"></jsp:include>
<%
String un=request.getParameter("uname");
out.print("<br><br><br><br><br><div style='text-align:center ;'>Login Successful!...<br><br>Your are Mr/Ms. "+un+"</div>");
%>