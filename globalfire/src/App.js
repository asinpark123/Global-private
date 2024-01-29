import logo from './logo.svg';
// import cursorJS from './cursor.js'
import {Helmet} from 'react-helmet'
// import globalFireLogo from "./logo/GlobalFire_orange_fire.glb";

import './App.css';
import './cursor.css';

function Header() {
  return (
    <header className="App-header">
      {/* <img src={logo} className="App-logo" alt="logo" /> */}
      <p>
        Edit <code>src/App.js</code> and save to reload.
      </p>
      <a className="App-link" href="https://reactjs.org" target="_blank" rel="noopener noreferrer">
        Learn React
      </a>
    </header>
  );
}

function NeilArmstrong() {
  return (
    <div id="container">
      <Helmet>
        <script
          type="module"
          src="https://ajax.googleapis.com/ajax/libs/model-viewer/3.4.0/model-viewer.min.js"
        ></script>
      </Helmet>
      {/* <Helmet>
        <script src={cursorJS}></script>
      </Helmet> */}
      <div className="model-container">
        <model-viewer
          id="NeilArmstrong"
          src="https://modelviewer.dev/shared-assets/models/NeilArmstrong.glb"
          auto-rotate
          auto-rotate-delay="0"
          rotation-per-second="30deg"
          environment-image="https://neromotion.co.nz/assets/Uploads/test14.jpeg"
          metalness="1"
          roughness="0"
          exposure="15"
          ar-status="not-presenting"
        ></model-viewer>
      </div>
      <canvas></canvas>
    </div>
  );
}


function App() {
  return (
    <div className="App">
      
      {/* <Header /> */}
      <NeilArmstrong />
    </div>
  );
}

export default App;