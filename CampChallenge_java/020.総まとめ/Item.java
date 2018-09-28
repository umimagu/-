/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import com.fasterxml.jackson.databind.JsonNode;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author satonana
 */
@WebServlet(name = "Item", urlPatterns = {"/Item"})
public class Item extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            request.setCharacterEncoding("UTF-8");
            
            String code = request.getParameter("code");
            //商品コード検索（商品詳細）のURL取得
            String json = GetResult.getResult("https://shopping.yahooapis.jp/"
                + "ShoppingWebService/V1/json/itemLookup?"
                + "appid=dj00aiZpPVpSYUlreURhZW50MyZzPWNvbnN1bWVyc2VjcmV0Jng9Y2U-"
                + "&itemcode=" + code// 商品固有コード
                + "&responsegroup=medium");
            //URLから必要な情報を取得
            JsonNode root = String2Json.getJsonNode(json);
            //URL共通部分
            JsonNode url = root.get("ResultSet").get("0").get("Result").get("0");
            //ビーンズに入れる
            ItemData idb = new ItemData();
                idb.setName(url.get("Name").asText());
                idb.setDiscription(url.get("Description").asText());
                idb.setImage(url.get("Image").get("Medium").asText());
                idb.setReview(url.get("Review").get("Rate").asText());
                idb.setPrice(url.get("Price").get("_value").asText());
                idb.setCode(code);

            
            //sessionにidbを格納
            HttpSession hs = request.getSession();
            hs.setAttribute("item",idb);
            
            request.getRequestDispatcher("/item.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
