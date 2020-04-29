/*
 * GMSFacade
 * ruicouto in 10/abr/2017
 */
package business;

import data.GameDAO;
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
    
    /*public static List<Game> listGames(int year) {
        List<Game> games = GameDAO.list().stream()
                                        .filter(g -> g.getYear() == year)
                                        .collect(Collectors.toList());
        return games;
    }*/
    
    
    public static List<Integer> getYears() {
        List<Integer> games = GameDAO.getYears();
        return games;
    }
}
