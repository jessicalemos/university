/**
 * Licensee: Universidade do Minho
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
public class RetrieveAndUpdateTutorial1Data {
	public void retrieveAndUpdateTestData() throws PersistentException {
		PersistentTransaction t = main.Tutorial1PersistentManager.instance().getSession().beginTransaction();
		try {
			main.User lmainUser = main.UserDAO.loadUserByQuery(null, null);
			// Update the properties of the persistent object
			main.UserDAO.save(lmainUser);
			main.Game lmainGame = main.GameDAO.loadGameByQuery(null, null);
			// Update the properties of the persistent object
			main.GameDAO.save(lmainGame);
			main.Platform lmainPlatform = main.PlatformDAO.loadPlatformByQuery(null, null);
			// Update the properties of the persistent object
			main.PlatformDAO.save(lmainPlatform);
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public void retrieveByCriteria() throws PersistentException {
		System.out.println("Retrieving User by UserCriteria");
		main.UserCriteria lmainUserCriteria = new main.UserCriteria();
		// Please uncomment the follow line and fill in parameter(s)
		//lmainUserCriteria.ID.eq();
		System.out.println(lmainUserCriteria.uniqueUser());
		
		System.out.println("Retrieving Game by GameCriteria");
		main.GameCriteria lmainGameCriteria = new main.GameCriteria();
		// Please uncomment the follow line and fill in parameter(s)
		//lmainGameCriteria.ID.eq();
		System.out.println(lmainGameCriteria.uniqueGame());
		
		System.out.println("Retrieving Platform by PlatformCriteria");
		main.PlatformCriteria lmainPlatformCriteria = new main.PlatformCriteria();
		// Please uncomment the follow line and fill in parameter(s)
		//lmainPlatformCriteria.ID.eq();
		System.out.println(lmainPlatformCriteria.uniquePlatform());
		
	}
	
	
	public static void main(String[] args) {
		try {
			RetrieveAndUpdateTutorial1Data retrieveAndUpdateTutorial1Data = new RetrieveAndUpdateTutorial1Data();
			try {
				retrieveAndUpdateTutorial1Data.retrieveAndUpdateTestData();
				//retrieveAndUpdateTutorial1Data.retrieveByCriteria();
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
