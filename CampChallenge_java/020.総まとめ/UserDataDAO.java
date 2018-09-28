/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;
import base.DBManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;


/**
 *
 * @author satonana
 */
public class UserDataDAO {

    //インスタンスオブジェクトを返却させてコードの簡略化
    public static UserDataDAO getInstance(){
        return new UserDataDAO();
    }
    
    /**
    * 新規登録データの挿入処理を行う。現在時刻は挿入直前に生成
    */ 
    public void insert(UserDataDTO ud) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            con = DBManager.getConnection();
            st = con.prepareStatement("INSERT INTO user_t(name,password,mail,address,newDate) VALUES(?,?,?,?,?)");
            st.setString(1, ud.getName());
            st.setString(2,ud.getPassword());
            st.setString(3,ud.getMail());
            st.setString(4,ud.getAddress());
            st.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            st.executeUpdate();
            System.out.println("insert completed");
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con !=null){
                con.close();
            }
        }
    }
    
    /**
    * 登録データの更新処理を行う。
    */ 
    public void update(UserDataDTO ud) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            con = DBManager.getConnection();
            st = con.prepareStatement("UPDATE user_t set name = ?, password = ?, mail = ?, address = ? where userID = ?");
            st.setString(1, ud.getName());
            st.setString(2,ud.getPassword());
            st.setString(3,ud.getMail());
            st.setString(4,ud.getAddress());
            st.setInt(5, ud.getUserID());

            //System.out.println(st);
                        
            st.executeUpdate();
            
            System.out.println("update completed");
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con !=null){
                con.close();
            }
        }
    }
    
    /**
    * ユーザの総購入金額の更新処理を行う。
    */ 
    public void updateTotal(UserDataDTO ud) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            con = DBManager.getConnection();
            st = con.prepareStatement("UPDATE user_t set total = ? where userID = ?");
                        
            System.out.println(ud.getTotal());
            st.setInt(1, ud.getTotal());
            st.setInt(2, ud.getUserID());

            System.out.println(st);
                        
            st.executeUpdate();
            
            System.out.println("total update completed");
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con !=null){
                con.close();
            }
        }
    }
    
    
    /**
    * 新規購入データの挿入処理を行う。現在時刻は挿入直前に生成
    */ 
    public void insertItems(UserDataDTO ud, int how2send) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            con = DBManager.getConnection();
            
            ArrayList <ItemData> list = ud.getCart();

            for (int i = 0; i < list.size(); i++) {

                st = con.prepareStatement("INSERT INTO buy_t(userID, itemCode, type, buyDate) VALUES(?,?,?,?)");
                st.setInt(1,ud.getUserID());
                st.setString(2,list.get(i).getCode());
                st.setInt(3,how2send);
                st.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
                st.executeUpdate();
                
            }

        } catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con !=null){
                con.close();
            }
        }
    }
    
    
    /**
     * ログイン認証処理を行う。
     */ 
    public UserDataDTO login(UserDataDTO ud) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            con = DBManager.getConnection();
            st = con.prepareStatement("select * from user_t where name = ? and password = ? and deleteFlg = 0 ");
            st.setString(1, ud.getName());
            st.setString(2,ud.getPassword());
            ResultSet rs = st.executeQuery();
            
            if(rs.next()){
                ud.setUserID(rs.getInt("userID"));
                ud.setName(rs.getString("name"));
                ud.setPassword(rs.getString("password"));
                ud.setMail(rs.getString("mail"));
                ud.setAddress(rs.getString("address"));
                ud.setTotal(rs.getInt("total"));

                return ud;
            }
            return null;
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con !=null){
                con.close();
            }
        }
    }
    
    
     /**
     * 購入履歴を取得する。
     */ 
    public ArrayList<BuyData> getHistory(UserDataDTO ud) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            
            con = DBManager.getConnection();
            st = con.prepareStatement("select itemCode, type, DATE_FORMAT(buyDate, '%Y-%m-%d %H:%i:%s') as buyDate from buy_t where userID = ?");
            st.setInt(1, ud.getUserID());

            ResultSet rs = st.executeQuery();
                            System.out.print(st);

            // 今はitemCodeだけだが、他の項目もたぶん必要
            ArrayList<BuyData> buyItems = new ArrayList<BuyData>();
            while (rs.next()) {
               BuyData bd = new BuyData();
               bd.setItemCode(rs.getString("itemCode"));
               bd.setBuyDate(rs.getString("buyDate"));
               bd.setType(rs.getInt("type"));
               buyItems.add(bd);
            }
            return buyItems;
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con !=null){
                con.close();
            }
        }
    }
    
    /**
     * 購入履歴を取得する。
     */ 
    public void deleteUser(UserDataDTO ud) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            
            con = DBManager.getConnection();
            st = con.prepareStatement("update user_t set deleteFlg = 1 where userID = ?");
            st.setInt(1, ud.getUserID());

            st.executeUpdate();
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con !=null){
                con.close();
            }
        }
    }

    void deleteUser() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
