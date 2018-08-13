/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.camp.servlet;
import java.io.*;
/**
 *
 * @author satonana
 */
//標準クラス（ファイル操作編）
//ファイルの書き出しと保存、ファイルから読み出しと表示

public class WriteAndRead {
    public static void main(String[]args){
    try{
        File fp = new File("text.txt");
        FileWriter fw = new FileWriter(fp);
        fw.write("私の名前は佐藤奈々です。"
                + "大学生です。"
                + "よろしくお願いします。");
        fw.close();
        
        FileReader fr = new FileReader(fp);
        BufferedReader br = new BufferedReader(fr);
        System.out.print(br.readLine());
        fr.close();
        
    }catch(IOException e){
        e.printStackTrace();
    }
    }
}
