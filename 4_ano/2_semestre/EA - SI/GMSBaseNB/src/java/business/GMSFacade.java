/*
 * GMSFacade
 * ruicouto in 10/abr/2017
 */
package business;

import data.GameDAO;
import data.UserDAO;
import java.util.List;
import java.util.stream.Collectors;


/**
 *
 * @author ruicouto
 */
public class GMSFacade {
    public static List<Game> listGames(int page) {
        List<Game> games = GameDAO.list();
        int items = 5;
        int indexi = items*page-items;
        int indexs = items*page-1;
        if (indexs > games.size())
            indexs = games.size();
          
        return games.subList(indexi, indexs);
    }
    
    public static List<Game> myGames() {
        List<Game> games = GameDAO.mylist();
        return games;
    }
    
    public static List<Integer> getYears() {
        List<Integer> games = GameDAO.getYears();
        return games;
    }
    
    public static Game getGameInfo(String name) {
        for(Game g : GameDAO.list()){
            if (g.getName().equals(name)){
                return g;
            }
        }
        return null;
    }
    
    public static Boolean checkUser(String username, String password){
        for(User u : UserDAO.list()){
            if (u.getUsername().equals(username) && u.getPassword().equals(password)){
                return true;
            }
        }
        return false;
    }
}
