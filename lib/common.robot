*** Settings ***
Documentation		Common keywords
Library		SeleniumLibrary
Library		String
Library		./CustomKeywords.py
*** Keywords ***
Close current browser
		capture page screenshot
		close browser

Close current tab
		capture page screenshot
		close window

wait until element is present and visible
		[Arguments]		${selector}		${timeout}
		wait until page contains element		${selector}		timeout=${timeout}
		wait until element is visible		${selector}		timeout=${timeout}

Open in new tab
		[Arguments]		${url}
		${jsCommand}=		format string		window.open('{}');		${url}
		Execute Javascript   ${jsCommand}
		switch window		NEW
