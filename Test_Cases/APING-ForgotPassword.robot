*** Settings ***
Library  Collections
Library  RequestsLibrary
Library  String
*** Variables ***

*** Keywords ***
APING - Forgot Password
    Create Session  aping  ${urlAPING}  verify=True
	Set Test Variable  ${data}  {"email": "${email}","title": "${titleForgotPassword}","link": "${link}"}
	&{headers}=  Create Dictionary  Content-Type=application/json
	${resp}=  Post Request  aping  /forgot-password  data=${data}  headers=${headers}
	Log To Console    Forgot Password APING-Web Success! ${resp}
	Log To Console    Body Response ${resp.content}
	${body}=  Set Variable  ${resp.json()}
	${status}=  Get From Dictionary  ${body}  status
	Should Be Equal  ${status}  ${200}
	${message}=  Get From Dictionary  ${body}  message
	Log To Console     message ${message}
    ${forgotPasswordToken}=    Set Variable    ${resp.json()['or_use_this_token']}
    Log To Console    Forgot Password Token : ${forgotPasswordToken}
    set global variable  ${forgotPasswordToken}
    Log To Console    Forgot Password User Successfull!
