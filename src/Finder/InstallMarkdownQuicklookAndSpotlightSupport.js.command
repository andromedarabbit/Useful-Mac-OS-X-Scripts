#!/usr/bin/env node
var shell = require('shelljs');
var path = require('path');

var downloadFromUrlScript = path.join(__dirname, '../Shell/DownloadFromUrl.command');
if( !shell.test('-e', downloadFromUrlScript) ) {
    shell.exit(1);
}

function downloadFromUrlToDir(url, dir) {
	if(!shell.test('-e', dir)) {
		shell.mkdir('-p', dir);
	}
	
	shell.pushd(dir);
	
	shell.exec( downloadFromUrlScript + ' ' + url, {async:false}, function(code, output) {
		console.log('Exit code:', code);
		console.log('Program output:', output);
  
  	  	shell.popd();
		
		if(code != 0) {
			shell.exit(code);
		}
	});
}

function unzipFile(dir, filename) {
	var filePath = path.join(dir, filename);
	if(!shell.test('-e', filePath)) {
		console.error('File Not Found: ' + filePath);
		shell.exit(1);
	}
	
	shell.pushd(dir);
	
	shell.exec( 'unzip ' + filename, {async:false}, function(code, output) {
		console.log('Exit code:', code);
		console.log('Program output:', output);
  
		shell.popd();
		
		if(code != 0) {
			shell.exit(code);
		}
	});
	
}

var homeDir = shell.env['HOME'];
var downloadDir = path.join(__dirname, 'downloads');

// Clean first
if(shell.test('-e', downloadDir)) {
	shell.rm('-Rf', downloadDir);
}

// Install the quicklook plugin for QuickLook

// ref: http://macnews.tistory.com/724
var quickLookFileName = 'QLMarkdown.Byword.qlgenerator';
var quickLookZipFileName = quickLookFileName + '.zip';

downloadFromUrlToDir('https://dl.dropbox.com/u/182299/Blog/' + quickLookZipFileName, downloadDir);

unzipFile(downloadDir, quickLookZipFileName);

var userQuickLookDir = path.join(homeDir, '/Library/QuickLook/');
if(!shell.test('-e', userQuickLookDir)) {
	shell.mkdir('-p', userQuickLookDir);
}

var quickLookDstFilePath = path.join(userQuickLookDir, quickLookFileName);
if(shell.test('-e', quickLookDstFilePath)) {
	shell.rm('-rf', quickLookDstFilePath);
}

shell.mv('-f',  path.join(downloadDir, quickLookFileName), userQuickLookDir);



// Spotlight support
// ref: http://brettterpstra.com/2011/10/18/fixing-spotlight-indexing-of-markdown-content/

var spotlightFileName = 'Markdown.mdimporter';
var spotlightZipFileName = spotlightFileName + '.zip';

downloadFromUrlToDir('http://brettterpstra.com/downloads/' + spotlightZipFileName, downloadDir);

unzipFile(downloadDir, spotlightZipFileName);

var userSpotlightDir = path.join(homeDir, '/Library/Spotlight/');
if(!shell.test('-e', userSpotlightDir)) {
	shell.mkdir('-p', userSpotlightDir);
}

var spotlightDstFilePath = path.join(userSpotlightDir, spotlightFileName);
if(shell.test('-e', spotlightDstFilePath)) {
	shell.rm('-rf', spotlightDstFilePath);
}

shell.mv('-f',  path.join(downloadDir, spotlightFileName), userSpotlightDir);

shell.exec( 'mdimport -r ' + spotlightDstFilePath, {async:false}, function(code, output) {
	console.log('Exit code:', code);
	console.log('Program output:', output);
  
	if(code != 0) {
		shell.exit(code);
	}
});



// Clean
if(shell.test('-e', downloadDir)) {
	shell.rm('-Rf', downloadDir);
}

