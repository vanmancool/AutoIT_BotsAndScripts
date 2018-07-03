#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Math for Poe!", 202, 254, 192, 124)
GUISetBkColor(0xFFFFFF)
$Group1 = GUICtrlCreateGroup("\_ Lazy Ass Calculator _/ ", 16, 8, 169, 233)
$Label1 = GUICtrlCreateLabel("Please enter the amount:", 24, 64, 160, 17)
$Input1 = GUICtrlCreateInput("", 24, 88, 145, 21)
$Combo1 = GUICtrlCreateCombo("Currency", 24, 32, 145, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData($Combo1, " |GCP to Chaos|Chaos to GCP||Regret to Chaos|Chaos to Regret||Fusing to Chaos|Chaos to Fusing", "")
$Button1 = GUICtrlCreateButton("Math it!", 56, 136, 75, 25)
$Label2 = GUICtrlCreateLabel("Please enter all information and click math it. :)", 24, 176, 148, 49)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$getCurrency = "Error!"

$rateGcp = 1.3333
$gToC = "3 : 4"
$rateChaos = 0.8333
$cToG = "6 : 5"

$rateRegret = 1.7
$rToC = "5 : 9"
$rateChaosR = 0.7
$cToR = "8 : 5"

$rateFusing = 1.8
$fToC = "5 : 9"
$rateChaosF = 0.625
$cToF = "8 : 5"

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Button1
			$readCurrency = GUICtrlRead($Combo1)
			$readAmount = GUICtrlRead($Input1)

			If $readCurrency = "Currency" Then
				GUICtrlSetData($Label2, "Please select the right currency in the combobox.")
			Else
				If $readCurrency = "GCP to Chaos" Then
					If $readAmount = "" Then
						GUICtrlSetData($Label2, "Please enter the right amount of currency you wish to exchange...")
					Else
						$getCurrency = $readAmount * $rateGcp
						$getCurrency =  Round($getCurrency)
						GUICtrlSetData($Label2, "Get: " & $getCurrency & @CRLF & "Ratio: " & $gToC)
					EndIf
					ElseIf $readCurrency = "Chaos to GCP" Then
					If $readAmount = "" Then
						GUICtrlSetData($Label2, "Please enter the right amount of currency you wish to exchange...")
					Else
						$getCurrency = $readAmount * $rateChaos
						$getCurrency =  Round($getCurrency)
						GUICtrlSetData($Label2, "Get: " & $getCurrency & @CRLF & "Ratio: " & $cToG)
					EndIf



					ElseIf $readCurrency = "Regret to Chaos" Then
					If $readAmount = "" Then
						GUICtrlSetData($Label2, "Please enter the right amount of currency you wish to exchange...")
					Else
						$getCurrency = $readAmount * $rateRegret
						$getCurrency =  Round($getCurrency)
						GUICtrlSetData($Label2, "Get: " & $getCurrency & @CRLF & "Ratio: " & $rToC)
					EndIf
					ElseIf $readCurrency = "Chaos to Regret" Then
					If $readAmount = "" Then
						GUICtrlSetData($Label2, "Please enter the right amount of currency you wish to exchange...")
					Else
						$getCurrency = $readAmount * $rateChaosR
						$getCurrency =  Round($getCurrency)
						GUICtrlSetData($Label2, "Get: " & $getCurrency & @CRLF & "Ratio: " & $cToR)
					EndIf



					ElseIf $readCurrency = "Fusing to Chaos" Then
					If $readAmount = "" Then
						GUICtrlSetData($Label2, "Please enter the right amount of currency you wish to exchange...")
					Else
						$getCurrency = $readAmount * $rateFusing
						$getCurrency =  Round($getCurrency)
						GUICtrlSetData($Label2, "Get: " & $getCurrency & @CRLF & "Ratio: " & $fToC)
					EndIf
					ElseIf $readCurrency = "Chaos to Fusing" Then
					If $readAmount = "" Then
						GUICtrlSetData($Label2, "Please enter the right amount of currency you wish to exchange...")
					Else
						$getCurrency = $readAmount * $rateChaosF
						$getCurrency =  Round($getCurrency)
						GUICtrlSetData($Label2, "Get: " & $getCurrency & @CRLF & "Ratio: " & $cToF)
					EndIf
				EndIf
			EndIf

	EndSwitch
WEnd
