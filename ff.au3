$CLASS_WINDOW = "[CLASS:FFXIVGAME]"
$TITLE_WINDOW = "FINAL FANTASY XIV"
$hWnd = WinGetHandle($CLASS_WINDOW)

While True
    ;~ ControlSend($hWnd, "", "", "{F11}")
    ControlSend($hWnd, "", "", "{8}")
    Sleep(3000)
    ControlSend($hWnd, "", "", "{1}")
    Sleep(4000)
    ControlSend($hWnd, "", "", "{2}")
    Sleep(3000)
    ControlSend($hWnd, "", "", "{4}")
    Sleep(2000)
    ControlSend($hWnd, "", "", "{3}")
    Sleep(3000)
    ControlSend($hWnd, "", "", "{7}")
    ;~ Sleep(3000)
    ;~ ControlSend($hWnd, "", "", "{2}")
    Sleep(1000)
    ControlSend($hWnd, "", "", "{5}")
    Sleep(2000)
    ControlSend($hWnd, "", "", "{6}")

    
WEnd
