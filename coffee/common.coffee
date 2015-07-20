###*
# Created by Ihor on 15.07.2015.
###

app =
    Models: {}
    Collections: {}
    path: '../'

require.config
    paths:
        'blocks': app.path + 'Library/blocks'
        'jquery': app.path + 'Library/jquery-2.1.4.min'
        'velocity': app.path + 'Library/velocity'
        'socket': app.path + 'Library/socket.io.min'
    shim:
        'jquery':
            exports: '$'
        'socket':
            exports: 'io'

@loadView = (name) ->
    if typeof name == 'string'
        require [ '../Views/' + name ]
    else if typeof name == 'object'
        Array::forEach.call name, (el, i) ->
            require [ '../Views/' + el ]
            return
    return

define [ 'socket' ], (io) ->
    socket = io(window.location.href)
    console.log io, socket
    socket.on 'news', (data) ->
        console.log data
        socket.emit 'my other event', my: 'data'
        return