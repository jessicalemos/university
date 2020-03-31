/**
 * Licensee: jessica(Universidade do Minho)
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
import uminho.di.aa.*;

public class RetrieveAndUpdateTutorialData {
	public void retrieveAndUpdateTestData() throws PersistentException {
		PersistentTransaction t = TutorialPersistentManager.instance().getSession().beginTransaction();
		try {
			User lptuminhodiaaUser = UserDAO.loadUserByQuery(null, null);
			// Update the properties of the persistent object
			UserDAO.save(lptuminhodiaaUser);
			Game lptuminhodiaaGame = GameDAO.loadGameByQuery(null, null);
			// Update the properties of the persistent object
			GameDAO.save(lptuminhodiaaGame);
			Platform lptuminhodiaaPlatform = PlatformDAO.loadPlatformByQuery(null, null);
			// Update the properties of the persistent object
			PlatformDAO.save(lptuminhodiaaPlatform);
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public void retrieveByCriteria() throws PersistentException {
		System.out.println("Retrieving User by UserCriteria");
		UserCriteria lptuminhodiaaUserCriteria = new UserCriteria();
		// Please uncomment the follow line and fill in parameter(s)
		//lptuminhodiaaUserCriteria.ID.eq();
		System.out.println(lptuminhodiaaUserCriteria.uniqueUser());
		
		System.out.println("Retrieving Game by GameCriteria");
		GameCriteria lptuminhodiaaGameCriteria = new GameCriteria();
		// Please uncomment the follow line and fill in parameter(s)
		//lptuminhodiaaGameCriteria.ID.eq();
		System.out.println(lptuminhodiaaGameCriteria.uniqueGame());
		
		System.out.println("Retrieving Platform by PlatformCriteria");
		PlatformCriteria lptuminhodiaaPlatformCriteria = new PlatformCriteria();
		// Please uncomment the follow line and fill in parameter(s)
		//lptuminhodiaaPlatformCriteria.ID.eq();
		System.out.println(lptuminhodiaaPlatformCriteria.uniquePlatform());
		
	}
	
	
	public static void main(String[] args) {
		try {
			RetrieveAndUpdateTutorialData retrieveAndUpdateTutorialData = new RetrieveAndUpdateTutorialData();
			try {
				retrieveAndUpdateTutorialData.retrieveAndUpdateTestData();
				//retrieveAndUpdateTutorialData.retrieveByCriteria();
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
