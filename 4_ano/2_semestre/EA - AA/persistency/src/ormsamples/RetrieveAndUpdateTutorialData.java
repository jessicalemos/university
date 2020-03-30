/**
 * Licensee: jessica(Universidade do Minho)
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
public class RetrieveAndUpdateTutorialData {
	public void retrieveAndUpdateTestData() throws PersistentException {
		PersistentTransaction t = pt.uminho.di.aa.TutorialPersistentManager.instance().getSession().beginTransaction();
		try {
			pt.uminho.di.aa.User lptuminhodiaaUser = pt.uminho.di.aa.UserDAO.loadUserByQuery(null, null);
			// Update the properties of the persistent object
			pt.uminho.di.aa.UserDAO.save(lptuminhodiaaUser);
			pt.uminho.di.aa.Game lptuminhodiaaGame = pt.uminho.di.aa.GameDAO.loadGameByQuery(null, null);
			// Update the properties of the persistent object
			pt.uminho.di.aa.GameDAO.save(lptuminhodiaaGame);
			pt.uminho.di.aa.Platform lptuminhodiaaPlatform = pt.uminho.di.aa.PlatformDAO.loadPlatformByQuery(null, null);
			// Update the properties of the persistent object
			pt.uminho.di.aa.PlatformDAO.save(lptuminhodiaaPlatform);
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public void retrieveByCriteria() throws PersistentException {
		System.out.println("Retrieving User by UserCriteria");
		pt.uminho.di.aa.UserCriteria lptuminhodiaaUserCriteria = new pt.uminho.di.aa.UserCriteria();
		// Please uncomment the follow line and fill in parameter(s)
		//lptuminhodiaaUserCriteria.ID.eq();
		System.out.println(lptuminhodiaaUserCriteria.uniqueUser());
		
		System.out.println("Retrieving Game by GameCriteria");
		pt.uminho.di.aa.GameCriteria lptuminhodiaaGameCriteria = new pt.uminho.di.aa.GameCriteria();
		// Please uncomment the follow line and fill in parameter(s)
		//lptuminhodiaaGameCriteria.ID.eq();
		System.out.println(lptuminhodiaaGameCriteria.uniqueGame());
		
		System.out.println("Retrieving Platform by PlatformCriteria");
		pt.uminho.di.aa.PlatformCriteria lptuminhodiaaPlatformCriteria = new pt.uminho.di.aa.PlatformCriteria();
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
				pt.uminho.di.aa.TutorialPersistentManager.instance().disposePersistentManager();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
