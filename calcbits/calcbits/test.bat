
set PROGRAM="%~1"
set OUT="%TEMP%\out.txt"

:: ����� ���������� �����
call %PROGRAM% 5 > %OUT%
if ERRORLEVEL 1 goto err
fc %OUT% Norm-out.txt || goto err

:: ����� �� �����
call %PROGRAM% "Text" > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% BadNum-out.txt || goto err

:: ����� ������������� �����
call %PROGRAM% -9> %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% BadNum-out.txt || goto err

:: ����� ������ ������
call %PROGRAM% > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% Empty-out.txt || goto err

:: ����� ����� �� � ������
call %PROGRAM% 1000 > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% OverNum-out.txt || goto err

echo All tests passed
exit /B 0

:err
echo Program testing failed
exit /B 1