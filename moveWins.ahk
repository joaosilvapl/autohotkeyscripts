#SingleInstance force

leftMonitorWidth = 1680
leftMonitorHeight = 1050
rightMonitorWidth = 1920
rightMonitorHeight = 1080

SetBatchLines, -1  
AutoTrim, Off       


^!q::    ;Default hotkey is Ctrl+Alt+Q

processNames := ["OUTLOOK.EXE", "ONENOTE.EXE", "ONENOTEM.EXE", "chrome.exe"]
index := 0

For i, processName in processNames
{
; processName := processNames%A_Index%

; MsgBox "%processName%".

if (WinExist("ahk_exe " . processName)){
	WinGet, winIds, List, ahk_exe %processName%

    Loop, %winIds%
		{
			winId := winIds%A_Index%

; WinGetClass, this_class, ahk_id %winId%
WinGetTitle, winTitle, ahk_id %winId%

; MsgBox The class is "%this_class%", title is "%this_title%".



if(winId = 0 || winTitle = "")
{
    continue
}

; MsgBox The window title is "%winTitle%".

WinSet, Trans, 50, ahk_id %winId%

WinGet, minMax, MinMax, ahk_id %winId%
if minMax != 0  ;If it's either maximized or minimized
{
    WinRestore, ahk_id %winId%
}

WinGetPos, x, y, width, height, ahk_id %winId%

; MsgBox Dimensions: %x%, %y%, %width%, %height%.

; if x < 0
; {
;     xScale := rightMonitorWidth / leftMonitorWidth
;     yScale := rightMonitorHeight / leftMonitorHeight
;     x := leftMonitorWidth + x
;     newX := x * xScale
;     newY := y * yScale
;     newWidth := width * xScale
;     newHeight := height * yScale
; }
; else
; {
;     xScale := leftMonitorWidth / rightMonitorWidth
;     yScale := leftMonitorHeight / rightMonitorHeight
;     newX := x * xScale
;     newY := y * yScale
;     newWidth := width * xScale
;     newHeight := height * yScale
;     newX := newX - leftMonitorWidth
; }
; WinMove, ahk_id %winId%, , %newX%, %newY%, %newWidth%, %newHeight%

newX := 100 + index * 50
newY := 100 + index * 50
newWidth := width
newHeight := height

WinMove, ahk_id %winId%, , %newX%, %newY%, %newWidth%, %newHeight%
; if minMax = 1
; {
;     WinMaximize, ahk_id %winId%
; }
WinActivate ahk_id %winId%   ;Needed - otherwise another window may overlap it

WinSet, Trans, 255, ahk_id %winId%

index++

}
}
}
return

