*** Settings ***
Library  Collections
Library  RequestsLibrary
Library  String
*** Variables ***

*** Keywords ***
APING - Reset Password
    Create Session  aping  ${urlAPING}  verify=True
	Set Test Variable  ${data}  {"password": "${passwordUser}","password_confirmation": "${passwordUser}","email": "${email}","token": "${forgotPasswordToken}"}
	&{headers}=  Create Dictionary  Content-Type=application/json
	${resp}=  Post Request  aping   /reset-password  data=${data}  headers=${headers}
	Log To Console    Reset Password APING-Web Success! ${resp}
	Log To Console    Body Response ${resp.content}
	${body}=  Set Variable  ${resp.json()}
	${status}=  Get From Dictionary  ${body}  status
	Should Be Equal  ${status}  ${200}
	${message}=  Get From Dictionary  ${body}  message
	Log To Console     Message : ${message}
	Log To Console     Reset Password User Successfull!