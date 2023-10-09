import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';
import LogIn from './LogIn'; 

export default function AppBoton() {
  const [productos, setProductos] = useState([]);
  useEffect(() => {
    fetchImage();
  }, []);

  const fetchImage = () => {
    axios.get('http://localhost:3001/producto')
      .then((response) => {
        console.log(response);
        setProductos(response.data);
      })
      .catch((error) => {
        console.log(error);
      });
  };

  if (productos.length === 0) {
    return (
      <div className="Fondo">
        <h1>Cargando...</h1>
      </div>
    );
  }

  return (
    <div>
      <LogIn /> {}
      {productos.map((producto) => (
        <div key={producto.id}>
          <div className="card">
            <img src={producto.Imagen} className="card-img-top" alt="..." />
            <div className="card-body">
              <h5 className="card-title">{producto.Nombre}</h5>
              <p className="card-text">${producto.Precio}</p>
            </div>
          </div>
        </div>
      ))}
    </div>
  );
}
