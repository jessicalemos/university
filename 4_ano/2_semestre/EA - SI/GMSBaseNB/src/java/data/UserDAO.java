/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import business.User;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jessica
 */
public class UserDAO {
    
    public static List<User> list() {
        List<User> r = new ArrayList<>();
        r.add(new User(1, "jessica9", "password1"));
        r.add(new User(2, "maria1", "password2"));
        return r;
    }   
}