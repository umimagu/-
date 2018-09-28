<%-- 
    Document   : item
    Created on : 2018/08/30, 17:58:47
    Author     : satonana
--%>

<%@page import="kagoyume.ItemData"%>
<%@page import="kagoyume.UserData"%>
<%@page import="com.fasterxml.jackson.databind.JsonNode"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"
        import="kagoyume.KagoyumeHelper"%>
<%
    HttpSession hs = request.getSession();
    //sessionからitemを取り出し、beansに格納する
    ItemData idb = (ItemData) hs.getAttribute("item");
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
                    position: relative;
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
        <title>Item Result</title>
    </head>
    <body>
        <br>
        <h1>Item Result</h1>

        <br><%out.println(idb.getName());%>
        <br><%out.println(idb.getDiscription());%>
        <br><img src="<%out.print(idb.getImage());%>" alt="">
        <br><%out.print("評価" + idb.getReview() + "点/5点");%>
        <br><%out.print(idb.getPrice() + "円");%>

        <form action="Add" method="POST">
            <div class="button-panel">
                <input type="submit" class="button" title="Add to cart" value="Add to cart"><br><br><br>
            </div>
        </form>
    </body>
</html>
