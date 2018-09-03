package jums;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hayashi-s
 */
public class ResultDetail extends HttpServlet {

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
        try{
            request.setCharacterEncoding("UTF-8");
            
            //セッション
            HttpSession hs = request.getSession();
            
            //getParameterでurlのidを受け取る
            int id = Integer.parseInt(request.getParameter("id"));
            
            //resultdataをセッションから受け取る
            ArrayList<UserDataDTO> resultData = (ArrayList<UserDataDTO>)hs.getAttribute("resultData");
            
            //for文でlistのi番目の要素を順に取っていきたい、listの中のDTOの中のidを取得したい、
            //if文中　その取得したidがurlから取得したidと一致していた場合==、
            //dtoにi番目の要素のlistに入ってるDTOインスタンスを代入する
            for(int i = 0; i < resultData.size(); i++){
                if(resultData.get(i).getUserID() == id ){
                    UserDataDTO dto = resultData.get(i);
                    hs.setAttribute("data",dto);
                    break;
                }
            }  
            
//            //DTOオブジェクトにマッピング。DB専用のパラメータに変換
//            UserDataDTO searchData = new UserDataDTO();
//            
//            //idの取得とDTOのserchDataへセット
//            searchData.setUserID(Integer.parseInt(request.getParameter("id")));
//            
//            //serchDataに入っているidを元に、id以外の全データを取得して、resultDataに格納
//            UserDataDTO resultData2 = UserDataDAO.getInstance().searchByID(searchData);
//            
//            hs.setAttribute("resultData2", resultData2);
            
            request.getRequestDispatcher("/resultdetail.jsp").forward(request, response);  
        
        }catch(Exception e){
            //何らかの理由で失敗したらエラーページにエラー文を渡して表示。想定は不正なアクセスとDBエラー
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
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
