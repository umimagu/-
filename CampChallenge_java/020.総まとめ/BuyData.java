/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;
import java.io.Serializable;

/**
 *
 * @author satonana
 */
public class BuyData implements Serializable{
    //購入履歴情報
    private String itemCode;
    private int type;
    private String buyDate;

    
    public BuyData(){
        this.itemCode = "";
        this.type = 0;
        this.buyDate = "";
    }
    
    public String getItemCode(){
        return itemCode;
    }
    public void setItemCode(String itemCode){
        this.itemCode = itemCode;
    }

    public int getType(){
        return type;
    }
    public void setType(int type){
        this.type = type;
    }

    public String getBuyDate(){
        return buyDate;
    }
    public void setBuyDate(String buyDate){
        this.buyDate = buyDate;
    }
    
}
