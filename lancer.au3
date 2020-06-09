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
global $eat_food_counter = 0
global $xPos = 0
global $yPos = 50
global $xPos2 = 950
global $yPos2 = 560

global $hp_xPos = 471
global $hp_yPos = 681
global $hp_xPos2 = 512
global $hp_yPos2 = 695

global $petCounter = 0

global $foundX = 0
global $foundY = 0
global $image1 = @ScriptDir & "\ff_no_white.bmp"
global $image2 = @ScriptDir & "\ff_enemy_whole.bmp"
global $image3 = @ScriptDir & "\aggro.bmp"
global $image4 = @ScriptDir & "\hp_bar.bmp"


;~ , $xPos2, $yPos2

Func _Exit()
    Exit
EndFunc

HotKeySet("{ESC}", "_Exit")


Func findEnemy()
    $search = _ImageSearch_Area($image1 & "|" & $image2, $xPos, $yPos, $xPos2, $yPos2,110 )
    if $search[0] = 1 then
 
        MouseMove($search[1] +60 ,$search[2] +1 , 1)
        sleep(1000)
        MouseDown("left")
        Sleep(200)
        MouseUp("left")
        sleep(400)
        MouseDown("right")
        Sleep(200)
        MouseUp("right")
        sleep(1000)
       
       
                ;~ MouseClick("right",$search[1] +35,$search[2] )

        ;~ Sleep(1000)
        ;~ MouseClick("right",$search[1] +35,$search[2] )
        ;~ Sleep(500)
        ;~ MsgBox(0,"found!", "X position: --> " & $search[1] & "Y position: --> " & $search[2])
        return true
    ;~ if $hostileSearch[0]= 1 Then
    ;~     MouseMove($hostileSearch[1] +60 ,$hostileSearch[2] +2 , 1)
    ;~     sleep(1000)
    ;~     MouseClick("left",$hostileSearch[1] +60,$hostileSearch[2] +2, 1, 1)
    ;~     Sleep(400)
    ;~     MouseClick("right",$hostileSearch[1] +60 ,$hostileSearch[2] +2, 1, 1)
    ;~     sleep(400)
    ;~ Endif
    Else
        ;~ ConsoleWrite("Could not find a non aggressive enemy")
        return false
    EndIf
EndFunc

Func findAggro()
    $search_aggro = _ImageSearch_Area($image3, $xPos, $yPos, $xPos2, $yPos2,110 )
    if $search_aggro[0] = 1 then
 
        MouseMove($search_aggro[1] +60 ,$search_aggro[2] +2 , 1)
        sleep(1000)
        MouseDown("left")
        Sleep(200)
        MouseUp("left")
        sleep(400)
        MouseDown("right")
        Sleep(200)
        MouseUp("right")
        sleep(800)
        return true
    ;~ $searchArea = 300
    ;~ $minAcceptable = 250
    ;~ $optimal = 320
    ;~ $x = 525
    ;~ $y = 330
    ;~ $color = 0xFFBDBF
    ;~ $tolerance = 0
    ;~ FFSetWnd($hWnd)
    ;~ $aggro =  FFBestSpot($searchArea, $minAcceptable, $optimal, $x, $y, $color, $tolerance)
    ;~ if not @error Then
    ;~     MouseMove($aggro[0] + 60, $aggro[1] +10 , 1)
    ;~     Sleep(1000)
    ;~     MouseClick("left",$aggro[0] + 60, $aggro[1] +10,1,1)
    ;~     Sleep(400)
    ;~     MouseClick("right",$aggro[0] + 60, $aggro[1] +10,1,1)
    ;~     Sleep(400)
    ;~     ;~ Sleep(1000)
    ;~     ;~ MouseClick("right",$aggro[0] + 35, $aggro[1] )
    ;~     ;~ Sleep(500)
    ;~     return true
    Else
        ;~ ConsoleWrite("could not find Aggressive Monster")
        return false
    EndIf
    ;~ blue_face pixel: 0076EE  red_attack_pixel: FFBDBF 9F2D29 hp: 6EA52D
