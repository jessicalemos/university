/**
 * Licensee: jessica(Universidade do Minho)
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
import uminho.di.aa.TutorialPersistentManager;

public class CreateTutorialDatabaseSchema {
	public static void main(String[] args) {
		try {
			ORMDatabaseInitiator.createSchema(TutorialPersistentManager.instance());
			TutorialPersistentManager.instance().disposePersistentManager();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
