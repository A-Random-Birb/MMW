@echo off
IF EXIST "resources\url.txt" (
  goto :url
) ELSE (
  goto :fts
)

:url
set /p url=<resources\url.txt
goto :start

:start
set /p msg="Enter msg: "
curl -d "content=%msg%" %url%
goto start

:fts
mkdir resources
echo You have entered the first time setup. If you dont have a Discord Webhook url, then pleasde check README.txt for more informations
set /p seturl="Please enter the webhook URL: "
echo %seturl% > resources\url.txt
echo Setup complete, starting main program
pause
goto :url