*** Settings ***
Documentation    Youtube video page keywords
Resource		../common.robot

*** Keywords ***
Get title of video
		wait until element is present and visible		${videoTitleSelector}		10
		${title}=		get text		${videoTitleSelector}
		Log many		title		${title}
		[Return]		${title}
video title is
		[Arguments]		${expectedTitle}
		${titleVideo}=		Get title of video
		Should be equal		${titleVideo}		${expectedTitle}
Open share options
		wait until element is present and visible		${shareButtonSelector}		10
		click element		${shareButtonSelector}

Get share link
		wait until element is present and visible		${shareLinkTextSelector}		10
		${link}=		get value		${shareLinkTextSelector}
		Log many		Share Link:		${link}
		[Return]		${link}