EndFunc
Func selectTarget()
    $adjust_x = 525
    $adjust_y = 330
    if findAggro() Then
        Sleep(500)
        movePlayer(1500)
        Sleep(800)
     
        attack()
        ;~ petAttack()
        ;~ heal()
        return true
    elseif findEnemy() Then
        Sleep(500)
        movePlayer(1500)
        Sleep(800)
        ;~ petAttack()
        attack()
    
       
        ;~ heal()
        return true    
    else
        ;~ ConsoleWrite("couldn't select a target")
        sleep(1000)
        MouseClickDrag("left",$adjust_x, $adjust_y,$adjust_x +15, $adjust_y, 5)
        sleep(1000)
        movePlayer(500)
        sleep(1000)
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
Func moveBackward($direction)
    if $direction == "left" Then

        ControlSend($hWnd, "", "", "{a down}")
        Sleep(1000)
        ControlSend($hWnd, "", "", "{a up}")
    ElseIf $direction == "right" Then
        ControlSend($hWnd, "", "", "{d down}")
        Sleep(1000)
        ControlSend($hWnd, "", "", "{d up}")
    EndIf
    Sleep(400)
    ControlSend($hWnd, "", "", "{s down}")
    Sleep(1000)
    ControlSend($hWnd, "", "", "{s up}")
    ;~ ControlSend($hWnd, "", "", "{w down}")
    ;~ Sleep($time)
    ;~ ControlSend($hWnd, "", "", "{w up}")
EndFunc

Func attack()
    ;~ ControlSend($hWnd, "", "", "{F11}")
    ;~ ControlSend($hWnd, "", "", "{8}")
    ControlSend($hWnd, "", "", "{1}")
   
    Sleep(2500)
    ControlSend($hWnd, "", "", "{8}")
   
    Sleep(2500)
    ControlSend($hWnd, "", "", "{2}")
    Sleep(2600)
   
    ControlSend($hWnd, "", "", "{3}")
    Sleep(2600)
    moveBackward("left")
    Sleep(2000)
    ControlSend($hWnd, "", "", "{4}")
    Sleep(2600)
    
    ControlSend($hWnd, "", "", "{5}")
    Sleep(2600)
    ControlSend($hWnd, "", "", "{3}")
    ;~ Sleep(2600)
    ;~ moveBackward("right")
    ;~ Sleep(2600)
   
    ;~ ControlSend($hWnd, "", "", "{4}")
    ;~ Sleep(2600)
    ;~ ControlSend($hWnd, "", "", "{5}")
    ;~ Sleep(2600)
    ;~ needsHeal()
    ;~ ControlSend($hWnd, "", "", "{3}")
    ;~ Sleep(2600)
    ;~ ControlSend($hWnd, "", "", "{4}")
    ;~ Sleep(2600)
    ;~ moveBackward("left")
    ;~ Sleep(1000)
    ;~ ControlSend($hWnd, "", "", "{6}")
    ;~ Sleep(2600)
    ;~ ControlSend($hWnd, "", "", "{3}")
    ;~ Sleep(2600)
    ;~ ControlSend($hWnd, "", "", "{4}")
    ;~ Sleep(2600)
    ;~ needsHeal()
    ;~ ControlSend($hWnd, "", "", "{6}")
    ;~ Sleep(2600)
    ;~ ControlSend($hWnd, "", "", "{6}")
    ;~ Sleep(2600)
    ;~ ControlSend($hWnd, "", "", "{6}")
    Sleep(11000)
    needsHeal()

EndFunc

Func needsHeal()
    ;~ $inj_searchArea = 15
    ;~ $inj_minAcceptable = 10
    ;~ $inj_optimal = 50
    ;~ $inj_x = 491
    ;~ $inj_y = 691
    ;~ $inj_color = 0x9ED545
    ;~ ;~ light green hp:9ED545 medium green hp: 6D8B33 dark green hp: 3B5D1C
    ;~ $inj_tolerance = 5
    ;~ $injured =  FFBestSpot($inj_searchArea, $inj_minAcceptable, $inj_optimal, $inj_x, $inj_y, $inj_color, $inj_tolerance)
    
    $search_hp = _ImageSearch_Area($image4, $hp_xPos, $hp_yPos, $hp_xPos2, $hp_yPos2,5 )

    if $search_hp[0] = 0 Then
        ;~ ConsoleWrite("<<<<injured>>>>>")
        ControlSend($hWnd, "", "", "{7}")
        Sleep(2600)
        return true
        
    Else
        ;~ ConsoleWrite("<<<<<not injured>>>>")
        ;~ ControlSend($hWnd, "", "", "{5}")
        return false
    EndIf
EndFunc

While true
    if $eat_food_counter = 60 Then
        ControlSend($hWnd, "", "", "{9}")
        $eat_food_counter = 0
    EndIf
    While not selectTarget()
        selectTarget()
    WEnd
    $eat_food_counter +=1
WEnd  
