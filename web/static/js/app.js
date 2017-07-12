// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import 'phoenix_html';

// Import styles
import 'tachyons/css/tachyons.css';
import '../scss/app.scss';

// import socket from './socket';

// Elm

const Elm = require('../../elm/Main.elm');

const elmDiv = document.getElementById('elm-main');

Elm.Main.embed(elmDiv);
