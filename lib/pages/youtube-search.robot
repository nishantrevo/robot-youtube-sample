*** Settings ***
Documentation    Youtube search keywords
Resource		../common.robot

*** Keywords ***
Search video
		[Arguments]		${keyword}
		wait until element is present and visible		${searchInputSelector}		10
		input text		${searchInputSelector}		${keyword}
		click element		${searchButtonSelector}
		wait until location contains		${searchUrl}
		${selector}=		format string		${searchResultTitleSelectorTemplate}		1
		wait until element is present and visible		${selector}		20

Get title of search result
		[Arguments]		${position}
		${selector}=		format string		${searchResultTitleSelectorTemplate}		${position}
		Log Many		Selector for search result		${selector}
		wait until element is present and visible		${selector}		20
		${title}=		get text		${selector}
		Log many		title		${title}
		[Return]		${title}

Open search result
		[Arguments]		${position}
		${selector}=		format string		${searchResultTitleSelectorTemplate}		${position}
		Log Many		Selector for search result		${selector}
		wait until element is present and visible		${selector}		20
		${href}=		get element attribute		${selector}		href
		Log many		href		${href}
		click element		${selector}
		wait until location contains		${href}