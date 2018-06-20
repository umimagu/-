<%-- 
    Document   : challenge8-1
    Created on : 2018/06/20, 17:22:58
    Author     : satonana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>for文1</title>
    </head>
    <body>
        <h1>
            <%
            long n=1;
            
            for(int i=0;i<20;i++){
               n=n*8;
               out.print(n);
               out.print("<br>");
            }
            
            
            %>
        </h1>
    </body>
</html>
