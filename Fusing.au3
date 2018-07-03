#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <Misc.au3>

HotKeySet("{F4}", exitScript)

Local $hDLL = DllOpen("user32.dll")

$mousePos = 0

While 1
    If _IsPressed("72", $hDLL) Then
		$mousePos = MouseGetPos()
		ConsoleWrite("all")
        While _IsPressed("72", $hDLL)
			MouseClick("Right", $mousePos[0], $mousePos[1], 1, 1)
            Sleep(50)
			MouseClick("left", 334, 586, 1, 1)
			Sleep(50)
        WEnd
    EndIf
    Sleep(250)
WEnd

DllClose($hDLL)


Func exitScript()
	Exit
EndFunc
