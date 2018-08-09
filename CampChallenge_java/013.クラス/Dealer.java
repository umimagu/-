/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.camp.servlet;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author satonana
 */
class Dealer extends Human {
    
    public ArrayList <Integer> Cards = new ArrayList <Integer>();//山札
    
//コンストラクタ　山札に13*4＝52枚のカードを追加
    public Dealer (){ 
        for(int i = 0; i < 4; i++){
            ArrayList<Integer> cards1 = new ArrayList<>();
            for(int j = 1; j <= 13; j++){
                cards1.add(j);
            }
            Cards.addAll(cards1);//addAllは中身の要素を全て追加する
        }
//            ArrayList<Integer> cards2 = new ArrayList<>();
//            for(int j = 1; j <= 13; j++){
//                cards2.add(j);
//            }
//            Cards.addAll(cards2);
//            
//            ArrayList<Integer> cards3 = new ArrayList<>();
//            for(int j = 1; j <= 13; j++){
//                cards3.add(j);
//            }
//            Cards.addAll(cards3);
//            
//            ArrayList<Integer> cards4 = new ArrayList<>();
//            for(int j = 1; j <= 13; j++){
//                cards4.add(j);
//            }
//            Cards.addAll(cards4);
        }    
  
//２枚配布
    public ArrayList<Integer> deal (){
        ArrayList<Integer> dealCards = new ArrayList<>();
        //手札に追加する前に仮として入れる箱（dealCards）
        for(int i = 0; i < 2; i++){
            Random rand = new Random();
            Integer index = rand.nextInt(this.Cards.size());//山札の要素数を上限とした乱数生成
            dealCards.add(this.Cards.get(index));//仮箱に山札からランダムに取ったカードを入れる
            Cards.remove(index);

//            int max = Collections.max(this.Cards);//Cardsの最大値(10)
//            int r = new java.util.Random().nextInt(max);//乱数生成,最大値10
//            Collections.addAll(myCards, r); 
//            //Cards(山札)から２枚取り、myCards(ディーラーの手札)へ追加
            }
    return dealCards;
    }
    
//１枚配布
    public ArrayList<Integer> hit (){
        ArrayList<Integer> dealCards = new ArrayList<>();
        Random rand = new Random();
        Integer index = rand.nextInt(this.Cards.size());
        dealCards.add(this.Cards.get(index));
        Cards.remove(index);
    return dealCards;
    }
    
//以下Userと共通
//引いたカードを手札に加える
    void setCards (ArrayList <Integer> num){
        for(int i = 0; i < num.size(); i++){
        this.myCards.add(num.get(i));
        }
    }

//引くか否かを判断する
    boolean checkSum (){
        if(open() < 17){//openメソッドを呼び出すことで戻り値を入れる
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
