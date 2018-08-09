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
public class BlackJack {
    public static void main(String[]args){
        Dealer dealer =new Dealer();
        User user = new User();
//        System.out.println(" " + dealer.Cards);
        //dealerのターン
        dealer.setCards(dealer.deal());
        while(dealer.checkSum() == true){
            dealer.setCards(dealer.hit());
        }
        System.out.println("dealerの合計点: " + dealer.open());
        //userのターン
        user.setCards(dealer.deal());
        while(user.checkSum() == true){
            user.setCards(dealer.hit());
        }
        System.out.println("userの合計点: " + user.open());
        //勝負    
        if(user.open() > 21){
            if(dealer.open() > 21){
                System.out.println("引き分け");
            }else{
                System.out.println("ディーラーの勝ち");
            }
        }else{
            if(dealer.open() > 21){
                System.out.println("ユーザーの勝ち");
            }else{
                if(user.open() < dealer.open()){
                    System.out.println("ディーラーの勝ち");
                }else if(dealer.open() < user.open()){
                    System.out.println("ユーザーの勝ち");
                }else{
                    System.out.println("引き分け");
                }
            }
        }
        
        
}
        
}

