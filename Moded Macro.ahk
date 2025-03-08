#Requires AutoHotkey v2.0
#SingleInstance Force
SetKeyDelay(-1)
SetMouseDelay(-1)
SetTitleMatchMode(2)
ProcessSetPriority "High"
CoordMode("Tooltip", "Window")
CoordMode("Pixel", "Window")
CoordMode("Mouse", "Window")

Result := MsgBox("If u download this macro from Fischmacro.com or any similar sites, and u get hacked, it's YOUR fault(we do NOT own those websites), pls download it from https://discord.gg/mangos . Did u download this macro from White Sand?", "Check where did u download this", "YesNo")
if (Result = "Yes")
{
    MsgBox("Thank you for downloading from the official source! Enjoy the macro!", "ty <3")
}
else
{
    MsgBox "Bruh what :) for real, pls download it from https://discord.gg/mangos"
    ExitApp
}

;     GENERAL SETTINGS     ====================================================================================================;

; How long to hold the cast for before releasing
HoldRodCastDuration := 250

; How long to wait for the bobber to land in water
WaitForBobberDelay := 1050

;     MINIGAME SETTINGS     ====================================================================================================;

; Color range to scan for fish bar
FishBarColorTolerance := 5
; Color range to scan for minigame white bar
WhiteBarColorTolerance := 17

; Color range to scan for minigame arrow
ArrowColorTolerance := 7

; Amount of clicks per action cycle
StabilizerLoop := 7
; Ratio for bar side maximum hold (1 = max bar|0.5 = half bar)
SideBarRatio := 0.67

; Strength for moving right in correct zone
StableRightMultiplier := 2.160
; Counter strafe after moving right in correct zone
StableRightDivision := 1.550
; Strength for moving left in correct zone
StableLeftMultiplier := 1.211
; Counter strafe after moving left in correct zone
StableLeftDivision := 1.12

; Strength for moving right when in wrong zone
UnstableRightMultiplier := 2.365
; Counter strafe after moving right in wrong zone
UnstableRightDivision := 1
; Strength for moving left when in wrong zone
UnstableLeftMultiplier := 2.190
; Counter strafe after moving left in wrong zone
UnstableLeftDivision := 1

; Strength for moving right after a shift in the middle
RightAnkleBreakMultiplier := 0.75
; Strength for moving left after a shift in the middle
LeftAnkleMultiplier := 0.45

WhiteBarSize := 0
;====================================================================================================;
if WinExist("Roblox")
{
    WinActivate("Roblox")
    if WinActive("Roblox")
    {
        WinMaximize("Roblox")
    }
}
else
{
    MsgBox("Pls open roblox first.", "Bruh where's roblox?")
    ExitApp()
}
;====================================================================================================;

Send("{lbutton up}")
Send("{rbutton up}")
Send("{shift up}")

;====================================================================================================;

Title := WinGetTitle("A")
WinGetPos(&WindowLeft, &WindowTop, &WindowWidth, &WindowHeight, "A")

CameraCheckLeft := WindowWidth / 2.8444
CameraCheckRight := WindowWidth / 1.5421
CameraCheckTop := WindowHeight / 1.28
CameraCheckBottom := WindowHeight

ClickShakeLeft := WindowWidth / 4.6545
ClickShakeRight := WindowWidth / 1.2736
ClickShakeTop := WindowHeight / 9
ClickShakeBottom := WindowHeight / 1.3409

MinigameAreaLeft := 0.2981543095 * WindowWidth
MinigameAreaRight := 0.7018456905 * WindowWidth
MinigameAreaTop := WindowHeight / 1.201
MinigameAreaBottom := WindowHeight / 1.15
MinigameAreaTooltipHeight := WindowHeight / 1.0626

ProgressAreaLeft := 0.391298225298586024 * WindowWidth
ProgressAreaRight := 0.608701774701413976 * WindowWidth
ProgressAreaTop := WindowHeight/1.13
ProgressAreaBottom := WindowHeight/1.08

ResolutionScaling := 2560 / WindowWidth

LookDownX := WindowWidth / 2
LookDownY := WindowHeight / 4

Total := 0
L1 := "None"

