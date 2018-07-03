#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <MsgBoxConstants.au3>

Global $Paused = False

HotKeySet("{F2}", "TogglePause")
HotKeySet("{F3}", "Stop")

$x = ""
$y = ""
$Yellow = ""

While 1

	ToolTip("Drücke:" & @CRLF & @CRLF & "F2 um den Bot zu pausieren." & @CRLF & "F3 um den Bot zu schließen." & @CRLF & @CRLF & "RaPhA RuLeZ!!11! xD", 1, 1)
	ControlClick("Time Clickers", "", "", "LEFT")
	ControlSend("Time Clickers", "", "", "asdfg{SPACE}0")
	Sleep(20)

WEnd

Func Stop()
	Exit
EndFunc

Func TogglePause()
	$Paused = Not $Paused
	While $Paused
		Sleep(100)
		ToolTip("Der Bot ist pausiert. Drücke F2 um ihn zu starten.", 1, 1)
	WEnd
EndFunc