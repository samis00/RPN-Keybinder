DownloadToString(url, encoding="utf-8")
{
  static a := "AutoHotkey/" A_AhkVersion
  if (!DllCall("LoadLibrary", "str", "wininet") || !(h := DllCall("wininet\InternetOpen", "str", a, "uint", 1, "ptr", 0, "ptr", 0, "uint", 0, "ptr")))
    return 0
  c := s := 0, o := ""
  if (f := DllCall("wininet\InternetOpenUrl", "ptr", h, "str", url, "ptr", 0, "uint", 0, "uint", 0x80003000, "ptr", 0, "ptr"))
  {
    while (DllCall("wininet\InternetQueryDataAvailable", "ptr", f, "uint*", s, "uint", 0, "ptr", 0) && s>0)
    {
      VarSetCapacity(b, s, 0)
      DllCall("wininet\InternetReadFile", "ptr", f, "ptr", &b, "uint", s, "uint*", r)
      o .= StrGet(&b, r>>(encoding="utf-16"||encoding="cp1200"), encoding)
    }
    DllCall("wininet\InternetCloseHandle", "ptr", f)
  }
  DllCall("wininet\InternetCloseHandle", "ptr", h)
  return o
}

DownloadToFile(url, filename)
{
  static a := "AutoHotkey/" A_AhkVersion
  if (!(o := FileOpen(filename, "w")) || !DllCall("LoadLibrary", "str", "wininet") || !(h := DllCall("wininet\InternetOpen", "str", a, "uint", 1, "ptr", 0, "ptr", 0, "uint", 0, "ptr")))
    return 0
  c := s := 0
  if (f := DllCall("wininet\InternetOpenUrl", "ptr", h, "str", url, "ptr", 0, "uint", 0, "uint", 0x80003000, "ptr", 0, "ptr"))
  {
    while (DllCall("wininet\InternetQueryDataAvailable", "ptr", f, "uint*", s, "uint", 0, "ptr", 0) && s>0)
    {
      VarSetCapacity(b, s, 0)
      DllCall("wininet\InternetReadFile", "ptr", f, "ptr", &b, "uint", s, "uint*", r)
      c += r
      o.rawWrite(b, r)
    }
    DllCall("wininet\InternetCloseHandle", "ptr", f)
  }
  DllCall("wininet\InternetCloseHandle", "ptr", h)
  o.close()
  return c
}

DownloadBin(url, byref buf)
{
  static a := "AutoHotkey/" A_AhkVersion
  if (!DllCall("LoadLibrary", "str", "wininet") || !(h := DllCall("wininet\InternetOpen", "str", a, "uint", 1, "ptr", 0, "ptr", 0, "uint", 0, "ptr")))
    return 0
  c := s := 0
  if (f := DllCall("wininet\InternetOpenUrl", "ptr", h, "str", url, "ptr", 0, "uint", 0, "uint", 0x80003000, "ptr", 0, "ptr"))
  {
    while (DllCall("wininet\InternetQueryDataAvailable", "ptr", f, "uint*", s, "uint", 0, "ptr", 0) && s>0)
    {
      VarSetCapacity(b, c+s, 0)
      if (c>0)
        DllCall("RtlMoveMemory", "ptr", &b, "ptr", &buf, "ptr", c)
      DllCall("wininet\InternetReadFile", "ptr", f, "ptr", &b+c, "uint", s, "uint*", r)
      c += r
      VarSetCapacity(buf, c, 0)
      if (c>0)
        DllCall("RtlMoveMemory", "ptr", &buf, "ptr", &b, "ptr", c)
    }
    DllCall("wininet\InternetCloseHandle", "ptr", f)
  }
  DllCall("wininet\InternetCloseHandle", "ptr", h)
  return c
}