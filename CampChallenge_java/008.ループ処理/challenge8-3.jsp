<%-- 
    Document   : challenge8-3
    Created on : 2018/06/20, 17:23:32
    Author     : satonana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>for文3</title>
    </head>
    <body>
        <h1>
            <%
                int num=0;
                for(int i=0;i<=100;i++){
                    num=num+i;
            }
                out.print(num);

            %>
        </h1>
    </body>
</html>
