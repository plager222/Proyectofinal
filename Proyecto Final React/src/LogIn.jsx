import React, {  useState } from 'react';

const LogIn = () => {
  
  const [userState, setUserState] = useState({
    email: 'fede01',
    password: 'Fede123',
  });

  const onLogInPress = async () => {
    if (!userState.email || !userState.password) {
      console.log("Por favor ingresar todos los datos");
    } else {
      console.log("datos completos, entra a loguearse");
      
    }
  };

  return (
    <div style={styles.container}>
      <h2 style={styles.titulo}>Inicio de sesión</h2>
      <input
        style={styles.input}
        placeholder="Email"
        value={userState.email}
        onChange={(e) => setUserState({ ...userState, email: e.target.value })}
      />
      <input
        style={styles.input}
        placeholder="Password"
        value={userState.password}
        type="password"
        onChange={(e) => setUserState({ ...userState, password: e.target.value })}
      />
      <button onClick={onLogInPress}>Iniciar sesión</button>
    </div>
  );
};

export default LogIn;

const styles = {
  container: {
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    flex: 1,
    backgroundColor: 'white',
    height: '100vh', 
  },
  titulo: {
    fontSize: 20,
    marginBottom: 10,
  },
  input: {
    backgroundColor: 'white',
    borderColor: 'black',
    borderRadius: 5,
    paddingHorizontal: 10,
    marginVertical: 5,
    height: 50,
    margin: 12,
    borderWidth: 1,
    padding: 10,
  },
};
