*** Settings ***
Library    AppiumLibrary


*** Variables ***
${remote_url}            http://localhost:4723
${google_account1}     srakshitha296@gmail.com
${google_account2}      csestudent48@gmail.com
${existing_google_account1}     srakshitha296@gmail.com
${email}              user@example.com
${password}      123Abc$
@{rooms}        Bedroom    Hall Room      Kitchen

*** Keywords ***
Open App
    Open Application    http://localhost:4723    platformName=Android    deviceName=5TYP8DQWPBS45DHM
    ...    appPackage=com.example.habiteck
    ...    appActivity=getstarted.LandingActivity
    ...    automationName=UiAutomator2

Launch the app
     Open App
     Wait Until Page Contains Element    xpath=//android.widget.Button[@text='Get Started']    15s

Tap on
    [Arguments]     ${button_name}
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='${button_name}']      10s
    Click Element    xpath=//android.widget.Button[@text='${button_name}']
    Sleep       3s


Verify visibility
    [Arguments]     ${title}
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='${title}']       15s

Choose account
    [Arguments]     ${google_account}
    Click Element   xpath=//android.widget.TextView[@text='${google_account}']
    Sleep    2s

Scan QR
    Sleep    5s

Location access
    [Arguments]     ${permission_type}
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='${permission_type}']    15s
    Tap on      ${permission_type}
    Wait Until Page Contains Element   xpath=//android.widget.Switch[@resource-id="android:id/checkbox"]    5s
    Click Element    xpath=//android.widget.Switch[@resource-id="android:id/checkbox"]
    Wait Until Page Contains Element    xpath=//android.widget.Button[@content-desc="Navigate up"]    5s
    Click Element    xpath=//android.widget.Button[@content-desc="Navigate up"]
    Sleep   20s
    Click Element    xpath=//android.widget.Button[@text='CONTINUE']
    Sleep    2s

Camera access
    [Arguments]     ${permission_type}
    Verify visibility       Allow HabiTeck to take pictures and record video?
    Tap on      ${permission_type}
    Scan QR

 Go to
    [Arguments]     ${navigation_name}
    Verify visibility    ${navigation_name}
    Wait Until Page Contains Element    xpath=//android.widget.FrameLayout[@content-desc="${navigation_name}"]    10s
    Click Element    xpath=//android.widget.FrameLayout[@content-desc="${navigation_name}"]
#    Sleep    2s

 Sign out
    Tap on    Sign Out
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Welcome Back!']    10s

SignIn through google account
    [Arguments]     ${google_account}
    Launch the app
    Tap on      Get Started
    Tap on      Sign in
    Tap on      Continue with Google
    Verify visibility    Choose an account
    Choose account      ${google_account}



Choose room
    Swipe    ${523}    ${1054}    ${526}    ${610}
    FOR    ${room}    IN    @{rooms}
        Click Element    xpath=//android.widget.TextView[@text="${room}"]
#        Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="${room}"]
        Sleep      2s
        Capture Page Screenshot
        Click Element    xpath=//android.widget.ImageButton[@content-desc="Back"]
    END


