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
public class Main2 {
    public static void main(String[] args){
    Class2 c2 = new Class2();
    c2.setProfile("なな", 21, "八王子");
    c2.printProfile();
    c2.clearProfile();
    c2.printProfile();
    }
}
