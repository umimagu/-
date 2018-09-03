/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jums;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author satonana
 */
public class UserDataBeans implements Serializable {
    
    private String name;
    private String year;
    private String month;
    private String day;
    private int type;
    private String tell;
    private String comment;
    
    UserDataBeans(){};//コンストラクタ
    
    public String getName(){
        return name;
    }
    public void setName(String name){
        this.name = name;
    }
    public String getYear(){
        return year;
    }
    public void setYear(String year){
        this.year = year;
    }
    public String getMonth(){
        return month;
    }
    public void setMonth(String month){
        this.month = month;
    }
    public String getDay(){
        return day;
    }
    public void setDay(String day){
        this.day = day;
    }
    public int getType(){
        return type;
    }
    public void setType(int type){
        this.type = type;
    }
    public String getComment(){
        return comment;
    }
    public void setComment(String comment){
        this.comment = comment;
    }
    public String getTell(){
        return tell;
    }
    public void setTell(String tell){
        this.tell = tell;
    }
    
    
//    public void mapping(UserDataDTO udt){
//        udt.setName(this.name);
//        udt.setBirthday();
//    }
//    

    Date getTime() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
