String::capitalize = ->
  @charAt(0).toUpperCase() + @slice(1)

module.exports = ->
  fs = require('fs')
  path = require('path')
  dir = __dirname + '/'
  fs.readdir dir, (err, files) ->
    if err
      throw err
    files.forEach (file) ->
      file = path.parse(file, '.js')
      return if file.name is "index"
      global[file.name.capitalize()] = require('./' + file.name)
      return
    return
  return