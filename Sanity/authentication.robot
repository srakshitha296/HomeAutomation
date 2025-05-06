*** Settings ***
Resource    ../Resource/resource.robot
Test Teardown     Close Application

*** Test Cases ***
Test Signup through google account
    [Tags]      Signup
    Launch the app
    Tap on      Get Started
    Tap on      Sign up
    Tap on      Continue with Google
    Verify visibility    Choose an account
    Choose account     ${google_account1}
    Camera access       ONLY THIS TIME
    Location access     ONLY THIS TIME
    Verify visibility    Home
    Capture Page Screenshot
    Go to    Setting
    Sign out
    Capture Page Screenshot
#    Close Application

Test SignIn through google account
    [Tags]      signin
    Launch the app
    Tap on      Get Started
    Tap on      Sign in
    Tap on      Continue with Google
    Verify visibility    Choose an account
    Choose account      ${google_account1}
    Verify visibility    Home
    Capture Page Screenshot
    Go to    Setting
    Sign out
#    Close Application

Test Signup through email
    [Tags]      Signup
    Launch the app
    Tap on      Get Started
    Tap on      Sign up
    Input Text    id=com.example.habiteck:id/email    ${email}
    Input Password    id=com.example.habiteck:id/newPass    ${password}
    Input Password    id=com.example.habiteck:id/confirmPass    ${password}
    Swipe    ${523}    ${1054}    ${526}    ${610}
    Tap on    Signup
    Camera access       ONLY THIS TIME
    Wait Until Element Is Visible    xpath=//android.widget.Button[@text='ONLY THIS TIME']    10s
    Tap on     ONLY THIS TIME
    Sleep    20s
    Tap on      CONTINUE
    Verify visibility    Home
    Capture Page Screenshot
    Go to    Setting
    Sign out
    Capture Page Screenshot
#    Close Application

Test SignIn through email
    [Tags]      Signin
    Launch the app
    Tap on      Get Started
    Tap on      Sign in
    Input Text    id=com.example.habiteck:id/emailEditText    ${email}
    Input Password    id=com.example.habiteck:id/passwordEditText    ${password}
    Tap on    Login
    Verify visibility    Home
    Capture Page Screenshot
    Go to    Setting
    Sign out
    Capture Page Screenshot
#    Close Application

Test creating multiple account through google
    [Tags]      signup
    Launch the app
    Tap on      Get Started
    Tap on      Sign up
    Tap on      Continue with Google
    Verify visibility    Choose an account
    Choose account      ${google_account2}
    Wait Until Element Is Visible    xpath=//android.widget.Button[@text='ONLY THIS TIME']    10s
    Camera access       ONLY THIS TIME
    Tap on     ONLY THIS TIME
    Sleep    20s
    Tap on    CONTINUE
    Verify visibility    Home
    Capture Page Screenshot
    Go to    Setting
    Sign out
#    Close Application

Test switching account
    [Tags]      signin
    Launch the app
    Tap on      Get Started
    Tap on      Sign in
    Tap on      Continue with Google
    Verify visibility    Choose an account
    Choose account      ${google_account1}
    Verify visibility    Home
    Capture Page Screenshot
    Go to    Setting
    Sign out
    Tap on      Continue with Google
    Verify visibility    Choose an account
    Choose account      ${google_account2}
    Verify visibility    Home
    Capture Page Screenshot
#    Close Application

Test creating duplicate account through google
    [Tags]      signup
    Launch the app
    Tap on      Get Started
    Tap on      Sign up
    Tap on      Continue with Google
    Verify visibility    Choose an account
    Choose account      ${existing_google_account1}
    Verify visibility    Home
    Capture Page Screenshot
    Go to    Setting
    Sign out
#    Close Application

