<%-- 
    Document   : hyoji
    Created on : 2018/08/13, 14:14:07
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
            
            out.print(request.getParameter("txtName"));
            out.print(request.getParameter("gender"));
            out.print(request.getParameter("hobby"));
        
            %>
        </h1>
    </body>
</html>
