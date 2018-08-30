<%-- 
    Document   : db_InventoryControl3
    Created on : 2018/08/18, 10:59:39
    Author     : satonana
--%><%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>商品一覧表示</title>
    </head>
    <body>
        <h1>
             <%
                request.setCharacterEncoding("UTF-8");
                Connection db_con = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    db_con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Challenge_db", "root", "root");

                    PreparedStatement db_st = null;//

                    //表示したい
                    db_st = db_con.prepareStatement("select * from product;");
                    
                    //SQL文の実行 ResultSet変数の定義
                    ResultSet db_data = db_st.executeQuery();
                    
                    //nextメソッドでデータの有無を確認、while文でデータがある限り取得し続け、表示
                    while (db_data.next()) {
                        out.println("ID：" + db_data.getInt("ID")+ "<br>");//カラム名
                        out.println("名前：" + db_data.getString("name")+ "<br>");
                        out.println("価格：" + db_data.getInt("value")+ "<br>");
                    }

                    db_data.close();//ResultSet変数
                    db_st.close();//PrepareStatement変数
                    db_con.close();//Connection変数

                } catch (SQLException e_sql) {
                    System.out.println("接続時にエラーが発生しました。" + e_sql.toString());
                } catch (Exception e) {
                    System.out.print("接続時にエラーが発生しました。" + e.toString());
                } finally {
                    if (db_con != null) {
                        try {
                            db_con.close();
                        } catch (Exception e_con) {
                            System.out.println(e_con.getMessage());
                        }
                    }
                }
            %>

        </h1>
    </body>
</html>
