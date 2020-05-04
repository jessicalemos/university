/**
 * Licensee: Universidade do Minho
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
public class ListTutorial1Data {
	private static final int ROW_COUNT = 100;
	
	public void listTestData() throws PersistentException {
		System.out.println("Listing User...");
		main.User[] mainUsers = main.UserDAO.listUserByQuery(null, null);
		int length = Math.min(mainUsers.length, ROW_COUNT);
		for (int i = 0; i < length; i++) {
			System.out.println(mainUsers[i]);
		}
		System.out.println(length + " record(s) retrieved.");
		
		System.out.println("Listing Game...");
		main.Game[] mainGames = main.GameDAO.listGameByQuery(null, null);
		length = Math.min(mainGames.length, ROW_COUNT);
		for (int i = 0; i < length; i++) {
			System.out.println(mainGames[i]);
		}
		System.out.println(length + " record(s) retrieved.");
		
		System.out.println("Listing Platform...");
		main.Platform[] mainPlatforms = main.PlatformDAO.listPlatformByQuery(null, null);
		length = Math.min(mainPlatforms.length, ROW_COUNT);
		for (int i = 0; i < length; i++) {
			System.out.println(mainPlatforms[i]);
		}
		System.out.println(length + " record(s) retrieved.");
		
	}
	
	public void listByCriteria() throws PersistentException {
		System.out.println("Listing User by Criteria...");
		main.UserCriteria lmainUserCriteria = new main.UserCriteria();
		// Please uncomment the follow line and fill in parameter(s) 
		//lmainUserCriteria.ID.eq();
		lmainUserCriteria.setMaxResults(ROW_COUNT);
		main.User[] mainUsers = lmainUserCriteria.listUser();
		int length =mainUsers== null ? 0 : Math.min(mainUsers.length, ROW_COUNT); 
		for (int i = 0; i < length; i++) {
			 System.out.println(mainUsers[i]);
		}
		System.out.println(length + " User record(s) retrieved."); 
		
		System.out.println("Listing Game by Criteria...");
		main.GameCriteria lmainGameCriteria = new main.GameCriteria();
		// Please uncomment the follow line and fill in parameter(s) 
		//lmainGameCriteria.ID.eq();
		lmainGameCriteria.setMaxResults(ROW_COUNT);
		main.Game[] mainGames = lmainGameCriteria.listGame();
		length =mainGames== null ? 0 : Math.min(mainGames.length, ROW_COUNT); 
		for (int i = 0; i < length; i++) {
			 System.out.println(mainGames[i]);
		}
		System.out.println(length + " Game record(s) retrieved."); 
		
		System.out.println("Listing Platform by Criteria...");
		main.PlatformCriteria lmainPlatformCriteria = new main.PlatformCriteria();
		// Please uncomment the follow line and fill in parameter(s) 
		//lmainPlatformCriteria.ID.eq();
		lmainPlatformCriteria.setMaxResults(ROW_COUNT);
		main.Platform[] mainPlatforms = lmainPlatformCriteria.listPlatform();
		length =mainPlatforms== null ? 0 : Math.min(mainPlatforms.length, ROW_COUNT); 
		for (int i = 0; i < length; i++) {
			 System.out.println(mainPlatforms[i]);
		}
		System.out.println(length + " Platform record(s) retrieved."); 
		
	}
	
	public static void main(String[] args) {
		try {
			ListTutorial1Data listTutorial1Data = new ListTutorial1Data();
			try {
				listTutorial1Data.listTestData();
				//listTutorial1Data.listByCriteria();
			}
			finally {
				main.Tutorial1PersistentManager.instance().disposePersistentManager();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
