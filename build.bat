@ECHO OFF

SET AppVer=8.1.A.0.12

:: Build with libs

call APK_Worker.bat build XperiaKeyboard || goto :Err
call APK_Worker.bat sign XperiaKeyboard_built.apk || goto :Err
:: Rename result
set NewAPKName=XperiaKeyboard_%AppVer%_mod_allcpu.apk
del %NewAPKName% 2> nul
ren XperiaKeyboard_built_signed.apk %NewAPKName%

:: Remove libs and save as another file
call APK_Worker.bat modify XperiaKeyboard_built.apk %cd% rules_nolibs.lst || goto :Err
call APK_Worker.bat sign XperiaKeyboard_built.apk || goto :Err
:: Rename result
set NewAPKName=XperiaKeyboard_%AppVer%_mod_arm7a.apk
del %NewAPKName% 2> nul
ren XperiaKeyboard_built_signed.apk %NewAPKName%

goto :EOF

:Err
pause