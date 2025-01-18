<jsp:include page="links.html" />
<br>
<%
	session.removeAttribute("user");
%>
<jsp:forward page="log.jsp"/>