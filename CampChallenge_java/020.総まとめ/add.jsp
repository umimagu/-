<%-- 
    Document   : add
    Created on : 2018/08/30, 17:57:23
    Author     : satonana
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="kagoyume.KagoyumeHelper"%>
<%
    HttpSession hs = request.getSession();
%>

<jsp:include page="header.jsp" flush="true"/>
<!DOCTYPE html>
<html>
    <head>
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
            /*カートボタン*/
            .btn {
                display: inline-block;
                text-decoration: none;
                color: #FFF;
                width: 170px;
                height: 170px;
                line-height: 170px;
                border-radius: 50%;
                text-align: center;
                vertical-align: middle;
                overflow: hidden;
                background-image: -webkit-linear-gradient(45deg, #709dff 0%, #91fdb7 100%);    
                background-image: linear-gradient(45deg, #709dff 0%, #91fdb7 100%);
                transition: .4s;
            }

            .btn:hover{
                -webkit-transform: rotate(10deg);
                -ms-transform: rotate(10deg);
                transform: rotate(10deg);
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>カート</title>
    </head>
    <body>
        <br><br><div class="heart">&#9829;</div>
        <div class="add">
            <p>Item added to cart</p><br>
        </div><br><br>
        <br><p><a href="Cart" class="btn">Go to Cart</a></p><br><br><br>


    </body>
</html>
