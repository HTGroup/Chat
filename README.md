# Installation Node
- ## Installing on Linux
    - You can install a pre-built version of node.js via [the downloads page](http://nodejs.org/download/) available in a **.tar.gz**.
    - Or you can use the automatic bash [Installer](https://github.com/taaem/nodejs-linux-installer/releases).

- ## Installing on Mac
    - You can install a pre-built version of node.js via [the downloads page](http://nodejs.org/download/) using a **.pkg** 
    - or available in a **.tar.gz**.

- ## Installing on Windows
    - You can install a pre-built version of node.js via [the downloads page](http://nodejs.org/download/) using a **.exe** or a **.msi**.

# Installation Builder
  * On Unix:
    * `python` (`v2.7` recommended, `v3.x.x` is __*not*__ supported)
    * `make`
    * A proper C/C++ compiler toolchain, like [GCC](https://gcc.gnu.org)
  * On Mac OS X:
    * `python` (`v2.7` recommended, `v3.x.x` is __*not*__ supported) (already installed on Mac OS X)
    * [Xcode](https://developer.apple.com/xcode/downloads/)
      * You also need to install the `Command Line Tools` via Xcode. You can find this under the menu `Xcode -> Preferences -> Downloads`
      * This step will install `gcc` and the related toolchain containing `make`
  * On Windows:
    * `Python` ([`v2.7.3`](http://www.python.org/download/releases/2.7.3#download) recommended, `v3.x.x` is __*not*__ supported)
      * Make sure that you have a PYTHON environment variable, and it is set to drive:\path\to\python.exe not to a folder
    * Windows XP/Vista/7/8:
      * [`Microsoft SDK`](https://www.microsoft.com/en-us/download/confirmation.aspx?id=8279)
        * If the install fails, try uninstalling any C++ 2010 x64&x86 Redistributable that you have installed first
        * If you get errors that the 64-bit compilers are not installed you may also need the [compiler update for the Windows SDK 7.1]
    * Windows 7/8:
      * Microsoft Visual Studio C++ 2013 for Windows Desktop

#Run code

```sh
$ npm install -g node-gyp --python /Python27/python.exe
$ npm config set python /Python27/python.exe --global
$ npm i -d
$ node app
```

#BackEnd

### Connecting to MongoDB

First, we need to specify the connection in the configuration file: index.js.
```sh
$ cd application/config
```
For Example, we next is used for connection [`Mongoose`](https://github.com/Automattic/mongoose#connecting-to-mongodb)
```js
_Config = {
  url: '127.0.0.1',
  port: 3000,
  mode: 'local',
  dataBase: {
    mongo: {
      host: '127.0.0.1',
      port: 27017,
      user: "",
      password: "",
      table: "test"
    }
  }
}
```
### Defining a Model

To work with the models , we need to access the folder
```sh
$ cd application/models
```

Models are defined through the Schema interface
```js
Model = require("./index");

module.exports = new Model('home', {
  name: String
});
```

And return mongoose Model
```js
module.exports = mongoose.model('home', homePage);
```

Aside from defining the structure of your documents and the types of data you're storing, a Schema handles the definition of:

* [Validators](http://mongoosejs.com/docs/validation.html) (async and sync)
* [Defaults](http://mongoosejs.com/docs/api.html#schematype_SchemaType-default)
* [Getters](http://mongoosejs.com/docs/api.html#schematype_SchemaType-get)
* [Setters](http://mongoosejs.com/docs/api.html#schematype_SchemaType-set)
* [Indexes](http://mongoosejs.com/docs/guide.html#indexes)
* [Middleware](http://mongoosejs.com/docs/middleware.html)
* [Methods](http://mongoosejs.com/docs/guide.html#methods) definition
* [Statics](http://mongoosejs.com/docs/guide.html#statics) definition
* [Plugins](http://mongoosejs.com/docs/plugins.html)
* [pseudo-JOINs](http://mongoosejs.com/docs/populate.html)

### Compiling a View

To work with the views , we need to access the folder
```sh
$ cd application/views
```

Each views inlet has: response and name template, and must also have three main parameters
```js
path = require('path');
filename = path.parse(__filename);

module.exports = function(response, template) {
  this.name = filename.name;
  this.response = response;
  this.template = this.name + "/" + template;
};
```

And the method of rendering the page
```js
module.exports.prototype = {
  render: function(data) {
    if (this.response && this.template) {
      this.response.render(this.template, data);
    }
  }
};
```

### Overview a Controllers

To work with the models , we need to access the folder
```sh
$ cd application/controllers
```

Controllers are comprised of a collection of methods called actions. Action methods can be bound to routes in your application so that when a client requests the route, the bound method is executed to perform some business logic and (in most cases) generate a response.
```js
var HomeModel, View, _HomeController;
View = require("../views/Home");
HomeModel = require("../models/Home");

_HomeController = {
  run: function(req, res) {
    var v;
    v = new View(res, 'index');
    HomeModel.find().exec(function(err, param) {
      v.render({
        param: param
      });
    });
  }
};

module.exports = _HomeController;
```

### Custom Routes

To work with the routes, we need to access the folder and open index.js
```sh
$ cd application/controllers
```
We allow you design your app's URLs in any way you like- there are no framework restrictions.

```js
rout = {
    home: {
      type: 'get',
      link: '/',
      control: function(req, res) {
        HomeController.run(req, res);
      }
    },
    signup: {
      type: 'post',
      link: '/signup',
      control: AuthController.processSignup
    }
};
```
OR
```js
rout = [
    {
      type: 'get',
      link: '/',
      control: function(req, res) {
        HomeController.run(req, res);
      }
    },
    {
      type: 'post',
      link: '/signup',
      control: AuthController.processSignup
    }
];
```