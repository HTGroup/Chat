var Schema, homePage, mongoose;

mongoose = require("mongoose");

Schema = mongoose.Schema;

homePage = new Schema({
  name: String
});

module.exports = mongoose.model('home', homePage);
