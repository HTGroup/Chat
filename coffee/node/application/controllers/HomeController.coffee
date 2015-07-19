View = require("../views/Home")
HomeModel = require("../models/Home")

_HomeController =
  run: (req, res)->
    v = new View(res, 'index')
    ###test = new HomeModel({name: "AAAA"})
    test.save (err, users)->
      console.log(err, users)###

    #console.log HomeModel
    v.render(
      title: "Hello World!"
    )
    #HomeModel.find().exec (err, home)->


module.exports = _HomeController