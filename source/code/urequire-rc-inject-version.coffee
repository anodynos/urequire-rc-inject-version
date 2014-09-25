fs = require 'fs'
_ = require 'lodash'

VERSION = (JSON.parse fs.readFileSync process.cwd() + '/package.json').version

module.exports = [
 '+inject-version'

 "injects a `var VERSION = 'x.x.x'` where its needed."

 ['**/*.js']

 (m)->  # @todo: use isFileInSpecs instead of these if's
   if (_.isString(@options.modules) and (m.path is @options.modules)) or
      (_.isArray(@options.modules) and (m.path in @options.modules)) or
      (m.path is m.bundle.main)
        m.beforeBody = "var VERSION = '#{@options.VERSION or VERSION}'; // injected by urequire-rc-inject-version"
]