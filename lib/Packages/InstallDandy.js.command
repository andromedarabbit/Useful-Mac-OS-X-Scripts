#!/usr/bin/env node
var shell = require('shelljs');
var path = require('path');
var toolbox = require('toolbox-js');

// 한글 맞춤법 검사기
var homeDir = shell.env['HOME'];
var dandyWorkflowFilePath = path.join(homeDir, 'Library/Services/dandy.workflow');

if(shell.test('-e', dandyWorkflowFilePath)) {
	toolbox.executeCmdAsync('curl https://raw.github.com/fallroot/dandy/master/bin/uninstall.sh | sh');
}

toolbox.executeCmdAsync('curl https://raw.github.com/fallroot/dandy/master/bin/install.sh | sh');

toolbox.executeCmdAsync('open http://soooprmx.com/wp/archives/3863');


