*** Settings ***
Library  Collections
Library  RequestsLibrary
Library  String
*** Variables ***

*** Keywords ***
APING - Create Articel
    Create Session  aping  ${urlAPING}  verify=True
	Set Test Variable  ${data}  {"title": "${titleArticle}","body": "${bodyArticle}","picture": "${pictureArticle}"}
	&{headers}=  Create Dictionary  Content-Type=application/json   Authorization=Bearer ${bearerToken}
	${resp}=  Post Request  aping   /article/create  data=${data}  headers=${headers}
	Log To Console    Create Article APING-Web Success! ${resp}
	Log To Console    Body Response ${resp.content}
	${body}=  Set Variable  ${resp.json()}
	${status}=  Get From Dictionary  ${body}  status
	Should Be Equal  ${status}  ${200}
	${message}=  Get From Dictionary  ${body}  message
	Log To Console     Message : ${message}
	Log To Console    Create Article Successfull!