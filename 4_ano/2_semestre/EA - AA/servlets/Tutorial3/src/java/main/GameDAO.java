/**
 * "Visual Paradigm: DO NOT MODIFY THIS FILE!"
 * 
 * This is an automatic generated file. It will be regenerated every time 
 * you generate persistence class.
 * 
 * Modifying its content may cause the program not work, or your work may lost.
 */

/**
 * Licensee: Universidade do Minho
 * License Type: Academic
 */
package main;

import org.orm.*;
import org.hibernate.Query;
import org.hibernate.LockMode;
import java.util.List;

public class GameDAO {
	public static Game loadGameByORMID(int ID) throws PersistentException {
		try {
			PersistentSession session = main.Tutorial1PersistentManager.instance().getSession();
			return loadGameByORMID(session, ID);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game getGameByORMID(int ID) throws PersistentException {
		try {
			PersistentSession session = main.Tutorial1PersistentManager.instance().getSession();
			return getGameByORMID(session, ID);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game loadGameByORMID(int ID, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = main.Tutorial1PersistentManager.instance().getSession();
			return loadGameByORMID(session, ID, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game getGameByORMID(int ID, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = main.Tutorial1PersistentManager.instance().getSession();
			return getGameByORMID(session, ID, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game loadGameByORMID(PersistentSession session, int ID) throws PersistentException {
		try {
			return (Game) session.load(main.Game.class, new Integer(ID));
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game getGameByORMID(PersistentSession session, int ID) throws PersistentException {
		try {
			return (Game) session.get(main.Game.class, new Integer(ID));
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game loadGameByORMID(PersistentSession session, int ID, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			return (Game) session.load(main.Game.class, new Integer(ID), lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game getGameByORMID(PersistentSession session, int ID, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			return (Game) session.get(main.Game.class, new Integer(ID), lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static List queryGame(String condition, String orderBy) throws PersistentException {
		try {
			PersistentSession session = main.Tutorial1PersistentManager.instance().getSession();
			return queryGame(session, condition, orderBy);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static List queryGame(String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = main.Tutorial1PersistentManager.instance().getSession();
			return queryGame(session, condition, orderBy, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game[] listGameByQuery(String condition, String orderBy) throws PersistentException {
		try {
			PersistentSession session = main.Tutorial1PersistentManager.instance().getSession();
			return listGameByQuery(session, condition, orderBy);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game[] listGameByQuery(String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = main.Tutorial1PersistentManager.instance().getSession();
			return listGameByQuery(session, condition, orderBy, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static List queryGame(PersistentSession session, String condition, String orderBy) throws PersistentException {
		StringBuffer sb = new StringBuffer("From main.Game as Game");
		if (condition != null)
			sb.append(" Where ").append(condition);
		if (orderBy != null)
			sb.append(" Order By ").append(orderBy);
		try {
			Query query = session.createQuery(sb.toString());
			return query.list();
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static List queryGame(PersistentSession session, String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		StringBuffer sb = new StringBuffer("From main.Game as Game");
		if (condition != null)
			sb.append(" Where ").append(condition);
		if (orderBy != null)
			sb.append(" Order By ").append(orderBy);
		try {
			Query query = session.createQuery(sb.toString());
			query.setLockMode("Game", lockMode);
			return query.list();
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game[] listGameByQuery(PersistentSession session, String condition, String orderBy) throws PersistentException {
		try {
			List list = queryGame(session, condition, orderBy);
			return (Game[]) list.toArray(new Game[list.size()]);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game[] listGameByQuery(PersistentSession session, String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			List list = queryGame(session, condition, orderBy, lockMode);
			return (Game[]) list.toArray(new Game[list.size()]);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game loadGameByQuery(String condition, String orderBy) throws PersistentException {
		try {
			PersistentSession session = main.Tutorial1PersistentManager.instance().getSession();
			return loadGameByQuery(session, condition, orderBy);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game loadGameByQuery(String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = main.Tutorial1PersistentManager.instance().getSession();
			return loadGameByQuery(session, condition, orderBy, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game loadGameByQuery(PersistentSession session, String condition, String orderBy) throws PersistentException {
		Game[] games = listGameByQuery(session, condition, orderBy);
		if (games != null && games.length > 0)
			return games[0];
		else
			return null;
	}
	
	public static Game loadGameByQuery(PersistentSession session, String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		Game[] games = listGameByQuery(session, condition, orderBy, lockMode);
		if (games != null && games.length > 0)
			return games[0];
		else
			return null;
	}
	
	public static java.util.Iterator iterateGameByQuery(String condition, String orderBy) throws PersistentException {
		try {
			PersistentSession session = main.Tutorial1PersistentManager.instance().getSession();
			return iterateGameByQuery(session, condition, orderBy);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static java.util.Iterator iterateGameByQuery(String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = main.Tutorial1PersistentManager.instance().getSession();
			return iterateGameByQuery(session, condition, orderBy, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static java.util.Iterator iterateGameByQuery(PersistentSession session, String condition, String orderBy) throws PersistentException {
		StringBuffer sb = new StringBuffer("From main.Game as Game");
		if (condition != null)
			sb.append(" Where ").append(condition);
		if (orderBy != null)
			sb.append(" Order By ").append(orderBy);
		try {
			Query query = session.createQuery(sb.toString());
			return query.iterate();
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static java.util.Iterator iterateGameByQuery(PersistentSession session, String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		StringBuffer sb = new StringBuffer("From main.Game as Game");
		if (condition != null)
			sb.append(" Where ").append(condition);
		if (orderBy != null)
			sb.append(" Order By ").append(orderBy);
		try {
			Query query = session.createQuery(sb.toString());
			query.setLockMode("Game", lockMode);
			return query.iterate();
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game createGame() {
		return new main.Game();
	}
	
	public static boolean save(main.Game game) throws PersistentException {
		try {
			main.Tutorial1PersistentManager.instance().saveObject(game);
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static boolean delete(main.Game game) throws PersistentException {
		try {
			main.Tutorial1PersistentManager.instance().deleteObject(game);
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static boolean refresh(main.Game game) throws PersistentException {
		try {
			main.Tutorial1PersistentManager.instance().getSession().refresh(game);
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static boolean evict(main.Game game) throws PersistentException {
		try {
			main.Tutorial1PersistentManager.instance().getSession().evict(game);
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Game loadGameByCriteria(GameCriteria gameCriteria) {
		Game[] games = listGameByCriteria(gameCriteria);
		if(games == null || games.length == 0) {
			return null;
		}
		return games[0];
	}
	
	public static Game[] listGameByCriteria(GameCriteria gameCriteria) {
		return gameCriteria.listGame();
	}
}
