/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package objetoNegocio;

/**
 *
 * @author Miran
 */
public class Usuario {
    protected int id;
    protected String nombre;
    protected String direccion;
    protected String email;
    protected String usuario;
    protected String contrasena;
    protected int edad;
    protected int nivel;
 
    public Usuario() {
    }
 
    public Usuario(int id) {
        this.id = id;
    }
 
    public Usuario(int id, String nombre, String direccion, String email, String usuario, String contrasena, int edad, int nivel) {
        this(nombre, direccion, email, usuario, contrasena, edad, nivel);
        this.id = id;
    }

    public Usuario(String nombre, String direccion, String email, String usuario, String contrasena, int edad, int nivel) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.email = email;
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.edad = edad;
        this.nivel = nivel;
    }
     
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
 
}