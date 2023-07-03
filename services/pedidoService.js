import sql from 'mssql'
import config from '../models/db.js';
export class PedidosService {
    getPedidos = async () => {

        const connection = await sql.connect(config);
        const result = await connection.request().query(`SELECT * from Pedidos`);
        console.log(result)

        return result.recordset;
    }
    getPedidoById = async (id) => {

        const connection = await sql.connect(config);
        const result = await connection.request()
            .input('id', sql.Int, id)
            .query(`SELECT * from Pedidos where IdPedido = @id`);
        console.log(result)

        return result.recordset;
    }

    createPedido = async (pedido) => {

        const connection = await sql.connect(config);
        const result = await connection.request()
            .input("pEstado", pedido.estado)
            .input("pIdUsuario", pedido.idusuario)
            .input("pIdPromocion", pedido.idpromocion)
            .query(`INSERT INTO Pedidos(Estado, IdUsuario, IdPromocion) VALUES (@pEstado, @pIdUsuario, @pIdPromocion)`);
        console.log(result)

        return result.recordset;
    }

    updatePedidoById = async (id, pedido) => {

        const connection = await sql.connect(config);
        const result = await connection.request()
            .input("pId", sql.Int, id)
            .input("pEstado", pedido.estado)
            .input("pIdPromocion", pedido.idpromocion)
            .input("pIdUsuario", pedido.idusuario)
            .query(`UPDATE Pedidos SET Estado = @Estado, IdPromocion = @IdPromocion, IdUsuario = @IdUsuario WHERE idPedido = @Id`);
        console.log(result)

        return result;
    }

    deletePedidoById = async (id) => {

        const connection = await sql.connect(config);
        const result = await connection.request()
            .input('id', sql.Int, id)
            .query(`DELETE  FROM Usuario WHERE idPedido = @id`);
        console.log(result)

        return result;
    }

    arrayPedidos = async () => {
        try {
            const connection = await sql.connect(config);
            const result = await connection.request().query(`SELECT pedidos.IdPedido, pedidos.IdUsuario, pedidos.Estado, pedidos.IdPromocion, pedidos_items.IdProducto, pedidos_items.Cantidad
          FROM pedidos
          INNER JOIN pedidos_items ON pedidos.IdPedido = pedidos_items.IdPedido`);

            console.log(result);
            return result.recordset;
        } catch (error) {
            console.error('Error al obtener los pedidos:', error);
            throw error;
        }
    };

}

