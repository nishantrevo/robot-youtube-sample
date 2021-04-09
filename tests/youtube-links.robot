*** Settings ***
Documentation		Youtube link tests
Resource		../lib/pages/youtube-keywords.robot
Test Setup		open youtube page		${youtubeUrl}		${browser}		${grid_url}
Test Teardown		Close current browser

*** Test Cases ***

Share link opens same video
		search video		${searchKeyword}
		${titleInResult}=		Get title of search result		1
		open search result		1
		video title is		${titleInResult}
		open share options
		${link}=		get share link
		open in new tab		${link}
		video title is		${titleInResult}