TooltipX := WindowWidth / 20
Tooltip1 := (WindowHeight / 2) - (20 * 9) - 2
Tooltip2 := (WindowHeight / 2) - (20 * 8)
Tooltip3 := (WindowHeight / 2) - (20 * 7)
Tooltip4 := (WindowHeight / 2) - (20 * 6)
Tooltip5 := (WindowHeight / 2) - (20 * 5)
Tooltip6 := (WindowHeight / 2) - (20 * 4)
Tooltip7 := (WindowHeight / 2) - (20 * 3)
Tooltip8 := (WindowHeight / 2) - (20 * 2)
Tooltip9 := (WindowHeight / 2) - (20 * 1)
Tooltip10 := (WindowHeight / 2)
Tooltip11 := (WindowHeight / 2) + (20 * 1)
Tooltip12 := (WindowHeight / 2) + (20 * 2)
Tooltip13 := (WindowHeight / 2) + (20 * 3)
Tooltip14 := (WindowHeight / 2) + (20 * 4)
Tooltip15 := (WindowHeight / 2) + (20 * 5)
Tooltip16 := (WindowHeight / 2) + (20 * 6)
Tooltip17 := (WindowHeight / 2) + (20 * 7)
Tooltip18 := (WindowHeight / 2) + (20 * 8)
Tooltip19 := (WindowHeight / 2) + (20 * 9)
Tooltip20 := (WindowHeight / 2) + (20 * 10)

