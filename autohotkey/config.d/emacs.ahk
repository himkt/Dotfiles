#InstallKeybdHook
#UseHook


is_not_terminal()
{
  ifWinActive,ahk_exe WindowsTerminal.exe
    return 1
  return 0
}

is_vscode()
{
  ifWinActive,ahk_exe Code.exe
    return 0
  return 1
}


SetKeyDelay 0


; Cursor

^a::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send {HOME}
  return

^e::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send {END}
  return

^p::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send {Up}
  return

^n::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send {Down}
  return

^f::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send {Right}
  return

^+f::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send ^f
  return

^b::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send {Left}
  return


; Mac-style commands

<#a::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send ^a
  return

<#b::
  if is_vscode()
    send %A_ThisHotKey%
  else
    send ^b
  return

<#j::
  if is_vscode()
    send %A_ThisHotKey%
  else
    send ^j
  return

<#n::
  if is_vscode()
    send %A_ThisHotKey%
  else
    send ^n
  return