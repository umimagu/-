<%-- 
    Document   : registrationcomplete
    Created on : 2018/08/30, 18:05:58
    Author     : satonana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"
        import="kagoyume.UserData" 
        import="kagoyume.KagoyumeHelper"
%>
<%
    UserData udb = (UserData)request.getAttribute("udb");
    KagoyumeHelper kh = KagoyumeHelper.getInstance();
%>
<jsp:include page="header.jsp" flush="true"/>
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
        <title>かごゆめ登録結果画面</title>
    </head>
    <body>
        <br><h1>登録結果</h1><br>
        名前：<%= udb.getName()%><br>
        パスワード：<%=udb.getPassword()%><br>
        メールアドレス：<%=udb.getMail()%><br>
        住所：<%=udb.getAddress()%><br>
        
    </body>
</html>
