
package ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for persistentSession complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="persistentSession">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cacheMode" type="{http://ws/}cacheMode" minOccurs="0"/>
 *         &lt;element name="defaultReadOnly" type="{http://www.w3.org/2001/XMLSchema}boolean"/>
 *         &lt;element name="flushMode" type="{http://ws/}flushMode" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "persistentSession", propOrder = {
    "cacheMode",
    "defaultReadOnly",
    "flushMode"
})
public class PersistentSession {

    protected CacheMode cacheMode;
    protected boolean defaultReadOnly;
    protected FlushMode flushMode;

    /**
     * Gets the value of the cacheMode property.
     * 
     * @return
     *     possible object is
     *     {@link CacheMode }
     *     
     */
    public CacheMode getCacheMode() {
        return cacheMode;
    }

    /**
     * Sets the value of the cacheMode property.
     * 
     * @param value
     *     allowed object is
     *     {@link CacheMode }
     *     
     */
    public void setCacheMode(CacheMode value) {
        this.cacheMode = value;
    }

    /**
     * Gets the value of the defaultReadOnly property.
     * 
     */
    public boolean isDefaultReadOnly() {
        return defaultReadOnly;
    }

    /**
     * Sets the value of the defaultReadOnly property.
     * 
     */
    public void setDefaultReadOnly(boolean value) {
        this.defaultReadOnly = value;
    }

    /**
     * Gets the value of the flushMode property.
     * 
     * @return
     *     possible object is
     *     {@link FlushMode }
     *     
     */
    public FlushMode getFlushMode() {
        return flushMode;
    }

    /**
     * Sets the value of the flushMode property.
     * 
     * @param value
     *     allowed object is
     *     {@link FlushMode }
     *     
     */
    public void setFlushMode(FlushMode value) {
        this.flushMode = value;
    }

}
