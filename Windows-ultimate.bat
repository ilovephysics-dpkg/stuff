@ echo off
cls
rem We should code the functionality of the scripts first, then we should polish the code and make everything aesthetically pleasing.
rem My code is currently very messy, and I do not like it. It is really annoying me.

:MENU
SET /P INT=Enter a delay (in seconds) between commands (Recommended: 10-15 seconds)
timeout %INT% >null
echo.
echo          --VERSION: 1.0.1--
echo --1.0.1: Fixed an issue where the menu glitches.
echo --------------------------------------
echo   SELECT FROM THE AVAILABLE OPTIONS
echo --------------------------------------
echo.
echo  1) - Enable the Firewall
echo  2) - Set passwd Pol.
echo  3) - Set lockout Pol.
echo  4) - So you wanna be a hacker, huh?
echo  5) - Bored? (NOT CODED YET)
echo  6) - Windows Def
echo  7)
echo  8)
echo  9)
echo  10)
echo.

:MENU2
cls
echo.
echo --------------------------------------
echo   SELECT FROM THE AVAILABLE OPTIONS
echo --------------------------------------
echo.
echo  1) - Enable the Firewall
echo  2) - Set passwd Pol.
echo  3) - Set lockout Pol.
echo  4) - Hackermode
echo  5) - Game (Not very productive)
echo  6) - Windows Defender
echo  7) - Random Stuff (Not very productive)
echo  8) - System Auditing
echo  9) -
echo  10)
echo.

SET /P M=Select an option from the table, then press the [enter] key.
if "%M%"=="1" GOTO :enabFire
if "%M%"=="2" GOTO :psswdPol
if "%M%"=="3" GOTO :lockPol
if "%M%"=="4" GOTO :hackermode
if "%M%"=="5" GOTO :game2
if "%M%"=="6" GOTO :defender
if "%M%"=="7" GOTO :coolStuffHehe
if "%M%"=="8" GOTO
if "%M%"=="9" GOTO
if "%M%"=="10" GOTO

:enabFire
  rem Enables the epic services of the Firewall!
  netsh advfirewall set allprofiles state on
  netsh advfirewall reset
    pause
      goto :MENU2

:psswdPol
SET /P INT=Enter a delay (in seconds) between commands (Recomended: 10-15 seconds)
if [[ wmic UserAccount set PasswordRequired=False ]]; then
  wmic UserAccount set PasswordRequired=True
fi
else
  echo "It is already secured!"
end

timeout %INT% >null
pause

goto :psswdPart2

timeout %INT% >null

:psswdPart2

  rem This will change user passwords



:lockPol
  rem Sets the lockout policy for us because we are too lazy.
  echo Setting the lockout policy...
  net accounts /lockoutduration:30
  net accounts /lockoutthreshold:3
  net accounts /lockoutwindow
  pause
  goto :MENU2


:hackermode
rem will def make you a hacker. -- You just need to put your hood up.
timeout 1 >null
color 2
echo Put your hood up, become a hacker.

set /P SELECT=Press 1 to go to the menu.
if "%SELECT%"=="1" GOTO :MENU2


:defender
timeout %INT% >null
  SET MPPATH="C:\Program Files\Windows Defender\""
  CD %MPPATH%
  START MpCmdRun.exe Scan Scan -ScanType 2

  set /P SELECT=Press 1 to go to the menu.
  if "%SELECT%"=="1" GOTO :MENU2

:coolStuffHehe
cls
echo.
echo --------------------------------------
echo   SELECT FROM THE AVAILABLE STUFF
echo --------------------------------------
echo.
echo  1) - Ping Statistics
echo  2) - Game
echo  3) - Matrix
echo  4) - Hackermode
echo.

SET /P cool=Select an option from the table, then press the [enter] key.
if "%cool%"=="1" GOTO :pinger2
if "%cool%"=="2" GOTO :game
if "%cool%"=="3" GOTO :matrix
if "%cool%"=="4" GOTO :hackermode
if "%cool%"=="5" GOTO :amIanAdmin

:amIanAdmin
mkdir "%windir%\system32\test" 2>nul
if "%errorlevel%" == "0" (rmdir "%windir%\system32\test" & echo Is admin) else (echo Not an Admin)


:pinger2
color 0e
set /p i= Enter the website to get Ping Statistics.
ping %i%
color 4
echo Your chosen website has been pinged.
color 0e
set /p e= If you would like to exit, press 1.
if "%e%"=="1"
color 2
echo Nope, lol.
echo
color 4
echo -------------------------------------------------------------------------------------
echo If you do not close this in 45 seconds you will go to ** AN EARRAPE VIDEO! ** - Just Joking
echo -------------------------------------------------------------------------------------
color 5
set /p real= If you would like to actually leave to go to the menu, enter 69.
if "%real%"=="69" goto :menu

:game2
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: SNAKE.BAT - A pure native Windows batch implementation of the classic game
:: ------------------------------------------------------------------------------
:: Written by Dave Benham with some debugging help and technique pointers from
:: DosTips users - See http://www.dostips.com/forum/viewtopic.php?f=3&t=4741
::
:: The game should work on any Windows machine from XP onward using only batch
:: and native external commands. However, there will most likely be some screen
:: flicker due to the CLS command issued upon every screen refresh.
::
:: The screen flicker can be eliminated by adding Aacinis CursorPos.exe to the
:: same folder that contains SNAKE.BAT. The flicker free feature is "cheating"
:: in that it is not pure native batch since it relies on a 3rd party tool.
:: But it really improves the game experience. A script to create CursorPos.exe
:: is available at http://goo.gl/hr6Kkn.
::
:: Note that user preferences and high scores are stored in %USERPROFILE%\Snake
:: User saved games have an implicit .snake.txt "extension", and are saved and
:: loaded from the current directory.
::
:: Version History
::
:: 3.8  2015-02-16
::   - Improve performance of Replay abort
::   - Eliminate flicker at game start when using CursorPos.exe
::   - Use symbols (variables) for lock, key and cmd streams.
::
:: 3.7  2014-08-03
::   - Reduced screen flicker when playing without CursorPos.exe by building
::     entire screen in one variable before CLS and ECHOing the screen.
::
:: 3.6  2014-04-09
::   - Pause after displaying CursorPos.exe message at end if game was launced
::     via double click or START menu.
::
:: 3.5  2014-02-03
::   - Made growth rate user configurable. High scores are now stored for each
::     growth rate played.
::   - Added optional support for Aacinis CursorPos.exe to eliminate screen
::     flicker.
::   - Redesigned storage of configuration options within saved games to make
::     it easier to extend in the future. Existing saved games are automatically
::     converted to the new format.
::   - Simplified replay abort mechanics.
::
:: 3.4  2013-12-26
::   - Added ability to abort a game replay.
::
:: 3.3  2013-12-24
::   - Added Pause functionality.
::
:: 3.2  2013-12-08
::   - Fixed a replay bug. Note that attempting to delete a non-existent file
::     does not raise an error!
::   - Added ability to save a previous game or a High score game to a user
::     named file in the current directory.
::   - Added ability to load and replay a user saved game from the current
::     directory.
::
:: 3.1  2013-12-08
::   - Fixed a bug with the game logs. Must include key mappings in log.
::     High scores from version 3.0 should be deleted from %USERPROFILE%\Snake.
::
:: 3.0  2013-12-07
::   - Made control keys user configurable, including option for 2 key
::     (left/right) or 4 key (left/right/up/down) input.
::   - Made graphics user configurable.
::   - Added ability to display replay of previous game.
::   - Added High Score list, with ability to display replay of High Score games.
::
:: 2.3  2013-12-01
::   - Added elapsed game time to the display.
::
:: 2.2  2013-08-06
::   - Improved comments / internal documentation
::   - A few inconsequential code changes
::
:: 2.1  2013-07-20
::   - Reworked interprocess communication. No more hanging games (I hope).
::   - Fixed parameterization of movement key definition.
::   - Temp file location now controlled by TEMP (or TMP) environment variable.
::   - Implemented a game session lock into temp file names so multiple game
::     instances can share the same TEMP folder without interference.
::
:: 2.0  2013-07-17
::   - First attempt at using XCOPY instead of CHOICE. Game now runs as
::     pure native batch on all Windows versions from XP onward.
::
:: 1.0  2013-07-13  to  1.x
::   - Game required CHOICE command, so did not work on XP without download of
::     a non-standard exe or com file.
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
if "%~1" == "startGame" goto :game
if "%~1" == "startController" goto :controller


