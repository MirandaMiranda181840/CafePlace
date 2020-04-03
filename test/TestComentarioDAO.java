/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.ComentarioDAO;
import java.sql.SQLException;
import objetoNegocio.Comentario;
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
public class TestComentarioDAO {
    ComentarioDAO comentarioDao;
    
    public TestComentarioDAO() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        comentarioDao = new ComentarioDAO("jdbc:mysql://localhost:3306/cafeplace", "root", "");
    }
    
    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
    
     @Test
    public void testInsert() throws SQLException{
        Comentario comentario = new Comentario("Nombre Anonimo", "correo@prueba.com", "6441294361", "Esta muy bueno el cafe pero no me gusto mucho la página web, quien la hizo? un niño de primaria?");
        boolean prueba = comentarioDao.insertComentario(comentario);
        assertTrue(prueba);
    }
    
    @Test
    public void testListComentario() throws SQLException{
        assertNotNull(comentarioDao.listAllUsers());
    }
    
    
}
