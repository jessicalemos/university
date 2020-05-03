/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tutorial2;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author utilizador
 */
@Entity
public class Format {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private  int id;
    private String description;
    private int kind;

    public Format() {
    }

    public int getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public int getKind() {
        return kind;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setKind(int kind) {
        this.kind = kind;
    }
    
}
