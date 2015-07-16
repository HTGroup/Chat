module.exports = (app) ->
  fs = require('fs')
  path = require('path')
  dir = __dirname + '/'
  fs.readdir dir, (err, files) ->
    if err
      throw err
    files.forEach (file) ->
      file = path.parse(file, '.js')
      return if file.name is "index"
      app.Controllers[file.name] = require('./' + file.name)
      return
    return
  return