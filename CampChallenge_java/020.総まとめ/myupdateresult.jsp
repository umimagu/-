<%-- 
    Document   : myupdateresult
    Created on : 2018/08/30, 18:00:29
    Author     : satonana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="true"/>
<%@page import="javax.servlet.http.HttpSession"
        import="kagoyume.UserData" 
        import="kagoyume.KagoyumeHelper"
        
%>
<%
    UserData udb = (UserData)request.getAttribute("udb");
    KagoyumeHelper kh = KagoyumeHelper.getInstance();
%>

<!DOCTYPE html>
<html>
    <head>
        <style>
            h1 {
                position: relative;
                padding: 0.6em;
                background: #f16272;
                color: #fff;
            }

            h1:after {
                position: absolute;
                content: '';
                top: 100%;
                left: 30px;
                border: 15px solid transparent;
                border-top: 15px solid #f16272;
                width: 0;
                height: 0;
            }
            </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Update Result Page</title>
    </head>
    <body>

        <br><h1>更新結果</h1><br>
        名前：<%= udb.getName()%><br>
        パスワード：<%=udb.getPassword()%><br>
        メールアドレス：<%=udb.getMail()%><br>
        住所：<%=udb.getAddress()%><br>
        
    </body>
</html>
