package pt.uminho.di.aa;

public class Platform {
	private String _name;
	private int _year;
	private String _description;
	private String _manufacturer;

	public String getName() {
		return this._name;
	}

	public void setName(String aName) {
		this._name = aName;
	}

	public int getYear() {
		return this._year;
	}

	public void setYear(int aYear) {
		this._year = aYear;
	}

	public String getDescription() {
		return this._description;
	}

	public void setDescription(String aDescription) {
		this._description = aDescription;
	}

	public String getManufacturer() {
		return this._manufacturer;
	}

	public void setManufacturer(String aManufacturer) {
		this._manufacturer = aManufacturer;
	}
}