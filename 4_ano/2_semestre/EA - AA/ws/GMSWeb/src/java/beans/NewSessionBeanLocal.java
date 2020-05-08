/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.List;
import javax.ejb.Local;
import org.orm.PersistentException;
import org.orm.PersistentSession;
import main.Game;
import main.Platform;
import main.User;

/**
 *
 * @author pc
 */
@Local
public interface NewSessionBeanLocal {
    
    String sayHello(String name);

    Game registerGame(Game game) throws PersistentException;

    List<Game> listGames(PersistentSession session, User user) throws PersistentException;

    List<Game> listGames(PersistentSession s) throws PersistentException;
    
    //Search a game;
    List<Game> searchGame(PersistentSession session, String keyword) throws PersistentException;
    
    //Delete a game.
    boolean delete(Game game);
}
