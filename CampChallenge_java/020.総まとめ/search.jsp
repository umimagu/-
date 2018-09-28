<%-- 
    Document   : search
    Created on : 2018/08/30, 18:07:35
    Author     : satonana
--%>

<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="kagoyume.KagoyumeHelper"%>
<%@page import="com.fasterxml.jackson.databind.JsonNode"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession hs = request.getSession();
    //sessionに格納した、nodeにある値の取得
    JsonNode root = (JsonNode) hs.getAttribute("searchResult");
    //アレイリストを４つ分作成
    ArrayList<String> name = new ArrayList<String>();
    ArrayList<String> price = new ArrayList<String>();
    ArrayList<String> image = new ArrayList<String>();
    ArrayList<String> code = new ArrayList<String>();

    int counter = 0;
    for (JsonNode jn : root.get("ResultSet").get("0").get("Result")) {

        if (!jn.has("Name")) {
            continue;
        }

        //ObjectMapper mapper = new ObjectMapper(); 
        //System.out.print(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jn));
        //String strIndex = String.valueOf(j);
        //JsonNode jn = root.get("ResultSet").get("0").get("Result").get(strIndex);
        name.add(jn.get("Name").asText());
        price.add(jn.get("Price").get("_value").asText());
        image.add(jn.get("Image").get("Medium").asText());
        code.add(jn.get("Code").asText());

        //10個が上限
        counter++;
        if (counter >= 10) {
            break;
        }

    }

    KagoyumeHelper kh = KagoyumeHelper.getInstance();
    boolean chk = false;
    if (hs.getAttribute("login_boo") != null) {
        chk = true;
    }
%>
<jsp:include page="header.jsp" flush="true"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>検索結果ページ</title>
        <style>
            
            table{
                width: 600px;
            }

            table.b-keep{
                word-break: keep-all;
                float: left;
                
            }
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
        <br><h1>Search Result</h1><br>
        <ul>

            <%if (code.isEmpty()) {
                    out.print("商品が見つかりませんでした。");
                }%>

            <%for (int i = 0; i < code.size(); i++) {%>
            <table border="0" class="b-keep">

                
                <td><img src="<%out.print(image.get(i));%>" alt=""></td>
                <td>
                    <a href="Item?code=<%=code.get(i)%>"><%out.println(name.get(i) + "<br>");%></a>
                    <%out.println(price.get(i) + "円");%>
                </td>

            </table>


            <%}%>
        </ul>
    </body>

</html>
