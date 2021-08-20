:: Sets the color, disables command feedback, and clears the screen of the version and whatnot text.
:Init
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
goto :ReadBackColor

:ReadBackColor
set /p color= < Color.txt
ping techflash.ga -n 1 > nul
color %color%
goto :MainMenu


:: Launches if the previous code detects that this is your first time launching the program
@echo off
:FirstTimeUser
title Do you want a tutorial?
echo.Hey!  You seem like you ran this program for the first time!  Would you like a tutorial on how to use the program?
set /p wantsTutorial= 
if not '%wantsTutorial%'=='' set choice=%wantsTutorial:~0,1%
if '%wantsTutorial%'=='y' goto :wantsTutorial
if '%wantsTutorial%'=='Y' goto :wantsTutorial
if '%wantsTutorial%'=='n' goto :noTutorial
if '%wantsTutorial%'=='N' goto :noTutorial
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
if '%isSureofNoTutorial%'=='n' goto :FirstTimeUser
if '%isSureofNoTutorial%'=='N' goto :FirstTimeUser
ECHO. "%isSureofNoTutorial%" is not a valid option, please try again.
goto :noTutorial
ECHO.

:isSureofNoTutorial
cls
echo Alright, just go to Help (5) and then Tutorial (1) to view it if you ever want to!
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
:: NOTE TO FUTURE SELF:
:: For some reason this code only allows for a SINGLE character to be used as a choice thingy, so like, 0-9 is fine, but not 10, etc.
:Choice
set choice=
echo.
echo.  1: Go to the regular command line and run your own commands!
echo.  2: Test your internet connection by pinging Google!
echo.  3: Repair your system by running DISM and System File Checker!
echo.  4: Get your public IP!
echo.  5: Check network statistics!
echo.  8: Settings
echo.  9: Access Help
echo.Which do you want?
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto :GoToRegularCMD
if '%choice%'=='2' goto :PingGoogle
if '%choice%'=='3' goto :DISMandSFC
if '%choice%'=='4' goto :CurlIPme
if '%choice%'=='5= goto :CheckNetworkStatistics
if '%choice%'=='0' goto :debug
if '%choice%'=='8' goto :Settings
if '%choice%'=='9' goto :Help
ECHO "%choice%" is not a valid option, please try again.
ECHO.
goto :Choice
echo.>EndOfChoiceTriggered.txt

:Help
echo.
title What do you need help with?
echo. Hello!  Select an option to get help for that topic.
echo.
echo.   1: Tutorial (unfinished)
echo.   2: Nothing yet
echo.Which do you want?
set /p HelpChoice=
if not '%HelpChoice%'=='' set HelpChoice=%HelpChoice:~0,1%
if '%HelpChoice%'=='1' goto :wantsTutorial
if '%HelpChoice%'=='1' goto :Nothing

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
echo.Do you understand this aggreement? The creator takes no responsibilty in what can happen if I, the user, breaks part of the program, by using explictly stated as options for DEBUGGING purposes.
echo.
set /p isSureOfDebugOptions=
if '%isSureOfDebugOptions%'=='y' goto :realDebug
if '%isSureOfDebugOptions%'=='Y' goto :realDebug
if '%isSureOfDebugOptions%'=='n' goto :noDebug
if '%isSureOfDebugOptions%'=='N' goto :noDebug
goto :noDebug


:noDebug
@echo off
cls
echo No debug if you don't accept the aggreement.
goto :MainMenu

:realDebug
@echo off
echo.
echo Nothing here yet, currently working on the main menu.
echo.Press any key to go back to the Main menu.
pause
goto :MainMenu

:: Settings menu
:Settings
@echo off
cls
echo.Welcome to the settings menu!
echo.Here you can modify some settings!
echo.
echo.1: Modify the default color when you start the script.
echo.2: Not yet created just felt like adding this here. :P
set /p SettingsChoice=
if '%SettingsChoice%'=='1' goto :color
if '%isSureOfDebugOptions%'=='2' goto :Nothing

:: A label used for when I wanted to add an option but it isn't implemented yet or is in a state where it can't be used.  Or if I just haven't though of anything to put in that slot yet.
:Nothing
@echo off
echo Nothing here yet!  There might be soon O_O
echo. Going back to settings in 5 seconds.
timeout 5
goto :Settings

:: A basic section of code for setting the default color of the shell.
:color
@echo off
cls
echo.Welcome to the color selection menu! (kinda janky but it works)
echo.Please enter a Command Prompt-format color code.
set /p ColorCode=
echo.Great!  Does this look good?
color %ColorCode%
set /p YesNoColor=
if not '%YesNoColor%'=='' set choice=%YesNoColor%:~0,1%
if '%YesNoColor%'=='y' goto :SetColor
if '%YesNoColor%'=='Y' goto :SetColor
if '%YesNoColor%'=='n' goto :color
if '%YesNoColor%'=='N' goto :color
ECHO. "%YesNoColor%" is not a valid option, please try again.
goto :color

:: Some code to actually set the color code.
:SetColor
@echo off
echo.Great!  Would you like to save the color code
echo.so that it is applied every time you start the
echo.script?
set /p YesNoColor2=
if not '%YesNoColo2r%'=='' set choice=%YesNoColor2%:~0,1%
if '%YesNoColor2%'=='y' goto :SetColor2
if '%YesNoColor2%'=='Y' goto :SetColor2
if '%YesNoColor2%'=='n' goto :MainMenu
if '%YesNoColor2%'=='N' goto :MainMenu
ECHO. "%YesNoColor%" is not a valid option, please try again.
goto :color

:: Some code to for real this time set the color code.
:SetColor2
@echo off
echo %ColorCode% > Color.txt
ping techflash.ga -n 2 > nul
set /p VerifyColorCode= < Color.txt
ping techflash.ga -n 2 > nul
echo. The file now needs some modification, I will open Notepad and show you what you have to do.
echo. (Note that this process is temporary and only needed to fix a strange bug that occurs.)
start %windir%\notepad.exe "%appdata%\Sanikdah Software\Ease of Use Command Prompt Auto Run Script\Color.txt"
echo. Now, click at the bottom area of the window, your text caret\cursor should be at the line below your color code.
echo. Then press Backspace 2 times, to delete that extra line, and the extra space after the color code.
echo. Now, save and exit the file.  And press any key to resume the program with your new color code!
pause
goto :Init



:: Simplest one of them all, exits the shell
:exit
exit
echo.>EndOfExitTriggeredIMPOSSIBLE.txt


:: End of the file, used to end the script (like to go to the normal shell)
:leave
@echo on