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

abstract class Human {
    
    abstract int open(); //手札の合計値を計算する
    
    abstract void setCards(ArrayList <Integer> num); //引いたカードを手札に追加する
    
    abstract boolean checkSum(); //引くか否か  
    
    ArrayList <Integer> myCards = new ArrayList <Integer>(); //手札
}
