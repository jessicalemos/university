
package ws;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for flushMode.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="flushMode">
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     &lt;enumeration value="NEVER"/>
 *     &lt;enumeration value="MANUAL"/>
 *     &lt;enumeration value="COMMIT"/>
 *     &lt;enumeration value="AUTO"/>
 *     &lt;enumeration value="ALWAYS"/>
 *   &lt;/restriction>
 * &lt;/simpleType>
 * </pre>
 * 
 */
@XmlType(name = "flushMode")
@XmlEnum
public enum FlushMode {

    NEVER,
    MANUAL,
    COMMIT,
    AUTO,
    ALWAYS;

    public String value() {
        return name();
    }

    public static FlushMode fromValue(String v) {
        return valueOf(v);
    }

}
