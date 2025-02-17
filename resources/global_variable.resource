*** Variables ***
${browser}    chrome    # browser use for the test (chrome, FF, IE)
${remote_runner}    http://selenium:4444    # ${False} : not use, else i.e. http://selenium:4444
${input}    ${EXECDIR}${/}input${/}    # Folder way where the file to upload in the application are storage
${output}    ${EXECDIR}${/}output${/}    # Folder to store the file send by the application to the bank, and use to make diff files
${expected_result_folder}    ${EXECDIR}${/}expected_result${/}
${root_url}    https://msswebcenter.com
