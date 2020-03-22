
public class Chantilly implements Ingrediente{
	private int price;
	
	public Chantilly() {
		this.price = 1;
	}
	
	public int getPrice() {
		return this.price;
	}
	
	public int accept(EmployeeVisitor visitor) {
		return visitor.visit(this);
	}
}
