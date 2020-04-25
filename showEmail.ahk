#SingleInstance force

SetBatchLines, -1  
AutoTrim, Off       


^!F9::

processName := "OUTLOOK.exe"

if (WinExist("ahk_exe " . processName)){
	WinGet, winIds, List, ahk_exe %processName%

    Loop, %winIds%{

		winId := winIds%A_Index%

		; WinGetClass, this_class, ahk_id %winId%
		WinGetTitle, winTitle, ahk_id %winId%

		if(InStr(winTitle,"Inbox -"), false)
		{
			
			WinGet, minMax, MinMax, ahk_id %winId%
			if minMax != 0  ;If it's either maximized or minimized
			{
				WinRestore, ahk_id %winId%
			}

			WinGetPos, x, y, width, height, ahk_id %winId%

			newX := 100
			newY := 100
			newWidth := width
			newHeight := height

			WinMove, ahk_id %winId%, , %newX%, %newY%, %newWidth%, %newHeight%
			WinMaximize, ahk_id %winId%

			WinActivate ahk_id %winId%   ;Needed - otherwise another window may overlap it

		}
	}
}

return

