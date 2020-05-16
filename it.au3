;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;;   FFXIV Adjusted Memory Functions  (Offsets Hardcoded .... temp till all is running
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Func playerxpos()                                                                  ; Player Y pos
	
	$STATICOFFSET = Dec("00D0A36C")
	Global $PID
	Global $CUROFFSET[1]
	$CUROFFSET[0] = 0
	$BASEADDR = _MEMORYMODULEGETBASEADDRESS($PID, "ffxiv_dx11.exe")
	$FINALADDR = "0x" & Hex($BASEADDR + $STATICOFFSET)
	$MEMTEST = _MEMORYREAD($FINALADDR, $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x154, $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x18, $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x10, $OPENMEM, "Float")
;~ 	MsgBox( 0 , "foeget" , $MEMTEST )
	Return $MEMTEST
EndFunc

Func playerzpos()                                                                  ; Player Y pos
	
	$STATICOFFSET = Dec("00D0A36C")
	Global $PID
	Global $CUROFFSET[1]
	$CUROFFSET[0] = 0
	$BASEADDR = _MEMORYMODULEGETBASEADDRESS($PID, "ffxiv_dx11.exe")
	$FINALADDR = "0x" & Hex($BASEADDR + $STATICOFFSET)
	$MEMTEST = _MEMORYREAD($FINALADDR, $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x154, $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x18, $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x14, $OPENMEM, "Float")
;~ 	MsgBox( 0 , "foeget" , $MEMTEST )
	Return $MEMTEST
EndFunc

Func playerypos()                                                                  ; Player Y pos
	OPENAIONMEMORY()
	$STATICOFFSET = Dec("00D0A36C")
	Global $PID
	Global $CUROFFSET[1]
	$CUROFFSET[0] = 0
	$BASEADDR = _MEMORYMODULEGETBASEADDRESS($PID, "ffxiv_dx11.exe")
	$FINALADDR = "0x" & Hex($BASEADDR + $STATICOFFSET)
	$MEMTEST = _MEMORYREAD($FINALADDR, $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x154, $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x18, $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x18, $OPENMEM, "Float")
;~ 	MsgBox( 0 , "foeget" , $MEMTEST )
	Return $MEMTEST
EndFunc

 ; Angel of the Player 360° / 2 :)   ....  0 - 180   and -180 - 0
Func playerrotation()
;~ 	Return MEMREADDLL($playerrotation, "float")
	OPENAIONMEMORY()
	$STATICOFFSET = Dec("00D09274")
	Global $PID
	Global $CUROFFSET[1]
	$CUROFFSET[0] = 0
	$BASEADDR = _MEMORYMODULEGETBASEADDRESS($PID, "ffxiv_dx11.exe")
	$FINALADDR = "0x" & Hex($BASEADDR + $STATICOFFSET)
	$MEMTEST = _MEMORYREAD($FINALADDR, $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x40  , $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x64  , $OPENMEM )
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x1A4 , $OPENMEM )
	$MEMTEST = _MEMORYREAD($MEMTEST         , $OPENMEM )
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x10  , $OPENMEM )
	$camx = _MEMORYREAD($MEMTEST    + 0x030 , $OPENMEM, "Float")
	$camy = _MEMORYREAD($MEMTEST    + 0x038 , $OPENMEM, "Float")
;~ 	MsgBox( 0 , "cy" ,  $camy )
	$playerxcoord = playerxpos()
	$playerycoord = playerypos()
;~ 	$playerzcoord = playerzpos()
	$diffy = round( $camy - $playerycoord,6)
	$diffx = round($camx - $playerxcoord,6)
	$Steigung = $diffy/ $diffx
	$pi = 3.14159265358979
	$RADZUGRAD = 180 / $pi
	$GRAD = atan( $Steigung ) * $RADZUGRAD
    $GRAD = 90  - $GRAD

if      $diffy > 0 and $diffx > 0 Then
		$GRAD = 90 - $GRAD +270
		Return $GRAD
ElseIf  $diffy < 0 and $diffx < 0 Then
		$grad =   180 - $GRAD
		Return   $GRAD
ElseIf  $diffy > 0 and $diffx < 0 Then
		$grad = ( 180 - $GRAD )
		Return $GRAD
ElseIf  $diffy < 0 and $diffx > 0 Then
		$grad =  (180 - $GRAD ) +180
		Return $GRAD
EndIf
EndFunc

