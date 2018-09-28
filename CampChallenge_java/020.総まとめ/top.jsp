<%-- 
    Document   : top
    Created on : 2018/08/30, 17:57:07
    Author     : satonana
--%>

<%@page import="kagoyume.KagoyumeHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="true"/>
<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>トップページ</title>
        <style>
            
            /* Form Layout */
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

            #form{
                padding: 0 1.5em;
                position:relative;
                max-width:300px;	
                margin-bottom:20px;
            }

            .form-item {
                margin-bottom: 0.75em;
                width: 100%;
            }

            .form-item input {
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

            .form-item input:focus {
                border-bottom: 2px solid #c0c0c0;
                outline: none;
            }
            /*以下検索画面*/
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
            /*検索ボックス*/
            #sbox4{
                height:50px;
                padding:0 10px; 
                left:0;
                top:0; 
                border-radius:25px;
                outline:0;
                background:#eee;
            }
            /*クリック部分*/
            #sbtn4{
                height:50px;
                width:50px;	
                position:absolute; 
                left:250px; 
                top:0;
                background:#f16272;
                color:#fff;
                border:none;
                border-radius:0 25px 25px 0;
            }
            #sbtn4:hover{
                background:#ee3e52;
            }
            /*虫眼鏡アイコン*/
            .search.icon {
                color: white;
                position: relative;
                left:241px;
                top:-60px;
                margin-top: 2px;
                margin-left: 3px;
                width: 12px;
                height: 12px;
                border: solid 2px currentColor;
                border-radius: 100%;
                -webkit-transform: rotate(-45deg);
                transform: rotate(-45deg);
            }
            .search.icon:before {
                content: '';
                position: absolute;
                top: 11px;
                left: 3px;
                height: 7px;
                width: 2px;
                background-color: currentColor;
            }

            /*フッター*/
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
            <h1>Top Page</h1><br>
            <br>
            <form action = "Search" method = "POST" id="form">
                    
                <div class="form-item">
                    <input id="sbox4" type = "text" placeholder="Please enter a keyword" name = "keyword">
                </div>
                
                <div class="button-panel">
                    <button id="sbtn4" type="submit"></button>
                </div>
                <div class="search icon"></div>

            </form>

            <div class="form-footer">
                <p></p>
            </div>

        </div>
    </body>
</html>
