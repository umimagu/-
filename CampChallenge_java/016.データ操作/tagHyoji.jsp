<%-- 
    Document   : tagHyoji
    Created on : 2018/08/14, 10:15:17
    Author     : satonana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
        <%
            request.setCharacterEncoding("UTF-8");
            out.print(request.getParameter("はい"));
            out.print(request.getParameter("いいえ"));
            out.print(request.getParameter("送信"));
            out.print(request.getParameter("hobby"));
            out.print(request.getParameter("cmbList"));
            out.print(request.getParameter("fan"));
            out.print(request.getParameter("pass"));
        %>
        </h1>
    </body>
</html>
