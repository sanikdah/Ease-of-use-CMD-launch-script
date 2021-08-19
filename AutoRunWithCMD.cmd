:: Sets the color, disables command feedback, and clears the screen of the version and whatnot text.
@echo off
cls
color 0a
:: Debug stuff, making a place for logs
if exist "Debug" (
	cd "Debug".
	goto DebugExists
	echo This should never occurr, please contact the developer and give the error code "1"
) else (
	mkdir "Debug".
	cd "Debug".
	goto DebugExists
)

:DebugExists
if exist "Sanikdah Software" (
	cd "Sanikdah Software".
	goto SSFolderExists
) else (
	mkdir "Sanikdah Software".
	cd "Sanikdah Software".
	goto SSFolderExists
)
	
:SSFolderExists
if exist "Ease of Use Command Prompt Auto Run Script" (
	cd "Ease of Use Command Prompt Auto Run Script"
	goto EoUCPARS-FolderExists
) else (
	mkdir "Ease of Use Command Prompt Auto Run Script"
	cd "Ease of Use Command Prompt Auto Run Script"
	goto :FirstTimeUser
)
:EoUCPARS-FolderExists
echo.>Launched.txt

:: Launches if the previous code detects that this is your first time launching the program
:FirstTimeUser
title Do you want a tutorial?
echo.Hey!  You seem like you ran this program for the first time!  Would you like a tutorial on how to navigate?
set /p wantsTutorial= Do you want a tutorial?=
if not '%wantsTutorial%'=='' set choice=%wantsTutorial:~0,1%
if '%wantsTutorial%'=='y' goto :wantsTutorial
if '%wantsTutorial%'=='Y' goto :wantsTutorial
if '%wantsTutorial%'=='Yes' goto :wantsTutorial
if '%wantsTutorial%'=='yes' goto :wantsTutorial
if '%wantsTutorial%'=='n' goto :noTutorial
if '%wantsTutorial%'=='N' goto :noTutorial
if '%wantsTutorial%'=='no' goto :noTutorial
if '%wantsTutorial%'=='No' goto :noTutorial
ECHO. "%wantsTutorial%" is not a valid option, please try again.
goto :FirstTimeUser
ECHO.

:wantsTutorial
echo.Placeholder tutorial.
set /p wantsTutorial= Do you want to see the tutorial again?
if not '%wantsTutorial%'=='' set choice=%wantsTutorial:~0,1%
if '%wantsTutorial%'=='y' goto :wantsTutorial
if '%wantsTutorial%'=='Y' goto :wantsTutorial
if '%wantsTutorial%'=='Yes' goto :wantsTutorial
if '%wantsTutorial%'=='yes' goto :wantsTutorial
if '%wantsTutorial%'=='n' goto :noTutorial
if '%wantsTutorial%'=='N' goto :noTutorial
if '%wantsTutorial%'=='no' goto :noTutorial
if '%wantsTutorial%'=='No' goto :noTutorial
ECHO. "%wantsTutorial%" is not a valid option, please try again.
goto :FirstTimeUser


:noTutorial
set /p isSureofNoTutorial= Are you sure?=
if not '%isSureofNoTutorial%'=='' set choice=%isSureofNoTutorial:~0,1%
if '%isSureofNoTutorial%'=='y' goto :isSureofNoTutorial
if '%isSureofNoTutorial%'=='Y' goto :isSureofNoTutorial
if '%isSureofNoTutorial%'=='Yes' goto :isSureofNoTutorial
if '%isSureofNoTutorial%'=='yes' goto :isSureofNoTutorial
if '%isSureofNoTutorial%'=='n' goto :FirstTimeUser
if '%isSureofNoTutorial%'=='N' goto :FirstTimeUser
if '%isSureofNoTutorial%'=='no' goto :FirstTimeUser
if '%isSureofNoTutorial%'=='No' goto :FirstTimeUser
ECHO. "%isSureofNoTutorial%" is not a valid option, please try again.
goto :noTutorial
ECHO.

:isSureofNoTutorial
cls
echo Alright, just go to Help (5) and then Tutorial (2) to view it if you ever want to!
goto :MainMenu


:: Main menu code, sets the title, adds 2 blank lines, and eventually a working choice system.
:MainMenu
title Welcome!  What would you like to do?
echo.
echo.
echo This is a placeholder menu until I design a real one!
goto :Choice
echo.>MainMenuTriggered.txt


:: Some code to make choices
:Choice
set choice=
echo.
echo 1: Go to the regular command line and run your own commands!
echo 2: Test your internet connection by pinging Google!
echo 3: Repair your system by running DISM and System File Checker!
set /p choice= Your choice?=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto :GoToRegularCMD
if '%choice%'=='2' goto :PingGoogle
if '%choice%'=='3' goto :DISMandSFC
if '%choice%'=='4' goto :exit
if '%choice%'=='9' goto :debug
ECHO "%choice%" is not a valid option, please try again.
ECHO.
goto :Choice
echo.>EndOfChoiceTriggered.txt


:GoToRegularCMD
@echo off
goto :leave
echo.>EndOfGoToRegualarCMDTriggered.txt

:PingGoogle
@echo off
title Pinging Google......
ping google.com -n 1 >PingStats.txt
if %errorlevel%==0 (set InternetState=up) else (set InternetState=down)
cls
echo.
echo.Internet is %InternetState%!
goto :MainMenu
echo.>EndOfPingGoogleTriggered.txt


::Debug options, to be accessible by those who know exactly what they are doing
:debug
@echo off
cls
echo.====WARNING========WARNING=======WARNING=====
echo.====WARNING========WARNING=======WARNING=====
echo.====WARNING========WARNING=======WARNING=====
echo.THESE ARE DEBUG OPTIONS AND **CAN** BREAK THE PROGRAM!!
echo.ARE YOU **101% POSITIVE** THAT YOU NEED THESE?
set /p isSureOfDebugOptions=Say "I understand that the creator takes no responsibilty in what can happen if I, the user, breaks part of the program, by using explictly stated as options for DEBUGGING purposes."
if '%isSureOfDebugOptions%'=='I understand that the creator takes no responsibilty in what can happen if I, the user, breaks part of the program, by using explictly stated as options for DEBUGGING purposes.' 
( echo.>WellThisWorks.txt
goto :realDebug )
else (goto :MainMenu)

:: Debug options don't exist as it would be accessible even if you didn't aggree to the terms.

:: Simplest one of them all, exits the shell
:exit
exit
echo.>EndOfExitTriggeredIMPOSSIBLE.txt


:: End of the file, used to end the script (like to go to the normal shell)
:leave
@echo on