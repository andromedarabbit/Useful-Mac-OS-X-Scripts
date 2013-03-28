#!/usr/bin/env node
var shell = require('shelljs');
var path = require('path');
var toolbox = require('toolbox-js');


// markdown 미리보기 등
toolbox.executeCmdAsync(
	path.join(__dirname, '/Packages/InstallMarkdownQuicklookAndSpotlightSupport.js.command')
	);

// 한글 맞춤법 검사기
toolbox.executeCmdAsync(
	path.join(__dirname, '/Packages/InstallDandy.js.command')
	);
	
// 한글 맞춤법 검사기
toolbox.executeCmdAsync(
	path.join(__dirname, '/Packages/SetupAdiumChatSyncWithDropbox.js.command')
	);