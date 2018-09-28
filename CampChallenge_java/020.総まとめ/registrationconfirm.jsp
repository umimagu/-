<%-- 
    Document   : registrationconfirm
    Created on : 2018/08/30, 18:07:08
    Author     : satonana
--%>

<%@page import="kagoyume.UserData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="true"/>
<%
    request.setCharacterEncoding("UTF-8");
    HttpSession hs = request.getSession();
    UserData udb = (UserData) hs.getAttribute("udb");
    ArrayList<String> chkList = udb.chkproperties();
%>
<!DOCTYPE html>
<html>
    <head>
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
            ul.list {
                margin-bottom: 0.75em;
                width: 100%;
            }

            ul.list {
                background: #fafafa;
                border: none;
                border-bottom: 2px solid #e9e9e9;
                color: #666;
                font-family: 'Open Sans', sans-serif;
                font-size: 1em;
                height: 50px;
                transition: border-color 0.3s;
                width: 100%;
            }

            ul.list:focus {
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登録確認</title>
    </head>
    <body>
        <div class="form-wrapper">
            <% if (chkList.size() == 0) {%>

            <h1>登録確認</h1>
            <ul class="list">
                <li>name：<%=udb.getName()%><br></li>
                <li>pass：<%=udb.getPassword()%><br></li>
                <li>mail：<%=udb.getMail()%><br></li>
                <li>address：<%=udb.getAddress()%><br></li>
                
            </ul>
                <br><br><br>
                <p>上記の内容で登録します。よろしいですか。</p>
            <form action="RegistrationComplete" method="POST">
                <div class="button-panel">
                    <input type="submit" class="button" name="yes" value="YES">
                </div>
            </form>


            <% } else { %>
            <h1>入力が不完全です</h1>
            <% }%>

            <form action="Registration" method="POST">
                <div class="button-panel">
                    <input type="submit" class="button" name="no" value="NO">
                    <input type="hidden" name="mode" value="REINPUT">
                </div>
            </form>
            <div class="form-footer">
                <p><a href="Registration">Create an account</a></p>

            </div>
        </div>
    </body>
</html>
