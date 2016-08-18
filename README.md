cernlib
=======

A version of `cernlib` with minor modifications to allow easier compilation on modern systems.
It was last confirmed to compile on `Ubuntu 16.04.1`. It requires `imake` which is included in the 
`xutils-dev` package. If you are still having trouble it may be beneficial to install the build-dependencies of the
version of `cernlib` in the repositories of your Linux distribution (if it exists).

The original code is taken from Jacek M Holeczek's 2005 patched release at
<http://www-zeuthen.desy.de/linear_collider/cernlib/new/cernlib_2005.html>.
The license information for CERNLIB can be found at <http://cernlib.web.cern.ch/cernlib/conditions.html>.

Compilation
-----------

Run: `build.sh`
Check the files in `cernlib_2005/2005/build/log/make.*` for errors. 
Make sure to check `cernlib_2005/2005/build/log/make.*`.
If you find errors enjoy the next several hours of debugging.

Usage
-----

Source `setup.sh`. This will setup the `CERN_LEVEL` and `CERN_ROOT` environment variables and add the binary 
directory to your path.




