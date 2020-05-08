/*
 * Util
 * ruicouto in 24/abr/2017
 */
package main;

import java.security.MessageDigest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.orm.PersistentSession;

/**
 *
 * @author ruicouto
 */
public class Util {
    public static String hash(String original) {
        String res = original;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(original.getBytes("UTF-8")); // Change this to "UTF-16" if needed
            byte[] digest = md.digest();
            res = String.format("%064x", new java.math.BigInteger(1, digest));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    
    public static PersistentSession getSession(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        PersistentSession session = null;
        try {
            Object hsession = httpSession.getAttribute("hsession");
            if(hsession!=null) {
                System.out.println("Reusing persistent session");
                session = (PersistentSession) hsession;
            } else {
                System.out.println("Creating new persistent session");
                session = Tutorial1PersistentManager.instance().getSession();
                request.getSession().setAttribute("hsession", session);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return session;
    }
}
