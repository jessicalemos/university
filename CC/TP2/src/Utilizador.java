public class Utilizador {
    private String username;
    private String password;

    public Utilizador(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean verificaPassword(String password) {
        return this.password.equals(password);
    }

    public boolean equals(Object o) {
        if (o == this)
            return true;

        if (o == null || (this.getClass() != o.getClass()))
            return false;

        Utilizador usr = (Utilizador) o;
        return username.equals(usr.username);
    }
}