// Import styles

import 'tachyons/css/tachyons.css';
import '../scss/app.scss';

// Import dependencies

// import socket from './socket';

// Elm
//
import Elm from '../../elm/Main.elm';

const elmDiv = document.getElementById('elm-main');

Elm.Main.embed(elmDiv, {
  prod: process.env.NODE_ENV === 'production',
  websocketUrl: process.env.WEBSOCKET_URL
});
