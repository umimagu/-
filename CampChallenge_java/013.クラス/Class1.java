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
public class Class1 {

    public String name;
    public int age;
    public String add;
    
    public void setProfile(String nm,int ag,String ad){
        this.name = nm;
        this.age = ag;
        this.add = ad;
    }
    
    public void printProfile(){
        System.out.println("名前： "+name);
        System.out.println(age);
        System.out.println(add);
    }
}
