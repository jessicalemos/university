/**
 * Licensee: jessica(Universidade do Minho)
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
import uminho.di.aa.*;

public class ListTutorialData {
	private static final int ROW_COUNT = 100;
	
	public void listTestData() throws PersistentException {
		System.out.println("Listing User...");
		User[] ptuminhodiaaUsers = UserDAO.listUserByQuery(null, null);
		int length = Math.min(ptuminhodiaaUsers.length, ROW_COUNT);
		for (int i = 0; i < length; i++) {
			System.out.println(ptuminhodiaaUsers[i]);
		}
		System.out.println(length + " record(s) retrieved.");
		
		System.out.println("Listing Game...");
		Game[] ptuminhodiaaGames = GameDAO.listGameByQuery(null, null);
		length = Math.min(ptuminhodiaaGames.length, ROW_COUNT);
		for (int i = 0; i < length; i++) {
			System.out.println(ptuminhodiaaGames[i]);
		}
		System.out.println(length + " record(s) retrieved.");
		
		System.out.println("Listing Platform...");
		Platform[] ptuminhodiaaPlatforms = PlatformDAO.listPlatformByQuery(null, null);
		length = Math.min(ptuminhodiaaPlatforms.length, ROW_COUNT);
		for (int i = 0; i < length; i++) {
			System.out.println(ptuminhodiaaPlatforms[i]);
		}
		System.out.println(length + " record(s) retrieved.");
		
	}
	
	public void listByCriteria() throws PersistentException {
		System.out.println("Listing User by Criteria...");
		UserCriteria lptuminhodiaaUserCriteria = new UserCriteria();
		// Please uncomment the follow line and fill in parameter(s) 
		//lptuminhodiaaUserCriteria.ID.eq();
		lptuminhodiaaUserCriteria.setMaxResults(ROW_COUNT);
		User[] ptuminhodiaaUsers = lptuminhodiaaUserCriteria.listUser();
		int length =ptuminhodiaaUsers== null ? 0 : Math.min(ptuminhodiaaUsers.length, ROW_COUNT); 
		for (int i = 0; i < length; i++) {
			 System.out.println(ptuminhodiaaUsers[i]);
		}
		System.out.println(length + " User record(s) retrieved."); 
		
		System.out.println("Listing Game by Criteria...");
		GameCriteria lptuminhodiaaGameCriteria = new GameCriteria();
		// Please uncomment the follow line and fill in parameter(s) 
		//lptuminhodiaaGameCriteria.ID.eq();
		lptuminhodiaaGameCriteria.setMaxResults(ROW_COUNT);
		Game[] ptuminhodiaaGames = lptuminhodiaaGameCriteria.listGame();
		length =ptuminhodiaaGames== null ? 0 : Math.min(ptuminhodiaaGames.length, ROW_COUNT); 
		for (int i = 0; i < length; i++) {
			 System.out.println(ptuminhodiaaGames[i]);
		}
		System.out.println(length + " Game record(s) retrieved."); 
		
		System.out.println("Listing Platform by Criteria...");
		PlatformCriteria lptuminhodiaaPlatformCriteria = new PlatformCriteria();
		// Please uncomment the follow line and fill in parameter(s) 
		//lptuminhodiaaPlatformCriteria.ID.eq();
		lptuminhodiaaPlatformCriteria.setMaxResults(ROW_COUNT);
		Platform[] ptuminhodiaaPlatforms = lptuminhodiaaPlatformCriteria.listPlatform();
		length =ptuminhodiaaPlatforms== null ? 0 : Math.min(ptuminhodiaaPlatforms.length, ROW_COUNT); 
		for (int i = 0; i < length; i++) {
			 System.out.println(ptuminhodiaaPlatforms[i]);
		}
		System.out.println(length + " Platform record(s) retrieved."); 
		
	}
	
	public static void main(String[] args) {
		try {
			ListTutorialData listTutorialData = new ListTutorialData();
			try {
				listTutorialData.listTestData();
				//listTutorialData.listByCriteria();
			}
			finally {
				TutorialPersistentManager.instance().disposePersistentManager();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
