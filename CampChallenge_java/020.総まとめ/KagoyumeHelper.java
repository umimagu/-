/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import javax.servlet.http.HttpSession;

/**
 *
 * @author satonana
 */
public class KagoyumeHelper {

    //トップへのリンクを定数として設定
    private final String homeURL = "top.jsp";
    //ログインページへのリンク
    private final String loginURL = "Login";
    //ログアウトリンク
    private final String logoutURL = "Login";
    //カートリンク
    private final String cartURL = "Cart";
    
    public static KagoyumeHelper getInstance() {
        return new KagoyumeHelper();
    }

    public String home() {
        return "<a href=\"" + homeURL + "\">Top</a>";
    }

    //ログインとログアウト表示
    public String loginLink(boolean chk){//boolean chkはlogin_booの値を引数に入れる
        if(chk){//ログイン時
            return "<a href=\""+ logoutURL + "\">Logout</a> "
                    +"<br><li>"
                    + "<a href=\""+ cartURL + "\">Cart</a></li>" ; //ログアウト＋買い物かご＋マイページ
        }else{//ログアウト時
            return "<a href=\""+ loginURL + "\">Login</a>"; //ログインリンク
        }
    }

       //発送方法コードをintから文字列に変換する
    public String getTypeString(int type){
        if (type == 1) {
            return "普通郵便";
            
        } else if (type == 2) {
            return "宅急便";

        } else if (type == 3) {
            return "レターパック";

        } else {
            return "エラー：不明な発送方法コード";
        }
        
    }
    
    
}
