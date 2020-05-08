/**
 * "Visual Paradigm: DO NOT MODIFY THIS FILE!"
 * 
 * This is an automatic generated file. It will be regenerated every time 
 * you generate persistence class.
 * 
 * Modifying its content may cause the program not work, or your work may lost.
 */

/**
 * Licensee: Universidade do Minho
 * License Type: Academic
 */
package main;

import org.hibernate.Criteria;
import org.orm.PersistentException;
import org.orm.PersistentSession;
import org.orm.criteria.*;

public class PlatformCriteria extends AbstractORMCriteria {
	public final IntegerExpression ID;
	public final StringExpression name;
	public final StringExpression manufacturer;
	public final StringExpression description;
	public final IntegerExpression year;
	
	public PlatformCriteria(Criteria criteria) {
		super(criteria);
		ID = new IntegerExpression("ID", this);
		name = new StringExpression("name", this);
		manufacturer = new StringExpression("manufacturer", this);
		description = new StringExpression("description", this);
		year = new IntegerExpression("year", this);
	}
	
	public PlatformCriteria(PersistentSession session) {
		this(session.createCriteria(Platform.class));
	}
	
	public PlatformCriteria() throws PersistentException {
		this(main.Tutorial1PersistentManager.instance().getSession());
	}
	
	public Platform uniquePlatform() {
		return (Platform) super.uniqueResult();
	}
	
	public Platform[] listPlatform() {
		java.util.List list = super.list();
		return (Platform[]) list.toArray(new Platform[list.size()]);
	}
}

