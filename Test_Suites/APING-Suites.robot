*** Settings ***
Library  Collections
Library  RequestsLibrary
Resource    ../Data/common_variables.robot
Resource    ../Test_Cases/APING-Register.robot
Resource    ../Test_Cases/APING-Login.robot
Resource    ../Test_Cases/APING-ForgotPassword.robot
Resource    ../Test_Cases/APING-ResetPassword.robot
Resource    ../Test_Cases/APING-CreateArticle.robot
Resource    ../Test_Cases/APING-GetAllData.robot
Resource    ../Test_Cases/APING-GetSingleData.robot
Resource    ../Test_Cases/APING-UpdateArticle.robot
Resource    ../Test_Cases/APING-DeleteArticle.robot


*** Test Cases ***
APING - Chaining Test Concept
    APING - Register

    #Login with Invalid Data
    APING - Login with Invalid Email
    APING - Login with Invalid Password

    APING - Login with valid data

    #Forgot Password
    APING - Forgot Password
    APING - Reset Password

    #Article
    APING - Create Articel
    APING - Get All Article
    APING - Get Single Article
    APING - Update Article
    APING - Delete Article
