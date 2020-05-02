#SingleInstance force

SetBatchLines, -1  
AutoTrim, Off       


^!F8::ShowApp("Code.exe", null)
^!F9::ShowApp("OUTLOOK.exe", "Inbox -")
^!F10::ShowApp("OUTLOOK.exe", "Calendar -")
^!F11::ShowApp("Teams.exe", null)
^!F12::ShowApp("chrome.exe", null)


ShowApp(processName, windowTitle) {

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

