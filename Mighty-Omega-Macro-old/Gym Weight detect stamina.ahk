end::reload

f1::
loop,
{
    CoordMode, Pixel, Window
    CoordMode, Mouse, Window
    Click , 340, 400
    Sleep 220
    Click , 340, 370
    Sleep 220
    Click , 340, 340
    Sleep 220
    Click , 340, 310
    Sleep 220
    Click , 340, 280
    Sleep 220
    Click , 340, 250
    Sleep 220
    Click , 410, 355
    Sleep 220
    StartTime := A_TickCount
    Loop ,
    {
        ImageSearch, x , y , 250 , 220 , 560 , 440, *30 %A_ScriptDir%\bin\yellow.png ;0xB1EA40
        if (errorlevel = 0)
        {
            MouseClick, Left,  x+5, y+5
            Sleep 100
            Click, 400, 500
        }
        PixelSearch , x, y, 40, 133, 45, 135, color1, 3, Fast
        If ErrorLevel = 0
        {
            Sleep 6000
        }
    } Until A_TickCount - StartTime > 62000
    StartTime2 := A_TickCount
    Loop ,
    {
        Click, 400, 390
        Sleep 16
    } Until A_TickCount - StartTime2 > 5000
    Sleep 7000
}
return

F2::
CoordMode , Pixel, Window
SendInput , {w down}{w up}{w down}{s down}
Sleep 6000
PixelGetColor , color1, 150, 134,
SendInput , {w up}{s up}
Return
