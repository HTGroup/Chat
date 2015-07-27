var app, applicationDirectory, config, express, http, io, path, pub;

applicationDirectory = __dirname + '/application/';

express = require('express');

app = express();

path = require('path');

config = require(applicationDirectory + 'config');

http = require('http').Server(app);

io = require('socket.io')(http);


/* Path to express public directory */

pub = __dirname + '/public';

app.set('views', 'views');

app.set('view engine', 'ejs');

app.use(express['static'](pub));


/* Adapter */

require(applicationDirectory + 'adapter')(config);

require(applicationDirectory + 'controllers').prototype.init();


/* Routing */

require(applicationDirectory + 'routes').prototype.init(app, io);

http.listen(config.port, function() {
  console.log('Server started. Link: http(s)://' + config.url + ':' + config.port);
});
