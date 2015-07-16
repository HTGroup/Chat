var app, express, http, io, pub;

express = require('express');

app = express();

http = require('http').Server(app);

io = require('socket.io')(http);


/* Path to our public directory */

pub = __dirname + '/public';

app.use(express["static"](pub));

app.set('view engine', 'ejs');

app.set('views', pub);

app.get('/', function(req, res) {
  res.render('index', {
    title: 'iBuilder'
  });
});

io.on('connection', function(socket) {
  console.log('a user connected');
});

http.listen(3000, function() {
  console.log('listening on *:3000');
});
