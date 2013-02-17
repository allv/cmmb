<%
StringBuffer buffer = new StringBuffer();
buffer.append(request.getContextPath());
buffer.append("/index.do");
response.sendRedirect(buffer.toString());
%>
