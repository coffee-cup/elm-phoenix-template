// Import styles
import 'tachyons/css/tachyons.css';
import '../scss/app.scss';

// Import dependencies
import randomColour from 'randomcolor';
console.log(randomColour());

// import socket from './socket';

// Elm

import Elm from '../../elm/Main.elm';

const elmDiv = document.getElementById('elm-main');

Elm.Main.embed(elmDiv, {
  websocketUrl: process.env.WEBSOCKET_URL
});