Func playermaxhp()
	OPENAIONMEMORY()
	$STATICOFFSET = Dec("00D0BCE8")
	Global $PID
	Global $CUROFFSET[1]
	$CUROFFSET[0] = 0
	$BASEADDR = _MEMORYMODULEGETBASEADDRESS($PID, "ffxiv_dx11.exe")
	$FINALADDR = "0x" & Hex($BASEADDR + $STATICOFFSET)
	$MEMTEST = _MEMORYREAD($FINALADDR, $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x75, $OPENMEM)
	Return $MEMTEST
EndFunc
Func playerCurrectHp()
	OPENAIONMEMORY()
	$STATICOFFSET = Dec("00D0BCE8")
	Global $PID
	Global $CUROFFSET[1]
	$CUROFFSET[0] = 0
	$BASEADDR = _MEMORYMODULEGETBASEADDRESS($PID, "ffxiv_dx11.exe")
	$FINALADDR = "0x" & Hex($BASEADDR + $STATICOFFSET)
	$MEMTEST = _MEMORYREAD($FINALADDR, $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x65, $OPENMEM)
	Return $MEMTEST
EndFunc

Func playerCurrectMpPercent()
	$VAL = playerCurrectMana()
	$PVAL = ($VAL * 100) / playerMaxMana()
	Return Round($PVAL)
EndFunc

Func playerCurrectHpPercent()
	$VAL = playerCurrectHp()
	$PVAL = ($VAL * 100) / playerMaxHP()
	Return Round($PVAL)
EndFunc

Func playerCurrectMana()
	OPENAIONMEMORY()
	$STATICOFFSET = Dec("00D0BCE8")
	Global $PID
	Global $CUROFFSET[1]
	$CUROFFSET[0] = 0
	$BASEADDR = _MEMORYMODULEGETBASEADDRESS($PID, "ffxiv_dx11.exe")
	$FINALADDR = "0x" & Hex($BASEADDR + $STATICOFFSET)
	$MEMTEST = _MEMORYREAD($FINALADDR, $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x85, $OPENMEM)
	Return $MEMTEST
EndFunc

func playerMaxMana()
	OPENAIONMEMORY()
	$STATICOFFSET = Dec("00D0BCE8")
	Global $PID
	Global $CUROFFSET[1]
	$CUROFFSET[0] = 0
	$BASEADDR = _MEMORYMODULEGETBASEADDRESS($PID, "ffxiv_dx11.exe")
	$FINALADDR = "0x" & Hex($BASEADDR + $STATICOFFSET)
	$MEMTEST = _MEMORYREAD($FINALADDR, $OPENMEM)
	$MEMTEST = _MEMORYREAD($MEMTEST + 0x87, $OPENMEM)
	Return $MEMTEST
endfunc

















;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,,,,,,,     Nomad Mem add   ,,,;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Func _MEMORYOPEN($IV_PID, $IV_DESIREDACCESS = 2035711, $IV_INHERITHANDLE = 1)
	If Not ProcessExists($IV_PID) Then
		SetError(1)
		Return 0
	EndIf
	Local $AH_HANDLE[2] = [DllOpen("kernel32.dll")]
	If @error Then
		SetError(2)
		Return 0
	EndIf
	Local $AV_OPENPROCESS = DllCall($AH_HANDLE[0], "uint", "OpenProcess", "uint", $IV_DESIREDACCESS, "uint", $IV_INHERITHANDLE, "uint", $IV_PID)
	If @error Then
		DllClose($AH_HANDLE[0])
		SetError(3)
		Return 0
	EndIf
	$AH_HANDLE[1] = $AV_OPENPROCESS[0]
	Return $AH_HANDLE
EndFunc
Func _MEMORYREAD($IV_ADDRESS, $AH_HANDLE, $SV_TYPE = "dword")
	If Not IsArray($AH_HANDLE) Then
		SetError(1)
		Return 0
	EndIf
	Local $V_BUFFER = DllStructCreate($SV_TYPE)
	If @error Then
		SetError(@error + 1)
		Return 0
	EndIf
	DllCall($AH_HANDLE[0], "uint", "ReadProcessMemory", "uint", $AH_HANDLE[1], "uint", $IV_ADDRESS, "ptr", DllStructGetPtr($V_BUFFER), "uint", DllStructGetSize($V_BUFFER), "uint", "")
	If Not @error Then
		Local $V_VALUE = DllStructGetData($V_BUFFER, 1)
		Return $V_VALUE
	Else
		SetError(6)
		Return 0
	EndIf
EndFunc

