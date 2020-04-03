/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.UsuarioDAO;
import java.sql.SQLException;
import objetoNegocio.Usuario;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author miran
 */
public class TestUsuarioDAO {
    UsuarioDAO testdao;
    
    public TestUsuarioDAO() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        testdao = new UsuarioDAO("jdbc:mysql://localhost:3306/cafeplace", "root", "");
    }
    
    @After
    public void tearDown() {
    }

    @Test
    public void testInsert() throws SQLException{
        Usuario usuario = new Usuario(7, "test de java", "direccion prueba", "email@prueba.com", "usuario7", "123456", 21, 2);
        boolean prueba = testdao.insertUsuario(usuario);
        assertTrue(prueba);
    }
    
    @Test
    public void testObtenerId() throws SQLException{
        System.out.println("Nombre: "+testdao.getUser(10).getNombre());
        assertNotNull(testdao.getUser(10));
    }
    
    @Test
    public void testObtenerNombre() throws SQLException{
        System.out.println("Nombre: "+testdao.getUser("administrador2", "123456").getNombre());
        System.out.println("ID: "+testdao.getUser("administrador2", "123456").getId());
        assertNotNull(testdao.getUser("administrador2", "123456"));
    }
    
    
}
