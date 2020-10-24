#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consi"stent starting directory.
SetBatchLines, -1
#SingleInstance force
#include socket2020.ahk

address := ["0.0.0.0", 5007]						; for multicast binding,  address should set to "0.0.0.0"		, sendust 2020/10/24
address_multicast := "224.1.1.1"				; interest multicast address
udp_recv := new SocketUDP()
udp_recv.bind(address)
udp_recv.addmembership(address_multicast)

udp_recv.onRecv := Func("OnUDPRecv")

return

esc::
udp_recv.dropmembership(address_multicast)
ExitApp


onUDPRecv(this)
{

	buffer := ""
	length := this.Recv(buffer)			; UDP length
	message :=  StrGet(&buffer, length, "utf-8")
	FileAppend, UDP packet arrived  [%length%] - %message% `r`n , *	
}

