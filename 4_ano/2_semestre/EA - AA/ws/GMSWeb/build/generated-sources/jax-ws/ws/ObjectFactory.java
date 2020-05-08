
package ws;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the ws package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _RegisterGameResponse_QNAME = new QName("http://ws/", "registerGameResponse");
    private final static QName _SayHello_QNAME = new QName("http://ws/", "sayHello");
    private final static QName _PersistentException_QNAME = new QName("http://ws/", "PersistentException");
    private final static QName _ListGames1_QNAME = new QName("http://ws/", "listGames_1");
    private final static QName _SayHelloResponse_QNAME = new QName("http://ws/", "sayHelloResponse");
    private final static QName _ListGames_QNAME = new QName("http://ws/", "listGames");
    private final static QName _Delete_QNAME = new QName("http://ws/", "delete");
    private final static QName _SearchGameResponse_QNAME = new QName("http://ws/", "searchGameResponse");
    private final static QName _DeleteResponse_QNAME = new QName("http://ws/", "deleteResponse");
    private final static QName _ListGamesResponse_QNAME = new QName("http://ws/", "listGamesResponse");
    private final static QName _RegisterGame_QNAME = new QName("http://ws/", "registerGame");
    private final static QName _SearchGame_QNAME = new QName("http://ws/", "searchGame");
    private final static QName _ListGames1Response_QNAME = new QName("http://ws/", "listGames_1Response");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: ws
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link RegisterGameResponse }
     * 
     */
    public RegisterGameResponse createRegisterGameResponse() {
        return new RegisterGameResponse();
    }

    /**
     * Create an instance of {@link SayHello }
     * 
     */
    public SayHello createSayHello() {
        return new SayHello();
    }

    /**
     * Create an instance of {@link PersistentException }
     * 
     */
    public PersistentException createPersistentException() {
        return new PersistentException();
    }

    /**
     * Create an instance of {@link ListGames1 }
     * 
     */
    public ListGames1 createListGames1() {
        return new ListGames1();
    }

    /**
     * Create an instance of {@link SayHelloResponse }
     * 
     */
    public SayHelloResponse createSayHelloResponse() {
        return new SayHelloResponse();
    }

    /**
     * Create an instance of {@link ListGames }
     * 
     */
    public ListGames createListGames() {
        return new ListGames();
    }

    /**
     * Create an instance of {@link Delete }
     * 
     */
    public Delete createDelete() {
        return new Delete();
    }

    /**
     * Create an instance of {@link SearchGameResponse }
     * 
     */
    public SearchGameResponse createSearchGameResponse() {
        return new SearchGameResponse();
    }

    /**
     * Create an instance of {@link DeleteResponse }
     * 
     */
    public DeleteResponse createDeleteResponse() {
        return new DeleteResponse();
    }

    /**
     * Create an instance of {@link ListGamesResponse }
     * 
     */
    public ListGamesResponse createListGamesResponse() {
        return new ListGamesResponse();
    }

    /**
     * Create an instance of {@link RegisterGame }
     * 
     */
    public RegisterGame createRegisterGame() {
        return new RegisterGame();
    }

    /**
     * Create an instance of {@link SearchGame }
     * 
     */
    public SearchGame createSearchGame() {
        return new SearchGame();
    }

    /**
     * Create an instance of {@link ListGames1Response }
     * 
     */
    public ListGames1Response createListGames1Response() {
        return new ListGames1Response();
    }

    /**
     * Create an instance of {@link Game }
     * 
     */
    public Game createGame() {
        return new Game();
    }

    /**
     * Create an instance of {@link GameSetCollection }
     * 
     */
    public GameSetCollection createGameSetCollection() {
        return new GameSetCollection();
    }

    /**
     * Create an instance of {@link PersistentSession }
     * 
     */
    public PersistentSession createPersistentSession() {
        return new PersistentSession();
    }

    /**
     * Create an instance of {@link Platform }
     * 
     */
    public Platform createPlatform() {
        return new Platform();
    }

    /**
     * Create an instance of {@link User }
     * 
     */
    public User createUser() {
        return new User();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RegisterGameResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "registerGameResponse")
    public JAXBElement<RegisterGameResponse> createRegisterGameResponse(RegisterGameResponse value) {
        return new JAXBElement<RegisterGameResponse>(_RegisterGameResponse_QNAME, RegisterGameResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SayHello }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "sayHello")
    public JAXBElement<SayHello> createSayHello(SayHello value) {
        return new JAXBElement<SayHello>(_SayHello_QNAME, SayHello.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link PersistentException }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "PersistentException")
    public JAXBElement<PersistentException> createPersistentException(PersistentException value) {
        return new JAXBElement<PersistentException>(_PersistentException_QNAME, PersistentException.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListGames1 }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "listGames_1")
    public JAXBElement<ListGames1> createListGames1(ListGames1 value) {
        return new JAXBElement<ListGames1>(_ListGames1_QNAME, ListGames1 .class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SayHelloResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "sayHelloResponse")
    public JAXBElement<SayHelloResponse> createSayHelloResponse(SayHelloResponse value) {
        return new JAXBElement<SayHelloResponse>(_SayHelloResponse_QNAME, SayHelloResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListGames }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "listGames")
    public JAXBElement<ListGames> createListGames(ListGames value) {
        return new JAXBElement<ListGames>(_ListGames_QNAME, ListGames.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Delete }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "delete")
    public JAXBElement<Delete> createDelete(Delete value) {
        return new JAXBElement<Delete>(_Delete_QNAME, Delete.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SearchGameResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "searchGameResponse")
    public JAXBElement<SearchGameResponse> createSearchGameResponse(SearchGameResponse value) {
        return new JAXBElement<SearchGameResponse>(_SearchGameResponse_QNAME, SearchGameResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DeleteResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "deleteResponse")
    public JAXBElement<DeleteResponse> createDeleteResponse(DeleteResponse value) {
        return new JAXBElement<DeleteResponse>(_DeleteResponse_QNAME, DeleteResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListGamesResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "listGamesResponse")
    public JAXBElement<ListGamesResponse> createListGamesResponse(ListGamesResponse value) {
        return new JAXBElement<ListGamesResponse>(_ListGamesResponse_QNAME, ListGamesResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RegisterGame }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "registerGame")
    public JAXBElement<RegisterGame> createRegisterGame(RegisterGame value) {
        return new JAXBElement<RegisterGame>(_RegisterGame_QNAME, RegisterGame.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SearchGame }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "searchGame")
    public JAXBElement<SearchGame> createSearchGame(SearchGame value) {
        return new JAXBElement<SearchGame>(_SearchGame_QNAME, SearchGame.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListGames1Response }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "listGames_1Response")
    public JAXBElement<ListGames1Response> createListGames1Response(ListGames1Response value) {
        return new JAXBElement<ListGames1Response>(_ListGames1Response_QNAME, ListGames1Response.class, null, value);
    }

}
