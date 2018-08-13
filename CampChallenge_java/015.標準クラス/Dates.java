/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.camp.servlet;
import java.util.Date;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.text.ParseException;
/**
 *
 * @author satonana
 */

public class Dates {
    public static void main(String[]args){
    //タイムスタンプの作成
    Date otherDay = new Date(1451574000L);
    System.out.println(otherDay.getTime());
    
    //現在の日時
    Calendar today = Calendar.getInstance();
    today.set(1988,4,21,1,23,45);
    System.out.println(today.getTime());
    
    //タイムスタンプの表示１
    Date stamp1 = new Date(1533815783L);
    SimpleDateFormat sdf 
            = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String dateString = sdf.format(stamp1);
    System.out.println(dateString);
    
    //タイムスタンプの表示２
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date dateTo = null;
    Date dateFrom = null;
 
    // 文字列を日付に変換
    try {
        dateFrom = sdf2.parse("2015/01/01 00:00:00");
        dateTo = sdf2.parse("2015/12/31 23:59:59");
    } catch (ParseException e) {
        e.printStackTrace();
    }
 
    // 日付をlong値に変換します。
    long dateTimeTo = dateTo.getTime();
    long dateTimeFrom = dateFrom.getTime();
 
    // 差分の日数を算出します。
    long dayDiff = ( dateTimeTo - dateTimeFrom  ) / (1000 * 60 * 60 * 24 );
    long HourDiff = ( dateTimeTo - dateTimeFrom  )/ (1000 * 60 * 60 );
    
    System.out.println( "日数(FROM) : " + sdf2.format(dateFrom) );
    System.out.println( "日数(TO) : " + sdf2.format(dateTo) );
    System.out.println( "差分日数 : " + dayDiff );
    System.out.println( "差分時間 : " + HourDiff );
    
    }

}
