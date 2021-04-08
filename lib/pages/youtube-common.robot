*** Settings ***
Documentation    Youtube home page keywords
Resource		../common.robot

*** Keywords ***
Open youtube page
		[Arguments]		${url}		${browser}
		open browser		url=${url}		browser=${browser}
		Give consent if needed
		wait until location contains		${url}		timeout=20
		Say no to sign-in pop up if present
Give consent if needed
		${redirectToConsent}=		run keyword and return status		wait until location contains		${consentDomain}		timeout=10
		run keyword if		${redirectToConsent}		Give consent
Give consent
		wait until location contains		${consentDomain}		timeout=20
		wait until element is present and visible		${iAgreeButtonSelector}		20
		click button		${iAgreeButtonSelector}
Say no to sign-in pop up if present
		${signInPopup}=		run keyword and return status		wait until element is present and visible		${noThanksButtonSelector}		5
		run keyword if		${signInPopup}		Say no to sign-in pop up
Say no to sign-in pop up
		wait until element is present and visible		${noThanksButtonSelector}		20
		click element		${noThanksButtonSelector}
		wait until element is not visible		${noThanksButtonSelector}		timeout=10

resume video playback
		wait until element is present and visible		${playerSelector}		10
		click element		${playerSelector}

skip ads
		wait until element is present and visible		${skipAdsTimerSelector}		20
		wait until element is not visible		${skipAdsTimerSelector}		timeout=10		error="Skip ads countdown did not expire"
		wait until element is present and visible		${skipAdsButtonSelector}		20
		click element		${skipAdsButtonSelector}
