#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Sleep(2000)

#include "Misc.au3"

While 1

	If _IsPressed("0D") Then
		Run("Exile.exe", @ScriptDir)
		Exit
	EndIf


WEnd

