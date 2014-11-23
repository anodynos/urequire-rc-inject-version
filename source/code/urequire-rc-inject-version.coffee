fs = require 'fs'
_ = require 'lodash'
umatch = require 'umatch'

VERSION = (JSON.parse fs.readFileSync process.cwd() + '/package.json').version

module.exports = [
 '+inject-version'

 "injects a `var VERSION = 'x.x.x'` where its needed: the bundle's main module & `options.modules`."

 ['**/*.js']

 (m)->
    if not @options.modules
      try
        m.bundle.ensureMain() # throw if main not found
      catch error
        err = new Error "urequire-rc-inject-version: can't find `main` module & `options.modules` is undefined"
        err.nested = error
        throw err

    if umatch(m.path, @options.modules) or (m is m.bundle.mainModule)
      m.beforeBody =
        ( if m.beforeBody then m.beforeBody + '\n' else '') +
        "var VERSION = '#{@options.VERSION or VERSION}'; // injected by urequire-rc-inject-version"
]