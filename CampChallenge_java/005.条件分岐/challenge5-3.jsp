<%-- 
    Document   : challenge5-3
    Created on : 2018/06/18, 11:51:33
    Author     : satonana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>switch文2</title>
    </head>
    <body>
        <h1>
            
            <%
                char langage='A';
                
             switch(langage){
                 case 'A':
                     out.println("英語");
                     break;
                     
                 case 'あ':
                     out.println("日本語");
                     break;
                     
                 default:
                     
             }
            
            %>
        </h1>
    </body>
</html>
