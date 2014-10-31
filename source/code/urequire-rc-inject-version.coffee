fs = require 'fs'
_ = require 'lodash'
isFileIn = require 'is_file_in'

VERSION = (JSON.parse fs.readFileSync process.cwd() + '/package.json').version

module.exports = [
 '+inject-version'

 "injects a `var VERSION = 'x.x.x'` where its needed: the bundle's main module & `options.modules`."

 ['**/*.js']

 (m)->
    m.bundle.ensureMain() if not @options.modules # throw if main not found
    if isFileIn(m.path, @options.modules) or m is m.bundle.mainModule
      m.beforeBody = "var VERSION = '#{@options.VERSION or VERSION}'; // injected by urequire-rc-inject-version"
]