/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.camp.servlet;
import java.util.ArrayList;

/**
 *
 * @author satonana
 */

class User extends Human{

//引いたカードを手札に追加する
    void setCards (ArrayList <Integer> num){
        for(int i = 0; i < num.size(); i++){
        this.myCards.add(num.get(i));
        }
    }

//引くか否かを判断する
    boolean checkSum (){
        if(open() < 17){
            return true;
        }else{
            return false;
        }
    }
    
//手札の合計値を計算する
    int open (){
        int sum = 0;
        for(int i=0; i < this.myCards.size(); i++ ) {
            sum += this.myCards.get(i);
        }
        return sum;
    } 
}