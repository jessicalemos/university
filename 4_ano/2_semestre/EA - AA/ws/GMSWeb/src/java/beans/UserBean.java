/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import javax.ejb.Stateless;
import org.orm.PersistentException;
import org.orm.PersistentSession;
import main.User;
import main.UserDAO;

/**
 *
 * @author pc
 */
@Stateless
public class UserBean implements UserBeanLocal {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    
    @Override
    public User login(PersistentSession session, String email, String password) throws PersistentException {
        return UserDAO.loadUserByQuery(session, "email='"+email+"' AND password='"+password+"'", "ID");
    }
    
    @Override
    public User registerUser(User user) throws PersistentException {
        UserDAO.save(user);
        return user;
    }
}
