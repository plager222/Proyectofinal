
import  { ProductoService }  from '../services/productoService.js';
import { Router } from 'express';
const router = Router()
const Producto = new ProductoService();

router.get('/',  async (req, res)=> {
    const getAll = await Producto.getProductos();
    res.status(200).send(getAll)
});
router.get('/api/producto/:id',  async (req, res)=> {
    const id = req.params.id;
    if(id < 1){
        res.status(400);
    }
    const getById = await Producto.getProductoById(id);
    if(getById == null){
        res.status(404);
    }
    res.status(200).send(getById);
});
router.post('/api/producto', async (req, res)=>{
    const producto = new Producto();
    producto.nombre = req.body.Nombre;
    producto.calorias = req.body.Calorias;
    producto.precio = req.body.Precio;
    producto.descripcion = req.body.Descripcion;
    const cProducto = await Producto.createProducto(producto);
    res.status(201).send(cProducto);
});
router.put('/api/producto/:id', async (req, res)=>{
    const id = req.params.id;
    if(id != req.body.Id){
        res.status(400).send();
    }
    const producto = new Producto();
    producto.descripcion = req.body.Descripcion;
    producto.nombre = req.body.Nombre;
    producto.precio = req.body.Precio;
    producto.calorias = req.body.Calorias
    const update = await Producto.updateProductoById(id, producto);
    if(update.rowsAffected[0] == 0){
        res.status(404).send();
    }
    res.send(update); 
});
router.delete('/api/producto/:id',  async (req, res)=>{
    const id = req.params.id;
    if(id < 1){
        res.status(400).send();
    }
    const resultDelete = await Producto.deleteProductoById(id);
    console.log(resultDelete);
    if(resultDelete.rowsAffected[0] == 0){
        res.status(404).send()
    }
    res.status(200).send();
});



export default router;
    
