var HomeModel, View, _HomeController;

View = require("../views/Home");

HomeModel = require("../models/Home");

_HomeController = {
  run: function(req, res) {
    var v;
    v = new View(res, 'index');

    /*test = new HomeModel({name: "AAAA"})
    test.save (err, users)->
      console.log(err, users)
     */
    return v.render({
      title: "Hello World!"
    });
  }
};

module.exports = _HomeController;
