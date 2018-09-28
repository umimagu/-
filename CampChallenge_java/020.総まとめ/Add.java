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
 * @author satonana
 */
@WebServlet(name = "Add", urlPatterns = {"/Add"})
public class Add extends HttpServlet {

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
            //セッションスタート
            HttpSession hs = request.getSession();
            //セッションから商品詳細を取り出して、ItemDataBeansにいれる
            ItemData idb = (ItemData)hs.getAttribute("item");
            
            UserDataDTO dto = new UserDataDTO();
            //ログインチェックの値を受け取る。値が入っているかチェック
            if(hs.getAttribute("login_boo") != null){
                //String check = (String)hs.getAttribute("login_boo");
            //}
            
            //if(check != null){
                
                //ログインしている人を判別するためのUserIDなどが入ったセッションを取得
                dto = (UserDataDTO) hs.getAttribute("login_dto");
                //UserIDによって判別された個人のdtoのカートに商品情報をセットする
                dto.setCart(idb);
                
            //非ログイン、2回目以降のadd
            } else if((UserDataDTO)hs.getAttribute("guest") != null){
                dto =(UserDataDTO)hs.getAttribute("guest");
                //二回目の商品追加
                dto.setCart(idb);
                ArrayList<ItemData> cart = dto.getCart();
                hs.setAttribute("Cart",cart);
            //非ログイン、add１回目のとき。
            } else {
                //dtoを作って、商品詳細をいれる
                dto = new UserDataDTO();
                dto.setCart(idb);
                //cartを作る
                ArrayList<ItemData> cart = dto.getCart();
                hs.setAttribute("Cart",cart);
                hs.setAttribute("guest",dto);
            }
               
            request.getRequestDispatcher("/add.jsp").forward(request,response);
            
        
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
