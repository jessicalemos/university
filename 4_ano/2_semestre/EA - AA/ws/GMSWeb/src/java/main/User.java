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

import java.security.MessageDigest;

public class User {

    public User() {
    }

    private java.util.Set this_getSet(int key) {
        if (key == main.ORMConstants.KEY_USER_GAME) {
            return ORM_game;
        }

        return null;
    }

    org.orm.util.ORMAdapter _ormAdapter = new org.orm.util.AbstractORMAdapter() {
        public java.util.Set getSet(int key) {
            return this_getSet(key);
        }

    };

    private int ID;

    private String name;

    private String email;

    private String password;

    private java.util.Set ORM_game = new java.util.HashSet();

    private void setID(int value) {
        this.ID = value;
    }

    public int getID() {
        return ID;
    }

    public int getORMID() {
        return getID();
    }

    public void setName(String value) {
        this.name = value;
    }

    public String getName() {
        return name;
    }

    public void setEmail(String value) {
        this.email = value;
    }

    public String getEmail() {
        return email;
    }

    public void setPassword(String value) {
        try {
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.password = value;
    }

    public String getPassword() {
        return password;
    }

    private void setORM_Game(java.util.Set value) {
        this.ORM_game = value;
    }

    private java.util.Set getORM_Game() {
        return ORM_game;
    }

    public final main.GameSetCollection game = new main.GameSetCollection(this, _ormAdapter, main.ORMConstants.KEY_USER_GAME, main.ORMConstants.KEY_MUL_MANY_TO_MANY);

    public String toString() {
        return String.valueOf(getID());
    }

}
