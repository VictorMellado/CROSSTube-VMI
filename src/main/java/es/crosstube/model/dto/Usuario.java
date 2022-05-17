package es.crosstube.model.dto;

public class Usuario {
    private int id;
    private String nombre;
    private String email;
    private String contrasenya;

    public Usuario(int id, String nombre, String email, String contrasenya) {
        this.id = id;
        this.nombre = nombre;
        this.email = email;
        this.contrasenya = contrasenya;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getEmail() {
        return email;
    }

    public String getContrasenya() {
        return contrasenya;
    }
}
