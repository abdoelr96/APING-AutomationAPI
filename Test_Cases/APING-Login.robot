*** Settings ***
Library  Collections
Library  RequestsLibrary
Library  String
*** Variables ***

*** Keywords ***
APING - Login with valid data
    Create Session  aping  ${urlAPING}  verify=True
	Set Test Variable  ${data}  {"email": "${email}","password": "${passwordUser}"}
	&{headers}=  Create Dictionary  Content-Type=application/json
	${resp}=  Post Request  aping  /login  data=${data}  headers=${headers}
	Log To Console    Login APING-Web Success! ${resp}
	Log To Console    Body Response ${resp.content}
	${body}=  Set Variable  ${resp.json()}
	${status}=  Get From Dictionary  ${body}  status
	Should Be Equal  ${status}  ${200}
	${message}=  Get From Dictionary  ${body}  message
	Log To COnsole     message ${message}!

	${user_id}=    Set Variable    ${resp.json()['result']['id']}
    Log To Console    user id : ${user_id}
    set global variable  ${user_id}

	${bearerToken}=    Set Variable    ${resp.json()['token']}
    Log To Console    Bearer Token : ${bearerToken}
    set global variable  ${bearerToken}
    Log To Console    Login User Successfull!

APING - Login with Invalid Email
    Create Session  aping  ${urlAPING}  verify=True
	Set Test Variable  ${data}  {"email": "${emailInvalid}","password": "${passwordUser}"}
	&{headers}=  Create Dictionary  Content-Type=application/json
	${resp}=  Post Request  aping  /login  data=${data}  headers=${headers}
	Log To Console    Login APING-Web Failed! ${resp}
	Log To Console    Body Response ${resp.content}
	${body}=  Set Variable  ${resp.json()}
	${status}=  Get From Dictionary  ${body}  status
	Should Be Equal  ${status}  ${400}
    ${message}=  Get From Dictionary  ${body}  message
	Log To Console     Message : ${message}!
	Log To Console    Login User Failed!

APING - Login with Invalid Password
    Create Session  aping  ${urlAPING}  verify=True
	Set Test Variable  ${data}  {"email": "${email}","password": "${passwordInvalid}"}
	&{headers}=  Create Dictionary  Content-Type=application/json
	${resp}=  Post Request  aping  /login  data=${data}  headers=${headers}
	Log To Console    Login APING-Web Failed! ${resp}
	Log To Console    Body Response ${resp.content}
	${body}=  Set Variable  ${resp.json()}
	${status}=  Get From Dictionary  ${body}  status
	Should Be Equal  ${status}  ${400}
    ${message}=  Get From Dictionary  ${body}  message
	Log To Console     Message : ${message}!
	Log To Console    Login User Failed!