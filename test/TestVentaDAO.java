/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.VentaDAO;
import java.sql.SQLException;
import objetoNegocio.Venta;
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
public class TestVentaDAO {
    VentaDAO ventaDao;
    
    public TestVentaDAO() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        ventaDao = new VentaDAO("jdbc:mysql://localhost:3306/cafeplace", "root", "");
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
    public void testinsertVenta() throws SQLException{
        Venta venta = new Venta(5, 2, 1, 2, 21.4f, "direccion");
        boolean prueba = ventaDao.insertVenta(venta);
        assertTrue(prueba);
    }
    
    @Test 
    public void testGetVenta() throws SQLException{
        assertNotNull(ventaDao.getVenta(1));
    }
    
}
