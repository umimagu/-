<%-- 
    Document   : header
    Created on : 2018/09/12, 16:35:02
    Author     : satonana
--%>

<%@page import="kagoyume.KagoyumeHelper"%>
<%@page import="kagoyume.ItemData"%>
<%@page import="kagoyume.UserDataDTO"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            /* Fonts */
            @import url(https://fonts.googleapis.com/css?family=Open+Sans:400);

            /* fontawesome */
            @import url(http://weloveiconfonts.com/api/?family=fontawesome);
            [class*="fontawesome-"]:before {
                font-family: 'FontAwesome', sans-serif;
            }

            /* Simple Reset */
            * { margin: 0; padding: 0; box-sizing: border-box; }

            /* body */
            body {
                background: #e9e9e9;
                color: #5e5e5e;
                font: 400 87.5%/1.5em 'Open Sans', sans-serif;
            }
            
            ul {
                padding: 0 0.5em;
                position: relative;
            }

            ul li {
                line-height: 1.5;
                padding: 0.2em 0 0 1.4em;
                list-style-type: none!important;
                color: #333333;
                
            }

            ul li:before {
                font-family: "Font Awesome 5 Free";
                content: "\f00c";/*アイコン種類*/
                position: absolute;
                left : 0.5em; /*左端からのアイコンまで*/
                color: #ee3e52; /*アイコン色*/
            }

            ul li:last-of-type{
                border-bottom: none;
                color: #333333;
            }
            ul li a {
                color: #333333;
                text-decoration: none;
                transition: border-color 0.3s;
            }
            ul li a:hover {
                border-bottom: 1px dotted #333333;
            }
        </style>
        
        <%
            HttpSession hs = request.getSession();
            KagoyumeHelper kh = KagoyumeHelper.getInstance();

            boolean chk = false;

            if (hs.getAttribute("login_boo") != null) {
                chk = true;
            }

        %>
    </head>
    <body>
        <ul>
            <li><%=kh.home()%></li>
            <li><%=kh.loginLink(chk)%></li>

            <%
                if (chk) {
                    if (hs.getAttribute("login_dto") != null) {
                        UserDataDTO dto = (UserDataDTO) hs.getAttribute("login_dto");
                        out.print("<li><a href=\"MyData\">" + dto.getName() + "</a>さん、こんにちは！</li>");
                    }
                }

            %> </ul>
    </body>
</html>
