<%-- 
    Document   : challenge3-1
    Created on : 2018/06/15, 0:41:04
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
            int num1=18;
            final int num2=5;
            
            out.print(num1+num2);
            out.print(num1-num2);
            out.print(num1*num2);
            out.print(num1/num2);
            out.print(num1%num2);
            
            out.print(++num1);
            out.print(num1++);
            out.print(num1--);
            out.print(--num1);
            

            out.print(num1++);
            out.print(num1);
            %>
        </h1>
    </body>
</html>
