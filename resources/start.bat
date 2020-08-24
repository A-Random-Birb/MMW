@echo off
: : checks if the url.txt file exists, probably not the best idea but checking if a file has a size above 0 or if it contains a Discord webhook url is probably harder
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
curl -d "content=%msg%" %url%
goto start

:fts
: : literally just echos the response into url.txt
echo You have entered the first time setup. If you dont have a Discord Webhook url, then check README.md for more information
set /p seturl="Please enter the webhook URL: "
echo %seturl% > resources\url.txt
echo Setup complete, starting main program
pause
goto :url