::---------------------------------------------------------------------
:: setup some global variables used by both the game and the controller

setlocal disableDelayedExpansion
:getSession
if defined temp (set "tempFileBase=%temp%\") else if defined tmp set "tempFileBase=%tmp%\"
set "tempFileBase=%tempFileBase%Snake%time::=_%"
set "keyFile=%tempFileBase%_key.txt"
set "cmdFile=%tempFileBase%_cmd.txt"
set "gameLock=%tempFileBase%_gameLock.txt"
set "gameLog=%tempFileBase%_gameLog.txt"
set "signal=%tempFileBase%_signal.txt"
set "saveLoc=%userprofile%\Snake"
set "userPref=%saveLoc%\SnakeUserPref.txt"
set "hiFile=%saveLoc%\Snake!growth!Hi"
set "keyStream=9"
set "cmdStream=8"
set "lockStream=7"


::------------------------------------------
:: Lock this game session and launch.
:: Loop back and try a new session if failure.
:: Cleanup and exit when finished

call :launch %lockStream%>"%gameLock%" || goto :getSession
del "%tempFileBase%*"
exit /b


::------------------------------------------
:launch the game and the controller

call :fixLogs
copy nul "%keyFile%" >nul
copy nul "%cmdFile%" >nul
start "" /b cmd /c ^""%~f0" startController %keyStream%^>^>"%keyFile%" %cmdStream%^<"%cmdFile%" 2^>nul ^>nul^"
cmd /c ^""%~f0" startGame %keyStream%^<"%keyFile%" %cmdStream%^>^>"%cmdFile%" ^<nul^"
echo(


::--------------------------------------------------------------
:: Upon exit, wait for the controller to close before returning

:close
2>nul (>>"%keyFile%" call )||goto :close
if not exist "%~dp0CursorPos.exe" (
  echo Game play can be improved by installing
  echo Aacinis CursorPos.exe, available at
  echo http://goo.gl/hr6Kkn
  echo(
  echo %cmdcmdline%|find /i "%~f0">nul&&pause
)
exit /b 0


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:game
title %~nx0
cls

::---------------------------------------
:: Playfield size
:: max playing field: (width-2)*(height-2) <= 1365

set "width=40"   max=99
set "height=25"  max=99

::----------------------------
:: resize the console window

set /a cols=width+1, lines=height+10, area=(width-2)*(height-2)
if %area% gtr 1365 (
  echo ERROR: Playfield area too large
  %sendCmd% quit
  exit
)
if %lines% lss 14 set lines=14
if %cols% lss 46 set cols=46
mode con: cols=%cols% lines=%lines%


::----------------------------
:: define variables

set "configOptions=diffCode difficulty growth moveKeys up down left right"
set "configOptionCnt=9"

set "moveKeys=4"

set "up=W"
set "down=S"
set "left=A"
set "right=D"
set "pause=P"

set "space= "
set "bound=#"
set "food=+"
set "head=@"
set "body=O"
set "death=X"

set "growth=1"

if exist "%userPref%" for /f "usebackq delims=" %%V in ("%userPref%") do set "%%V"

set "spinner1=-"
set "spinner2=\"
set "spinner3=|"
set "spinner4=/"
set "spinner= spinner1 spinner2 spinner3 spinner4 "

set "delay1=20"
set "delay2=15"
set "delay3=10"
set "delay4=7"
set "delay5=5"
set "delay6=3"

set "desc1=Sluggard"
set "desc2=Crawl"
set "desc3=Slow"
set "desc4=Normal"
set "desc5=Fast"
set "desc6=Insane"

set "spinnerDelay=3"

set /a "width-=1, height-=1"

:: define LF as a Line Feed (newline) character
set ^"LF=^

^" Above empty line is required - do not remove

:: define CR as a Carriage Return character
for /f %%A in ('copy /Z "%~dpf0" nul') do set "CR=%%A"

:: define BS as a BackSpace character
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "BS=%%A"

set "upper=A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
set "invalid=*~="


::---------------------------
:: define macros

if exist "%~dp0CursorPos.exe" (
  set "cls=CursorPos 0 0"
  set "ClearLine=echo(                                   &CursorPos 0 -1"
  set "ClearPrev=CursorPos 0 -0&echo(                                   "
) else (
  set "cls=cls"
  set "ClearLine="
  set "ClearPrev="
)

:: define a newline with line continuation
set ^"\n=^^^%LF%%LF%^%LF%%LF%^^"

:: setErr
:::  Sets the ERRORLEVEL to 1
set "setErr=(call)"

:: clrErr
:::  Sets the ERRORLEVEL to 0
set "clrErr=(call )"


:: sendCmd  command
:::  sends a command to the controller
set "sendCmd=>&%cmdStream% echo"


:: getKey  [ValidKey]  [ValidKey...]
::: Check for keypress from the controller. Only accept a ValidKey.
::: Token delimiters and poison characters must be quoted.
::: Accept any key if no ValidKey specified.
::: Return result in Key variable. Key is undefined if no valid keypress.
set getKey=%\n%
for %%# in (1 2) do if %%#==2 (%\n%
  set key=%\n%
  set inKey=%\n%
  set keyTest=%\n%
  ^<^&%keyStream% set /p "inKey="%\n%
  if defined inKey (%\n%
    set inKey=!inKey:~0,-1!%\n%
    for %%C in (!args!) do set /a keyTest=1^&if /i !inKey! equ %%~C set key=!inKey!%\n%
  )%\n%
  if not defined keyTest set key=!inKey!%\n%
) else set args=


:: draw
:::  draws the board
set draw=%\n%
set screen=%\n%
for /l %%Y in (0,1,%height%) do set screen=!screen!!line%%Y!!LF!%\n%
set screen=!screen!Speed = !Difficulty! !replay!!LF!Growth Rate = !growth!   HighScore = !hi!!LF!Score = !score!   Time = !m!:!s!%\n%
if defined replay if not defined replayFinished (%\n%
  set screen=!screen!!LF!!LF!Press a key to abort the replay%\n%
)%\n%
%cls%^&echo(!screen!

:: test  X  Y  ValueListVar
:::  tests if value at coordinates X,Y is within contents of ValueListVar
set test=%\n%
for %%# in (1 2) do if %%#==2 (for /f "tokens=1-3" %%1 in ("!args!") do (%\n%
  for %%A in ("!line%%2:~%%1,1!") do if "!%%3:%%~A=!" neq "!%%3!" %clrErr% else %setErr%%\n%
)) else set args=


:: plot  X  Y  ValueVar
:::  places contents of ValueVar at coordinates X,Y
set plot=%\n%
for %%# in (1 2) do if %%#==2 (for /f "tokens=1-3" %%1 in ("!args!") do (%\n%
  set "part2=!line%%2:~%%1!"%\n%
  set "line%%2=!line%%2:~0,%%1!!%%3!!part2:~1!"%\n%
)) else set args=


