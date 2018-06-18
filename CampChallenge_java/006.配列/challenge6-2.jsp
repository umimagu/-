<%-- 
    Document   : challenge6-2
    Created on : 2018/06/18, 19:15:13
    Author     : satonana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>配列の変更</title>
    </head>
    <body>
        <h1>
          <%@page import="java.util.ArrayList"%>    
            <%  
               ArrayList<String> datas =new ArrayList<String>();
                datas.add("10");
                datas.add("100");
                datas.add("soeda");
                datas.add("hayashi");
                datas.add("-20");
                datas.add("118");
                datas.add("END");
                
                datas.set(2,"33");
                
                for(int num=0;num<=6;num++){
                out.print(datas.get(num));
                
                out.print("<br>");
                
                }
                
            %>
        
        </h1>
    </body>
</html>
