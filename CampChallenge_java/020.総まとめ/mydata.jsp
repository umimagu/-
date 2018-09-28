<%-- 
    Document   : mydata
    Created on : 2018/08/30, 18:01:05
    Author     : satonana
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="true"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
        <%
            HttpSession hs = request.getSession();
            UserDataDTO dto = (UserDataDTO) hs.getAttribute("login_dto");            
        %>
        <br><h1>ユーザ情報</h1><br>
        <ul>
            <li>ユーザ名：<% out.print(dto.getName()); %> </li>
            <li>パスワード：<% out.print(dto.getPassword()); %> </li>
            <li>メールアドレス：<% out.print(dto.getMail()); %> </li>
            <li>住所：<% out.print(dto.getAddress()); %></li> 
            <li>総購入金額：￥<% out.print(Integer.toString(dto.getTotal()));%></li> 
        </ul>
        <br>
        <a href="MyUpdate">登録情報更新</a><br>
        <a href="MyHistory">購入履歴</a><br>
        <a href="MyDelete">アカウント削除</a><br>

      
    </body>
</html>
