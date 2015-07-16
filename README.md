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
      * Microsoft Visual Studio C++ 2013 for Windows Desktop ([Express][msvc2013] version works well)

#Run code

```sh
$ npm install -g node-gyp --python /path/to/python2.7
$ npm config set python /Python27/python.exe --global
$ npm i -d
```