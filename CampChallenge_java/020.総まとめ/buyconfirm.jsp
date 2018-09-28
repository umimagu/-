<%-- 
    Document   : buycomfirm
    Created on : 2018/08/30, 17:57:54
    Author     : satonana
--%>
<%@page import="kagoyume.UserDataDTO"%>
<%
    HttpSession hs = request.getSession();
    int total = Integer.parseInt(String.valueOf(hs.getAttribute("total")));
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="true"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>購入確認画面</title>
        <style>
            .form-wrapper {
                background: #fafafa;
                margin: 3em auto;
                padding: 0 1em;
                max-width: 370px;
            }

            h1 {
                text-align: center;
                padding: 1em 0;
            }
            h3 {
                text-align: center;
                padding: 1em 0;
            }
            p{
               position: relative;
                left: 50px; 
            }
            form {
                padding: 0 1.5em;
            }

            .form-item {
                margin-bottom: 0.75em;
                width: 100%;
            }

            .form-item input {
                background: #fafafa;
                border: none;
                border-bottom: 2px solid #e9e9e9;
                font-family: 'Open Sans', sans-serif;
                font-size: 1em;
                transition: border-color 0.3s;
                
            }

            .form-item input:focus {
                border-bottom: 2px solid #c0c0c0;
                outline: none;
            }

            .button-panel {
                margin: 2em 0 0;
                width: 100%;
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
            .form-footer {
                font-size: 1em;
                padding: 2em 0;
                text-align: center;
            }

            .form-footer a {
                color: #8c8c8c;
                text-decoration: none;
                transition: border-color 0.3s;
            }

            .form-footer a:hover {
                border-bottom: 1px dotted #8c8c8c;
            }

        </style>
    </head>
    <body>
        <div class="form-wrapper">
            <br><br>
            <h1><%out.print("合計金額：" + total + "円");%></h1>

            <form action="BuyComplete" method="POST">
                <div class="form-item">
                    
                    <h3>発送方法</h3>

                        <p><input type="radio"  name="how2send" value="1"> 普通郵便</p><br>
                        <p><input type="radio"  name="how2send" value="2"> 宅急便</p><br>
                        <p><input type="radio"  name="how2send" value="3"> レターパック</p><br>
                </div>

                <div class="button-panel">
                    <input type="submit" class="button" title="Buy" value="BUY">
                </div>
            </form>
            <div class="form-footer">
                <a href="javascript:history.back()">back</a>
            </div>
            
        </div>
    </body>
</html>
