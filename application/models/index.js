module.exports = function(app) {
  var dir, fs, path;
  fs = require('fs');
  path = require('path');
  dir = __dirname + '/';
  fs.readdir(dir, function(err, files) {
    if (err) {
      throw err;
    }
    files.forEach(function(file) {
      file = path.parse(file, '.js');
      if (file.name === "index") {
        return;
      }
      app.Models[file.name] = require('./' + file.name);
    });
  });
};
