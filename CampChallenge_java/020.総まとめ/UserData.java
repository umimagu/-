/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author satonana
 */
public class UserData implements Serializable {
    //個人情報
    private int userID;
    private String name;
    private String password;
    private String mail;
    private String address;
    private int total;


    public UserData() {
        this.userID = 0;
        this.name = "";
        this.password = "";
        this.mail = "";
        this.address = "";
        this.total = 0;

    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        //空文字(未入力)の場合空文字をセット
        if (name.trim().length() == 0) {
            this.name = "";
        } else {
            this.name = name;
        }
    }
    public String getPassword(){
        return password;
    }
    public void setPassword(String password){
        if(password.trim().length() == 0){
            this.password = "";
        }else{
            this.password = password;
        }
    }
    public String getMail(){
        return mail;
    }
    public void setMail(String mail){
        if(mail.trim().length()== 0 ){
            this.mail = "";
        }else{
            this.mail = mail; 
        }
    }
    public String getAddress(){
        return address;
    }
    public void setAddress(String address){
        if(address.trim().length() == 0 ){
            this.address = "";
        }else{
            this.address = address;
        }
    }
    
    public int getUserID(){
        return userID;
    }
    public void setUserID(int userID){
        this.userID = userID;
    }
    
    public int getTotal(){
        return total;
    }
    public void setTotal(int total){
        this.total = total;
    }
    
    public void UD2DTOMapping(UserDataDTO udd){
        udd.setName(this.name);
        udd.setPassword(this.password);
        udd.setMail(this.mail);
        udd.setAddress(this.address);
        udd.setUserID(this.userID);
        udd.setTotal(this.total);
    }
    
    public void DTO2UDMapping(UserData udb){
        UserDataDTO udd = new UserDataDTO();
        udb.setName(udd.getName());
        udb.setPassword(udd.getPassword());
        udb.setMail(udd.getMail());
        udb.setAddress(udd.getAddress());
        udb.setUserID(udd.getUserID());
        udb.setTotal(udd.getTotal());
    }
    
    public ArrayList<String> chkproperties(){
        ArrayList<String>chkList = new ArrayList<String>();
        if(this.name.equals("")){
            chkList.add("name");
        }
        if(this.password.equals("")){
            chkList.add("password");
        }
        if(this.mail.equals("")){
            chkList.add("mail");
        }
        if(this.address.equals("")){
            chkList.add("address");
        }
    return chkList;
    }
    
    
    
}
