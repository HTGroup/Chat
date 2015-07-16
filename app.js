var http;

http = require('http');

http.createServer(function(req, res) {
  return res.end('Hello world');
}).listen(1337, '127.0.0.1');

console.log("Server running");
