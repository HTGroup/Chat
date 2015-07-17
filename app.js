var app, applicationDirectory, config, express, http, i, io, mongoose, page, path, pub, routes;

applicationDirectory = __dirname + '/application/';

express = require('express');

app = express();

path = require('path');

config = require(applicationDirectory + 'config')();

http = require('http').Server(app);

io = require('socket.io')(http);

mongoose = require('mongoose');


/* Path to express public directory */

pub = __dirname + '/public';

require(applicationDirectory + 'controllers')(mongoose);

routes = require(applicationDirectory + 'routes')();

app.set('views', 'views');

app.set('view engine', 'ejs');

app.use(express['static'](pub));

mongoose.connect('mongodb://' + config.mongo.host + ':' + config.mongo.port + '/test', function(err, db) {
  if (err != null) {
    return console.log(err);
  }
  console.log('Successfully connected to mongodb://' + config.mongo.host + ':' + config.mongo.port);
});


/* Routing */

for (i in routes) {
  page = routes[i];
  app[page.type](page.link, page.control);
}


/* Socket */

io.on('connection', function(socket) {});

http.listen(config.port, function() {
  console.log('Server started. Link: http(s)://' + config.mongo.host + ':' + config.port);
});
