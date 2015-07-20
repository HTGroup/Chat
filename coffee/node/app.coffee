applicationDirectory = __dirname + '/application/'
express = require('express')
app = express()
path = require('path')
config = require(applicationDirectory + 'config')
http = require('http').Server(app)
io = require('socket.io')(http)
### Path to express public directory ###
pub = __dirname + '/public'
app.set 'views', 'views'
app.set 'view engine', 'ejs'
app.use express['static'](pub)


### Adapter ###
require(applicationDirectory + 'adapter')(config)
require(applicationDirectory + 'controllers')::init();

### Routing ###
require(applicationDirectory + 'routes')::init(app)

### Socket ###
require(applicationDirectory + 'socket')::init(io)

http.listen config.port, ->
  console.log 'Server started. Link: http(s)://' + config.url + ':' + config.port
  return