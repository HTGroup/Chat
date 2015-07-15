###*
# Created by Ihor on 15.07.2015.
###

define [
  'blocks'
  app.path + 'Models/Product'
], (blocks, model) ->
  App = blocks.Application()
  app.Collections['Product'] = App.Collection(model)
  app.Collections['Product']
