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
public class ItemData implements Serializable{
    //カートに入れた商品情報
    private int userID;
    private String name;
    private String discription;
    private String image;
    private String review;
    private String price;
    private String code;

    
    public ItemData(){
        this.userID = 0;
        this.name = "";
        this.discription = "";
        this.image = "";
        this.review = "";
        this.price = "";
        this.code = "";
    }
    //商品名
    public String getName(){
        return name;
    }
    public void setName(String name){
        this.name = name;
    }
    //商品説明
    public String getDiscription(){
        return discription;
    }
    public void setDiscription(String discription){
        this.discription = discription;
    }
    //商品画像
    public String getImage(){
        return image;
    }
    public void setImage(String image){
        this.image = image;
    }
    //商品レビュー
    public String getReview(){
        return review;
    }
    public void setReview(String review){
        this.review = review;
    }
    //商品価格
    public String getPrice(){
        return price;
    }
    public void setPrice(String price){
        this.price = price;
    }
    //商品コード
    public String getCode(){
        return code;
    }
    public void setCode(String code){
        this.code = code;
    }
    
    
    
}
