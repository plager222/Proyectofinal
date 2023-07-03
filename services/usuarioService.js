import sql from 'mssql'
import config from '../models/db.js'

export class UsuarioService{

    getUsuarios = async () => {
    
        const connection = await sql.connect(config);
        const result = await connection.request().query(`SELECT * from Usuario`);
        console.log(result)

        return result.recordset;
    }
 getUsuarioById = async (id) => {

        const connection = await sql.connect(config);
        const result = await connection.request()
            .input('id',sql.Int, id)
            .query(`SELECT * from Usuarios where IdUsuario = @id`);
        console.log(result)

        return result.recordset;
    }

 createUsuario = async (usuario) => {

        const connection = await sql.connect(config);
        const result = await connection.request()
        .input("pApellido", usuario.apellido)
        .input("pContraseña", usuario.contraseña)
        .input("pNombre", usuario.nombre)
            .query(`INSERT INTO Usuario(Nombre, Apellido, Contraseña) VALUES (@Nombre, @Apellido, @Contraseña)`);
        console.log(result)

        return result.recordset;
    }

 updateUsuarioById = async (id, usuario) => {

        const connection = await sql.connect(config);
        const result = await connection.request()
        .input("pId",id)
        .input("pNombre", producto.nombre)
        .input("pContraseña", usuario.contraseña)
        .input("pApellido", usuario.apellido)
            .query(`UPDATE Usuarios SET Nombre = @Nombre, Contraseña = @Contraseña, Apellido = @Apellido WHERE id = @Id`);
        console.log(result)

        return result;
    }

 deleteUsuarioById = async (id) => {

        const connection = await sql.connect(config);
        const result = await connection.request()
            .input('id',sql.Int, id)
            .query(`DELETE  FROM Usuario WHERE id = @id`);
        console.log(result)

        return result;
    }
}
