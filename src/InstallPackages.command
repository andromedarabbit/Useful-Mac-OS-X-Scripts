#!/usr/bin/env node
var shell = require('shelljs');
var path = require('path');

function executeCmdAsync(cmd) {
	console.log(cmd);
	
	var executable = shell.exec( cmd, {async:true, silent:false}, function(code, output) {
  
		if(code != 0) {
			console.error('error occurs with an exit code ' + code);
			console.log();
			
			console.error('Program output:');
			console.error(output);
			
			shell.exit(code);
		}
	});
	
	console.log();
}

function executeCmdSync(cmd) {
	console.log(cmd);

	var executable = shell.exec( cmd, {async:false, silent:false} );
	var code = executable.code;
	var output = executable.output;
	
	console.log('Exit code:', code);
	console.log('Program output:', output);
  
	if(code != 0) {
		console.error('error occurs: exit code ' + code);
		shell.exit(code);
	}
}

executeCmdAsync('./Finder/InstallMarkdownQuicklookAndSpotlightSupport.js.command');

var homeDir = shell.env['HOME'];
var dandyWorkflowFilePath = path.join(homeDir, 'Library/Services/dandy.workflow');

if(!shell.test('-e', dandyWorkflowFilePath)) {

	executeCmdAsync('curl https://raw.github.com/fallroot/dandy/master/bin/install.sh | sh');

	executeCmdAsync('open http://soooprmx.com/wp/archives/3863');
}


