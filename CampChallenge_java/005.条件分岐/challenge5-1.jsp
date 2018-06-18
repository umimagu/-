<%-- 
    Document   : challenge5-1
    Created on : 2018/06/18, 11:51:14
    Author     : satonana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>変数の宣言と表示（if文）</title>
    </head>
    <body>
        <h1>
            <%
              int num1=3;
              
              if(num1==1){
                  out.println("1です！");
              }
              
              else if(num1==2){
                  out.println("プログラミングキャンプ！");
              }
              else{
                  out.print("その他です！");
              }
              
            %>
        </h1>
    </body>
</html>
