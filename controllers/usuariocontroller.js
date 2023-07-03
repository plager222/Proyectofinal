import { Router } from 'express';
import   { UsuarioService }  from '../services/usuarioService.js';



const router = Router();
const Usuario = new UsuarioService();

router.get('/api/usuario',  async (req, res)=> {
    const getAll = await Usuario.getUsuarios();
    res.status(200).send(getAll)
});
router.get('/api/usuario/:id',  async (req, res)=> {
    const id = req.params.id;
    if(id < 1){
        res.status(400);
    }
    const getById = await Usuario.getusuarioById(id);
    if(getById == null){
        res.status(404);
    }
    res.status(200).send(getById);
});
router.post('/api/usuario', async (req, res)=>{
    const usuario = new Usuario();
    usuario.estado = req.body.Estado;
    usuario.idpromocion = req.body.IdPromocion;
    usuario.idusuario = req.body.IdUsuario;
    const cUsuario = await Usuario.createUsuario(usuario);
    res.status(201).send(cUsuario);
});
router.put('/api/usuario/:id', async (req, res)=>{
    const id = req.params.id;
    if(id != req.body.Id){
        res.status(400).send();
    }
    const usuario = new Usuario();
    usuario.estado = req.body.Estado;
    usuario.idpromocion = req.body.IdPromocion;
    usuario.idusuario = req.body.IdUsuario;
    const update = await Usuario.updateUsuarioById(id, usuario);
    if(update.rowsAffected[0] == 0){
        res.status(404).send();
    }
    res.send(update); 
});
router.delete('/api/usuario/:id',  async (req, res)=>{
    const id = req.params.id;
    if(id < 1){
        res.status(400).send();
    }
    const resultDelete = await usuario.deleteUsuarioById(id);
    console.log(resultDelete);
    if(resultDelete.rowsAffected[0] == 0){
        res.status(404).send()
    }
    res.status(200).send();
});


export default router;