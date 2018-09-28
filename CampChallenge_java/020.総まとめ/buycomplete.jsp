<%-- 
    Document   : buycomplete
    Created on : 2018/08/30, 17:57:39
    Author     : satonana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kagoyume.KagoyumeHelper"%>
<%KagoyumeHelper kh = KagoyumeHelper.getInstance(); %>
<jsp:include page="header.jsp" flush="true"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>購入完了</title>
        <style>
            /*ハートボタン*/
            .heart {
                font-size: 200px;
                color: #ee3e52;
                margin:  100px 0 0;
                text-align: center;
                
            }
            .heart:hover {
                -webkit-animation: heart-anim 1s linear .3s;
                animation: heart-anim 1s linear .3s;
            }
            p{
                text-align: center;
                color: #FFF;
            }
            .add{
                position: relative;
                top: -35px
            }
            /* Animation setting */
            @-webkit-keyframes heart-anim {
                to {
                    opacity: 0;
                    -webkit-transform: scale(50);
                }
            }
            @keyframes heart-anim {
                to {
                    opacity: 0;
                    transform: scale(50);
                }
            }
            </style>
    </head>
    <body>
        <br><br><div class="heart">&#9829;</div>
        <div class="add">
            <p>purchase complete</p><br>
        </div><br><br>
        
    </body>
    
</html>
