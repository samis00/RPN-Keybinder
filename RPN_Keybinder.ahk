if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%" 
   ExitApp
}
;;;Includes;;;
#IfWinActive GTA:SA:MP
#UseHook
#Persistent
#Include API.ahk
#include httplib.ahk
#include json.ahk
#include defines.ahk
#EscapeChar `
#CommentFlag ;

;~ ;;;;Variablen1;;;;
Version := 1



login := API("http://api.rpn-server.de/getUserToken?User=" . username . "&Password=" . passwort)
usertoken := login["UserToken"]

Killstats := API("http://api.rpn-server.de/getKillStats?UserKey=" usertoken )
PaintballKills := Killstats["PaintballKills"]

PaintballDeaths := Killstats["PaintballDeaths"]

;;;;Variablen2;;;;


Hotkey, Enter, Off
Hotkey, Escape, Off
+t::
~T::
Suspend On
Hotkey, Enter, On
Hotkey, Escape, On
Hotkey, t, Off
return
~NumpadEnter::
~Enter::
Suspend Permit
Suspend Off
Hotkey, t, On
Hotkey, Enter, Off
Hotkey, Escape, Off
Return
Escape::
Suspend Permit
Suspend Off
SendInput {Escape}
Hotkey, t, On
Hotkey, Enter, Off
Hotkey, Escape, Off
return

z::
SendInput t/m Bleiben sie stehen sir{!}{enter}
return

u::
SendInput t/m Ich werde gleich das Feuer eröffnen{!}{enter}
return