/**
 * Licensee: Universidade do Minho
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
public class CreateTutorial1Data {
	public void createTestData() throws PersistentException {
		PersistentTransaction t = main.Tutorial1PersistentManager.instance().getSession().beginTransaction();
		try {
			main.User lmainUser = main.UserDAO.createUser();
			// TODO Initialize the properties of the persistent object here, the following properties must be initialized before saving : game
			main.UserDAO.save(lmainUser);
			main.Game lmainGame = main.GameDAO.createGame();
			// TODO Initialize the properties of the persistent object here, the following properties must be initialized before saving : price, year, platform
			main.GameDAO.save(lmainGame);
			main.Platform lmainPlatform = main.PlatformDAO.createPlatform();
			// TODO Initialize the properties of the persistent object here, the following properties must be initialized before saving : year
			main.PlatformDAO.save(lmainPlatform);
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public static void main(String[] args) {
		try {
			CreateTutorial1Data createTutorial1Data = new CreateTutorial1Data();
			try {
				createTutorial1Data.createTestData();
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
