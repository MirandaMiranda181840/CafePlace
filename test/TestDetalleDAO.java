/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.DetalleDAO;
import java.sql.SQLException;
import objetoNegocio.Detalle;
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
public class TestDetalleDAO {
    DetalleDAO detalleDao;
    
    public TestDetalleDAO() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        detalleDao = new DetalleDAO("jdbc:mysql://localhost:3306/cafeplace", "root", "");
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
    public void testInsertDetalle() throws SQLException{
        Detalle detalle = new Detalle(2, 1, 1, 1);
        boolean prueba = detalleDao.insertDetalle(detalle);
        assertTrue(prueba);
    }
    
    @Test
    public  void testGetDetalle() throws SQLException{
        System.out.println(detalleDao.listAllDetalle().get(0).getFolio());
        assertNotNull(detalleDao.listAllDetalle().get(0));
    }
    
    @Test
    public void testDeleteDetalle() throws SQLException{
        assertNotNull(detalleDao.deleteDetalle(1));
    }
}
