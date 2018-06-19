<%-- 
    Document   : challenge7
    Created on : 2018/06/19, 11:12:39
    Author     : satonana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>連想配列の作成</title>
    </head>
    <body>
        <h1>
            <%@page import ="java.util.HashMap"%>
            <%
            
                HashMap<String,String>data1=new HashMap<String,String>();
                    data1.put("1","AAA");
                    data1.put("hello","world");
                    data1.put("soeda","33");
                    data1.put("20", "20");
               
                    out.print(data1.get("1"));
                    out.print("<br>");
                    out.print(data1.get("hello"));
                    out.print("<br>");
                    out.print(data1.get("soeda"));
                    out.print("<br>");
                    out.print(data1.get("20"));
              
             %>
        </h1>
    </body>
</html>
