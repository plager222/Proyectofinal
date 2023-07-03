import { Router } from 'express';
import   { PedidosService }  from '../services/pedidoService.js';



const router = Router();
const Pedido = new PedidosService();

router.get('/api/pedido',  async (req, res)=> {
    const getAll = await Pedido.getPedidos();
    res.status(200).send(getAll)
});
router.get('/api/pedido/:id',  async (req, res)=> {
    const id = req.params.id;
    if(id < 1){
        res.status(400);
    }
    const getById = await Pedido.getPedidoById(id);
    if(getById == null){
        res.status(404);
    }
    res.status(200).send(getById);
});
router.post('/api/pedido', async (req, res)=>{
    const pedido = new Pedido();
    pedido.estado = req.body.Estado;
    pedido.idpromocion = req.body.IdPromocion;
    pedido.idusuario = req.body.IdUsuario;
    const cPedido = await Pedido.createPedido(pedido);
    res.status(201).send(cPedido);
});
router.put('/api/pedido/:id', async (req, res)=>{
    const id = req.params.id;
    if(id != req.body.Id){
        res.status(400).send();
    }
    const pedido = new Pedido();
    pedido.estado = req.body.Estado;
    pedido.idpromocion = req.body.IdPromocion;
    pedido.idusuario = req.body.IdUsuario;
    const update = await Pedido.updatePedidoById(id, pedido);
    if(update.rowsAffected[0] == 0){
        res.status(404).send();
    }
    res.send(update); 
});
router.delete('/api/pedido/:id',  async (req, res)=>{
    const id = req.params.id;
    if(id < 1){
        res.status(400).send();
    }
    const resultDelete = await Pedido.deletePedidoById(id);
    console.log(resultDelete);
    if(resultDelete.rowsAffected[0] == 0){
        res.status(404).send()
    }
    res.status(200).send();
});

router.get('/api/pedido',  async (req, res)=> {
    const arrayP = await arrayPedidos();
    res.status(200).send(arrayP)
});


export default router;