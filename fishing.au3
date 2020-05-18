#include "FastFind.au3"
#AutoIt3Wrapper_Userx64=n
#include "_ImageSearch_UDF.au3"
#include "_ImageSearch_Tool.au3"

$CLASS_WINDOW = "[CLASS:FFXIVGAME]"
$TITLE_WINDOW = "FINAL FANTASY XIV"
$hWnd = WinGetHandle($CLASS_WINDOW)

HotKeySet("Esc", "_Exit")
;~ 
;~ For searching by pixel for the blue face
;~ Global $searchArea = 20
;~ Global $minAcceptable = 3
;~ Global $optimal = 15

global $xPos = 420
global $yPos = 150
global $xPos2 = 630
global $yPos2 = 330

global $petCounter = 0

global $foundX = 0
global $foundY = 0
global $image1 = @ScriptDir & "\rare_occurance.bmp"
global $image2 = @ScriptDir & "\ff_enemy.bmp"

;~ , $xPos2, $yPos2

Func _Exit()
    Exit
EndFunc

HotKeySet("{ESC}", "_Exit")


Func findFish()
    $search = _ImageSearch_Area($image1, $xPos, $yPos, $xPos2, $yPos2,110 )
    if $search[0] = 1 then
        ControlSend($hWnd, "", "", "{3}")
        Sleep(15000)
        ControlSend($hWnd, "", "", "{2}")
        return True
    Else
        Sleep(500)
        return False

    EndIf
EndFunc

While True
    ControlSend($hWnd, "", "", "{2}")
    While not findFish()
    findFish()
    WEnd
    
WEnd
    
