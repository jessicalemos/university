import java.util.Scanner;

public class Menu {
    private int op;
    /** Scanner */
    private Scanner in;

    /**
     * Construtor da classe Menu sem paramêtros.
     */
    Menu() {
        in = new Scanner(System.in);
        this.op = 0;
    }

    public int getOp() {
        return op;
    }

    public void setOp(int op) {
        this.op = op;
    }

    /**
     * Apresenta o menu.
     */
    public void showMenu() {
        switch (op){
            case 0: System.out.println("************* MENU ****************\n"+
                    "* 1 - Iniciar Sessão              *\n"+
                    "* 2 - Registar Utilizador         *\n"+
                    "* 3 - Sair                        *\n"+
                    "***********************************\n");
                System.out.println("Escolha uma opção");
                break;
            case 1:
                System.out.println("************* MENU ****************\n"+
                        "* 1 - Upload                      *\n"+
                        "* 2 - Download                    *\n"+
                        "* 0 - Terminar conexão            *\n"+
                        "***********************************\n");
                System.out.println("Escolha uma opção");
                break;
        }

    }

    /**
     * Lê a opção selecionada do menu.
     *@return opção
     */
    public int readOp() {
        int n;

        try {
            n = Integer.parseInt(in.nextLine());
        } catch (NumberFormatException e) {
            System.out.println("\n>Valor inválido\n");
            n = -1;
        }

        return n;
    }

    /**
     * Devolve a opção inserida, verificando se esta é valida.
     * @return opção
     */
    public Integer op() {
        int opcao = readOp();
        while (opcao < 0 || opcao > 2) {
            System.out.println("Escolha uma opção: ");
            opcao = readOp();
        }
        return opcao;
    }
}