/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.ProductoDAO;
import java.sql.SQLException;
import classes.Producto;
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
public class TestProductoDAO {
    ProductoDAO productoDao;
    
    public TestProductoDAO() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        productoDao = new ProductoDAO("jdbc:mysql://localhost:3306/cafeplace", "root", "");
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
    public void testInsertProducto() throws SQLException{
        Producto producto = new Producto(12, "Nachos", "Totopos con queso amarillo y blanco.", 40.5f, 50, "img/menu/6nachos.png");
        boolean prueba = productoDao.insertProducto(producto);
        assertTrue(prueba);
    }
    
    @Test
    public void testGetProducto() throws SQLException{
        assertNotNull(productoDao.getProducto(1));
    }
}
