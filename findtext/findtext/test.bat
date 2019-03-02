
set PROGRAM="%~1"
set OUT="%TEMP%\out.txt"

:: ����� ������ �������
call %PROGRAM% Text.txt "Let" > %OUT%
if ERRORLEVEL 1 goto err
fc %OUT% Have-out.txt || goto err

:: ����� ������ �� �������
call %PROGRAM% Text.txt "help" > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% Not-out.txt || goto err

:: ����� ������ �� ����
call %PROGRAM% > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% Empty-out.txt || goto err

:: ����� ���� ���������
call %PROGRAM% Off.txt "aaa" > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% Off-out.txt || goto err

:: ����� ������ ������
call %PROGRAM% Text.txt "" > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% EmptyStr-out.txt || goto err

echo All tests passed
exit /B 0

:err
echo Program testing failed
exit /B 1