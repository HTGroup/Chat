View = require("../views/Home")
HomeModel = require("../models/Home")

_HomeController =
  run: (req, res)->
    v = new View(res, 'index')
    ###test = new HomeModel({name: "AAAA"})
    test.save (err, users)->
      console.log(err, users)###

    HomeModel.find().exec (err, home)->
      v.render(
        title: if home[0]? then home[0].name else "Hello World!"
      )

module.exports = _HomeController