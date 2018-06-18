<%-- 
    Document   : challenge5-2
    Created on : 2018/06/18, 11:51:25
    Author     : satonana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>switch文1</title>
    </head>
    <body>
        <h1>
            <%
                int num=3;
                
                switch(num){
                    case 1:
                        out.println("one");
                        break;
                    case 2:
                        out.println("two");
                        break;
                    default:
                        out.println("想定外");
               }
            %>
            
        </h1>
    </body>
</html>
