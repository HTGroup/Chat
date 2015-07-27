HomeModel = require("../models/Home")
class HomeSocket
  init: (io)->
    if io?
      io.on 'connection', (socket) ->

        socket.emit 'news', hello: 'world'
        socket.on 'add_new_row', (msg) ->
          test = new HomeModel(msg.my)
          test.save (err, history)->

            socket.emit 'add_new_row_added',
              result: true
              data: history

            socket.broadcast.emit 'add_new_row_added',
              result: true
              data: history

            return

          return

        return
    return

module.exports = HomeSocket


