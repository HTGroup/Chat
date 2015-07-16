
express = require('express')
app = express()
http = require('http').Server(app)
io = require('socket.io')(http)

### Path to our public directory ###
pub = __dirname + '/public'
app.use express.static(pub)
app.set 'view engine', 'ejs'
app.set 'views', pub


app.get '/', (req, res) ->
  res.render 'index',
    title: 'iBuilder'
  return

io.on 'connection', (socket) ->
  console.log 'a user connected'
  return

http.listen 3000, ->
  console.log 'listening on *:3000'
  return