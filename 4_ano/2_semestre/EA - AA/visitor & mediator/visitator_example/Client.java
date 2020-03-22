
public class Client {
	public static void main(String[] args)  
    { 
        Ingrediente[] items = new Ingrediente[]{new Morango(), 
                              new Chantilly()}; 
   
        int total = calculatePrice(items); 
        System.out.println("O custo total é de "+ total + " euros." ); 
    } 
	
	private static int calculatePrice(Ingrediente[] ing) {
		int cost = 0;
		EmployeeVisitor visitor = new EmployeeVistiorC();
		for(Ingrediente i : ing) {
			cost  = cost + i.accept(visitor);
		}
		return cost;
	}

}
