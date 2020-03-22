
public class EmployeeVistiorC implements EmployeeVisitor{
	public int visit (Morango m) {
		int cost = m.getPrice();
		System.out.print("O preço de adicionar morangos "  + cost + " euros.\n");
		return cost;
	}
	
	public int visit (Chantilly c) {
		int cost = c.getPrice();
		System.out.print("O preço de adicionar chantilly é de " + cost + " euro.\n");
		return cost;
	}
}
