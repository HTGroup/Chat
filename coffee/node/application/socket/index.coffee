module.exports = class Socket
  init: (io)->
    io.on 'connection', (socket) ->

      socket.emit 'news', hello: 'world'
      socket.on 'my other event', (msg) ->
        console.log( msg )
        return




      return
    return




