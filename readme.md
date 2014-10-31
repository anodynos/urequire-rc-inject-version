[uRequire](http://urequire.org) [ResourceConverter](http://urequire.org/resourceconverters.coffee) that injects a `var VERSION = ''` where its needed: before the body of the 'main' module of your bundle (or any other module).

# Usage

* Add 'urequire-rc-inject-version' to your `package.json` / `node_modules` (i.e `npm install urequire-rc-inject-version --save`).

* add 'inject-version' to your `bundle.resources`, eg :

```
  resources: [
    ...
    'inject-version'
    ...
   ]

```

By default:

 * it reads the `version` of your project's `package.json`.

 * It adds it before the body of the 'main' module, if `bundle.main` is defined (otherwise it fails, unless `options.modules` is passed).

To override these defaults use it as `['inject-version', options]` where options is a `{}` like this:

```
    [ 'inject-version', {
        VERSION: pkg.version + '-NIGHTLY',
        modules: 'my/module/path/**/*'
       }
    ]
```

The `modules` can be a `String` or an `Array` of module paths (always relative to `bundle.path`, without `.js`) that filters module paths using [`is_file_in`](https://github.com/anodynos/is_file_in) which is minimatch on steroids.

For example:

```
    [ 'inject-version', {
        VERSION: pkg.version + '-NIGHTLY',
        modules: ['models/**/*', '!models/aliens/**/*', /integration/]
       }
    ]
```

### See more ResourceConverter usage / configuring examples

http://github.com/anodynos/urequire-rc-less/

http://urequire.org

# License

The MIT License

Copyright (c) 2014 Agelos Pikoulas (agelos.pikoulas@gmail.com)

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
