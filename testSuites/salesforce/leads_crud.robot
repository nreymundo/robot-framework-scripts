*** Settings ***
Documentation    A test suite for different lead operations.
Suite Teardown   Close Browser
Resource         ./common_resources/resource.robot
Resource          ./common_resources/valid_login_steps.robot

*** Variables ***
${First Name}       TEST
${Last Name}        LEAD
${Company Name}     RobotFramework Test

*** Test Cases ***
Create Lead
    Login With Working Credentials Should Succeed
    Then Click Element          Lead_Tab
    Then Click Button           new
    Then Input Text             name_firstlea2    ${First Name}
    And Input Text              name_lastlea2     ${Last Name}
    And Input Text              lea3              ${Company Name}
    And Click Button            save
    Then Validate Lead          ${First Name}     ${Last Name}    ${Company Name}

Search Lead
    Go To Home Page
    Then Search For An Existing Lead    ${Company Name}
# TODO: Fix this.
    Then Table Should Contain           css=list        ${Company Name}

*** Keywords ***
Search For An Existing Lead
    [Arguments]     ${searchCriteria}
    Go To Home Page
    Then Input Text             phSearchInput     ${searchCriteria}
    Then Click Button           phSearchButton