/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.FacturaDAO;
import java.sql.SQLException;
import objetoNegocio.Factura;
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
public class TestFacturaDAO {
    FacturaDAO facturaDao;
    
    public TestFacturaDAO() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        facturaDao = new FacturaDAO("jdbc:mysql://localhost:3306/cafeplace", "root", "");
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
    public void testInsertarFactura() throws SQLException{
        Factura factura = new Factura(2, "2019-12-02", 3, 2);
        boolean prueba = facturaDao.insertFactura(factura);
        assertTrue(prueba);
    }
}
