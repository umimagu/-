<%-- 
    Document   : cart
    Created on : 2018/08/30, 17:58:25
    Author     : satonana
--%>

<%@page import="kagoyume.ItemData"%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.KagoyumeHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession hs = request.getSession();
    UserDataDTO dto = (UserDataDTO) hs.getAttribute("login_dto");
    ArrayList<ItemData> cart = dto.getCart();

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
            .button-panel {
                margin: 2em 0 0;
                width: 20%;
                margin: 0 auto;
            }

            .button-panel .button {
                background: #f16272;
                border: none;
                color: #fff;
                cursor: pointer;
                height: 50px;
                font-family: 'Open Sans', sans-serif;
                font-size: 1.2em;
                letter-spacing: 0.05em;
                text-align: center;
                text-transform: uppercase;
                transition: background 0.3s ease-in-out;
                width: 100%;
            }

            .button:hover {
                background: #ee3e52;
            }

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
    </head>
    <body>
        <br><h1>Items in the cart</h1><br>

        <%for (int i = 0; i < cart.size(); i++) {%>
        <h3><%out.println(cart.get(i).getName());%></h3><br>
        <img src="<%out.println(cart.get(i).getImage());%>" alt=""><br>
        <%out.println(cart.get(i).getPrice() + "円");%><br>
        <a href="Cart?listnum=<%=i%>">削除</a><br><br>
        <%}%>

        <form action="BuyConfirm" method="POST">
            <div class="button-panel">
                <input type="submit" class="button" title="Buy" value="BUY"><br><br><br>
            </div>
        </form>
    </body>
</html>
