import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

export default function AppBoton() {
    const [productos, setProductos] = useState([]);
    useEffect(() => {fetchImage();}, []);

    const fetchImage = () => {
        axios.get('http://localhost:3000/producto')
        .then((response) => {
            console.log(response)
            setProductos(response.data);
        })
        .catch((error) => {console.log(error);});
    };

    if (productos.length === 0) {
    return (
        <div className="Fondo">
        <h1>Cargando...</h1>
        </div>
    );
    }

    return (
        productos.map((producto) => (
            
        <div>
            <div class="card">
            <img src={producto.Imagen} class="card-img-top" alt="..."/>
            <div class="card-body">
            <h5 class="card-title">{producto.Nombre}</h5>
            <p class="card-text">${producto.Precio}</p>
            </div>
            </div>
        </div>
        
        ))
    );
}