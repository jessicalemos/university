/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.ejb.Stateless;
import org.orm.PersistentException;
import org.orm.PersistentSession;
import main.Game;
import main.GameDAO;
import main.Platform;
import main.PlatformDAO;
import main.User;
import main.UserDAO;

/**
 *
 * @author pc
 */
@Stateless
public class NewSessionBean implements NewSessionBeanLocal {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @Override
    public String sayHello(String name) {
        return "Hello " + name;
    }
    
    @Override
    public List<Game> listGames(PersistentSession session, User user) throws PersistentException {
        //optional - refresh the user object
        user = UserDAO.getUserByORMID(user.getID());
        List<Game> l = new ArrayList<>();
        for(Game g : user.game.toArray()) {
            l.add(g);
        }
        return l;
    }
        
    @Override
    public List<Game> listGames(PersistentSession s) throws PersistentException{
        return GameDAO.queryGame(s, "ID > -1", "ID");
    }
     
    //Register a game;
    @Override
    public Game registerGame(Game game) throws PersistentException {
        GameDAO.save(game);
        return game;
    }
    
    //Search a game;
    @Override
    public List<Game> searchGame(PersistentSession session, String keyword) throws PersistentException {
        return GameDAO.queryGame(session, "name LIKE '%"+keyword+"%'", "name");
    }
    
    //Delete a game.
    @Override
    public boolean delete(Game game) {
        try {
            GameDAO.delete(game);            
        } catch (Exception e) {
            return false;
        }
        return true;       
    }
}
