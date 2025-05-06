*** Settings ***
Resource        ../Resource/resource.robot

*** Test Cases ***
Test Room selection
    SignIn through google account       ${google_account1}
    Verify visibility    Home
    Choose room
