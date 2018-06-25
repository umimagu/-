/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    package org.camp.servlet;

import java.io.Serializable;
import java.util.Date;
    
/**
 *
 * @author satonana
 */
    public class ResultData implements Serializable{
    
        private Date d;
        private String luck; //隠匿、カプセル化
        
        
        public ResultData(){} //引数なしのコンストラクタ
        
        
        public Date getD(){ //Dateのgetter
            return d;     
        }
        public void setD(Date d){ //Dateのsetter
                this.d = d;
        }
    
        
        public String getLuck(){//luckのgetter
            return luck;
        }
        public void setLuck(String luck){//luckのsetter
           this.luck=luck;
        }
    }

// javabeans