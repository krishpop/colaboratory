#!/bin/bash
# Builds and installs the web app

# copy static files to build directory
cp -r static build/

# copy Google Closure library to build directory
cp -r ../closure-library/closure/goog/* build/static/frontend/js/

# Create deps.js
../closure-library/closure/bin/build/depswriter.py --root=../closure-library/closure/goog --root=static/frontend/js/ > build/static/frontend/js/deps.js

# copy Google Closure css
mkdir -p build/static/frontend/css
cp -r ../closure-library/closure/goog/css/* build/static/frontend/css/

# copy extern files into build directory
cp -r extern/* build/static/

# copy files built by the Google build system to build directory
# (note, this files should be replaced with files that are built
# directly from source.
cp -r built_js/* build/static/frontend/js
cp -r built_css/* build/static/frontend/css