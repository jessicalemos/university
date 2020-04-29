/*
 * GameDAO
 * ruicouto in 10/abr/2017
 */
package data;

import business.Game;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author ruicouto
 */
public class GameDAO {
    /**
     * Data is currently mocked
     * @return 
     */
    public static List<Game> list() {
        List<Game> r = new ArrayList<>();
        r.add(new Game(1, "Tetris", 1989, 10, ""));
        r.add(new Game(2, "GTA V", 2013, 60, ""));
        r.add(new Game(3, "Assetto Corsa", 2014, 30, ""));
        r.add(new Game(4, "Fallout 4", 2014, 30, ""));
        r.add(new Game(5, "Breath of The Wild", 2017, 60, ""));
        r.add(new Game(6, "FIFA", 1989, 10, ""));
        r.add(new Game(7, "PES", 1989, 10, ""));
        r.add(new Game(8, "CS", 1989, 10, ""));
        return r;
    }
    
    
    public static List<Integer> getYears() {
        List<Integer> l = new ArrayList<>();
        l.add(1989);
        l.add(2013);
        l.add(2014);
        l.add(2017);
        return l;
    }
    
}
