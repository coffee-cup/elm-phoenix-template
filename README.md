# elm-phoenix-template

This is a simple webserver using [Elixir Phoenix](http://www.phoenixframework.org/) and [Elm](http://elm-lang.org). [Here is an example of the result](https://elm-phoenix-template.herokuapp.com/).

## Features 💥

- [Phoenix](http://www.phoenixframework.org/)
- [Elm](http://elm-lang.org/)
- [Elm Phoenix Socket](https://github.com/fbonetti/elm-phoenix-socket)
- [ES6](https://github.com/lukehoban/es6features)
- [ESLint](http://eslint.org/)
- [Prettier](https://github.com/prettier/prettier)
- [Webpack](https://webpack.github.io/)
- [PostCSS](https://github.com/postcss/postcss)
- [SCSS](http://sass-lang.com/)
- [Tachyons](http://tachyons.io/)
- Live reloading
- Elm environment flags
- Ready to deploy to [Heroku](https://dashboard.heroku.com/)

## Development ✨

1. Clone repo
1. `mix deps.get`
1. `mix ecto.create && mix ecto.migrate`
1. `yarn install`
1. `mix phoenix.server`

Visit [`localhost:4000`](http://localhost:4000) in your browser.

### Build

The frontend is built with [Webpack](https://webpack.js.org/). This is taken care of for you when starting phoenix.

Phoenix uses the PostgreSQL database. I recommend using the [docker container](https://hub.docker.com/_/postgres/). It must be running before you run the command `mix ecto.create`.

## Source 👼

- Elixir in `lib/` and `web/`
- Elm in `web/elm`
- SCSS in `web/static/scss`
- Public files in `web/static/assets`
- Fonts in `web/static/fonts`

## Deployment 🚀

This template is setup to deploy to Heroku.

```
heroku create
heroku config:set SECRET_KEY_BASE=$(mix phoenix.gen.secret)
heroku config:set WEBSOCKET_URL="wss://YOUR-HEROKU-APP.herokuapp.com/socket/websocket"
heroku addons:create heroku-postgresql:hobby-dev
heroku buildpacks:set https://github.com/gjaldon/phoenix-static-buildpack
heroku buildpacks:add --index 1 https://github.com/HashNuke/heroku-buildpack-elixir

```
