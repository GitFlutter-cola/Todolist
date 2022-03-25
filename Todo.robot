***Settings***
Documentation                                      Todo List website
Library     SeleniumLibrary
# Library     Selenium2Library
Library     String

***Variables***
${URL}                                              https://abhigyank.github.io/To-Do-List/
${BROWSER}                                          safari
${NOTE01}           Test_01
${NOTE02}           Test_02
${PATH_Todo}             //div[@class="mdl-tabs__tab-bar"]//a[@href="#todo"]//span[@class="mdl-tabs__ripple-container mdl-js-ripple-effect"]
${PATH_Completed}        //div[@class="mdl-tabs__tab-bar"]//a[@href="#completed"]//span[@class="mdl-tabs__ripple-container mdl-js-ripple-effect"]
${PATH_Delete_Task_01}            //div[@id="todo"]/ul[@id="incomplete-tasks"]/li/button[@id="1"]
${PATH_element_ToDoList}        //div[@class="container"]/h1
${PATH_element_Completed}       //div[@id="completed"]/ul[@id="completed-tasks"]/li[@class="mdl-list"]/button[@id="1"]
${PATH_element_checkbox}        //div[@id="todo"]/ul[@id="incomplete-tasks"]/li/label[@for="1"]/span[@class="mdl-checkbox__ripple-container mdl-js-ripple-effect mdl-ripple--center"]     
${PATH_delete_completed_task}       //div[@id="completed"]/ul[@id="completed-tasks"]/li[@class="mdl-list"]/button[@id="1"]/span[@class="mdl-button__ripple-container"]

***Keywords***
Open_Todo_Website
    # Set Selenium Speed      2
    open browser            ${URL}    ${BROWSER}
    # Maximize Browser Window
    sleep   2
    wait until page contains element     ${PATH_element_ToDoList}
    Page Should Contain Element     ${PATH_element_ToDoList}
    
Add_Note_Complete
    input text              id=new-task  ${NOTE01}
    Sleep      2
    Click Element              class=material-icons   
    input text              id=new-task  ${NOTE02}
    Sleep      2
    Click Element              class=material-icons
    
Visit_ToDo_Task_page  
    Click Element         ${PATH_Todo}
    
    Sleep      4
Visit_Complete_Task_page
    Click Element         ${PATH_Completed}
    
    Sleep      4
Mark_CheckBox_Complete           
    Click Element           ${PATH_element_checkbox}
    Sleep      4

Mark_Delete_Button_Complete
    
    Click Element       ${PATH_Delete_Task_01}
    
Investigate_Element_Complete_Task
    
    wait until page contains element        ${PATH_element_Completed}

Deleted_completed_Task
    
    Click Element       ${PATH_delete_completed_task}

***Test Cases***

TC1 - completed task - successful
    Open_Todo_Website
    Add_Note_Complete
    Visit_ToDoTask_page
    Mark_CheckBox_Complete
    Visit_Complete_Task_page
    Investigate_Element_Complete_Task
    Close Browser


TC2 - deleted task - successful
    Open_Todo_Website
    Add_Note_Complete
    Visit_ToDoTask_page
    Mark_Delete_Button_Complete
    Visit_Complete_Task_page
    Close Browser
    

TC3 - deleted completed task - successful
    Open_Todo_Website
    Add_Note_Complete
    Visit_ToDoTask_page
    Mark_CheckBox_Complete
    Visit_Complete_Task_page
    Investigate_Element_Complete_Task
    Deleted_completed_Task
    Close Browser