#!/usr/bin/env node
var shell = require('shelljs');

if( shell.which('pkill') ) {
    shell.exit(1);
}