ToolTip("Moded Macro", TooltipX, Tooltip1, 1)
ToolTip("Adjusted by Luke (notahero05)", TooltipX, Tooltip2, 2)
ToolTip("Press P to Start", TooltipX, Tooltip4, 4)
ToolTip("Press O to Reload", TooltipX, Tooltip5, 5)
ToolTip("Press M to Exit", TooltipX, Tooltip6, 6)
ToolTip("Shake Mode: `"Click`"", TooltipX, Tooltip16, 16)
ToolTip("Total: " Total, TooltipX, Tooltip12, 12)

;====================================================================================================;
if (WinExist("ahk_exe RobloxPlayerBeta.exe"))
{
    if (!WinActive("ahk_exe RobloxPlayerBeta.exe"))
    {
        WinActivate()
    }
}
else
{
    ExitApp()
}
;====================================================================================================;
$o::Reload()
$m::ExitApp()
$p::
;====================================================================================================;
{
    global
    global runtimeS := 0
    global runtimeM := 0
    global runtimeH := 0

    RunTime() {
        global runtimeS, runtimeM, runtimeH
        runtimeS += 1
        if (runtimeS >= 60) {
            runtimeS := 0
            runtimeM += 1
        }
        if (runtimeM >= 60) {
            runtimeM := 0
            runtimeH += 1
        }
        ToolTip("Runtime: " runtimeH "h " runtimeM "m " runtimeS "s", TooltipX, Tooltip3, 3)
    }
    SetTimer RunTime, 1000

    ToolTip("Press `"O`" to Reload", TooltipX, Tooltip4, 4)
    ToolTip("Press `"M`" to Exit", TooltipX, Tooltip5, 5)

    ToolTip(, , , 6)
    ToolTip(, , , 10)
    
    ToolTip(, , , 14)
    ToolTip(, , , 16)

    RestartMacro:
    sleep 100
    ToolTip(, , , 9)

    ToolTip("Total: " Total, TooltipX, Tooltip12, 12)

    ToolTip("Current Task: Casting Rod", TooltipX, Tooltip7, 7)
    Send("{lbutton down}")
    ToolTip("Action: Casting For " HoldRodCastDuration "ms", TooltipX, Tooltip8, 8)
    Sleep(HoldRodCastDuration)
    Send("{lbutton up}")
    ToolTip("Action: Waiting For Bobber (" WaitForBobberDelay "ms)", TooltipX, Tooltip8, 8)
    Sleep(WaitForBobberDelay)

    Goto("ClickShakeMode")


;====================================================================================================;

ClickShakeMode:

ToolTip("Current Task: Shaking", TooltipX, Tooltip7, 7)
ToolTip("Click X: None", TooltipX, Tooltip8, 8)
ToolTip("Click Y: None", TooltipX, Tooltip9, 9)

ToolTip("Click Count: 0", TooltipX, Tooltip11, 11)
i := 0
MemX := 0
MemY := 0
ClickCount := 0
MemoryX := 0
MemoryY := 0
ForceReset := false

ClickShakeModeRedo:
if (ForceReset == true) {
    ToolTip(, , , 11)    
    ToolTip(, , , 14)
    Goto("RestartMacro")
}
ToolTip("Failsafe: " i "/35", TooltipX, Tooltip14, 14)
if (i >= 35) {
    i := 0
    ForceReset := true
}
ErrorLevel := !PixelSearch(&AHKv1v2_vPlaceholder, &AHKv1v2_vPlaceholder, MinigameAreaLeft, MinigameAreaTop, MinigameAreaRight, MinigameAreaBottom, 0x424A5A, FishBarColorTolerance)
    if (ErrorLevel == 0) {
        ToolTip(, , , 9)
        ToolTip(, , , 11)       
        ToolTip(, , , 14)
        Goto("BarMinigame")
    }
ErrorLevel := !PixelSearch(&ClickX, &ClickY, ClickShakeLeft, ClickShakeTop, ClickShakeRight, ClickShakeBottom, 0xB2B2B4, 5)
if (ErrorLevel == 0) {
    MemoryX := ClickX
    MemoryY := ClickY
    ToolTip("Click X: " ClickX, TooltipX, Tooltip8, 8)
    ToolTip("Click Y: " ClickY, TooltipX, Tooltip9, 9)
    if (MemoryX == MemX) and (MemoryY == MemY) {
        Goto("ClickShakeModeRedo")
    } else {
        Clickcount++
        MouseMove ClickX, ClickY, 0
        MouseMove 0, -1, 0, "R"
        Loop 2 {
        Click
        sleep 15
        }
        ToolTip("Click Count: " ClickCount, TooltipX, Tooltip11, 11)
        i := 0
        MemX := ClickX
        MemY := ClickY
        Goto("ClickShakeModeRedo")
    }
} 
if (ErrorLevel == 1) {
    i += 1
    Goto("ClickShakeModeRedo")
}

;====================================================================================================;
BarMinigame:
sleep 0
 if WhiteBarSize != 0 {
    Goto("BarMinigameSingle")
}     
ErrorLevel := !PixelSearch(&BarX, &AHKv1v2_vPlaceholder, MinigameAreaLeft, MinigameAreaTop, MinigameAreaRight, MinigameAreaBottom, 0xF0F0F0, WhiteBarColorTolerance)
if (ErrorLevel == 0) {
   WhiteBarSize := (MinigameAreaRight-(BarX-MinigameAreaLeft))-BarX
   }
Goto("BarMinigameSingle")

;====================================================================================================;

R1:
    Total++
    ToolTip("", , , 10)
    ToolTip("", , , 11)
    ToolTip("", , , 15)
    ToolTip("", , , 17)
    ToolTip("", , , 18)
    ToolTip("", , , 19)
    ToolTip("", , , 20)
    Sleep(500)
    Goto("RestartMacro")

BarMinigameSingle:
ToolTip("Current Task: Playing Bar Minigame", TooltipX, Tooltip7, 7)
ToolTip("Bar Size: " WhiteBarSize, TooltipX, Tooltip8, 8)
ToolTip("Direction: None", TooltipX, Tooltip10, 10)
ToolTip("Loctation: " L1, TooltipX, Tooltip15, 15)

HalfBarSize := WhiteBarSize / 2
SideDelay := 0
AnkleBreakDelay := 0
DirectionalToggle := "Disabled"
MaxLeftToggle := false
MaxRightToggle := false
MaxLeftBar := MinigameAreaLeft + WhiteBarSize * SideBarRatio
MaxRightBar := MinigameAreaRight - WhiteBarSize * SideBarRatio
MaxR := MinigameAreaRight - WhiteBarSize
MaxL := MinigameAreaLeft + WhiteBarSize
RS := false
LS := false
ToolTip("|", MaxLeftBar, MinigameAreaTooltipHeight, 18)
ToolTip("|", MaxRightBar, MinigameAreaTooltipHeight, 17)
BarMinigame2:
ForceReset := false
ErrorLevel := !PixelSearch(&FishX, &AHKv1v2_vPlaceholder, MinigameAreaLeft, MinigameAreaTop, MinigameAreaRight, MinigameAreaBottom, 0x434B5B, FishBarColorTolerance)
if (ErrorLevel == 0) {
    L1 := "None"
    ToolTip(".", FishX, MinigameAreaTooltipHeight, 20)
    if (FishX <= MaxL){
        RS := false
        LS := true
    } if (FishX >= MaxR){
        RS := true
        LS := false
    } if (FishX > MaxL) and (FishX < MaxR){
        RS := false
        LS := false
    }
    if (FishX < MaxLeftBar) {
        if (MaxLeftToggle == false) {
            ToolTip("<", MaxLeftBar, MinigameAreaTooltipHeight, 19)
            ToolTip("Direction: Max Left", TooltipX, Tooltip10, 10)
            DirectionalToggle := "Right"
            MaxLeftToggle := true
            Send("{lbutton up}")
            Sleep(SideDelay)
            AnkleBreakDelay := 0
            SideDelay := 0
        }
        Goto("BarMinigame2")
    } else if (FishX > MaxRightBar) {
        if (MaxRightToggle == false) {
            ToolTip(">", MaxRightBar, MinigameAreaTooltipHeight, 19)
            ToolTip("Direction: Max Right", TooltipX, Tooltip10, 10)
            DirectionalToggle := "Left"
            MaxRightToggle := true
            Send("{lbutton down}")
            Sleep(SideDelay)
            AnkleBreakDelay := 0
            SideDelay := 0
        }
        Goto("BarMinigame2")
    }
    MaxLeftToggle := false
    MaxRightToggle := false
    ErrorLevel := !PixelSearch(&BarX, &AHKv1v2_vPlaceholder, MinigameAreaLeft, MinigameAreaTop, MinigameAreaRight, MinigameAreaBottom, 0xFFFFFF, WhiteBarColorTolerance)
    if (ErrorLevel == 0) {
        L1 := "WhiteBar"
        BarX := BarX + (WhiteBarSize / 2)
        if (BarX > FishX) {
            ToolTip("<", BarX, MinigameAreaTooltipHeight, 19)
            ToolTip("Direction: <", TooltipX, Tooltip10, 10)
            Difference := (BarX - FishX) * ResolutionScaling * StableLeftMultiplier
            CounterDifference := Difference / StableLeftDivision

            Send("{lbutton up}")
            if (DirectionalToggle == "Right") {
                Sleep(AnkleBreakDelay)
                AnkleBreakDelay := 0
            } else {
                AnkleBreakDelay := AnkleBreakDelay + (Difference - CounterDifference) * LeftAnkleMultiplier
                SideDelay := AnkleBreakDelay / LeftAnkleMultiplier * 4.5
            }
            Sleep(Difference)
            ErrorLevel := !PixelSearch(&FishX, &AHKv1v2_vPlaceholder, MinigameAreaLeft, MinigameAreaTop, MinigameAreaRight, MinigameAreaBottom, 0x434B5B, FishBarColorTolerance)
            if (ErrorLevel == 1) {
                Goto("R1")
            } else {
                if (FishX < MaxLeftBar) {
                    Send("{lbutton up}")
                    Goto("BarMinigame2")
            }
            if (FishX <= MaxL) and (LS == false) {
                CounterDifference := 0
            }
        }
            Send("{lbutton down}")
            Sleep(CounterDifference)
            Loop StabilizerLoop {
                Send("{lbutton down}")
                Send("{lbutton up}")
            }
            DirectionalToggle := "Left"
        } else {
            ToolTip(">", BarX, MinigameAreaTooltipHeight, 19)
            ToolTip("Direction: >", TooltipX, Tooltip10, 10)
            Difference := (FishX - BarX) * ResolutionScaling * StableRightMultiplier
            CounterDifference := Difference / StableRightDivision

            Send("{lbutton down}")
            if (DirectionalToggle == "Left") {
                Sleep(AnkleBreakDelay)
                AnkleBreakDelay := 0
            } else {
                AnkleBreakDelay := AnkleBreakDelay + (Difference - CounterDifference) * RightAnkleBreakMultiplier
                SideDelay := AnkleBreakDelay / RightAnkleBreakMultiplier * 4.5
            }
            Sleep(Difference)
            ErrorLevel := !PixelSearch(&FishX, &AHKv1v2_vPlaceholder, MinigameAreaLeft, MinigameAreaTop, MinigameAreaRight, MinigameAreaBottom, 0x434B5B, FishBarColorTolerance)
            if (ErrorLevel == 1) {
                Goto("R1")
            } else {
                if (FishX > MaxRightBar) {
                    Send("{lbutton up}")
                    Goto("BarMinigame2")
            }
            if (FishX >= MaxR) and (RS == false) {
                CounterDifference := 0
            }
        }
            Send("{lbutton down}")
            Sleep(CounterDifference)
            Loop StabilizerLoop {
                Send("{lbutton down}")
                Send("{lbutton up}")
            }
            DirectionalToggle := "Right"
        }
    }
    if (ErrorLevel == 1) {
        L1 := "Arrow"
        ErrorLevel := !PixelSearch(&ArrowX, &AHKv1v2_vPlaceholder, MinigameAreaLeft, MinigameAreaTop, MinigameAreaRight, MinigameAreaBottom, 0x848587, ArrowColorTolerance)
        if (ErrorLevel == 1) {
            Goto("R1")
        } else if (ArrowX > FishX) {
            ToolTip("<", ArrowX, MinigameAreaTooltipHeight, 19)
            ToolTip("Direction: <<<", TooltipX, Tooltip10, 10)
            Difference := HalfBarSize * UnstableLeftMultiplier
            CounterDifference := Difference / UnstableLeftDivision
            Send("{lbutton up}")
            if (DirectionalToggle == "Right") {
                Sleep(AnkleBreakDelay)
                AnkleBreakDelay := 0
            } else {
                AnkleBreakDelay := AnkleBreakDelay + (Difference - CounterDifference) * LeftAnkleMultiplier
                SideDelay := AnkleBreakDelay / LeftAnkleMultiplier * 4.5
            }
            Sleep(Difference * 0.245)
            loop 3 {
                ErrorLevel := !PixelSearch(&BarX, &AHKv1v2_vPlaceholder, MinigameAreaLeft, MinigameAreaTop, MinigameAreaRight, MinigameAreaBottom, 0xFFFFFF, WhiteBarColorTolerance)
                if (ErrorLevel == 0) {
                    sleep 100
                    Send("{lbutton down}")
                    Goto("BarMinigame2")
                }
                Sleep(Difference * 0.245)
            }
            ErrorLevel := !PixelSearch(&FishX, &AHKv1v2_vPlaceholder, MinigameAreaLeft, MinigameAreaTop, MinigameAreaRight, MinigameAreaBottom, 0x434B5B, FishBarColorTolerance)
            if (ErrorLevel == 1) {
                Goto("R1")
            } else {
                if (FishX < MaxLeftBar){
                    Send("lbutton up")
                Goto("BarMinigame2")
            }
            if (FishX <= MaxL) and (LS == false) {
                CounterDifference := 0
        }
            }

                Send("{lbutton down}")
                Sleep(CounterDifference)
                Loop StabilizerLoop {
                    Send("{lbutton down}")
                    Send("{lbutton up}")
                }
                DirectionalToggle := "Left"
        } else {
            ToolTip(">", ArrowX, MinigameAreaTooltipHeight, 19)
            ToolTip("Direction: >>>", TooltipX, Tooltip10, 10)
            Difference := HalfBarSize * UnstableRightMultiplier
            CounterDifference := Difference / UnstableRightDivision
            Send("{lbutton down}")
            if (DirectionalToggle == "Left") {
                Sleep(AnkleBreakDelay)
                AnkleBreakDelay := 0
            } else {
                AnkleBreakDelay := AnkleBreakDelay + (Difference - CounterDifference) * RightAnkleBreakMultiplier
                SideDelay := AnkleBreakDelay / RightAnkleBreakMultiplier * 4.5
            }
            Sleep(Difference * 0.245)
            loop 3 {
                ErrorLevel := !PixelSearch(&BarX, &AHKv1v2_vPlaceholder, MinigameAreaLeft, MinigameAreaTop, MinigameAreaRight, MinigameAreaBottom, 0xFFFFFF, WhiteBarColorTolerance)
                if (ErrorLevel == 0) {
                    sleep 100
                    Send("{lbutton up}")
                    Goto("BarMinigame2")
                }
                Sleep(Difference * 0.245)
            }
            ErrorLevel := !PixelSearch(&FishX, &AHKv1v2_vPlaceholder, MinigameAreaLeft, MinigameAreaTop, MinigameAreaRight, MinigameAreaBottom, 0x434B5B, FishBarColorTolerance)
            if (ErrorLevel == 1) {
                Goto("R1")
            } else {
                if (FishX > MaxRightBar) {
                    Send("{lbutton down}")
                Goto("BarMinigame2")
            }
            if (FishX >= MaxRightBar) and (RS == false) {
                CounterDifference := 0
            }
        }
                Send("{lbutton up}")
                Sleep(CounterDifference)
                Loop StabilizerLoop {
                    Send("{lbutton down}")
                    Send("{lbutton up}")
                }
                DirectionalToggle := "Right"
        }
    }
    Goto("BarMinigame2")
}
if (ErrorLevel == 1) {
    Goto("R1")
}
}