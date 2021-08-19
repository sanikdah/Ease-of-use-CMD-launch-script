:: Sets the color, disables command feedback, and clears the screen of the version and whatnot text.
@echo off
cls
cd %appdata%
:: Debug stuff, making a place for logs
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
goto :MainMenu

:: Launches if the previous code detects that this is your first time launching the program
:FirstTimeUser
title Do you want a tutorial?
echo.Hey!  You seem like you ran this program for the first time!  Would you like a tutorial on how to navigate?
set /p wantsTutorial= 
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
echo.Do you want to see the tutorial again?
set /p wantsTutorial= 
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
echo.Are you sure?
set /p isSureofNoTutorial= 
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
@echo off
title Welcome!  What would you like to do?
echo.
echo This is a placeholder menu until I design a real one!
goto :Choice
echo.>MainMenuTriggered.txt


:: Some code to make choices
:Choice
set choice=
echo.
echo. 1: Go to the regular command line and run your own commands!
echo. 2: Test your internet connection by pinging Google!
echo. 3: Repair your system by running DISM and System File Checker!
echo. 4: Get your public IP!
echo. 5: Check network statistics!
echo. 8: Settings
echo. 9: Access Help
set /p choice= Your choice?=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto :GoToRegularCMD
if '%choice%'=='2' goto :PingGoogle
if '%choice%'=='3' goto :DISMandSFC
if '%choice%'=='4' goto :CurlIPme
if '%choice%'=='5= goto :CheckNetworkStatistics
if '%choice%'=='exit' goto :exit
if '%choice%'=='leave' goto :exit
if '%choice%'=='die' goto :exit
if '%choice%'=='debug' goto :debug
if '%choice%'=='8' goto :Settings
if '%choice%'=='9' goto :Help
ECHO "%choice%" is not a valid option, please try again.
ECHO.
goto :Choice
echo.>EndOfChoiceTriggered.txt


:CurlIPme
@echo off
title Please Wait....
echo Getting your IP....
curl ip.me > TempIP.txt
set /p IP= < TempIP.txt
del TempIP.txt
echo Your public IP is %IP%
set %IP%=
goto :MainMenu

:CheckNetworkStatistics


:GoToRegularCMD
@echo off
title Command Prompt
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
title WARNING
echo.====WARNING========WARNING=======WARNING=====
echo.====WARNING========WARNING=======WARNING=====
echo.====WARNING========WARNING=======WARNING=====
echo.THESE ARE DEBUG OPTIONS AND **CAN** BREAK THE PROGRAM!!
echo.ARE YOU **101% POSITIVE** THAT YOU NEED THESE?
echo.
echo.Say "I understand", to prove the you understand this aggreement: The creator takes no responsibilty in what can happen if I, the user, breaks part of the program, by using explictly stated as options for DEBUGGING purposes.
set /p isSureOfDebugOptions=
if '%isSureOfDebugOptions%'=='I understand' goto :realDebug
if '%isSureOfDebugOptions%'=='i understand' goto :useBetterGrammarDebug
goto :noDebug


:noDebug
echo No debug 4 u
:: Causes about a 0.25 second pause
ping techflash.ga -n 1 > nul
goto :noDebug

:realDebug
echo Nothing here yet, currently working on the menu.
goto :MainMenu

:useBetterGrammarDebug
echo Use better grammar next time, CAPITALIZE >:(
goto :realDebug

:: Settings menu
:Settings
@echo off
cls
echo.Welcome to the settings menu!  Here you can modify some settings!
echo.1: Modify the default color when you start the script.
echo.2: Not yet created just felt like adding this here. :P
set /p SettingsChoice=
if '%SettingsChoice%'=='1' goto :color
if '%isSureOfDebugOptions%'=='2' goto :Nothing

:: A label used for when I wanted to add an option but it isn't implemented yet or is in a state where it can't be used.
:Nothing
@echo off
echo Nothing here yet!  There might be soon O_O
echo. Going back to settings in 5 seconds.
timeout 5
goto :Settings

:: A basic section of code for setting the default color of the shell.
:color
@echo off
echo.Welcome to the color selection menu!
echo.Please enter a Command Prompt-format color code.
echo.
set /p ColorCode=
echo.Great!  Does this look good?
color %ColorCode%
set /p YesNoColor=
if not '%YesNoColor%'=='' set choice=%YesNoColor%:~0,1%
if '%YesNoColor%'=='y' goto :SetColor
if '%YesNoColor%'=='Y' goto :SetColor
if '%YesNoColor%'=='Yes' goto :SetColor
if '%YesNoColor%'=='yes' goto :SetColor
if '%YesNoColor%'=='n' goto :color
if '%YesNoColor%'=='N' goto :color
if '%YesNoColor%'=='no' goto :color
if '%YesNoColor%'=='No' goto :color
ECHO. "%YesNoColor%" is not a valid option, please try again.
goto :color

:: Some code to actually set the color code.
:SetColor
@echo on
echo.Great!  Would you like to save the color code
echo.so that it is applied every time you start the
echo.script?
set /p YesNoColor2=
if not '%YesNoColo2r%'=='' set choice=%YesNoColor2%:~0,1%
if '%YesNoColor2%'=='y' goto :SetColor2
if '%YesNoColor2%'=='Y' goto :SetColor2
if '%YesNoColor2%'=='Yes' goto :SetColor2
if '%YesNoColor2%'=='yes' goto :SetColor2
if '%YesNoColor2%'=='n' goto :MainMenu
if '%YesNoColor2%'=='N' goto :MainMenu
if '%YesNoColor2%'=='no' goto :MainMenu
if '%YesNoColor2%'=='No' goto :MainMenu
ECHO. "%YesNoColor%" is not a valid option, please try again.
goto :color

:: Some code to for real this time set the color code.
:SetColor2
@echo on
echo %ColorCode% > Color.txt
set /p VerifyColorCode= < Color.txt
pause
if not '%ColorCode% '=='%VerifyColorCode%' echo. Something went wrong when saving the color code,
if not '%ColorCode% '=='%VerifyColorCode%' echo. please report this to the developer and give
if not '%ColorCode% '=='%VerifyColorCode%' echo. the error code "2".
pause


:: Simplest one of them all, exits the shell
:exit
exit
echo.>EndOfExitTriggeredIMPOSSIBLE.txt


:: End of the file, used to end the script (like to go to the normal shell)
:leave
@echo on