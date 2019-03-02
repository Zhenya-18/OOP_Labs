
set PROGRAM="%~1"
set OUT="%TEMP%\out.txt"

:: когда нормальное число
call %PROGRAM% 5 > %OUT%
if ERRORLEVEL 1 goto err
fc %OUT% Norm-out.txt || goto err

:: когда не число
call %PROGRAM% "Text" > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% BadNum-out.txt || goto err

:: когда отрицательное число
call %PROGRAM% -9> %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% BadNum-out.txt || goto err

:: когда строка пустая
call %PROGRAM% > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% Empty-out.txt || goto err

:: когда число не в рамках
call %PROGRAM% 1000 > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% OverNum-out.txt || goto err

echo All tests passed
exit /B 0

:err
echo Program testing failed
exit /B 1