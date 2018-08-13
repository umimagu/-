/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.camp.servlet;
import java.lang.Math;
import java.util.Date;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.io.*;
/**
 *
 * @author satonana
 */

//標準クラス（ファイル操作編）
//標準クラスを利用して処理を作成

public class StandardClass {
    public static void main(String[]args){
       
        Date now1 = new Date ();
        SimpleDateFormat sdf 
            = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString1 = sdf.format(now1);
        
        try{
            File fp1 = new File("start.txt");
            FileWriter fw1 = new FileWriter(fp1);
            fw1.write("開始時間："+ dateString1);
            fw1.close();
        
            FileReader fr1 = new FileReader(fp1);
            BufferedReader br = new BufferedReader(fr1);
            System.out.println(br.readLine());
            fr1.close();
            
        }catch(IOException e){
            e.printStackTrace();   
        }
        
        System.out.println(-5 + "の絶対値は" + Math.abs(-5) + "です");
        System.out.println("2 と 7 では" + Math.min(2, 7) + "の方が小さい。");
        System.out.println("10 と 4 では" + Math.max(10, 4) + "の方が大きい。");
        System.out.println("9 の 4 乗は" + Math.pow(9, 4) + "です。");
        System.out.println(Math.round(1.34) + "は1です。");
        
        try{
            Thread.sleep(5000);
            }catch (InterruptedException e){
            e.printStackTrace();
        }
        
        Date now2 = new Date ();
        String dateString2 = sdf.format(now2);
        
        try{
            File fp2 = new File("finish.txt");
            FileWriter fw2 = new FileWriter(fp2);
            fw2.write("終了時間："+ dateString2);
            fw2.close();
            
            FileReader fr2 = new FileReader(fp2);
            BufferedReader br = new BufferedReader(fr2);
            System.out.println(br.readLine());
            fr2.close();
        
        }catch(IOException ee){
            ee.printStackTrace();
    }
}
}
    