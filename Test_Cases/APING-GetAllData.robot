*** Settings ***
Library  Collections
Library  RequestsLibrary
Library  String
*** Variables ***

*** Keywords ***
APING - Get All Article
    Create Session    aping    ${urlAPING}    verify=True
    &{headers}=     Create Dictionary   Content-Type=application/json   Authorization=Bearer ${bearerToken}
    ${resp}=    Get Request    aping    /articles    headers=${headers}
    Log To Console    Get All Data Articel List Response ${resp}
    Log To Console    Body Response ${resp.content}
    ${body}=    Set Variable    ${resp.json()}
    ${status}=    Get From Dictionary    ${body}    status
    Should Be Equal  ${status}  ${200}

    ${listOfArticle}=     Get From Dictionary     ${body}     result
    reverse list    ${listOfArticle}
    FOR     ${item}     IN      @{listOfArticle}
        ${curTitle}=    Set Variable        ${item['title']}
        IF    "${curTitle}" == "${titleArticle}"
            ${articleId}=       Set Variable    ${item['id']}
            Set Global Variable     ${articleId}
            ${curPict}=       Set Variable    ${item['picture']}
            ${curUserId}=     Set Variable    ${item['user_id']}
            Should Be Equal     ${curPict}    ${pictureArticle}
            Log To Console      Article ${articleId} with Title ${titleArticle} from author ${curUserId}
            Exit For Loop
        END
    END
    Log To Console  Get All Article & Search Spesific Article Success !