*** Settings ***
Library  Collections
Library  RequestsLibrary
Library  String
*** Variables ***

*** Keywords ***
APING - Register
#    Random Data
    ${randomAbc}  Generate Random String    4    ${LOWER}
    ${name}=  Set Variable    ${randomAbc}
    Set Global Variable     ${name}
    ${email}=    Set Variable  duls.${randomAbc}@gmail.com
    Set Global Variable     ${email}
    ${passwordUser}=    Set Variable    ${name}123
    Set Global Variable     ${passwordUser}

    ${randomNumber}     Generate Random String  10  [NUMBERS]
    ${randomPhone}      Set Variable    ${randomNumber}


    Create Session  aping  ${urlAPING}  verify=True
	Set Test Variable  ${data}  {"name":"${name}","email":"${email}","phone":"${randomPhone}", "password":"${passwordUser}","password_confirmation":"${passwordUser}"}
    &{headers}=     Create Dictionary   Content-Type=application/json
	${resp}=  POST Request  aping  /register  data=${data}  headers=${headers}
	Log To Console    Input Profile Response ${resp}
	Log To Console    Body Response ${resp.content}
	${body}=  Set Variable  ${resp.json()}
	${status}=  Get From Dictionary  ${body}  status
	Should Be Equal  ${status}  ${200}
    ${message}=  Get From Dictionary  ${body}  message
    Log To Console  Message : ${message}
    Log To Console  Register User Successfull!
