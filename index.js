import express from "express";
import PedidosRouter from './controllers/pedidoscontroller.js';
import UsuariosRouter from "./controllers/usuariocontroller.js";
import ProductosRouter from "./controllers/productoscontroller.js";
import cors from "cors";

const app = express();
const port = 3000;

app.use(express.json());
app.use(cors());
app.use("/pedido", PedidosRouter)
app.use("/usuario", UsuariosRouter)
app.use("/producto", ProductosRouter)

app.listen(port, () => {
    console.log(`Se está usando el puerto: ${port}`);
  });



