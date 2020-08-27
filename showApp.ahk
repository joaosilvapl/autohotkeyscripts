#SingleInstance force

SetBatchLines, -1  
AutoTrim, Off       


^!F5::ShowApp("doublecmd.exe", null, null)
;F6 is used on another script
^!F7::ShowApp("Onenote.exe", null, null)
^!F8::ShowApp("Code.exe", null, null)
^!Left::ShowApp("OUTLOOK.exe", "Inbox -", null)
^!Down::ShowApp("OUTLOOK.exe", "Calendar -", null)
^!Right::ShowApp("Teams.exe", null, null)
^!Up::ShowApp("chrome.exe", null, null)
^!Numpad0::ShowApp("firefox.exe", null, null)


ShowApp(processName, windowTitle, windowTitle2) {

	if (WinExist("ahk_exe " . processName)){
		WinGet, winIds, List, ahk_exe %processName%

		Loop, %winIds%{

			winId := winIds%A_Index%

			; WinGetClass, this_class, ahk_id %winId%
			WinGetTitle, winTitle, ahk_id %winId%

			if(InStr(winTitle, windowTitle), false)
			{
				
				WinGet, minMax, MinMax, ahk_id %winId%
				WinGetPos, x, y, width, height, ahk_id %winId%

				wasRestored := false

				if(minMax == -1 || (minMax == 1 && x >= 0)){
					WinRestore, ahk_id %winId%
					wasRestored = true
				}

				WinGetPos, x, y, width, height, ahk_id %winId%

				if(x>=0) {
					newX := -1000
					newY := 100
					newWidth := width
					newHeight := height

					WinMove, ahk_id %winId%, , %newX%, %newY%, %newWidth%, %newHeight%
				}
				
				if(wasRestored){
					WinMaximize, ahk_id %winId%
				}

				WinActivate ahk_id %winId%   ;Needed - otherwise another window may overlap it

			}
		}
	}

	return
}

