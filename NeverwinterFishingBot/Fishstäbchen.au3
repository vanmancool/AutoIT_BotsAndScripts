#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here



#include "ImageSearch.au3"
#include <MsgBoxConstants.au3>

Global $Paused = False

HotKeySet("{F2}", "TogglePause")
HotKeySet("{F3}", "Stop")
HotKeySet("{F4}", "SearchFish")
HotKeySet("{F5}", "SearchMapOnly")

$x = ""
$y = ""
$search = ""
$search1 = ""
$search2 = ""
$search3 = ""
$position = ""
$imageFolder = @ScriptDir & "\Images\"

While 1

	ToolTip("")
	SearchFish()

WEnd


Func Stop()
	Exit
EndFunc

Func SearchFish()
	For $i = 1 To 6 Step 1

		$search = _ImageSearch($imageFolder & $i & ".png", 0, $x, $y, 0)
		If $search = 1 Then
			If $i = 6 Then
				Opt("SendKeyDownDelay", 1500)
				Send("r")
			ElseIf $i = 1 Then
				MouseClick("LEFT")
			ElseIf $i = 2 Then
				MouseClick("RIGHT")
			ElseIf $i = 3 Then
				Send("1")
			ElseIf $i = 4 Then
				Opt("SendKeyDownDelay", 1500)
				Send("q")
			ElseIf $i = 5 Then
				Opt("SendKeyDownDelay", 1500)
				Send("e")
			EndIf
		EndIf
	Next
EndFunc

Func SearchMapOnly()
	For $i = 1 To 3
		$search = _ImageSearch($imageFolder & $i & ".png", 0, $x, $y, 0)
		If $search = 1 Then
			If $i = 1 Then
				MouseClick("LEFT")
			ElseIf $i = 2 Then
				MouseClick("RIGHT")
			ElseIf $i = 3 Then
				Send("1")
			EndIf
		EndIf
	Next

	$search1 = _ImageSearch($imageFolder & "3.png", 0, $x, $y, 0)
	If $search1 = 1 Then
		$search2 = _ImageSearch($imageFolder & "4.png", 0, $x, $y, 0)
		If $search2 = 1 Then
			Opt("SendKeyDownDelay", 2500)
			Send("q")
		Else
			Opt("SendKeyDownDelay", 2500)
			Send("w")
		EndIf
	EndIf
EndFunc

Func TogglePause()
	$Paused = Not $Paused
	While $Paused
		Sleep(100)
		ToolTip("Paused", 1, 1)
	WEnd
EndFunc