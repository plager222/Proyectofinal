import sql from 'mssql'
import config from '../models/db.js';
export class ProductoService{

    getProductos = async () => {
    
        const connection = await sql.connect(config);
        const result = await connection.request().query(`SELECT * from Productos`);
        return result.recordset;
    }
    getProductoById = async (id) => {

        const connection = await sql.connect(config);
        const result = await connection.request()
            .input('id',sql.Int, id)
            .query(`SELECT * from Productos where IdProducto = @id`);
        return result.recordset;
    }

    createProducto = async (producto) => {
        const connection = await sql.connect(config);
        const result = await connection.request()
        .input("pPrecio", producto.precio)
        .input("pCalorias", producto.calorias)
        .input("pDescripcion", producto.descripcion)
        .input("pNombre", producto.nombre)
            .query(`INSERT INTO Productos(Nombre, Precio, Calorias, Descripcion) VALUES (@pNombre, @pPrecio, @pCalorias, @pDescripcion)`);

        return result.recordset;
    }

    updateProductoById = async (id, producto) => {
        const connection = await sql.connect(config);
        const result = await connection.request()
        .input("pId", sql.Int,id)
        .input("pNombre", producto.nombre)
        .input("pCalorias", producto.calorias)
        .input("pPrecio", producto.precio)
        .input("pDescripcion", producto.descripcion)
            .query(`UPDATE Productos SET Nombre = @pNombre, Calorias = @pCalorias, Precio = @pPrecio, Descripcion = @pDescripcion WHERE IdProducto = @pId`);


        return result;
    }

    deleteProductoById = async (id) => {
        const connection = await sql.connect(config);
        const result = await connection.request().input('id',sql.Int, id).query(`DELETE FROM Productos where IdProducto = @id`);
        return result;
    }


}
