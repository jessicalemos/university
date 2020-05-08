/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import javax.ejb.Local;
import org.orm.PersistentException;
import org.orm.PersistentSession;
import main.User;

/**
 *
 * @author pc
 */
@Local
public interface UserBeanLocal {
    
    public User registerUser(User user) throws PersistentException;
    
    User login(PersistentSession session, String email, String password) throws PersistentException;
}
