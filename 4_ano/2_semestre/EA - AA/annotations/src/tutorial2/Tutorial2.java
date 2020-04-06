/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tutorial2;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.FlushMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author utilizador
 */
public class Tutorial2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try{
            //1 - Configuration
            Configuration configuration = new Configuration().configure();
            StandardServiceRegistry sr =new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            //2 - SessionFactory
            SessionFactory sf = configuration.buildSessionFactory(sr);
            //3 - Session
            Session s = sf.openSession();
            s.setFlushMode(FlushMode.COMMIT); 
            //propagate changes on commit
            //4 - start the transaction
            Transaction t = s.beginTransaction();
            
            List<Format> formats = new ArrayList<>();
            Format f = new Format();
            f.setDescription("format1");
            f.setKind(2);
            s.save(f);
            formats.add(f);
            
            Format f2 = new Format();
            f2.setDescription("format2");
            f2.setKind(3);
            s.save(f2);
            formats.add(f2);
            
            Platform p =new Platform();
            p.setName("PS4");
            p.setYear(2017);
            p.setManufacturer("Sony");
            p.setDescription("eighth-generation home video game console ");
            p.setFormats(formats);
            s.save(p);
            
            List<Game> games =new ArrayList<>();
            //Create a new object
            Game g =new Game();
            g.setName("GTA V");
            g.setPrice(60.0);
            g.setPlatform(p);
            g.setDescription("testar");
            g.setYear(2017);
            //g.set...
            //5 - save the object
            s.save(g);
            games.add(g);
            
            Game g2 =new Game();
            g2.setName("Gran Turismo Sport");
            g2.setPrice(70.0);
            g2.setDescription("testando");
            g2.setPlatform(p);
            g2.setYear(2018);
            s.save(g2);
            games.add(g2);
            
            User u =new User();
            u.setUsername("joao@gmail.com");
            u.setUsername("joao");
            u.setPassword("jo2");
            u.setGames(games);
            s.save(u);
            
            try{
                //6 - commit the transaction
                t.commit();
            }catch(Exception e) {
                //6 - rollback in case of exception
                t.rollback();
                e.printStackTrace();
                System.out.println("Unable to commit changes");
            }
            //List user games
            Query query = s.createQuery("SELECT games FROM User where username='joao'");
            List results = query.list();
            System.out.println("Number of entries: " + results.size());
            //Game lg = (Game) results.get(0);
            //System.out.println(lg.getDescription());
            
            //List all games
            Query query1 = s.createQuery("FROM Game where id>0");
            List results1 = query1.list();
            System.out.println("Number of entries: " + results1.size());
            //Game lg = (Game) results.get(0);
            //System.out.println(lg.getDescription());
            
            //Search a game
            Query query2 = s.createQuery("from Game g, Platform p where g.platform = p and p.year = 2017");
            List results2 = query2.list();
            //index 0 - Game; index 1 - Platform
            Object[] os = (Object[]) results2.get(0);
            //cast
            Game lg2 = (Game) os[0];
            System.out.println(lg2.getName());
            
            //Delete a game
            //Query query5 = s.createQuery("Delete User_Game where games_id=1");
            //query5.executeUpdate();
            Serializable id = 1;
            Object persistentInstance = s.load(Game.class, id);
            if (persistentInstance != null) {
                s.delete(persistentInstance);
            }
            /*Game lg3 = (Game) results3.get(0);
            System.out.println(lg3.getName());
            s.delete(lg3);
            query3.executeUpdate();*/

            //7 - Close the session and end process
            s.close();
            StandardServiceRegistryBuilder.destroy(sr);
        }catch(Exception e) {
            e.printStackTrace();
            System.out.println("Unable to connect to hibernate");
        }
    }

    private static Object newConfiguration() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private static Object newStandardServiceRegistryBuilder() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
