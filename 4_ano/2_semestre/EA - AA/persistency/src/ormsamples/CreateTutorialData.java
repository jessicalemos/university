/**
 * Licensee: jessica(Universidade do Minho)
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
import uminho.di.aa.*;

public class CreateTutorialData {
	public void createTestData() throws PersistentException {
		PersistentTransaction t = TutorialPersistentManager.instance().getSession().beginTransaction();
		try {
			User lptuminhodiaaUser = UserDAO.createUser();
			// Initialize the properties of the persistent object here
			UserDAO.save(lptuminhodiaaUser);
			Game lptuminhodiaaGame = GameDAO.createGame();
			// TODO Initialize the properties of the persistent object here, the following properties must be initialized before saving : price, year
			GameDAO.save(lptuminhodiaaGame);
			Platform lptuminhodiaaPlatform = PlatformDAO.createPlatform();
			// TODO Initialize the properties of the persistent object here, the following properties must be initialized before saving : year
			PlatformDAO.save(lptuminhodiaaPlatform);
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public static void main(String[] args) {
		try {
			CreateTutorialData createTutorialData = new CreateTutorialData();
			try {
				createTutorialData.createTestData();
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
