
package ws;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for cacheMode.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="cacheMode">
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     &lt;enumeration value="NORMAL"/>
 *     &lt;enumeration value="IGNORE"/>
 *     &lt;enumeration value="GET"/>
 *     &lt;enumeration value="PUT"/>
 *     &lt;enumeration value="REFRESH"/>
 *   &lt;/restriction>
 * &lt;/simpleType>
 * </pre>
 * 
 */
@XmlType(name = "cacheMode")
@XmlEnum
public enum CacheMode {

    NORMAL,
    IGNORE,
    GET,
    PUT,
    REFRESH;

    public String value() {
        return name();
    }

    public static CacheMode fromValue(String v) {
        return valueOf(v);
    }

}
