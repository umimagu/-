/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.camp.servlet;

/**
 *
 * @author satonana
 */
public class CharacterStrings {
    public static void main(String[]args){
    //バイト数と文字数の取得
    String name = "佐藤奈々";
    System.out.println("バイト数：" + name.getBytes().length);
    System.out.println("文字数：" + name.length());
    
    //文字数の取得
    String address = "satonana@gmail.com";
    System.out.println("ドメイン名：" + address.substring(8));
    
    //文字の入れ替え
    String PHP1 = "きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます";
    String PHP2 = PHP1.replace("I", "い");
    System.out.println(PHP2.replace("U", "う"));
    }
}