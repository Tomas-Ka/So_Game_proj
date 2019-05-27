@echo off

:Question
cls
echo.
echo.
echo.
echo.
echo do you want to get updated git data or save and upload?
set /p var="u for update, s for save and upload and Fix for fixing download: "

if %var% == u goto Update
if %var% == U goto Update
if %var% == s goto Save
if %var% == S goto Save
if %var% == Fix goto Fix

goto Question

:Update
git pull
echo.
echo Done, press any button to quit
pause >null
del null
exit

:Save

cls
echo.
echo.
echo.
echo.

set /p new_files="Did you add any new files in this update? y/n: "
if %new_files% == y goto add_files
if %new_files% == Y goto add_files
if %new_files% == n goto commit
if %new_files% == N goto commit
goto Save

:add_files

cls
echo.
echo.
echo.
echo.

git status
echo.
echo type the names of the files you want to add, including .txt or whatever
set /p files="-> "
git add %files%

set /p continue="Are there more files that need to be added? y/n:"
if %continue% == y goto add_files
if %continue% == Y goto add_files
if %continue% == n goto commit
if %continue% == N goto commit

:commit
cls
echo.
set /p message="what did you change in this update?: "
echo.
git commit -a -m"%message%"
echo.
git push
echo.
echo Done, press any button to quit
pause >null
del null
exit

:Fix
cd..
rmdir /s "SO Videogame-project-game - Copy"
xcopy "SO Videogame-project-game" "So Videogame-project-game - Copy" /h /e /i
cd "SO Videogame-project-game"
git checkout *

echo Done, press any button to quit
pause >null
del null
exit