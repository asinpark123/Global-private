import logo from './logo.svg';
import {Helmet} from 'react-helmet'
// import globalFireLogo from "./logo/GlobalFire_orange_fire.glb";

import './App.css';

function Header() {
  return (
    <header className="App-header">
      <img src={logo} className="App-logo" alt="logo" />
      <p>
        Edit <code>src/App.js</code> and save to reload.
      </p>
      <a className="App-link" href="https://reactjs.org" target="_blank" rel="noopener noreferrer">
        Learn React
      </a>
    </header>
  );
}

function MetalBall(){
  return(
    <div>
      <Helmet>
        <script type="module" src="https://ajax.googleapis.com/ajax/libs/model-viewer/3.4.0/model-viewer.min.js"></script>
      </Helmet>
      <div className='logoAnimation'>
        <model-viewer camera-controls="" touch-action="pan-y" src="https://modelviewer.dev/shared-assets/models/NeilArmstrong.glb">
        </model-viewer>
      </div>
    </div>
  );
}


// function LogoAnimation (){
//   return(
//     <div className='logoAnimation'>
//       <model-viewer roughness="0" metalness="1" id="model-viewer" powerpreference="low-power" reveal="auto" exposure="50" environment-image="./logo/background.jpeg" src={globalFireLogo} alt="NM 3D Logo" auto-rotate="" auto-rotate-delay="0" rotation-per-second="30deg" ar-status="not-presenting">
//       </model-viewer>
//     </div>
//   );
// }

// function Header() {
//   return (
//     <header className="App-header">
//       <img src={logo} className="App-logo" alt="GlobalFire-logo" />
//       <p>
//         Edit <code>src/App.js</code> and save to reload.
//       </p>
//       <a className="App-link" href="https://reactjs.org" target="_blank" rel="noopener noreferrer">
//         Learn React
//       </a>
//     </header>
//   );
// }

function App() {
  return (
    <div className="App">
      <Header />
      <MetalBall />
      {/* <LogoAnimation /> */}
    </div>
  );
}

export default App;