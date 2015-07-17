String.prototype.capitalize = function() {
  return this.charAt(0).toUpperCase() + this.slice(1);
};

module.exports = function() {
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
      global[file.name.capitalize()] = require('./' + file.name);
    });
  });
};