Func MemWriteDLL($offset, $data)
	$StaticOffset = Dec($offset)
	Global $pid
	Global $CUROffset[1]
	$CUROffset[0] = 0
	$baseADDR = _MemoryModuleGetBaseAddress($pid, "ffxiv_dx11.exe")
	$finalADDR = "0x" & Hex($baseADDR + $StaticOffset)

	_MemoryWrite($finalADDR, $openmem, $data, "float")
	Return
EndFunc   ;==>MemWriteDLL


Func _MEMORYWRITE($IV_ADDRESS, $AH_HANDLE, $V_DATA, $SV_TYPE = "dword")
	If Not IsArray($AH_HANDLE) Then
		SetError(1)
		Return 0
	EndIf
	Local $V_BUFFER = DllStructCreate($SV_TYPE)
	If @error Then
		SetError(@error + 1)
		Return 0
	Else
		DllStructSetData($V_BUFFER, 1, $V_DATA)
		If @error Then
			SetError(6)
			Return 0
		EndIf
	EndIf
	DllCall($AH_HANDLE[0], "uint", "WriteProcessMemory", "uint", $AH_HANDLE[1], "uint", $IV_ADDRESS, "ptr", DllStructGetPtr($V_BUFFER), "uint", DllStructGetSize($V_BUFFER), "uint", "")
	If Not @error Then
		Return 1
	Else
		SetError(7)
		Return 0
	EndIf
EndFunc
Func _MEMORYCLOSE($AH_HANDLE)
	If Not IsArray($AH_HANDLE) Then
		SetError(1)
		Return 0
	EndIf
	DllCall($AH_HANDLE[0], "uint", "CloseHandle", "uint", $AH_HANDLE[1])
	If Not @error Then
		DllClose($AH_HANDLE[0])
		Return 1
	Else
		DllClose($AH_HANDLE[0])
		SetError(2)
		Return 0
	EndIf
EndFunc
Func _MEMORYMODULEGETBASEADDRESS($IPID, $SMODULE)
	If Not ProcessExists($IPID) Then Return SetError(1, 0, 0)
	If Not IsString($SMODULE) Then Return SetError(2, 0, 0)
	Local $PSAPI = DllOpen("psapi.dll")
	Local $HPROCESS
	Local $PERMISSION = BitOR(2, 1024, 8, 16, 32)
	If $IPID > 0 Then
		Local $HPROCESS = DllCall("kernel32.dll", "ptr", "OpenProcess", "dword", $PERMISSION, "uint", 0, "dword", $IPID)
		If $HPROCESS[0] Then
			$HPROCESS = $HPROCESS[0]
		EndIf
	EndIf
	Local $MODULES = DllStructCreate("ptr[1024]")
	Local $ACALL = DllCall($PSAPI, "uint", "EnumProcessModules", "ptr", $HPROCESS, "ptr", DllStructGetPtr($MODULES), "dword", DllStructGetSize($MODULES), "dword*", 0)
	If $ACALL[4] > 0 Then
		Local $IMODNUM = $ACALL[4] / 4
		Local $ATEMP
		For $I = 1 To $IMODNUM
			$ATEMP = DllCall($PSAPI, "dword", "GetModuleBaseNameW", "ptr", $HPROCESS, "ptr", Ptr(DllStructGetData($MODULES, 1, $I)), "wstr", "", "dword", 260)
			If $ATEMP[3] = $SMODULE Then
				DllClose($PSAPI)
				Return Ptr(DllStructGetData($MODULES, 1, $I))
			EndIf
		Next
	EndIf
	DllClose($PSAPI)
	Return SetError(-1, 0, 0)
