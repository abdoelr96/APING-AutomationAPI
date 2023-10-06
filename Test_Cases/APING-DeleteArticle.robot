*** Settings ***
Library  Collections
Library  RequestsLibrary
Library  String
*** Variables ***

*** Keywords ***
APING - Delete Article
    Create Session    aping    ${urlAPING}    verify=True
    &{headers}=     Create Dictionary   Content-Type=application/json   Authorization=Bearer ${bearerToken}
    ${resp}=    Delete Request    aping    /article/delete/${articleId}    headers=${headers}
    Log To Console    Get Single Articel List Response ${resp}
    Log To Console    Body Response ${resp.content}
    ${body}=    Set Variable    ${resp.json()}
    ${status}=    Get From Dictionary    ${body}    status
    Should Be Equal  ${status}  ${200}
    Log To Console    Delete Article Successfull!
