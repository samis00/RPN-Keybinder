if not A_IsAdmin
{
   ;Run *RunAs "%A_ScriptFullPath%" 
   ;ExitApp
}
;;;Includes;;;
#IfWinActive GTA:SA:MP
#UseHook
#Persistent
#Include API.ahk
#include httplib.ahk
#include json.ahk
#EscapeChar `
#CommentFlag ;
#include defines.ahk

Version := 1
if (!UserLogin("Test","6"))
   MsgBox,Benutzername oder Passwort falsch
else 
   MsgBox,Willkommen
;Killstats := API("http://api.rpn-server.de/getKillStats?UserKey=" usertoken )
;PaintballKills := Killstats["PaintballKills"]

;PaintballDeaths := Killstats["PaintballDeaths"]

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

~z::
SendChat("/m Bleiben sie stehen, Sir!")
return

~u::
SendChat("/m Nun reichts mir aber! Ich werde gleich das Feuer eröffnen!")
return