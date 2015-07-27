###*
# Created by Ihor on 15.07.2015.
###

define ->
  require [ app.path + 'Collections/Product', 'socket' ], (collection, io)->
    App = blocks.Application()
    mess = App.Model

    App.View 'Block',
      name: blocks.observable('')
      text: blocks.observable('')
      add: ->
        this.Products.add()
      remove: ->
        this.Products.remove()


    App.View 'Block', 'Products',
      options: url: 'templates/blog.tpl'
      cnt: 1
      sock: null
      products: app.Collections.Product([
        {
          name: 'HTML'
          text: 'Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.'
        }
      ])
#https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Drag_and_drop
      remove: ->
        @products.pop()

      init: ->
        _this = @
        _this.sock = io(window.location.href)

        _this.sock.on 'add_new_row_added', (res)->
          if res.result is true
            _this.products.add
              name: res.data.name
              text: res.data.text
            return
        return

      add: ->
        _this = @
        _this.cnt++
        _this.sock.emit 'add_new_row', my:
          name: _this._parentView.name()
          text: _this._application.Block.text()


        ###@products.unshift
            name: 'Element ' + @cnt
            version: '5.0'
            link: 'w3.org'###

        ###this.products.addMany([{ name: 'HTML'+this.cnt, version:"5.0", link: "w3.org" }, { name: 'CSS'+this.cnt, version:"3.0", link: "w3.org" }, { name: 'JavaScript'+this.cnt, version:"6.0", link: "w3.org" }]);###

        return
    return
  true