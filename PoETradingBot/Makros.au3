#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <WindowsConstants.au3>
#include <GuiConstants.au3>
#include <ScrollBarsConstants.au3>
#include <GuiEdit.au3>
#include <GuiStatusBar.au3>

$FilePath = ""
$poePath = ""
$tom = ""
$tradeStatus = "Pending"
$requestedItemFinal = ""
$for = ""
$refresh = 0

$guildMessageShort = ""

$iniRead = 0

$rateGcp = 1.3333
$rateChaos = 0.9

$rateRegret = 1.8
$rateChaosR = 0.625


StartUp()

Func StartUp()

	If FileExists(@ScriptDir & "\Settings.ini") Then
		$poePath = IniRead("Settings.ini", "Settings", "Path of Exile", "")
	Else
		$sFolderPath = FileSelectFolder("Looks like you start this bot for the first time please choose your Poe Folder", "C:\Games\SteamLibrary\steamapps\common\Path of Exile\")
		$FilePath = $sFolderPath & "\logs\Client.txt"

		IniWrite("Settings.ini", "Settings", "Path of Exile", $FilePath)
	EndIf

EndFunc

#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("Trade Whisperer", 477, 398, 192, 124)
GUICtrlCreateTab(10, 200, 458, 178)
GUICtrlCreateTabItem("Whisper Chat")
GUICtrlSetState(-1,$GUI_SHOW)
$WhisperList = GUICtrlCreateList("", 16, 235, 438, 132)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlCreateTabItem("Guild Chat")
GUICtrlSetState(-1,$GUI_SHOW)
$GuildList = GUICtrlCreateList("", 16, 235, 438, 132)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlCreateTabItem("Trade Chat")
GUICtrlSetState(-1,$GUI_SHOW)
$TradeList = GUICtrlCreateList("", 16, 235, 438, 132)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlCreateTabItem("Global Chat")
GUICtrlSetState(-1,$GUI_SHOW)
$GlobalList = GUICtrlCreateList("", 16, 235, 438, 132)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlCreateTabItem("Local Chat")
GUICtrlSetState(-1,$GUI_SHOW)
$LocalList = GUICtrlCreateList("", 16, 235, 438, 132)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlCreateTabItem("Order Incomming:")
GUICtrlSetState(-1,$GUI_SHOW)
$OrderList = GUICtrlCreateList("", 16, 235, 438, 132)
GUICtrlSetData(-1, "1:Time and Date:|2:Buyer:|3:Orders:|4:For:|5:Order Status:")
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Local $aArray = FileReadToArray($poePath)
Local $whisperMessageShort = FileReadToArray($poePath)
Local $guildMessageShort = FileReadToArray($poePath)
Local $tradeMessageShort = FileReadToArray($poePath)
Local $globalMessageShort = FileReadToArray($poePath)
Local $localMessageShort = FileReadToArray($poePath)

$newMessage = UBound($aArray)
   If @error Then
       MsgBox($MB_SYSTEMMODAL, "", "There was an error reading the file. @error: " & @error)
	Else
		For $i = 0 To UBound($aArray) -1
			$whisperChat = StringInStr($aArray[$i], "@" & "From")
			$guildChat = StringInStr($aArray[$i], "&")
			$tradeChat = StringInStr($aArray[$i], "$")
			$globalChat = StringInStr($aArray[$i], "#")
			If $whisperChat = 55 Then
				$whisperMessageShort[$i] = StringTrimLeft($aArray[$i], 55)
				GUICtrlSetData($whisperList, 100000 + $i & ": " & $whisperMessageShort[$i])
			EndIf
			If $guildChat = 55 Then
				$guildMessageShort[$i] = StringTrimLeft($aArray[$i], 55)
				GUICtrlSetData($GuildList, 100000 + $i & ": " & $guildMessageShort[$i])
			EndIf
			If $tradeChat = 55 Then
				$tradeMessageShort[$i] = StringTrimLeft($aArray[$i], 55)
				GUICtrlSetData($tradeList, 100000 + $i & ": " & $tradeMessageShort[$i])
			EndIf
			If $globalChat = 55 Then
				$globalMessageShort[$i] = StringTrimLeft($aArray[$i], 55)
				GUICtrlSetData($globalList, 100000 + $i & ": " & $globalMessageShort[$i])
			EndIf
		Next
	EndIf


While 1

	$aArray = FileReadToArray($poePath)
	LoadingMessages()
	SearchForTrade()

	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd


Func LoadingMessages()

	$newMessageLoading = UBound($aArray)
	Local $whisperMessageShort = FileReadToArray($poePath)
	Local $guildMessageShort = FileReadToArray($poePath)
	Local $tradeMessageShort = FileReadToArray($poePath)
	Local $globalMessageShort = FileReadToArray($poePath)
	Local $localMessageShort = FileReadToArray($poePath)


	If $newMessageLoading > $newMessage Then
		$refresh = 1
		$aArray = FileReadToArray($poePath)
		$newMessage = UBound($aArray)
		If @error Then
			MsgBox($MB_SYSTEMMODAL, "", "There was an error reading the file. @error: " & @error)
		Else
			For $i = 0 To $newMessageLoading -1
			$whisperChat = StringInStr($aArray[$i], "@" & "From")
			$guildChat = StringInStr($aArray[$i], "&")
			$tradeChat = StringInStr($aArray[$i], "$")
			$globalChat = StringInStr($aArray[$i], "#")

			If $whisperChat = 55 Then
				$whisperMessageShort[$i] = StringTrimLeft($aArray[$i], 55)
				GUICtrlSetData($whisperList, 100000 + $i & ": " & $whisperMessageShort[$i])
			EndIf
			If $guildChat = 55 Then
				$guildMessageShort[$i] = StringTrimLeft($aArray[$i], 55)
				GUICtrlSetData($GuildList, 100000 + $i & ": " & $guildMessageShort[$i])
			EndIf
			If $tradeChat = 55 Then
				$tradeMessageShort[$i] = StringTrimLeft($aArray[$i], 55)
				GUICtrlSetData($tradeList, 100000 + $i & ": " & $tradeMessageShort[$i])
			EndIf
			If $globalChat = 55 Then
				$globalMessageShort[$i] = StringTrimLeft($aArray[$i], 55)
				GUICtrlSetData($globalList, 100000 + $i & ": " & $globalMessageShort[$i])
			EndIf
		Next
		EndIf
	Else
	EndIf
EndFunc

Func SearchForTrade()

	If $refresh = 1 Then

		$messageFilter = FileReadToArray($poePath)
		$lastLineWhisper = UBound($messageFilter)

		For $i = 0 To $lastLineWhisper -1
			If StringInStr($messageFilter[$i], "Hi, I'd like to buy your") Then

				$orderTime = StringLeft($messageFilter[$i], 19) ;Get Order Time

				$buyer = StringInStr($messageFilter[$i], "@From ")		;Get Buyer Name
				$buyerTrim = StringTrimLeft($messageFilter[$i], $buyer +5)
				$buyerTrim2 = StringInStr($buyerTrim, ":")
				$buyerName = StringLeft($buyerTrim, $buyerTrim2 -1)

				;-----------------------------------------------------------------------------

				$requestedItemStack = StringInStr($messageFilter[$i], "your") ;Get requested Item Stacksize
				$requestedItemStackTrim = StringTrimLeft($messageFilter[$i], $requestedItemStack +4)

				$requestedItemStackTrim2 = StringInStr($requestedItemStackTrim, " ")
				$requestedItemStacks = StringLeft($requestedItemStackTrim, $requestedItemStackTrim2 -1) ;Got Stacksize

				;-----------------------------------------------------------------------------

				$forStack = StringInStr($messageFilter[$i], "my") ;Get for Item Stacksize
				$forStackTrim = StringTrimLeft($messageFilter[$i], $forStack +2)

				$forStackTrim2 = StringInStr($forStackTrim, " ")
				$forStacks = StringLeft($forStackTrim, $forStackTrim2 -1) ;Got Stacksize

				;-----------------------------------------------------------------------------

				$requestedItem = StringInStr($messageFilter[$i], "regret")
				$requestedItem1 = StringInStr($messageFilter[$i], "gcp")
				$requestedItem2 = StringInStr($messageFilter[$i], "chaos")

				$tradeStatusIni = IniRead("Trades.ini", $buyerName, $orderTime, "")

				Sleep(5000)

				If $tradeStatusIni = "Done" Then
				Else
					If $requestedItem = 0 Then
						If $requestedItem1 < $requestedItem2 Then
							$requestedItemFinal = "gcp"
							$for = "chaos"
							$priceRate = $rateGcp * $requestedItemStacks
							Send("{Enter}")
							Sleep(1000)
							Send("@" & $buyerName & " Price is " & $priceRate & " " & $for & " come my ho and trade when ready.")
							Sleep(1000)
							Send("{Enter}")
							$tradeStatus = "Done"
						Else
							$requestedItemFinal = "chaos"
							$for = "gcp"
							$priceRate = $rateChaos * $requestedItemStacks
							Send("{Enter}")
							Sleep(1000)
							Send("@" & $buyerName & " Price is " & $priceRate & " " & $for & " come my ho and trade when ready.")
							Sleep(1000)
							Send("{Enter}")
							$tradeStatus = "Done"
						EndIf
					ElseIf $requestedItem1 = 0 Then
						If $requestedItem < $requestedItem2 Then
							$requestedItemFinal = "regret"
							$for = "chaos"
							$priceRate = $rateGcp * $requestedItemStacks
							Send("{Enter}")
							Sleep(1000)
							Send("@" & $buyerName & " Price is " & $priceRate & " " & $for & " come my ho and trade when ready.")
							Sleep(1000)
							Send("{Enter}")
							$tradeStatus = "Done"
						Else
							$requestedItemFinal = "chaos"
							$for = "regret"
							$priceRate = $rateGcp * $requestedItemStacks
							Send("{Enter}")
							Sleep(1000)
							Send("@" & $buyerName & " Price is " & $priceRate & " " & $for & " come my ho and trade when ready.")
							Sleep(1000)
							Send("{Enter}")
							$tradeStatus = "Done"
						EndIf
					EndIf
				EndIf


				GUICtrlSetData($OrderList, "")
				GUICtrlSetData($OrderList, "1:Time and Date: " & $orderTime & "|2:Buyer: "& $buyerName & "|3:Orders: " & $requestedItemStacks & " " & $requestedItemFinal & "|4:For: " & $forStacks & " " & $for & "|5:Order Status: " & $tradeStatus)

				IniWrite("Trades.ini", $buyerName, $orderTime, $tradeStatus)
			EndIf
		Next
	$refresh = 0
	EndIf

	;2016/10/18 01:31:23 1398412312 355 [INFO Client 7356] @From FlickeDeFlick: Hi, I'd like to buy your 100 regret for my 190 chaos in Standard.

EndFunc
