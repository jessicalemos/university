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
            List<Object> games = getAllGames();
            System.out.println(games);
        }catch(Exception e) {
            e.printStackTrace();
            System.out.println("Unable to connect to hibernate");
        }
    }
    
    public static List<Object> getAllGames() {
        Configuration configuration = new Configuration().configure();
 
            // 2. create sessionfactory
            SessionFactory sessionFactory = configuration.buildSessionFactory();
 
            // 3. Get Session object
            Session s = sessionFactory.openSession();
        //1 - Configuration
        //Configuration configuration = new Configuration().configure();
       // StandardServiceRegistry sr =new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
        //2 - SessionFactory
        //SessionFactory sf = configuration.buildSessionFactory(sr);
        //3 - Session
        //Session s = sf.openSession();
        s.setFlushMode(FlushMode.COMMIT); 
        Query query = s.createQuery("FROM Game where id>0");
        List results = query.list();
        System.out.println(results);
        s.close();
       // StandardServiceRegistryBuilder.destroy(sr);
        return results;
    }
    
    public static void registerUser(String email, String username, String password){
        Configuration configuration = new Configuration().configure();
 
            // 2. create sessionfactory
            SessionFactory sessionFactory = configuration.buildSessionFactory();
 
            // 3. Get Session object
            Session s = sessionFactory.openSession();
            Transaction transaction = s.beginTransaction();
            User u = new User();
            u.setEmail(email);
            u.setUsername(username);
            u.setPassword(password);
            s.save(u);
            try{
                transaction.commit();
            }catch(Exception e){
                transaction.rollback();
                e.printStackTrace();
                System.out.println("Unnable to commit");
            }
            s.close();
    }
    
    public static int login(String email, String password){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session s = sessionFactory.openSession();
        s.setFlushMode(FlushMode.COMMIT); 
        Query query = s.createQuery("FROM User where email = :e and password = :p");
        query.setParameter("e", email);
        query.setParameter("p", password);
        List results = query.list();
        System.out.println(results);
        //System.out.println(pass);
        s.close();
        if (results.size()>0){
            return 1;
        }
        else return 0;
    }

    private static Object newConfiguration() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private static Object newStandardServiceRegistryBuilder() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
