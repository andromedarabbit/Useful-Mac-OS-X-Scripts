#!/usr/bin/env node
// reference: http://www.maclife.com/article/howtos/how_sync_chat_transcripts_dropbox
var shell = require('shelljs');
var path = require('path');
var toolbox = require('toolbox-js');
var prompt = require('prompt');
var fs = require('fs');

var homeDir = toolbox.getHomeDir();
var possibleTargetDirs = [
	path.join(homeDir, 'Dropbox'),
	path.join( path.join(homeDir, 'Documents'), 'Dropbox')
];

var targetDir;
for(var i = 0; i < possibleTargetDirs.length; i++) {
	var thisDir = possibleTargetDirs[i];
	
	if( shell.test('-d', thisDir) ) {
		targetDir = thisDir;
	}
}


if(shell.test('-d', targetDir)) {
	setup(targetDir);
	return;
}

prompt.start();

shell.echo('Please let me know where Dropbox folder is: ');

prompt.get(['targetDir'], function (err, result) {
    if (err) { 
		console.error('Error occurs!'.error);
		return onErr(err); 
	}

	targetDir = result.targetDir;
	if(!shell.test('-d', targetDir)) {
		console.error('Droopbox folder not found!'.error);
	}

	setup(targetDir);
	return;
});

function setup(targetDir) {
	var dropboxAdiumDir = path.join(targetDir, 'Apps/Adium');
	shell.echo('All chat histories will be stored in ' + dropboxAdiumDir);
	
	shell.mkdir('-p', dropboxAdiumDir);
	
	var adiumUserDir = path.join(homeDir, '/Library/Application Support/Adium 2.0/Users/Default/');
	var srcDir = path.join(adiumUserDir, 'Logs');
	
	var fileStat = fs.lstatSync(srcDir);
	if( fileStat.isSymbolicLink() ) {
		console.info('already installed!');
		return;
	} 
	/*
	if(shell.test('-e', srcDir)) {
		toolbox.moveFilesSyncRecursive(srcDir, dropboxAdiumDir);
	}
	
	shell.rm('-rf', srcDir);
	
	toolbox.executeCmdSync('ln -s "' + dropboxAdiumDir + '" "' + srcDir + '"');
	*/
	console.log('df ' + srcDir);
}