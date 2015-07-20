###*
# Created by Ihor on 15.07.2015.
###

define ->
    require [ app.path + 'Collections/Product' ], ->
        App = blocks.Application()
        App.View 'Products',
            options: url: 'templates/blog.tpl'
            newProduct: app.Models.Product
            cnt: 1
            head: [
                { name: 'Name' }
                { name: 'Version' }
                { name: 'Link' }
            ]
            products: app.Collections.Product([
                {
                    name: 'HTML'
                    version: '5.0'
                    link: 'w3.org'
                }
                {
                    name: 'CSS'
                    version: '3.0'
                    link: 'w3.org'
                }
                {
                    name: 'JavaScript'
                    version: '6.0'
                    link: 'w3.org'
                }
            ])
            #https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Drag_and_drop
            dragStart: ->
                @cnt++
                @products.add
                    name: 'Element ' + @cnt
                    version: '5.0'
                    link: 'w3.org'

                ###this.products.addMany([{ name: 'HTML'+this.cnt, version:"5.0", link: "w3.org" }, { name: 'CSS'+this.cnt, version:"3.0", link: "w3.org" }, { name: 'JavaScript'+this.cnt, version:"6.0", link: "w3.org" }]);###

                return
        return
    true