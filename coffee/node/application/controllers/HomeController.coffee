View = require("../views/Home")
HomeModel = require("../models/Home")
HomeSocket = require("../socket/HomeSocket")

class HomeController
  run: (req, res)->
    v = new View(res, 'index')

    new HomeSocket()

    HomeModel.find().exec (err, home)->
      v.render(
        title: "Hello World!"
      )
    return

    ###test = new HomeModel({name: "AAAA"})
    test.save (err, users)->
      console.log(err, users)

    #console.log HomeModel
    v.render(
      title: "Hello World!"
    )###
    #HomeModel.find().exec (err, home)->


module.exports = HomeController