package pt.uminho.di.aa;

public class User {
	private String _name;
	private String _emai;
	private String _password;

	public String getName() {
		return this._name;
	}

	public void setName(String aName) {
		this._name = aName;
	}

	public String getEmail() {
		throw new UnsupportedOperationException();
	}

	public String getPassword() {
		return this._password;
	}

	public void setPassword(String aPassword) {
		this._password = aPassword;
	}
}