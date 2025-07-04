﻿if(-not (Test-Path env:CI))
{
    $signExe = 'C:\Program Files (x86)\Windows Kits\10\bin\10.0.26100.0\x86\signtool.exe'
    $files = gci '..\Build\Release\*' -Recurse -Include *.exe,LoaderDll.dll,LocaleEmulator.dll | %{('"{0}"' -f $_.FullName)}
    $timestampUrl = 'http://timestamp.digicert.com'

    .$signExe sign /v /a /fd SHA384 /t $timestampUrl $files
}
