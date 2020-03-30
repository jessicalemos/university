/**
 * "Visual Paradigm: DO NOT MODIFY THIS FILE!"
 * 
 * This is an automatic generated file. It will be regenerated every time 
 * you generate persistence class.
 * 
 * Modifying its content may cause the program not work, or your work may lost.
 */

/**
 * Licensee: jessica(Universidade do Minho)
 * License Type: Academic
 */
package uminho.di.aa;

import java.util.List;
import org.hibernate.criterion.DetachedCriteria;
import org.orm.PersistentSession;
import org.orm.criteria.*;

public class PlatformDetachedCriteria extends AbstractORMDetachedCriteria {
	public final IntegerExpression ID;
	public final StringExpression name;
	public final IntegerExpression year;
	public final StringExpression description;
	public final StringExpression manufacturer;
	
	public PlatformDetachedCriteria() {
		super(Platform.class, PlatformCriteria.class);
		ID = new IntegerExpression("ID", this.getDetachedCriteria());
		name = new StringExpression("name", this.getDetachedCriteria());
		year = new IntegerExpression("year", this.getDetachedCriteria());
		description = new StringExpression("description", this.getDetachedCriteria());
		manufacturer = new StringExpression("manufacturer", this.getDetachedCriteria());
	}
	
	public PlatformDetachedCriteria(DetachedCriteria aDetachedCriteria) {
		super(aDetachedCriteria, PlatformCriteria.class);
		ID = new IntegerExpression("ID", this.getDetachedCriteria());
		name = new StringExpression("name", this.getDetachedCriteria());
		year = new IntegerExpression("year", this.getDetachedCriteria());
		description = new StringExpression("description", this.getDetachedCriteria());
		manufacturer = new StringExpression("manufacturer", this.getDetachedCriteria());
	}
	
	public Platform uniquePlatform(PersistentSession session) {
		return (Platform) super.createExecutableCriteria(session).uniqueResult();
	}
	
	public Platform[] listPlatform(PersistentSession session) {
		List list = super.createExecutableCriteria(session).list();
		return (Platform[]) list.toArray(new Platform[list.size()]);
	}
}

