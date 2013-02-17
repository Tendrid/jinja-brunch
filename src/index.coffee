
sysPath = require 'path'

module.exports = class JinjaCompiler
  brunchPlugin: yes
  type: 'template'
  extension: 'html'
  pattern: /\.(?:html|jinja)$/

  constructor: (@config) ->
    null

  compile: (data, path, callback) ->
    try
      data = data.replace(/\n/g,"\\")
      result = "module.exports = function(context){ return Jinja.render('#{data}', context); };"
    catch err
      error = err
    finally
      callback error, result

  include: [
    (sysPath.join __dirname, '..', 'vendor',
      'build.js')
  ]