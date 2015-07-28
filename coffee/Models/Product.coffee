###*
# Created by Ihor on 15.07.2015.
###

define [ 'blocks' ], (blocks) ->
    App = blocks.Application()
    app.Models['Product'] = App.Model(
        name: App.Property()
        version: App.Property()
        link: App.Property()
        remove: ->
            this.destroy(true)
    )
    app.Models['Product']
