f1::
CoordMode, Pixel, Window
CoordMode, Mouse, Window
MouseGetPos, x1, y1
Loop,
{
    Click, %x1% %y1%
    Sleep 150
    ImageSearch, x, y, 10, 460, 68, 475, *60 nah.png
    If ErrorLevel = 0
    {
        Break
    }
    else
    {
        Click, 100 468
    }
}
Return
end::Reload
