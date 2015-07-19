var app, applicationDirectory, config, express, http, i, io, page, path, pub, routes;

applicationDirectory = __dirname + '/application/';

express = require('express');

app = express();

path = require('path');

config = require(applicationDirectory + 'config');

http = require('http').Server(app);

io = require('socket.io')(http);


/* Path to express public directory */

pub = __dirname + '/public';


/* Adapter */

require(applicationDirectory + 'adapter')(config);

require(applicationDirectory + 'controllers')();

routes = require(applicationDirectory + 'routes')();

app.set('views', 'views');

app.set('view engine', 'ejs');

app.use(express['static'](pub));


/* Routing */

for (i in routes) {
  page = routes[i];
  app[page.type](page.link, page.control);
}


/* Socket */

io.on('connection', function(socket) {});

http.listen(config.port, function() {
  console.log('Server started. Link: http(s)://' + config.url + ':' + config.port);
});
