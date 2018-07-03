#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include "Misc.au3"

Global $g_bPaused = False

HotKeySet("{Space}", startPotting)
HotKeySet("{Enter}", sleepForChat)
HotKeySet("{F3}", exitScript)


While 1

	Sleep(10)

WEnd

Func startPotting()

	$rN1 = Random(2, 3, 1)

	If $rN1 = 2 Then
		$rN2 = 3
	Else
		$rN2 = 2
	EndIf

	$rN3 = Random(4, 5, 1)

	If $rN3 = 4 Then
		$rN4 = 5
	Else
		$rN4 = 4
	EndIf

	$nS = Random(0, 3, 1)

	If $nS = 0 Then
		Send($rN1)
		Sleep(Random(68, 142))
		Send($rN2)
		Sleep(Random(68, 142))
		Send($rN3)
		Sleep(Random(68, 142))
		Send($rN4)
		Sleep(Random(68, 142))
	ElseIf $nS = 1 Then
		Send($rN3)
		Sleep(Random(68, 142))
		Send($rN4)
		Sleep(Random(68, 142))
		Send($rN1)
		Sleep(Random(68, 142))
		Send($rN2)
		Sleep(Random(68, 142))
	ElseIf $nS = 2 Then
		Send($rN4)
		Sleep(Random(68, 142))
		Send($rN1)
		Sleep(Random(68, 142))
		Send($rN3)
		Sleep(Random(68, 142))
		Send($rN2)
		Sleep(Random(68, 142))
	ElseIf $nS = 3 Then
		Send($rN2)
		Sleep(Random(68, 142))
		Send($rN4)
		Sleep(Random(68, 142))
		Send($rN3)
		Sleep(Random(68, 142))
		Send($rN1)
		Sleep(Random(68, 142))
	EndIf

EndFunc


Func sleepForChat()
    Run("sleepRestart.exe", "")
	Exit
EndFunc

Func exitScript()
	Exit
EndFunc
