/**
 * Licensee: Universidade do Minho
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
public class DeleteTutorial1Data {
	public void deleteTestData() throws PersistentException {
		PersistentTransaction t = main.Tutorial1PersistentManager.instance().getSession().beginTransaction();
		try {
			main.User lmainUser = main.UserDAO.loadUserByQuery(null, null);
			// Delete the persistent object
			main.UserDAO.delete(lmainUser);
			main.Game lmainGame = main.GameDAO.loadGameByQuery(null, null);
			// Delete the persistent object
			main.GameDAO.delete(lmainGame);
			main.Platform lmainPlatform = main.PlatformDAO.loadPlatformByQuery(null, null);
			// Delete the persistent object
			main.PlatformDAO.delete(lmainPlatform);
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public static void main(String[] args) {
		try {
			DeleteTutorial1Data deleteTutorial1Data = new DeleteTutorial1Data();
			try {
				deleteTutorial1Data.deleteTestData();
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
