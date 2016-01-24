*** Settings ***
Documentation     A test suite with a single test for valid login.
Resource          ./common_resources/resource.robot
Resource          ./common_resources/valid_login_steps.robot

*** Test Cases ***
Valid Login
  Login With Working Credentials Should Succeed
  [Teardown]    Close Browser