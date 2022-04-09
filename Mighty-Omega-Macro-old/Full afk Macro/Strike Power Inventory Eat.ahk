
InputBox, slot, how much food slot you have?
if ErrorLevel = 1
{	
	ExitApp
}

Loop, 3
{	
	CenterWindow("ahk_exe RobloxPlayerBeta.exe")
	Sleep 100
}
CenterWindow(WinTitle)
{	
	WinGetPos,,, Width, Height, %WinTitle%
	WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2), 400, 400
}


end::reload
#maxThreadsPerHotkey, 2
F1::
macro_on := !macro_on
   if (macro_on)
{
    CoordMode Pixel, Window
    CoordMode Mouse, Window
    Loop,
    {
        
        PixelSearch, x, y, 184, 132, 186, 134, 0x3A3A3A, 40, Fast
        if ErrorLevel = 0
        {
            if Rythm = 0
            {
                Rythm++
                Sleep 100
                ;Send r
            }
            Send {Click, 50}{Click, Right}
        } 
        Else
        {
            Rythm = 0
            Sleep 100
            Sendinput, {w down}{w up}{w down}{s down}
            Sleep 100
            StartTime11 := A_TickCount
            Loop,
            {
                PixelSearch, x, y, 184, 132, 186, 134, 0x3A3A3A, 40, Fast 
                If ErrorLevel = 0
                {
                    Sleep 2000
                    Sendinput, {w up}{s up}
                    Sleep 100
                    Send {Click, 50}{Click, Right}
                    Break
                }
            } Until A_TickCount - StartTime11 > 14000
        }
        PixelSearch, x, y, 40, 132, 65, 134, 0x3A3A3A, 40, Fast
        if ErrorLevel = 0
        {
            Sleep 10000
        }
        PixelSearch, x, y, 70, 144, 80, 146, 0x3A3A3A, 40, Fast
        If ErrorLevel = 0
        {
            if eat <= 5
            {
                eat++
                Sendinput, {w up}{s up}
                Sleep 100
                Send 2
                Sleep 50 
                Send {Click}
                Sleep 5000
                Send 1
                Sleep 100
                Rythm = 0
            }
            If eat >= 5
            {
                Sendinput, {w up}{s up}
                Sleep 1000
                Send 1
                MouseMove, 118, 300, 5
                Sleep 1000
                SendInput, {VKC0}
                Sleep 500
                MouseMove, 118, 220, 5
                Sleep 100
                Send {Click down}
                Sleep 100
                MouseMove, 160, 562, 5
                Sleep 100
                Send {Click up}
                Sleep 100
                SendInput, {VKC0}
                MouseMove, 118, 300, 5
                Send 1
                Sleep 1000
                eat = 0
                Rythm = 0
                slots++
                if slots = %slot%
                {
                    Send !{f4}
                    ExitApp
                }
            }
        }
        PixelSearch, x, y, 39, 159, 41, 161, 0x9299BC,, Fast
        If ErrorLevel = 0
        {
            Send !{f4}
            Reload
        }
	PixelSearch, x, y, 20, 144, 50, 146, 0x3A3A3A, 40, Fast
        If ErrorLevel = 0
        {
            Send !{f4}
	        Reload          
        }
        PixelSearch, x, y, 409,151, 411,153, 0x242424,, Fast
        If ErrorLevel = 0
        {
            Sleep 100
            Send e
            Sleep 100
        }
    }
}else
    {
        ExitApp
    }
Return
