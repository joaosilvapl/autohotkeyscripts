#SingleInstance force

^!F2::

WinGet, ExStyle, ExStyle, A

If (ExStyle & 0x8){
    ToolTip, Always On Top Disabled
    WinSet, AlwaysOnTop, toggle, A
    SetTimer, RemoveToolTip, 1000
}
Else{
    ToolTip, Enabling Always On Top...
    SetTimer, EnableAlwaysOnTop, 1000
}

return

EnableAlwaysOnTop:
SetTimer, EnableAlwaysOnTop, Off
ToolTip
WinSet, AlwaysOnTop, toggle, A
return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return