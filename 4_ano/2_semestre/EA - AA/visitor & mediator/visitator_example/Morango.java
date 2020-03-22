
public class Morango implements Ingrediente{
	private int price;
	
	public Morango() {
		price = 2;
	}
	
	public int getPrice() {
		return this.price;
	}
	
	public int accept(EmployeeVisitor visitor) {
		return visitor.visit(this);
	}
}
