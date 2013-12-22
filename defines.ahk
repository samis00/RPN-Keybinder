usertoken := "INVALID"
username := "Test"
passwort := "7"

API(url)
{
        jresponse := DownloadToString("http://api.rpn-server.de/getUserToken?User=" . username . "&Password=" . passwort)
        j := JSON_from(jresponse)
        return j
}

Waffe(){
        if (GetCurrentWeaponId() == 1)
                str := "Schlagring"
        else if (GetCurrentWeaponId() == 2)
                str := "Golfschläger"
        else if (GetCurrentWeaponId() == 3)
                str := "Schlagstock"
        else if (GetCurrentWeaponId() == 4)
                str := "Messer"
        else if (GetCurrentWeaponId() == 5)
                str := "Baseballschläger"
        else if (GetCurrentWeaponId() == 6)
                str := "Schaufel"
        else if (GetCurrentWeaponId() == 7)
                str := "Pool Cue"
        else if (GetCurrentWeaponId() == 8)
                str := "Katana"
        else if (GetCurrentWeaponId() == 9)
                str := "Chainsaw"
        else if (GetCurrentWeaponId() == 10) or (GetCurrentWeaponId() == 11) or (GetCurrentWeaponId() == 12) or (GetCurrentWeaponId() == 13)
                str := "Dildo"
        else if (GetCurrentWeaponId() == 14)
                str := "Blumen"
        else if (GetCurrentWeaponId() == 15)
                str := "Cane"
        else if (GetCurrentWeaponId() == 16)
                str := "Granate"
        else if (GetCurrentWeaponId() == 17)
                str := "Tränengas"
        else if (GetCurrentWeaponId() == 18)
                str := "Molotov Cocktail"
        else if (GetCurrentWeaponId() == 22)
                str := "9mm"
        else if (GetCurrentWeaponId() == 23)
                str := "Silenced 9mm"
        else if (GetCurrentWeaponId() == 24)
                str := "Deagle"
        else if (GetCurrentWeaponId() == 25) or (GetCurrentWeaponId() == 26) or (GetCurrentWeaponId() == 27)
                str := "Shotgun"
        else if (GetCurrentWeaponId() == 28)
                str := "Micro SMG/Uzi"
        else if (GetCurrentWeaponId() == 29)
                str := "MP5"
        else if (GetCurrentWeaponId() == 30)
                str := "AK-47"
        else if (GetCurrentWeaponId() == 31)
                str := "M4"
        else if (GetCurrentWeaponId() == 32)
                str := "Tec-9"
        else if (GetCurrentWeaponId() == 33)
                str := "Rifle"
        else if (GetCurrentWeaponId() == 34)
                str := "Sniper"
        else if (GetCurrentWeaponId() == 41)
                str := "Spraydose"
        else if (GetCurrentWeaponId() == 42)
                str := "Feuerlöscher"
        else if (GetCurrentWeaponId() == 43)
                str := "Kamera"
        else if (GetCurrentWeaponId() == 46)
                str := "Fallschirm"
        else
                str := "Faust"
        if (GetVehicleModel() == 425)
                str := "Hunter"
        else if (GetVehicleModel() == 520)
                str := "Hydra"
        else if (GetVehicleModel() == 432)
                str := "Panzer"
        return, Str
}
