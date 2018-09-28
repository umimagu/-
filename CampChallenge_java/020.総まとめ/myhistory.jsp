<%-- 
    Document   : myhistory
    Created on : 2018/08/30, 17:59:49
    Author     : satonana
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kagoyume.UserDataDAO"%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.BuyData"%>
<%@page import="kagoyume.KagoyumeHelper"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            HttpSession hs = request.getSession();
            UserDataDTO dto = (UserDataDTO)hs.getAttribute("login_dto");
            ArrayList<BuyData> buyItems = UserDataDAO.getInstance().getHistory(dto);
        %>
        <br><h1>購入履歴</h1><br><br>
        <% for (int i = 0; i < buyItems.size(); i++) { %>
            <% BuyData bd = buyItems.get(i);
               String ic = bd.getItemCode();%>
            <a href="Item?code=<% out.print(ic);%>"> <% out.print(ic);%> </a> 
            &nbsp;&nbsp;<% out.print(KagoyumeHelper.getInstance().getTypeString(bd.getType()));%>
            &nbsp;&nbsp;<% out.print(bd.getBuyDate());%>
            <br>     
        <%}%>
        
    </body>
</html>
