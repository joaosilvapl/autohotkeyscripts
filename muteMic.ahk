#SingleInstance force

F1::

SoundSet, +1, MASTER, mute,6 
SoundGet, master_mute, , mute, 6

ToolTip, Mute %master_mute% ;use a tool tip at mouse pointer to show what state mic is after toggle
SetTimer, RemoveToolTip, 1000
return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return