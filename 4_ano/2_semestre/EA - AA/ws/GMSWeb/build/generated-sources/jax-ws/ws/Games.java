
package ws;

import java.util.List;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.6-1b01 
 * Generated source version: 2.2
 * 
 */
@WebService(name = "Games", targetNamespace = "http://ws/")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface Games {


    /**
     * 
     * @param name
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "sayHello", targetNamespace = "http://ws/", className = "ws.SayHello")
    @ResponseWrapper(localName = "sayHelloResponse", targetNamespace = "http://ws/", className = "ws.SayHelloResponse")
    public String sayHello(
        @WebParam(name = "name", targetNamespace = "")
        String name);

    /**
     * 
     * @param s
     * @return
     *     returns java.util.List<ws.Game>
     * @throws PersistentException_Exception
     */
    @WebMethod(operationName = "listGames_1")
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "listGames_1", targetNamespace = "http://ws/", className = "ws.ListGames1")
    @ResponseWrapper(localName = "listGames_1Response", targetNamespace = "http://ws/", className = "ws.ListGames1Response")
    public List<Game> listGames1(
        @WebParam(name = "s", targetNamespace = "")
        PersistentSession s)
        throws PersistentException_Exception
    ;

    /**
     * 
     * @param game
     * @return
     *     returns ws.Game
     * @throws PersistentException_Exception
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "registerGame", targetNamespace = "http://ws/", className = "ws.RegisterGame")
    @ResponseWrapper(localName = "registerGameResponse", targetNamespace = "http://ws/", className = "ws.RegisterGameResponse")
    public Game registerGame(
        @WebParam(name = "game", targetNamespace = "")
        Game game)
        throws PersistentException_Exception
    ;

    /**
     * 
     * @param session
     * @param keyword
     * @return
     *     returns java.util.List<ws.Game>
     * @throws PersistentException_Exception
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "searchGame", targetNamespace = "http://ws/", className = "ws.SearchGame")
    @ResponseWrapper(localName = "searchGameResponse", targetNamespace = "http://ws/", className = "ws.SearchGameResponse")
    public List<Game> searchGame(
        @WebParam(name = "session", targetNamespace = "")
        PersistentSession session,
        @WebParam(name = "keyword", targetNamespace = "")
        String keyword)
        throws PersistentException_Exception
    ;

    /**
     * 
     * @param session
     * @param user
     * @return
     *     returns java.util.List<ws.Game>
     * @throws PersistentException_Exception
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "listGames", targetNamespace = "http://ws/", className = "ws.ListGames")
    @ResponseWrapper(localName = "listGamesResponse", targetNamespace = "http://ws/", className = "ws.ListGamesResponse")
    public List<Game> listGames(
        @WebParam(name = "session", targetNamespace = "")
        PersistentSession session,
        @WebParam(name = "user", targetNamespace = "")
        User user)
        throws PersistentException_Exception
    ;

    /**
     * 
     * @param game
     * @return
     *     returns boolean
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "delete", targetNamespace = "http://ws/", className = "ws.Delete")
    @ResponseWrapper(localName = "deleteResponse", targetNamespace = "http://ws/", className = "ws.DeleteResponse")
    public boolean delete(
        @WebParam(name = "game", targetNamespace = "")
        Game game);

}
