<%-- 
    Document   : challenge8-4
    Created on : 2018/06/20, 19:06:00
    Author     : satonana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>while文</title>
    </head>
    <body>
        <h1>
            <%
                int num=1000;
                int count=0;
                
                while(num>100){
                    num=num/2;
                    count++;
                    
                    out.print(num);
                    out.print("<br>");
                }
                
            %>
        </h1>
    </body>
</html>