EndFunc
Func SETPRIVILEGE($PRIVILEGE, $BENABLE)
	Const $nTOKEN_ADJUST_PRIVILEGES = 32
	Const $nTOKEN_QUERY = 8
	Const $nSE_PRIVILEGE_ENABLED = 2
	Local $HTOKEN, $SP_AUXRET, $SP_RET, $HCURRPROCESS, $NTOKENS, $NTOKENINDEX, $PRIV
	$NTOKENS = 1
	$LUID = DllStructCreate("dword;uint")
	If IsArray($PRIVILEGE) Then $NTOKENS = UBound($PRIVILEGE)
	$TOKEN_PRIVILEGES = DllStructCreate("dword;dword[" & (3 * $NTOKENS) & "]")
	$NEWTOKEN_PRIVILEGES = DllStructCreate("dword;dword[" & (3 * $NTOKENS) & "]")
	$HCURRPROCESS = DllCall("kernel32.dll", "hwnd", "GetCurrentProcess")
	$SP_AUXRET = DllCall("advapi32.dll", "uint", "OpenProcessToken", "hwnd", $HCURRPROCESS[0], "uint", BitOR($nTOKEN_ADJUST_PRIVILEGES, $nTOKEN_QUERY), "uint_ptr", 0)
	If $SP_AUXRET[0] Then
		$HTOKEN = $SP_AUXRET[3]
		DllStructSetData($TOKEN_PRIVILEGES, 1, 1)
		$NTOKENINDEX = 1
		While $NTOKENINDEX <= $NTOKENS
			If IsArray($PRIVILEGE) Then
				$PRIV = $PRIVILEGE[$NTOKENINDEX - 1]
			Else
				$PRIV = $PRIVILEGE
			EndIf
			$RET = DllCall("advapi32.dll", "uint", "LookupPrivilegeValue", "str", "", "str", $PRIV, "ptr", DllStructGetPtr($LUID))
			If $RET[0] Then
				If $BENABLE Then
					DllStructSetData($TOKEN_PRIVILEGES, 2, $nSE_PRIVILEGE_ENABLED, (3 * $NTOKENINDEX))
				Else
					DllStructSetData($TOKEN_PRIVILEGES, 2, 0, (3 * $NTOKENINDEX))
				EndIf
				DllStructSetData($TOKEN_PRIVILEGES, 2, DllStructGetData($LUID, 1), (3 * ($NTOKENINDEX - 1)) + 1)
				DllStructSetData($TOKEN_PRIVILEGES, 2, DllStructGetData($LUID, 2), (3 * ($NTOKENINDEX - 1)) + 2)
				DllStructSetData($LUID, 1, 0)
				DllStructSetData($LUID, 2, 0)
			EndIf
			$NTOKENINDEX += 1
		WEnd
		$RET = DllCall("advapi32.dll", "uint", "AdjustTokenPrivileges", "hwnd", $HTOKEN, "uint", 0, "ptr", DllStructGetPtr($TOKEN_PRIVILEGES), "uint", DllStructGetSize($NEWTOKEN_PRIVILEGES), "ptr", DllStructGetPtr($NEWTOKEN_PRIVILEGES), "uint_ptr", 0)
		$F = DllCall("kernel32.dll", "uint", "GetLastError")
	EndIf
	$NEWTOKEN_PRIVILEGES = 0
	$TOKEN_PRIVILEGES = 0
	$LUID = 0
	If $SP_AUXRET[0] = 0 Then Return 0
	$SP_AUXRET = DllCall("kernel32.dll", "uint", "CloseHandle", "hwnd", $HTOKEN)
	If Not $RET[0] And Not $SP_AUXRET[0] Then Return 0
	Return $RET[0]
EndFunc


Func ProcessGetWindow($PId)
    If IsNumber($PId) = 0 Or ProcessExists(ProcessGetName($PId)) = 0 Then
        SetError(1)
    Else

        Local $WinList = WinList()
        Local $i = 1
        Local $WindowTitle = ""

        While $i <= $WinList[0][0] And $WindowTitle = ""
            If WinGetProcess($WinList[$i][0], "") = $PId Then
                $WindowTitle = $WinList[$i][0]
            Else
                $i = $i + 1
            EndIf
        WEnd

        Return $WindowTitle
    EndIf
EndFunc   ;==>ProcessGetWindow

Func ProcessGetId($Process)
    If IsString($Process) = 0 Then
        SetError(2)
    ElseIf ProcessExists($Process) = 0 Then
        SetError(1)
    Else

        Local $PList = ProcessList($Process)
        Local $i
        Local $PId[$PList[0][0] + 1]

        $PId[0] = $PList[0][0]

        For $i = 1 To $PList[0][0]
            $PId[$i] = $PList[$i][1]
        Next

        Return $PId
    EndIf
EndFunc   ;==>ProcessGetId

Func ProcessGetName($PId)
    If IsNumber($PId) = 0 Then
        SetError(2)
    ElseIf $PId > 9999 Then
        SetError(1)
    Else

        Local $PList = ProcessList()
        Local $i = 1
        Local $ProcessName = ""

        While $i <= $PList[0][0] And $ProcessName = ""
            If $PList[$i][1] = $PId Then
                $ProcessName = $PList[$i][0]
            Else
                $i = $i + 1
            EndIf
        WEnd

        Return $ProcessName
    EndIf
EndFunc   ;==>ProcessGetName

