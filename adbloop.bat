for /F "delims=" %%i in (newussdphonenumbers.txt) do (
    
    rem Check for and clear OK dialog
    adb shell service call power 17 | findstr /C:"---)"
    adb shell service call power 16 | findstr /C:"---)"

    rem Press OK button on dialog
    adb shell input keyevent KEYCODE_ENTER

    adb shell service call phone 7 i32 1 | findstr /C:"---)"
    adb shell input text "%%i"
    adb shell input keyevent KEYCODE_CALL
    timeout /T 5 /NOBREAK
    rem Press OK button on dialog
    adb shell input keyevent KEYCODE_ENTER
)