::--------------------------------------
:: start the game
setlocal enableDelayedExpansion
if not exist "%saveLoc%\" md "%saveLoc%"
set "replay= Aborting... "
set "replayAvailable="
call :loadHighScores
call :mainMenu


::--------------------------------------
:: main loop (infinite loop)
for /l %%. in () do (

  %=== check for and process abort signal if in replay mode ===%
  if defined replay if exist "%signal%" (
    del "%signal%"
    set "replayFinished=1"
    %draw%
    echo(
    %ClearLine%
    <nul set /p "=Aborting... "
    findstr "^" >nul <&%keyStream%
    for %%A in (!configOptions!) do set "%%A=!%%ASave!"
    call :mainMenu
  )

  %=== compute time since last move ===%
  for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "t2=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100, tDiff=t2-t1"
  if !tDiff! lss 0 set /a tDiff+=24*60*60*100

  if !tDiff! geq !delay! (
    %=== delay has expired, so time for movement ===%
    set /a t1=t2

    %=== compute game time ===%
    if not defined gameStart set "gameStart=!t2!"
    set /a "gameTime=(t2-gameStart)"
    if !gameTime! lss 0 set /a "gameTime+=24*60*60*100"
    set /a "gameTime=(gameTime-pauseTime)/100, m=gameTime/60, s=gameTime%%60"
    if !m! lss 10 set "m=0!m!"
    if !s! lss 10 set "s=0!s!"

    %=== get keypress ===%
    %getKey% !keys!
    if /i !key! equ !pause! (

      %=== pause game ===%
      echo(
      call :ask "PAUSED - Press a key to continue..."
      %ClearPrev%
      %sendCmd% go
      for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "t2=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100, tDiff=t2-t1"
      if !tDiff! lss 0 set /a tDiff+=24*60*60*100
      set /a pauseTime+=tDiff

    ) else (

      %=== establish direction ===%
      if not defined replay (echo(!key!.) >>"!gameLog!"
      for %%K in (!key!) do if !moveKeys! equ 2 (
        set /a "xDiff=xTurn%%K*!yDiff!, yDiff=yTurn%%K*!xDiff!"
      ) else if "!%%KAxis!" neq "!axis!" (
        set /a "xDiff=xDiff%%K, yDiff=yDiff%%K"
        set "axis=!%%KAxis!"
      )

      %=== erase the tail ===%
      set "TX=!snakeX:~-2!"
      set "TY=!snakeY:~-2!"
      set "snakeX=!snakeX:~0,-2!"
      set "snakeY=!snakeY:~0,-2!"
      %plot% !TX! !TY! space

      %=== compute new head location and attempt to move ===%
      set /a "X=PX+xDiff, Y=PY+yDiff"
      set "X= !X!"
      set "Y= !Y!"
      set "X=!X:~-2!"
      set "Y=!Y:~-2!"
      (%test% !X! !Y! playerSpace) && (

        %=== move successful ===%

        %=== remove the new head location from the empty list ===%
        for %%X in ("!X!") do for %%Y in ("!Y!") do set "empty=!empty:#%%~X %%~Y=!"

        %=== eat any food that may be present ===%
        (%test% !X! !Y! food) && (
          %=== initiate growth ===%
          set /a grow+=growth

          %=== locate and draw new food ===%
          if defined replay (
            <&%keyStream% set /p "F="
          ) else (
            set /a "F=(!random!%%(emptyCnt-1))*6+1"
            (echo !F!) >>"!gameLog!"
          )
          for %%F in (!F!) do (%plot% !empty:~%%F,5! food)
        )

        if !grow! gtr 0 (
          %=== restore the tail ===%
          %plot% !TX! !TY! body
          set "snakeX=!snakeX!!TX!"
          set "snakeY=!snakeY!!TY!"
          set /a emptyCnt-=1

          %=== manage score ===%
          set /a "score+=1, grow-=1"
          if not defined replay if !score! gtr !hi! set /a "hi+=1, newHi=1"

        ) else (
          %=== add the former tail position to the empty list ===%
          set "empty=!empty!#!TX! !TY!"
        )

        %=== draw the new head ===%
        if defined snakeX (%plot% !PX! !PY! body)
        %plot% !X! !Y! head

        %=== Add the new head position to the snake strings ===%
        set "snakeX=!X!!snakeX!"
        set "snakeY=!Y!!snakeY!"
        set "PX=!X!"
        set "PY=!Y!"

        %draw%

      ) || (

        %=== failed move - game over ===%
        set "replayFinished=1"
        %plot% !TX! !TY! body
        call :spinner !PX! !PY! death
        %draw%
        if defined newHi (
          echo(
          echo New High Score - Congratulations^^!
          set "hi!diffCode!=!score!"
          copy "!gameLog!" "%hiFile%!diffCode!.txt" >nul
          >>"%hiFile%!diffCode!.txt" echo ::!score!
        )
        echo(
        %ClearLine%
        call :ask "Press a key to continue..."
        for %%A in (!configOptions!) do set "%%A=!%%ASave!"
        call :mainMenu
      )
    )
  )
)


::-------------------------------------
:getString  Prompt  Var  MaxLen
:: Prompt for a string with max lengh of MaxLen.
:: Valid keys are alpha-numeric, space, underscore, and dash
:: String is terminated by Enter
:: Backspace works to delete previous character
:: Result is returned in Var
set /a "maxLen=%3"
set "%2="
%sendCmd% prompt
<nul set /p "=%~1 "
call :purge
:getStringLoop
(%getKey% !upper! 0 1 2 3 4 5 6 7 8 9 " " _ - {Enter} !BS!)
if defined key (
  if !key! equ {Enter} (
    echo(
    exit /b
  )
  if !key! neq !BS! if !maxLen! gtr 0 (
    set /a maxLen-=1
    <nul set /p "=.!BS!!key!"
    set "%2=!%2!!key!
  )
  if !key! equ !BS! if defined %2 (
    set /a maxLen+=1
    <nul set /p "=!BS! !BS!"
    set "%2=!%2:~0,-1!"
  )
)
if defined inKey %sendCmd% one
goto :getStringLoop


::-------------------------------------
:ask  Prompt  ValidKey [Validkey]...
:: Prompt for a keypress.
:: Wait until a ValidKey is pressed and return result in Key variable.
:: Token delimiters, ), and poison characters must be quoted.
%sendCmd% prompt
<nul set /p "=%~1 "
(set validKeys=%*)
(set validKeys=!validKeys:%1=!)
call :purge
:getResponse
(%getKey% !validKeys!)
if not defined key (
  if defined inKey %sendCmd% one
  goto :getResponse
)
exit /b


:purge
set "inKey="
for /l %%N in (1 1 1000) do (
  set /p "inKey="
  if "!inKey!" equ "{purged}." exit /b
)<&%keyStream%
goto :purge


::-------------------------------------
:spinner  X  Y  ValueVar
set /a d1=-1000000
for /l %%N in (1 1 5) do for %%C in (%spinner%) do (
  call :spinnerDelay
  %plot% %1 %2 %%C
  %draw%
)
call :spinnerDelay
(%plot% %1 %2 %3)
exit /b


::-------------------------------------
:delay  centiSeconds
setlocal
for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "spinnerDelay=%1, d1=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100"
:: fall through to :spinnerDelay

::-------------------------------------
:spinnerDelay
for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "d2=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100, dDiff=d2-d1"
if %dDiff% lss 0 set /a dDiff+=24*60*60*100
if %dDiff% lss %spinnerDelay% goto :spinnerDelay
set /a d1=d2
exit /b


::-------------------------------------
:mainMenu
cls
set "loadAvailable="
echo Growth rate = !growth!
echo(
echo Main Menu:
echo(
echo   N - New game
if defined replayAvailable echo   R - Replay previous game
if defined saveAvailable   echo   S - Save a game
if exist *.snake.txt       echo   L - Load and watch a saved game&set "loadAvailable=L"

echo   C - Control options
echo   G - Graphic options
echo   Q - Quit
echo(
set "hiAvailable="
for /l %%N in (1 1 6) do if defined hi%%N (
  if not defined hiAvailable (
    echo Replay High Score:
    echo(
  )
  set "desc=!desc%%N!........"
  set "hiAvailable=!hiAvailable! %%N"
  echo   %%N - !desc:~0,8! !hi%%N!
)
if defined hiAvailable echo(
set "keys=N C G Q !hiAvailable! !replayAvailable! !saveAvailable! !loadAvailable!"
call :ask ">" !keys!
if /i !key! equ Q (
  %sendCmd% quit
  cls
  exit
)
if /i !key! equ N (
  set "replay="
  set "replayAvailable=R"
  set "saveAvailable=S"
  goto :initialize
)
if /i !key! equ S (
  if defined replayAvailable (
    call :ask "HighScore # or P for Previous:" !hiAvailable! P
  ) else (
    call :ask "HighScore #:" !hiAvailable!
  )
  echo !key!
  if /i !key! equ P (set "src=!gameLog!") else set "src=%hiFile%!key!.txt"
  call :getString "Save file name:" file 20
  copy "!src!" "!file!.snake.txt"
  call :ask "Press a key to continue..."
)
if /i !key! equ L (
  call :getString "Load file name:" file 20
  if exist "!file!.snake.txt" (
    set "replay=!file!.snake.txt"
    goto :initialize
  )
  echo Error: File "!file!.snake.txt" not found
  call :ask "Press a key to continue..."
)
if /i !key! equ R (
  set "replay=!gameLog!"
  goto :initialize
)
if !key! geq 1 if !key! leq 6 (
  set "replay=%hiFile%!key!.txt"
  goto :initialize
)
if /i !key! equ C call :controlOptions
if /i !key! equ G call :graphicOptions
goto :mainMenu


::-------------------------------------
:controlOptions
cls
set "keys={Enter} T L R P"
if !moveKeys! equ 4 set "keys=!keys! U D"
                    echo Control Options:
                    echo(
                    echo   T - Type... = !moveKeys! keys
                    echo(
                    echo   L - Left... = !left!
                    echo   R - Right.. = !right!
if !moveKeys! equ 4 echo   U - Up..... = !up!
if !moveKeys! equ 4 echo   D - Down... = !down!
                    echo(
                    echo   P - Pause.. = !pause!
                    echo(
                    echo   {Enter} - Return to Main Menu
                    echo(
call :ask ">" !keys!
if !key! equ {Enter} goto :saveUserPrefs
if /i !key! equ T (
  if !moveKeys! equ 2 (set "moveKeys=4") else set "moveKeys=2"
  goto :controlOptions
)
set "option= LLeft RRight UUp DDown PPause"
for /f %%O in ("!option:* %key%=!") do (
  call :ask "Press a key for %%O:"
  for %%K in (0 1 2) do if "!key!" equ "!invalid:~%%K,1!" goto :controlOptions
  for %%C in (!upper!) do set "key=!key:%%C=%%C!"
  set "%%O=!key!"
)
goto :controlOptions


::-------------------------------------
:graphicOptions
cls
echo Graphic Options:
echo(
echo   B - Border...... = !bound!
echo   E - Empty space. = !space!
echo   H - snake Head.. = !head!
echo   S - Snake body.. = !body!
echo   F - Food........ = !food!
echo   D - Death....... = !death!
echo(
echo   G - Growth rate. = !growth!
echo(
echo   {Enter} - Rturn to Main Menu
echo(
call :ask ">" B E H S F D G {Enter}
if !key! equ {Enter} goto :saveUserPrefs
if /i !key! equ G (
  call :ask "Press a digit for growth rate (0 = 10)" 0 1 2 3 4 5 6 7 8 9
  if !key! equ 0 set "key=10"
  set "growth=!key!"
  call :loadHighScores
) else (
  set "option=-BBorder:bound:-EEmpty Space:space:-HSnake Head:head:-SSnake Body:body:-FFood:food:-DDeath:death:"
  for /f "tokens=1,2 delims=:" %%A in ("!option:*-%key%=!") do (
    call :ask "Press a key for %%A"
    for %%K in (0 1 2) do if "!key!" equ "!invalid:~%%K,1!" goto :graphicOptions
    set "%%B=!key!"
  )
)
goto :graphicOptions


::------------------------------------
:saveUserPrefs
(for %%V in (moveKeys up down left right space bound food head body death pause growth) do echo %%V=!%%V!) >"%userPref%"
exit /b


::-------------------------------------
:initialize
cls
if defined replay (
  echo Replay Speed Options:
) else (
  echo Speed Options:
)
echo                       delay
echo    #   Description  (seconds)
echo   ---  -----------  ---------
for /l %%N in (1 1 6) do (
  set "delay=0!delay%%N!"
  set "desc=!desc%%N!           "
  echo    %%N   !desc:~0,11!    0.!delay:~-2!
)
echo(
call :ask "Pick a speed (1-6):" 1 2 3 4 5 6
set "difficulty=!desc%key%!"
set "delay=!delay%key%!"
set "diffCode=%key%"
echo %key% - %difficulty%
echo(
<nul set /p "=Initializing."
set "axis=X"
set "xDiff=+1"
set "yDiff=+0"
set "empty="
set /a "PX=1, PY=height/2, FX=width/2+1, FY=PY, score=0, emptyCnt=0, t1=-1000000"
set "gameStart="
set "m=00"
set "s=00"
set "snakeX= %PX%"
set "snakeY= %PY%"
set "snakeX=%snakeX:~-2%"
set "snakeY=%snakeY:~-2%"
for /l %%Y in (0 1 %height%) do (
  <nul set /p "=."
  set "line%%Y="
  for /l %%X in (0,1,%width%) do (
    set "cell="
    if %%Y equ 0        set "cell=%bound%"
    if %%Y equ %height% set "cell=%bound%"
    if %%X equ 0        set "cell=%bound%"
    if %%X equ %width%  set "cell=%bound%"
    if %%X equ %PX% if %%Y equ %PY% set "cell=%head%"
    if not defined cell (
      set "cell=%space%"
      set "eX= %%X"
      set "eY= %%Y"
      set "empty=!empty!#!eX:~-2! !eY:~-2!"
      set /a emptyCnt+=1
    )
    if %%X equ %FX% if %%Y equ %FY% set "cell=%food%"
    set "line%%Y=!line%%Y!!cell!"
  )
)
for %%A in (!configOptions!) do set "%%ASave=!%%A!"
set "replayFinished="
if defined replay (
  %sendCmd% replay
  %sendCmd% !replay!
  call :waitForSignal
  set "replay=(REPLAY at !difficulty!)"
  set "read=1"
  <&%keyStream% (
    for /l %%N in (1 1 !configOptionCnt!) do if defined read (
      set /p "ln="
      if "!ln!" equ "END" (set read=) else set "!ln!"
    )
  )
  set "keys="
  set "hi=0"
  for /f "delims=:" %%A in ('findstr "^::" "%hiFile%!diffCode!.txt" 2^>nul') do set "hi=%%A"
  (%draw%)
  call :delay 100
) else (
  if defined hi%diffCode% (set "hi=!hi%diffCode%!") else set "hi=0"
  (%draw%)
  >"!gameLog!" (
    for %%A in (!configOptions!) do (echo %%A=!%%A!)
    (echo END)
  )
  echo(
  if !moveKeys! equ 4 (
    echo Controls: !up!=up !down!=down !left!=left !right!=right !pause!=pause
  ) else (
    echo Controls: !left!=left !right!=right !pause!=pause
  )
  echo Avoid running into yourself (!body!!body!!head!^) or wall (!bound!^)
  echo Eat food (!food!^) to grow.
  echo(
  call :ask "Press a key to start..."
  %sendCmd% go
)
set "pauseTime=0"
set "xDiff!up!=+0"
set "xDiff!down!=+0"
set "xDiff!left!=-1"
set "xDiff!right!=+1"
set "yDiff!up!=-1"
set "yDiff!down!=+1"
set "yDiff!left!=+0"
set "yDiff!right!=+0"
set "!up!Axis=Y"
set "!down!Axis=Y"
set "!left!Axis=X"
set "!right!Axis=X"
set "xTurn!left!=1"
set "xTurn!right!=-1"
set "yTurn!left!=-1"
set "yTurn!right!=1"
set "playerSpace=!space!!food!"
set ^"keys="!left!" "!right!" "!pause!"^"
set "newHi="
set "grow=0"
if !moveKeys! equ 4 set ^"keys=!keys! "!up!" "!down!"^"
if exist "%~dp0CursorPos.exe" if not defined replay (
  cursorpos 0 -4
  for /l %%N in (1 1 5) do (echo(                                             )
)
exit /b


::-------------------------------------
:waitForSignal
if not exist "%signal%" goto :waitForSignal
del "%signal%"
exit /b


::-------------------------------------
:loadHighScores
set "saveAvailable="
for /l %%N in (1 1 6) do (
  set "hi%%N="
  for /f "delims=:" %%A in ('findstr "^::" "%hiFile%%%N.txt" 2^>nul') do (
    set "hi%%N=%%A"
    set "saveAvailable=S"
  )
)
exit /b


::-------------------------------------
:fixLogs
setlocal enableDelayedExpansion
for %%F in (*.snake) do (
  ren "%%F" "%%F.txt"
  call :fixLog "%%F.txt"
)
pushd "%SaveLoc%"
for /f "delims=" %%F in ('dir /b SnakeHi*.txt 2^>nul') do (
  set "file=%%~nF"
  set "file=Snake1Hi!file:~-1!.txt"
  ren "%%F" "!file!"
  call :fixLog "!file!"
)
popd
exit /b

:fixLog  filePath
>"%~1.new" (
  <"%~1" (
    for %%A in (diffCode difficulty moveKeys up down left right) do (
      set /p "val="
      (echo %%A=!val!)
    )
  )
  (echo growth=1)
  (echo END)
  more +7 "%~1"
)
move /y "%~1.new" "%~1" >nul
exit /b


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:controller
:: Detects keypresses and sends the information to the game via a key file.
:: The controller has various modes of input that are activated by commands sent
:: from the game via a cmd file.
::
:: Modes:
::
::   hold   - No input, wait for command
::
::   go     - Continuously get/send key presses
::
::   prompt - Send {purged} marker to allow game to purge input buffer, then
::            get/send a single key press and hold
::
::   one    - Get/send a single key press and hold
::
::   replay - Copy a game log to the key file. The next line in cmd file
::            specifies name of log file to copy. During replay, the controller
::            will send an abort signal to the game if a key is pressed.
::
::   quit   - Immediately exit the controller process
::
:: As written, this routine incorrectly reports ! as ), but that doesn't matter
:: since we don't need that key. Both <CR> and Enter key are reported as {Enter}.
:: An extra character is appended to the output to preserve any control chars
:: when read by SET /P.

setlocal enableDelayedExpansion
for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
set "cmd=hold"
set "inCmd="
set "key="
for /l %%. in () do (
  if "!cmd!" neq "hold" (
    for /f "delims=" %%A in ('xcopy /w "%~f0" "%~f0" 2^>nul') do (
      if not defined key set "key=%%A"
    )
    set "key=!key:~-1!"
    if !key! equ !CR! set "key={Enter}"
  )
  <&%cmdStream% set /p "inCmd="
  if defined inCmd (
    if !inCmd! equ quit exit
    set "cmd=!inCmd!"
    if !inCmd! equ replay (
      <&%cmdStream% set /p "file="
      type "!file!" >&%keyStream%
      copy nul "%signal%"
    )
    set "inCmd="
  )
  if defined key (
    if "!cmd!" equ "prompt" (echo {purged}.)
    if "!cmd!" equ "replay" (
      copy nul "%signal%" >nul
      set "cmd=go"
    ) else (echo(!key!.)
    if "!cmd!" neq "go" set "cmd=hold"
    set "key="
  )>&%keyStream%
)

:game
color 0c
title TOTAL WAR!!!
echo.
echo.
pause
:players
cls
set player=
set replay=
echo.
set /p player=Select 1 or 2 player mode:
if '%player%'=='1' goto name
if '%player%'=='2' goto p1name
goto players
:name
cls
set name=
echo.
set /p name=Please type in your name (One word):
if '%name%'=='' goto name
rem Easter Egg:
if '%name%'=='oof' goto win
:country
cls
set country=
set enemy=
echo.
echo Welcome %name%!
echo.
set /p country=Choose your country; USA, Russia, or Canada:
if '%country%'=='usa' goto enemy1
if '%country%'=='USA' goto enemy1
if '%country%'=='Usa' goto enemy1
if '%country%'=='Russia' goto enemy2
if '%country%'=='russia' goto enemy2
if '%country%'=='canada' goto enemy3
if '%country%'=='Canada' goto enemy3
goto country
:enemy1
set country=USA
goto enemy
:enemy2
set country=Russia
goto enemy
:enemy3
set country=Canada
:enemy
set /a cpucountryrand=%random% %%5 +1
if '%cpucountryrand%'=='0' goto enemy
if '%cpucountryrand%'=='1' set enemy=Russia
if '%cpucountryrand%'=='2' set enemy=USA
if '%cpucountryrand%'=='3' set enemy=Canada
if '%cpucountryrand%'=='4' goto enemy
if '%cpucountryrand%'=='5' goto enemy
if '%enemy%'=='%country%' goto enemy
:begin
set user=1000
set cpu=1000
set nuke=1
set airstrike=2
set missiles=3
set cpunuke=1
set cpuairstrike=2
set cpumissiles=3
:gameplay
cls
set move=
set choice=
set cpucount=0
echo.
echo %name%, your turn.
echo                                                               %country%: %user% DEF
echo Options:
echo                                                               %enemy%: %cpu% DEF
echo 1. Fire NUKE x %nuke%
echo.
echo 2. Fire Airstrike x %airstrike%
echo.
echo 3. Fire Missiles x %missiles%
echo.
echo 4. Surrender
echo.
echo 5. Do nothing
echo.
set /p move=Select your option:
if '%move%'=='1' goto nuke
if '%move%'=='2' goto airstrike
if '%move%'=='3' goto missiles
if '%move%'=='4' goto surrender
if '%move%'=='5' goto cpu1
goto gameplay
:nuke
cls
if '%nuke%'=='0' goto nonuke
echo.
echo %name% has fired a NUKE headed towards the %enemy%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %enemy% has lost 400 DEF!
echo.
pause
set /a cpu=%cpu% - 400
set nuke=0
if '%cpu%'=='0' goto win
if '%cpu%'=='-100' goto win
if '%cpu%'=='-200' goto win
if '%cpu%'=='-300' goto win
goto cpu1
:nonuke
echo.
echo You can't use a nuke since you don't have any more left!
echo.
pause
goto gameplay
:airstrike
cls
if '%airstrike%'=='0' goto noairstrike
echo.
echo %name% has fired an airstrike on the %enemy%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %enemy% has lost 300 DEF!
echo.
pause
set /a cpu=%cpu% - 300
set /a airstrike=%airstrike% - 1
if '%cpu%'=='0' goto win
if '%cpu%'=='-100' goto win
if '%cpu%'=='-200' goto win
if '%cpu%'=='-300' goto win
goto cpu1
:noairstrike
echo.
echo You can't use an airstrike since you don't have any more left!
echo.
pause
goto gameplay
:missiles
cls
if '%missiles%'=='0' goto nomissiles
echo.
echo %name% has fired multiple missiles headed towards the %enemy%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %enemy% has lost 200 DEF!
echo.
pause
set /a cpu=%cpu% - 200
set /a missiles=%missiles% - 1
if '%cpu%'=='0' goto win
if '%cpu%'=='-100' goto win
if '%cpu%'=='-200' goto win
if '%cpu%'=='-300' goto win
goto cpu1
:nomissiles
echo.
echo You can't use missiles since you don't have any more left!
echo.
pause
goto gameplay
:surrender
cls
echo.
echo "We may have lost the war, but we still have our dignity..."
echo.
pause
:end
cls
echo.
echo "We may have lost the war, but we still have our dignity..."
echo.
set /p replay=Type anything to replay the game. Type 'x' to exit:
if '%replay%'=='x' goto suggest
if '%replay%'=='' goto end
goto players
:win
cls
echo.
echo You have won Total War!!!
echo.
pause
:win2
cls
echo.
echo You have won Total War!!!
echo.
set /p replay=Type anything to replay the game. Type 'x' to exit:
if '%replay%'=='x' goto suggest
if '%replay%'=='' goto win2
goto players
:cpu1
cls
set /a cpucount=%cpucount% + 1
if '%cpucount%'=='10' goto cpu2
echo.
echo My turn.
echo                                                               %country%: %user% DEF
echo Options:
echo                                                               %enemy%: %cpu% DEF
echo 1. Fire NUKE x %cpunuke%
echo.
echo 2. Fire Airstrike x %cpuairstrike%
echo.
echo 3. Fire Missiles x %cpumissiles%
echo.
echo 4. Surrender
echo.
echo 5. Do nothing
echo.
echo Select your option:/
ping localhost -n 1 >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
cls
echo.
echo My turn.
echo                                                               %country%: %user% DEF
echo Options:
echo                                                               %enemy%: %cpu% DEF
echo 1. Fire NUKE x %cpunuke%
echo.
echo 2. Fire Airstrike x %cpuairstrike%
echo.
echo 3. Fire Missiles x %cpumissiles%
echo.
echo 4. Surrender
echo.
echo 5. Do nothing
echo.
echo Select your option:-
ping localhost -n 1 >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
cls
echo.
echo My turn.
echo                                                               %country%: %user% DEF
echo Options:
echo                                                               %enemy%: %cpu% DEF
echo 1. Fire NUKE x %cpunuke%
echo.
echo 2. Fire Airstrike x %cpuairstrike%
echo.
echo 3. Fire Missiles x %cpumissiles%
echo.
echo 4. Surrender
echo.
echo 5. Do nothing
echo.
echo Select your option:\
ping localhost -n 1 >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
goto cpu1
:cpu2
cls
set /a choice=%random% %%6
if '%choice%'=='0' goto cpu2
if '%choice%'=='4' goto cpu2
if '%choice%'=='6' goto cpu2
echo.
echo My turn.
echo                                                               %country%: %user% DEF
echo Options:
echo                                                               %enemy%: %cpu% DEF
echo 1. Fire NUKE x %cpunuke%
echo.
echo 2. Fire Airstrike x %cpuairstrike%
echo.
echo 3. Fire Missiles x %cpumissiles%
echo.
echo 4. Surrender
echo.
echo 5. Do nothing
echo.
echo Select your option:%choice%
ping localhost -n 4 >nul
if '%choice%'=='1' goto cpunuke
if '%choice%'=='2' goto cpuairstrike
if '%choice%'=='3' goto cpumissiles
if '%choice%'=='5' goto gameplay
:cpunuke
cls
if '%cpunuke%'=='0' goto nocpunuke
echo.
echo I have fired a NUKE headed towards the %country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %country% has lost 400 DEF!
echo.
ping localhost -n 4 >nul
set /a user=%user% - 400
set cpunuke=0
if '%user%'=='0' goto cpuwin
if '%user%'=='-100' goto cpuwin
if '%user%'=='-200' goto cpuwin
if '%user%'=='-300' goto cpuwin
goto gameplay
:nocpunuke
echo.
echo I can't use a nuke since I don't have any more left!
echo.
ping localhost -n 4 >nul
set cpucount=0
goto cpu1
:cpuairstrike
cls
if '%cpuairstrike%'=='0' goto nocpuairstrike
echo.
echo I have fired an airstrike on the %country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %country% has lost 300 DEF!
echo.
ping localhost -n 4 >nul
set /a user=%user% - 300
set /a cpuairstrike=%cpuairstrike% - 1
if '%user%'=='0' goto cpuwin
if '%user%'=='-100' goto cpuwin
if '%user%'=='-200' goto cpuwin
if '%user%'=='-300' goto cpuwin
goto gameplay
:nocpuairstrike
echo.
echo I can't use an airstrike since I don't have any more left!
echo.
ping localhost -n 4 >nul
set cpucount=0
goto cpu1
:cpumissiles
cls
if '%cpumissiles%'=='0' goto nocpumissiles
echo.
echo I have fired multiple missiles headed towards the %country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %country% has lost 200 DEF!
echo.
ping localhost -n 4 >nul
set /a user=%user% - 200
set /a cpumissiles=%cpumissiles% - 1
if '%user%'=='0' goto cpuwin
if '%user%'=='-100' goto cpuwin
if '%user%'=='-200' goto cpuwin
if '%user%'=='-300' goto cpuwin
goto gameplay
:nocpumissiles
echo.
echo I can't use missiles since I don't have any more left!
echo.
ping localhost -n 4 >nul
set cpucount=0
goto cpu1
:cpuwin
cls
echo.
echo It was a long battle today. I have emerged victorious, even though you tried
echo very well.
echo.
pause
:cpuwin2
cls
echo.
echo It was a long battle today. I have emerged victorious, even though you tried
echo very well.
echo.
set /p replay=Type anything to replay the game. Type 'x' to exit:
if '%replay%'=='x' goto suggest
if '%replay%'=='' goto cpuwin2
goto players
:p1name
cls
set p1name=
echo.
set /p p1name=Player 1, please type in your name (One word):
if '%p1name%'=='' goto p1name
:p2name
cls
set p2name=
echo.
set /p p2name=Player 2, please type in your name (One word):
if '%p2name%'=='%p1name%' goto p2name
if '%p2name%'=='' goto p2name
rem Easter Egg:
if '%p1name%'=='Vincent' goto p1win
if '%p2name%'=='Vincent' goto p2win
:p1country
cls
set p1country=
echo.
echo Welcome %p1name%!
echo.
set /p p1country=Choose your country; USA, Russia, or Canada:
if '%p1country%'=='usa' goto p1country1
if '%p1country%'=='USA' goto p1country1
if '%p1country%'=='Usa' goto p1country1
if '%p1country%'=='Russia' goto p1country2
if '%p1country%'=='russia' goto p1country2
if '%p1country%'=='canada' goto p1country3
if '%p1country%'=='Canada' goto p1country3
goto p1country
:p1country1
set p1country=USA
goto p2country
:p1country2
set p1country=Russia
goto p2country
:p1country3
set p1country=Canada
:p2country
cls
set p2country=
echo.
echo Welcome %p2name%!
echo.
set /p p2country=Choose your country; USA, Russia, or Canada:
if '%p2country%'=='%p1country%' goto na
if '%p2country%'=='usa' goto p2country1
if '%p2country%'=='USA' goto p2country1
if '%p2country%'=='Usa' goto p2country1
if '%p2country%'=='Russia' goto p2country2
if '%p2country%'=='russia' goto p2country2
if '%p2country%'=='canada' goto p2country3
if '%p2country%'=='Canada' goto p2country3
goto p2country
:na
cls
echo.
echo You cant choose %p1country% because %p1name% has already chosen it.
pause >nul
goto p2country
:p2country1
set p2country=USA
goto begin2
:p2country2
set p2country=Russia
goto begin2
:p2country3
set p2country=Canada
:begin2
set p1health=1000
set p2health=1000
set p1nuke=1
set p1airstrike=2
set p1missiles=3
set p2nuke=1
set p2airstrike=2
set p2missiles=3
:p1gameplay
cls
set move=
set choice=
echo.
echo %p1name%, your turn.
echo                                                               %p1country%: %p1health% DEF
echo Options:
echo                                                               %p2country%: %p2health% DEF
echo 1. Fire NUKE x %p1nuke%
echo.
echo 2. Fire Airstrike x %p1airstrike%
echo.
echo 3. Fire Missiles x %p1missiles%
echo.
echo 4. Surrender
echo.
echo 5. Do nothing
echo.
set /p move=Select your option:
if '%move%'=='1' goto p1nuke
if '%move%'=='2' goto p1airstrike
if '%move%'=='3' goto p1missiles
if '%move%'=='4' goto p1surrender
if '%move%'=='5' goto p2gameplay
goto p1gameplay
:p1nuke
cls
if '%p1nuke%'=='0' goto nop1nuke
echo.
echo %p1name% has fired a NUKE headed towards %p2country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %p2country% has lost 400 DEF!
echo.
pause
set /a p2health=%p2health% - 400
set p1nuke=0
if '%p2health%'=='0' goto p1win
if '%p2health%'=='-100' goto p1win
if '%p2health%'=='-200' goto p1win
if '%p2health%'=='-300' goto p1win
goto p2gameplay
:nop1nuke
echo.
echo You cant use a nuke since you dont have any more left!
echo.
pause
goto p1gameplay
:p1airstrike
cls
if '%p1airstrike%'=='0' goto nop1airstrike
echo.
echo %p1name% has fired an airstrike on %p2country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %p2country% has lost 300 DEF!
echo.
pause
set /a p2health=%p2health% - 300
set /a p1airstrike=%p1airstrike% - 1
if '%p2health%'=='0' goto p1win
if '%p2health%'=='-100' goto p1win
if '%p2health%'=='-200' goto p1win
if '%p2health%'=='-300' goto p1win
goto p2gameplay
:nop1airstrike
echo.
echo You cant use an airstrike since you dont have any more left!
echo.
pause
goto p1gameplay
:p1missiles
cls
if '%p1missiles%'=='0' goto nop1missiles
echo.
echo %p1name% has fired multiple missiles headed towards %p2country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %p2country% has lost 200 DEF!
echo.
pause
set /a p2health=%p2health% - 200
set /a p1missiles=%p1missiles% - 1
if '%p2health%'=='0' goto p1win
if '%p2health%'=='-100' goto p1win
if '%p2health%'=='-200' goto p1win
if '%p2health%'=='-300' goto p1win
goto p2gameplay
:nop1missiles
echo.
echo You can't use missiles since you don't have any more left!
echo.
pause
goto p1gameplay
:p1surrender
cls
echo.
echo %p2name% has won Total War!!!
echo.
pause
:p1surrender2
cls
echo.
echo %p2name% has won Total War!!!
echo.
set /p replay=Type anything to replay the game. Type x to exit:
if '%replay%'=='x' goto suggest
if '%replay%'=='' goto p1surrender2
goto players
:p1win
cls
echo.
echo %p1name% has won Total War!!!
echo.
pause
:p1win2
cls
echo.
echo %p1name% has won Total War!!!
echo.
set /p replay=Type anything to replay the game. Type x to exit:
if '%replay%'=='x' goto suggest
if '%replay%'=='' goto p1win2
goto players
:p2gameplay
cls
set move=
set choice=
echo.
echo %p2name%, your turn.
echo                                                               %p2country%: %p2health% DEF
echo Options:
echo                                                               %p1country%: %p1health% DEF
echo 1. Fire NUKE x %p2nuke%
echo.
echo 2. Fire Airstrike x %p2airstrike%
echo.
echo 3. Fire Missiles x %p2missiles%
echo.
echo 4. Surrender
echo.
echo 5. Do nothing
echo.
set /p move=Select your option:
if '%move%'=='1' goto p2nuke
if '%move%'=='2' goto p2airstrike
if '%move%'=='3' goto p2missiles
if '%move%'=='4' goto p2surrender
if '%move%'=='5' goto p1gameplay
goto p2gameplay
:p2nuke
cls
if '%p2nuke%'=='0' goto nop2nuke
echo.
echo %p2name% has fired a NUKE headed towards %p1country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %p1country% has lost 400 DEF!
echo.
pause
set /a p1health=%p1health% - 400
set p2nuke=0
if '%p1health%'=='0' goto p2win
if '%p1health%'=='-100' goto p2win
if '%p1health%'=='-200' goto p2win
if '%p1health%'=='-300' goto p2win
goto p1gameplay
:nop2nuke
echo.
echo You cant use a nuke since you dont have any more left!
echo.
pause
goto p2gameplay
:p2airstrike
cls
if '%p2airstrike%'=='0' goto nop2airstrike
echo.
echo %p2name% has fired an airstrike on %p1country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %p1country% has lost 300 DEF!
echo.
pause
set /a p1health=%p1health% - 300
set /a p2airstrike=%p2airstrike% - 1
if '%p1health%'=='0' goto p2win
if '%p1health%'=='-100' goto p2win
if '%p1health%'=='-200' goto p2win
if '%p1health%'=='-300' goto p2win
goto p1gameplay
:nop2airstrike
echo.
echo You cant use an airstrike since you dont have any more left!
echo.
pause
goto p2gameplay
:p2missiles
cls
if '%p2missiles%'=='0' goto nop2missiles
echo.
echo %p2name% has fired multiple missiles headed towards %p1country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %p1country% has lost 200 DEF!
echo.
pause
set /a p1health=%p1health% - 200
set /a p2missiles=%p2missiles% - 1
if '%p1health%'=='0' goto p2win
if '%p1health%'=='-100' goto p2win
if '%p1health%'=='-200' goto p2win
if '%p1health%'=='-300' goto p2win
goto p1gameplay
:nop2missiles
echo.
echo You cant use missiles since you dont have any more left!
echo.
pause
goto p2gameplay
:p2surrender
cls
echo.
echo %p1name% has won Total War!!!
echo.
pause
:p2surrender2
cls
echo.
echo %p1name% has won Total War!!!
echo.
set /p replay=Type anything to replay the game. Type 'x' to exit:
if '%replay%'=='x' goto suggest
if '%replay%'=='' goto p2surrender2
goto players
:p2win
cls
echo.
echo %p2name% has won Total War!!!
echo.
pause
:p2win2
cls
echo.
echo %p2name% has won Total War!!!
echo.
set /p replay=Type anything to replay the game. Type X to exit:
if '%replay%'=='x' goto :MENU
if '%replay%'=='' goto p2win2
goto players

:matrix
color 0a
cls
:a
set /a a=%random%
if %a% geq 16384 set /a aa=1
if %a% lss 16384 set /a aa=0
set /a b=%random%
if %b% geq 16384 set /a bb=1
if %b% lss 16384 set /a bb=0
set /a c=%random%
if %c% geq 16384 set /a cc=1
if %c% lss 16384 set /a cc=0
set /a d=%random%
if %d% geq 16384 set /a dd=1
if %d% lss 16384 set /a dd=0
set /a e=%random%
if %e% geq 16384 set /a ee=1
if %e% lss 16384 set /a ee=0
set /a f=%random%
if %f% geq 16384 set /a ff=1
if %f% lss 16384 set /a ff=0
set /a g=%random%
if %g% geq 16384 set /a gg=1
if %g% lss 16384 set /a gg=0
set /a h=%random%
if %h% geq 16384 set /a hh=1
if %h% lss 16384 set /a hh=0
set /a i=%random%
if %i% geq 16384 set /a ii=1
if %i% lss 16384 set /a ii=0
set /a j=%random%
if %j% geq 16384 set /a jj=1
if %j% lss 16384 set /a jj=0
set /a k=%random%
if %k% geq 16384 set /a kk=1
if %k% lss 16384 set /a kk=0
set /a l=%random%
if %l% geq 16384 set /a ll=1
if %l% lss 16384 set /a ll=0
set /a m=%random%
if %m% geq 16384 set /a mm=1
if %m% lss 16384 set /a mm=0
set /a n=%random%
if %n% geq 16384 set /a nn=1
if %n% lss 16384 set /a nn=0
set /a o=%random%
if %o% geq 16384 set /a oo=1
if %o% lss 16384 set /a oo=0
set /a p=%random%
if %p% geq 16384 set /a pp=1
if %p% lss 16384 set /a pp=0
set /a q=%random%
if %q% geq 16384 set /a qq=1
if %q% lss 16384 set /a qq=0
set /a r=%random%
if %r% geq 16384 set /a rr=1
if %r% lss 16384 set /a rr=0
set /a s=%random%
if %s% geq 16384 set /a ss=1
if %s% lss 16384 set /a ss=0
set /a t=%random%
if %t% geq 16384 set /a tt=1
if %t% lss 16384 set /a tt=0
set /a u=%random%
if %u% geq 16384 set /a uu=1
if %u% lss 16384 set /a uu=0
set /a v=%random%
if %v% geq 16384 set /a vv=1
if %v% lss 16384 set /a vv=0
set /a w=%random%
if %w% geq 16384 set /a ww=1
if %w% lss 16384 set /a ww=0
set /a x=%random%
if %x% geq 16384 set /a xx=1
if %x% lss 16384 set /a xx=0
set /a y=%random%
if %y% geq 16384 set /a yy=1
if %y% lss 16384 set /a yy=0
set /a z=%random%
if %z% geq 16384 set /a zz=1
if %z% lss 16384 set /a zz=0
echo %aa% %bb% %cc% %dd% %ee% %ff% %gg% %hh% %ii% %jj% %kk% %ll% %mm% %nn% %oo% %pp% %qq% %rr% %ss% %tt% %uu% %vv% %ww% %xx% %yy% %zz%
goto a

:hackermode
color 2
