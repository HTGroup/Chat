http = require('http')
http.createServer((req,res)->
  res.end 'Hello world'

).listen 1337, '127.0.0.1'
console.log "Server running"