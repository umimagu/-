/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 *
 * @author satonana
 * HTTP接続して結果を得る
 * まっすぐなやつ
 */

public class GetResult {

    public static String getResult(String urlString) {
        String result = "";
        try {
            //URLの作成
            URL url = new URL(urlString);
            //コネクションを開いて接続
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.connect();
            //文字列を取得、1行ずつテキストを読み込む
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String tmp = "";
            while ((tmp = in.readLine()) != null) {
                result += tmp;
            }
            in.close();
            con.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
