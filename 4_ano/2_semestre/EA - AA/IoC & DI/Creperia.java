public class Creperia {
    public static void main(String[] args){
        Creperia container = new Creperia();
        Cliente cliente_1 = container.new Cliente(container.new Crepe());
        cliente_1.acompanhamento("Chocolate");
        Cliente cliente_2 = container.new Cliente(container.new Waffle());
        cliente_2.acompanhamento("Morangos e chantilly");
    }

    public class Cliente {
        Pedido pedido;

        public Cliente(Pedido pedido){
            this.pedido = pedido;
        }

        public void acompanhamento(String descricao){
            pedido.acompanhamento(descricao);
        }
    }

    public interface Pedido {
        void acompanhamento(String descricao);
    }

    public class Crepe implements Pedido {
        @Override
        public void acompanhamento(String descricao){
            System.out.println("Crepe com " + descricao);
        }
    }

    public class Waffle implements Pedido {
        @Override
        public void acompanhamento(String descricao){
            System.out.println("Waffle com " + descricao);
        }
    }
}
