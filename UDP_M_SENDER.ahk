#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consi"stent starting directory.
SetBatchLines, -1
#SingleInstance force
#include socket2020.ahk

address := ["224.1.1.1", 5007]						; for multicast binding,  address should be "0.0.0.0"		, sendust 2020/10/24
udp_send := new SocketUDP()
udp_send.connect(address)


while (1)
{
	udp_send.SendText(A_TickCount)
	FileAppend, Send UDP Packet %A_TickCount% `r`n, *
	Sleep, 500
	
}

return

esc::
ExitApp


