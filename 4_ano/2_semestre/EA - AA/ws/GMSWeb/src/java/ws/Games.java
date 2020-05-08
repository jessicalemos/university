/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ws;

import beans.NewSessionBeanLocal;
import java.util.List;
import javax.ejb.EJB;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;
import main.Game;
import main.User;
import org.orm.PersistentException;
import org.orm.PersistentSession;

/**
 *
 * @author jessica
 */
@WebService(serviceName = "Games")
public class Games {

    @EJB
    private NewSessionBeanLocal ejbRef;// Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Web Service Operation")

    @WebMethod(operationName = "sayHello")
    public String sayHello(@WebParam(name = "name") String name) {
        return ejbRef.sayHello(name);
    }

    @WebMethod(operationName = "registerGame")
    public Game registerGame(@WebParam(name = "game") Game game) throws PersistentException {
        return ejbRef.registerGame(game);
    }

    @WebMethod(operationName = "listGames")
    public List<Game> listGames(@WebParam(name = "session") PersistentSession session, @WebParam(name = "user") User user) throws PersistentException {
        return ejbRef.listGames(session, user);
    }

    @WebMethod(operationName = "listGames_1")
    @RequestWrapper(className = "listGames_1")
    @ResponseWrapper(className = "listGames_1Response")
    public List<Game> listGames(@WebParam(name = "s") PersistentSession s) throws PersistentException {
        return ejbRef.listGames(s);
    }

    @WebMethod(operationName = "searchGame")
    public List<Game> searchGame(@WebParam(name = "session") PersistentSession session, @WebParam(name = "keyword") String keyword) throws PersistentException {
        return ejbRef.searchGame(session, keyword);
    }

    @WebMethod(operationName = "delete")
    public boolean delete(@WebParam(name = "game") Game game) {
        return ejbRef.delete(game);
    }
    
}