func switchrotate($target, $now)
	if($target < $now) then
	if(($now - $target) > 180) then
	$rot_key = GUICtrlRead($rightkey)
	else
	$rot_key = GUICtrlRead($leftkey)
	Endif
	else
	if(($target - $now) > 180) then
	$rot_key = GUICtrlRead($leftkey)
	else
	$rot_key = GUICtrlRead($rightkey)
	endif
	endif
	endfunc
func getangle($diffx, $diffy)
	$Steigung = $diffy/ $diffx
	$pi = 3.14159265358979
	$RADZUGRAD = 180 / $pi
	$GRAD = atan( $Steigung ) * $RADZUGRAD
    $GRAD = 90  - $GRAD

if      $diffy > 0 and $diffx > 0 Then    ;   
		$GRAD = 180 -  $GRAD
;~ 		MsgBox( 0 , "after1" ,  $GRAD  )
		Return $GRAD

ElseIf  $diffy < 0 and $diffx < 0 Then    ; 
		$grad =   270 + $GRAD
;~ 		MsgBox( 0 , "after2" ,  $GRAD  )
		Return   $GRAD

ElseIf  $diffy > 0 and $diffx < 0 Then    ;  
		$grad = ( 180 - $GRAD ) + 180
;~ 		MsgBox( 0 , "after3" ,  $GRAD  )
		Return $GRAD

ElseIf  $diffy < 0 and $diffx > 0 Then    ;  
		$grad =  (180 - $GRAD )
;~ 		MsgBox( 0 , "after4" ,  $GRAD  )
		Return $GRAD

EndIf

endfunc

func getthreesixty($angle, $flag = false)
	if($flag) then
	if($angle < 0) then
	$angle = (360 - ($angle * -1))
	endif
	else
	if($angle > 360)then
	$angle = $angle - 360
	elseif($angle < 0)then
	$angle = $angle + 360
	endif
	endif
	return $angle
endfunc


func AlignRotation($x, $y, $z , $move = false)
	$playerxcoord = playerxpos()
	$playerycoord = playerypos()
	$playerzcoord = playerzpos()

	if onflight() <> 0  then
		$higth  = $zcoord - $playerzcoord
		$length = $Ycoord - $playerYcoord
			if $length < 0 Then
				$length = $length * -1
			EndIf
		$slope = ($higth / $length)
		$pi =  3.14159265358979
		$radToDeg = 180 / $pi
		$winkelff = (ATan($slope) * $radToDeg  ) / 2
		$winkel = round( $winkelff  * -1 , 8)
		MemWriteDLL($camy, $winkel )                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	EndIf

;....


	$diffy = round($y - $playerycoord,2)
	$diffx = round($x - $playerxcoord,2)
	$angle = getangle($diffx, $diffy)
	$nowang =  playerrotation()


if $readmemwrite = 1 Then

		MemWriteDLL($camx, $angle )                      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	$higth  = $zcoord - $playerzcoord
	$length = $Ycoord - $playerYcoord
	if $length < 0 Then
		$length = $length * -1
	EndIf
	$slope = ($higth / $length)
	$pi =  3.14159265358979
	$radToDeg = 180 / $pi
	$winkelff = (ATan($slope) * $radToDeg  ) / 2
	$winkel = round( $winkelff  * -1 , 8)
	MemWriteDLL($camy, $winkel )                          ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;

Else

	switchrotate($angle, $nowang)
	If ($angle + 14) < $nowang or ($angle - 14) > $nowang Then
	If ($angle+14) < $nowang Then
	$nowang = playerrotation()
	switchrotate($angle, $nowang)
	ControlSend("FINAL FANTASY XIV" , "" , "" , "{"&$rot_key&' down'&"}")
	While 1
	$nowang= playerrotation()
	IF ($angle+4) > $nowang Then
	ExitLoop
	ElseIf calcdist($xcoord,$ycoord) < 5 Then
	ExitLoop
	EndIf
	WEnd
	ElseIf ($angle-14) >$nowang Then
	$nowang = playerrotation()
	switchrotate($angle, $nowang)
	ControlSend("FINAL FANTASY XIV" , "" , "" , "{"&$rot_key&' down'&"}")
	While 1
	$nowang=playerrotation()
	IF ($angle-4) < $nowang Then
	ExitLoop
	ElseIf calcdist($xcoord,$ycoord) < 5 Then
	ExitLoop
	EndIf
	WEnd
	EndIf
	ControlSend("FINAL FANTASY XIV" , "" , "" , "{"&$rot_key&' UP'&"}")
	EndIf
EndIf
endfunc


ConsoleWrite(playerxpos())