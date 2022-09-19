@echo off

:: Parse inputs
if not "%2"=="" (goto too_many_inputs)

:: Display help text
if "%1"=="/?" (goto help)
if "%1"=="help" (goto help)
if "%1"=="-h" (goto help)
if "%1"=="-help" (goto help)
if "%1"=="--help" (goto help)



:: Rebuild the website using sphinx
cd C:\Users\jonki\Documents\Hackathon
if exist .\docs\ (
    rmdir /S /Q docs
)
sphinx-build -qE source docs

:: Exit without opening in browser
if "%1"=="" (exit /B 0)

:: Get the page name. Default is index
if %1==open (
    set pagename=index
) else (
    set pagename=%1
)

:: Get full path to the page
set page=.\docs\%pagename%.html

:: Open page or indicate failure
if exist %page% (
    start %page%
) else (
    echo Requested page "%pagename%" does not exist
)
exit /B



:too_many_inputs
echo Too many input arguments
exit /B



:help
echo:
echo usage: rebuild [option]
echo =======================
echo: 
echo Rebuilds the Hackathon website from the source reST files.
echo Before building, deletes the "docs" directory so that
echo old/unused pages don't remain in the website. Optionally
echo opens the rebuilt website in a browser.
echo: 
echo:
echo Options
echo =======
echo:
echo help, /S, -h, -help, --help
echo Displays the help text for this command
echo:
echo open
echo Opens the rebuilt website at index.html
echo:
echo {page name}
echo Opens the rebuilt website at the specified page.
echo Appends .html to the end of the indicated name before opening.