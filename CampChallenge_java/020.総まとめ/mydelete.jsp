<%-- 
    Document   : mydelete
    Created on : 2018/08/30, 17:59:07
    Author     : satonana
--%>

<%@page import="kagoyume.UserDataDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"        
        import="kagoyume.KagoyumeHelper"%>
<jsp:include page="header.jsp" flush="true"/>

<% KagoyumeHelper kh = KagoyumeHelper.getInstance();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
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
        <br><br>削除して本当によろしいですか？<br>
        <a href="MyDeleteResult">はい</a><br>
        <a href="top.jsp">いいえ</a><br>    

    </body>
</html>
