function Random_Mouse_Movement {
    param($minX, $maxX, $minY, $maxY)
    $signature = @'
    [DllImport("user32.dll",CharSet=CharSet.Auto,SetLastError=true)]
    public static extern int SetCursorPos(int X, int Y);
"@
    Add-Type -MemberDefinition $signature -Name Win32Utils -Namespace RandomMouseMovement
    $x = Get-Random -Minimum $minX -Maximum $maxX
    $y = Get-Random -Minimum $minY -Maximum $maxY
    [RandomMouseMovement.Win32Utils]::SetCursorPos($x, $y) | Out-Null
}

while ($true) {
    Random_Mouse_Movement -minX 0 -maxX 1920 -minY 0 -maxY 1080
    Start-Sleep -Seconds 120
}

Write-Host "Press any key to exit..."

$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
```