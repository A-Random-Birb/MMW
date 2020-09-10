@echo off
: : checks if the url.txt file exists, probably not the best idea but checking if a file has a size above 0 or if it contains a Discord webhook url is probably harder
cls
color 0a
IF EXIST "resources\url.txt" (
  goto :url
) ELSE (
  goto :fts
)

:url
: : sets the webhook url, i really dont know what the /p operator does and i really dont care as long as it works
set /p url=<resources\url.txt
goto :start

:start
: : sends the contents of the msg variable to the url variable using curl, to whoever created curl, ily
set /p msg="Enter msg: "
if not defined msg (
echo cant send empty message
goto :start
) else (
echo Sending...
curl -d "content=%msg%" %url%
)
if ERRORLEVEL 1 (
goto :error
)
echo Sent!
set "msg="
goto :start

:fts
: : literally just echos the response into url.txt
echo You have entered the first time setup. If you dont have a Discord Webhook url, then check README.md for more information
set /p seturl="Please enter the webhook URL: "
IF %seturl%==pub (
 goto :true
) ELSE (
 goto :false
)

:true
set seturl=https://discord.com/api/webhooks/753294925721763871/qTNDxQVzeXn4nYWmML3TPNXY_Wbk59zWStqik70e089ZERwPBUfAvdWCXeMxRZT4MOun
echo %seturl% > resources\url.txt
echo Connected to public webhook
echo Setup complete, starting main program
pause
goto :url

:false
echo %seturl% > resources\url.txt
echo Setup complete, starting main program
pause
goto :url

:error
echo oops, something went wrong. you can try and figure it out yourself, referance the error guide or dm the owner (me) of the Discord server, which is in the README
echo Press any button to exit back to the comand prompt
pause >nul
color 07
exit /b