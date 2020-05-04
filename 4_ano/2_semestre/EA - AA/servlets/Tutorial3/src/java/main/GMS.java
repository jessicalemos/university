/*
 * GMS
 * ruicouto in 24/abr/2017
 */
package main;

import java.util.ArrayList;
import java.util.List;
import org.orm.PersistentException;
import org.orm.PersistentSession;

/**
 *
 * @author ruicouto
 */
public class GMS {
       
    /**
     * 1. Register a user;
     * @param user
     * @return
     * @throws PersistentException 
     */
    public static User registerUser(User user) throws PersistentException {
        UserDAO.save(user);
        return user;
    }    
    
    /**
     * 2. Register a game;
     * @param game
     * @return
     * @throws PersistentException 
     */
    public static Game registerGame(Game game) throws PersistentException {
        GameDAO.save(game);
        return game;
    }
    
    /**
     * 3. Register a platform; 
     * @param platform
     * @return
     * @throws PersistentException 
     */
    public static Platform registerPlatform(Platform platform) throws PersistentException {
        PlatformDAO.save(platform);
        return platform;
    }
    
    /**
     * 4. List user games;
     * @param user
     * @return
     * @throws PersistentException 
     */
    public static List<Game> listGames(PersistentSession session, User user) throws PersistentException {
        //optional - refresh the user object
        user = UserDAO.getUserByORMID(user.getID());
        List<Game> l = new ArrayList<>();
        for(Game g : user.game.toArray()) {
            l.add(g);
        }
        return l;
    }
    
    /**
     * 5. List all games; 
     * @return
     * @throws PersistentException 
     */
    public static List<Game> listGames(PersistentSession session) throws PersistentException {
        return GameDAO.queryGame(session, "ID > -1", "ID");
    }
    
    /**
     * 6. Search a game; 
     * @param keyword
     * @return
     * @throws PersistentException 
     */
    public static List<Game> searchGame(PersistentSession session, String keyword) throws PersistentException {
        return GameDAO.queryGame(session, "name LIKE '%"+keyword+"%'", "name");
    }
    
    /**
     * 7. Delete a game.
     * @param game
     * @return 
     */
    public static boolean delete(Game game) {
        try {
            GameDAO.delete(game);            
        } catch (Exception e) {
            return false;
        }
        return true;       
    }
    
    
    public static User login(PersistentSession session, String email, String password) throws PersistentException {
        return UserDAO.loadUserByQuery(session, "email='"+email+"' AND password='"+Util.hash(password)+"'", "ID");
    }
        
        
}
