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

global $xPos = 0
global $yPos = 0
global $xPos2 = 950
global $yPos2 = 550



global $foundX = 0
global $foundY = 0
global $image1 = @ScriptDir & "\ff_no_white.bmp"
global $image2 = @ScriptDir & "\ff_enemy.bmp"

;~ , $xPos2, $yPos2

Func findEnemy()
    $search = _ImageSearch_Area($image1, $xPos, $yPos, $xPos2, $yPos2,110 )
    if $search[0] = 1 then
        $foundX = $search[1]
        $foundY = $search[2]
        MouseMove($search[1] +35 ,$search[2] , 1)
        sleep(1000)
        MouseClick("left",$search[1] +35 ,$search[2] )
        sleep(500)
        MouseClick("right",$search[1] +35,$search[2])
        Sleep(1000)
        MouseClick("right",$search[1] +35,$search[2]+ 1 )
        Sleep(500)
        ;~ MsgBox(0,"found!", "X position: --> " & $search[1] & "Y position: --> " & $search[2])
        return true
    Else
        ConsoleWrite("Could not find a non aggressive enemy")
        return false
    EndIf
EndFunc

Func findAggro()
    $searchArea = 300
    $minAcceptable = 250
    $optimal = 320
    $x = 525
    $y = 330
    $color = 0xFFBDBF
    $tolerance = 0
    FFSetWnd($hWnd)
    $aggro =  FFBestSpot($searchArea, $minAcceptable, $optimal, $x, $y, $color, $tolerance)
    if not @error Then
        MouseMove($aggro[0] + 35, $aggro[1] +1, 1)
        Sleep(1000)
        MouseClick("left",$aggro[0] + 35, $aggro[1] )
        Sleep(500)
        MouseClick("right",$aggro[0] + 35, $aggro[1]  )
        Sleep(1000)
        MouseClick("right",$aggro[0] + 35, $aggro[1] +1 )
        Sleep(500)
        return true
    Else
        ConsoleWrite("could not find Aggressive Monster")
        return false
    EndIf
    ;~ blue_face pixel: 0076EE  red_attack_pixel: FFBDBF 9F2D29 hp: 6EA52D
EndFunc
Func selectTarget()
    $adjust_x = 525
    $adjust_y = 330
    if findAggro() Then
        movePlayer(2000)
        attack()
        return true
    elseif findEnemy() Then
        movePlayer(2000)
        attack()
        return true    
    else
        ConsoleWrite("couldn't select a target")
        MouseClickDrag("left",$adjust_x, $adjust_y,$adjust_x +15, $adjust_y)
        movePlayer(800)
        Sleep(1000)
        return false
    EndIf
EndFunc
    
Func movePlayer($time)
    MouseDown("left")
    MouseDown("right")
    Sleep($time)
    MouseUp("left")
    MouseUp("right")

EndFunc

Func attack()
    ;~ ControlSend($hWnd, "", "", "{F11}")
    ;~ ControlSend($hWnd, "", "", "{8}")
    ControlSend($hWnd, "", "", "{1}")
    Sleep(3000)
    ControlSend($hWnd, "", "", "{2}")
    Sleep(3000)
    ControlSend($hWnd, "", "", "{4}")
    Sleep(2000)
    ControlSend($hWnd, "", "", "{3}")
    Sleep(2000)
    ControlSend($hWnd, "", "", "{7}")
    Sleep(2000)
    ControlSend($hWnd, "", "", "{2}")
    Sleep(3000)
    ControlSend($hWnd, "", "", "{3}")
    Sleep(2500)
    ControlSend($hWnd, "", "", "{2}")
    Sleep(3000)
    ControlSend($hWnd, "", "", "{3}")
    Sleep(1000)
    ControlSend($hWnd, "", "", "{5}")
    Sleep(2000)
    ControlSend($hWnd, "", "", "{6}")
    Sleep(5000)

EndFunc

While true

    While not selectTarget()
        selectTarget()
    WEnd
WEnd  
