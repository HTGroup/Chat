###*
# Created by Ihor on 15.07.2015.
###

app =
    Models: {}
    Collections: {}
    path: '../'
require.config paths:
    'blocks': app.path + 'Library/blocks'
    'jquery': app.path + 'Library/jquery-2.1.4.min'
    'velocity': app.path + 'Library/velocity'

@loadView = (name) ->
    if typeof name == 'string'
        require [ '../Views/' + name ]
    else if typeof name == 'object'
        Array::forEach.call name, (el, i) ->
            require [ '../Views/' + el ]
            return
    return
