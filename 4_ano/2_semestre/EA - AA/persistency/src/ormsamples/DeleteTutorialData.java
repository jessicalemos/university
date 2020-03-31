/**
 * Licensee: jessica(Universidade do Minho)
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
import uminho.di.aa.*;

public class DeleteTutorialData {
	public void deleteTestData() throws PersistentException {
		PersistentTransaction t = TutorialPersistentManager.instance().getSession().beginTransaction();
		try {
			User lptuminhodiaaUser = UserDAO.loadUserByQuery(null, null);
			// Delete the persistent object
			UserDAO.delete(lptuminhodiaaUser);
			Game lptuminhodiaaGame = GameDAO.loadGameByQuery(null, null);
			// Delete the persistent object
			GameDAO.delete(lptuminhodiaaGame);
			Platform lptuminhodiaaPlatform = PlatformDAO.loadPlatformByQuery(null, null);
			// Delete the persistent object
			PlatformDAO.delete(lptuminhodiaaPlatform);
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public static void main(String[] args) {
		try {
			DeleteTutorialData deleteTutorialData = new DeleteTutorialData();
			try {
				deleteTutorialData.deleteTestData();
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
