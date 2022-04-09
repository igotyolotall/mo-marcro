#maxThreadsPerHotkey, 2
CoordMode, Pixel, Window
CoordMode, Mouse, Window
Loop, 3
{	
	CenterWindow("ahk_exe RobloxPlayerBeta.exe")
	Sleep 100
}
CenterWindow(WinTitle) {	
	WinGetPos,,, Width, Height, %WinTitle%
	WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2), 400, 400
}
removetooltip() {
    tooltip
}

end::reload

f1:: ; change keybind here!
PixelGetColor , color2, 250, 134
slots = 2
current = 0
toggle := !toggle
if (toggle)
{
    Loop, ; Start Loop
    {
        Tooltip, Start Running
        SetTimer, removetooltip, 1000
        task:
        {
            Sendinput, {w down}{w up}{w down}{s down}
            Rythm = False
            Loop,
            {
                PixelSearch, x, y, 170, 132, 171, 134, 0x3A3A3A, 40, Fast ;stamina 
                If ErrorLevel = 0
                {
                    Tooltip, Enough Stamina
                    SetTimer, removetooltip, 1000
                    Sleep 1000
                    Sendinput, {w up}{s up}
                    Sleep 100
                    Break
                }
                Sleep 1000
                PixelSearch, x, y, 249, 133, 250, 134, color2,, Fast ;If Still Full Stamina
                If ErrorLevel = 0
                {
                    Tooltip, Full Stamina
                    SetTimer, removetooltip, 1000
                    Sendinput, {w up}{s up}
                    Sleep 1000
                    Tooltip, Restart Run
                    SetTimer, removetooltip, -3000
                    Goto, task ; back to start
                }
            }
            Loop,
            {
                PixelSearch , x, y, 80, 144, 85, 146, 0x3A3A3A, 40, Fast ;Hungry
                If ErrorLevel = 0
                {
                    Tooltip, Start Eating 2 Time
                    SetTimer, removetooltip, 500
                    Sleep 500
                    Loop, 2
                    {
                        Rythm = False
                        tooltip, eat slot %slots% current %current%
                        settimer, removetooltip, -3000
                        if current <= 5
                        {
                            
                            Sleep 150
                            Send %slots%
                            Sleep 200
                            Send {Click 10}
                            Sleep 5500
                            Send %slots%
                            Sleep 100
                            Send 1
                            current++
                        }
                        if slots = 0
                        {
                            if current >= 5
                            {
                                if nah = False
                                {
                                    current = 0 
                                    Slots = 2
                                    nah = True
                                    ImageSearch, x, y, 60, 520, 790, 590, *10 %A_ScriptDir%\bin2\slot.png
                                    If ErrorLevel = 0
                                    {
                                        SetBatchLines, -1
                                        Sleep 50
                                        SendInput, 1{VKC0}
                                        Sleep 500
                                        Loop, 9 ; Search for 9 time
                                        {
                                            ; Searching for slot
                                            ImageSearch, Emptyx, Emptyy, 145, 530, 190, 580, *10 %A_ScriptDir%\bin2\empty.png ;slot 2
                                            If errorlevel = 0 
                                            {
                                                Slot = 2
                                            } else {
                                                ImageSearch, Emptyx, Emptyy, 210, 530, 260, 580, *10 %A_ScriptDir%\bin2\empty.png ;slot 3
                                                If errorlevel = 0 
                                                {
                                                    Slot = 3
                                                } else {
                                                    ImageSearch, Emptyx, Emptyy, 280, 530, 330, 580, *10 %A_ScriptDir%\bin2\empty.png ;slot 4
                                                    If errorlevel = 0 
                                                    {
                                                        Slot = 4
                                                    } else {
                                                        ImageSearch, Emptyx, Emptyy, 350, 530, 400, 580, *10 %A_ScriptDir%\bin2\empty.png ;slot 5
                                                        If errorlevel = 0 
                                                        {
                                                            Slot = 5
                                                        } else {
                                                            ImageSearch, Emptyx, Emptyy, 420, 530, 470, 580, *10 %A_ScriptDir%\bin2\empty.png ;slot 6
                                                            If errorlevel = 0 
                                                            {
                                                                Slot = 6
                                                            } else {
                                                                ImageSearch, Emptyx, Emptyy, 490, 530, 540, 580, *10 %A_ScriptDir%\bin2\empty.png ;slot 7
                                                                If errorlevel = 0 
                                                                {
                                                                    Slot = 7
                                                                } else {
                                                                    ImageSearch, Emptyx, Emptyy, 560, 530, 610, 580, *10 %A_ScriptDir%\bin2\empty.png ;slot 8
                                                                    If errorlevel = 0 
                                                                    {
                                                                        Slot = 8
                                                                    } else {
                                                                        ImageSearch, Emptyx, Emptyy, 630, 530, 680, 580, *10 %A_ScriptDir%\bin2\empty.png ;slot 9
                                                                        If errorlevel = 0 
                                                                        {
                                                                            Slot = 9
                                                                        } else {
                                                                            ImageSearch, Emptyx, Emptyy, 700, 530, 750, 580, *10 %A_ScriptDir%\bin2\empty.png ;slot 0
                                                                            If errorlevel = 0 
                                                                            {
                                                                                Slot = 0
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }

                                            Loop, 1
                                            {
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\eztaco.png  ;eztaco
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\hotdog.png ;hotdog
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\hamburger.png ;hamburger
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\pancakes.png ;pancakes
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\pie.png ;pie
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\donut.png  ;donut
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\ramen.png ;ramen  
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\TofuBeefSoup.png  ;TofuBeefSoup
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\tokitosake.png ;tokitosake  
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\Chickenfries.png ;Chickenfires  
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\steak.png  
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\chicken.png  
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\steakfriedrice.png  
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\onigiri.png  
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\omelette.png  
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\sunnysideupegg.png  
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                ImageSearch, foodx, foody, 80, 185, 680, 500, *40 %A_ScriptDir%\bin2\GrotesqueFood.png  
                                                If errorLevel = 0 
                                                {
                                                    Break
                                                }
                                                
                                            }
                                            if Slot = 2
                                            {
                                                MouseMove, foodx+10, foody+10
                                                Send {Click, Down}
                                                MouseMove, Emptyx+20, Emptyy+5
                                                Send {Click, Up}
                                            }
                                            if Slot = 3
                                            {
                                                MouseMove, foodx+10, foody+10
                                                Send {Click, Down}
                                                MouseMove, Emptyx+20, Emptyy+5
                                                Send {Click, Up}
                                            }
                                            if Slot = 4
                                            {
                                                MouseMove, foodx+10, foody+10
                                                Send {Click, Down}
                                                MouseMove, Emptyx+20, Emptyy+5
                                                Send {Click, Up}
                                            }
                                            if Slot = 5
                                            {
                                                MouseMove, foodx+10, foody+10
                                                Send {Click, Down}
                                                MouseMove, Emptyx+20, Emptyy+5
                                                Send {Click, Up}
                                            }
                                            if Slot = 6
                                            {
                                                MouseMove, foodx+10, foody+10
                                                Send {Click, Down}
                                                MouseMove, Emptyx+20, Emptyy+5
                                                Send {Click, Up}
                                            }
                                            if Slot = 7
                                            {
                                                MouseMove, foodx+10, foody+10
                                                Send {Click, Down}
                                                MouseMove, Emptyx+20, Emptyy+5
                                                Send {Click, Up}
                                            }
                                            if Slot = 8
                                            {
                                                MouseMove, foodx+10, foody+10
                                                Send {Click, Down}
                                                MouseMove, Emptyx+20, Emptyy+5
                                                Send {Click, Up}
                                            }
                                            if Slot = 9
                                            {
                                                MouseMove, foodx+10, foody+10
                                                Send {Click, Down}
                                                MouseMove, Emptyx+20, Emptyy+5
                                                Send {Click, Up}
                                            }
                                            if Slot = 0
                                            {
                                                MouseMove, foodx+10, foody+10
                                                Send {Click, Down}
                                                MouseMove, Emptyx+20, Emptyy+5
                                                Send {Click, Up}
                                            }

                                            Slot = 1
                                        }
                                        Sleep 500
                                        SendInput, {VKC0}1
                                        Sleep 200
                                    }
                                }
                                
                                PixelSearch , x, y, 25, 144, 30, 146, 0x3A3A3A, 40, Fast ; logs when hungry
                                If ErrorLevel = 0
                                {
                                    Send !{f4}
                                    Return
                                }
                            }
                        }
                        if current >= 5
                        {
                            slots++
                            current = 0
                            if slots >= 10
                            {
                                slots = 0
                            }
                        }
                    }
                }
                PixelSearch , x, y, 40, 144, 45, 146, 0x3A3A3A, 40, Fast ; losing muscle
                If ErrorLevel = 0
                {
                    Send !{f4}
                    Return
                }
                PixelSearch, x, y, 184, 132, 186, 134, 0x3A3A3A, 40, Fast ; Still Enough Stamina
                If ErrorLevel = 1 ; not enough
                {
                    Tooltip, Restart Run
                    SetTimer, removetooltip, -1000
                    ; too much stamina
                    Goto, task ; back to start
                }
                Else
                {
                    If Rythm = False
                    {
                        Rythm = True
                        Send r
                    }
                    else
                    {
                        Send {Click, 50}{Click, Right}
                    }
                }
                PixelSearch, x, y, 40, 132, 65, 134, 0x3A3A3A, 40, Fast  ; if too low stam
                if ErrorLevel = 0
                {
                    Tooltip, Too Low Stamina
                    SetTimer, removetooltip, -3000
                    Sleep 10000
                }
                
                PixelSearch, x, y, 409, 151, 411, 153, 0x242424,, Fast ;auto flow
                If ErrorLevel = 0
                {
                    Send e
                    Sleep 100
                }
                ; more here


            }
        }

    }

}
else
{
    Return
}
Return

