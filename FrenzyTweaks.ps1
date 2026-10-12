<#
    Frenzy Tweaks  -  FPS & latency optimizer for Windows 10 / 11
    Scans your hardware on launch and adapts

    Every tweak is reversible from inside the app (except removed Store apps, which can be
    reinstalled from the Microsoft Store). Original values are saved to:
        %ProgramData%\FrenzyTweaks\backup.json
    A System Restore point is created before the first change of every session (configurable).

    Run "Launch FrenzyTweaks.bat" (it asks for Administrator rights).
#>

$ErrorActionPreference = 'Continue'
$AppName    = 'Frenzy Extreme Panel'
$AppVersion = '2.2.0'

# >>> SET THESE TWO LINES to your GitHub repo before publishing <<<
$RepoUrl    = 'https://github.com/YOUR-USER/YOUR-REPO'
$RawUrl     = 'https://raw.githubusercontent.com/YOUR-USER/YOUR-REPO/main/FrenzyTweaks.ps1'
$IconB64    = 'iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAM/klEQVR4nN2ba5Ac1XXH/+fe7p7Zh2Z3JLFIIGRFQUgQyYB4FJYTy1QFYsuVVCh7JtiFjZNgm8qzEhviwo6HjVxl4wpViXG5Col8cKDyYedDKvngkDiptfCjEtvgsiWBhEAGTISCHjs7uzsz3X3vOfnQj+meXQm0O7u21FWr1d7b9/b5/e+5p++jL3ABV2VCdE3EqUyIvpByK3HVaqJqk7FtIvR2y72tGycmRFcqYCKSJO3R12RAWRQajbco3Oj+Gu3+ef6bgQXvbjQWSB0dRal9hh/bs7aZTa5MiK5XwUDX5oWu8wogsZIJ+N7ngl1w9Z02sLsguBaEYWsZwiBAIIL4RyCI/g8BWOK8qM44LcqTbDmWOC1TT1IHuuXSdJAIhMSKgdKHSdGPBZg8+crJp5/+82t8IPKM8XHiCxagJqLGKSq49yf+hx1H/ymzfpc7CNgQCH2ALeeAwV1Dc2Jk4JP0RBgAEO4RIlMG58pLxOMIQ7keSLmw1sAEwRFrwn8KDr3+SH18exB5A9m3LcDEhOhqlewD3527ojxSfMIpqPczA53ZQBiwECERkAgIvQYtAB9ByryWTcU4B3xSBtm8HsEyQrJE7UHKLWrlFmH89uGgPfepiXsu/97uSXEO3E7mLQWYENFVIjv+g+CWwir9L8pR69vNwEbGk4bMB8m5aOxsvSCRhRmDe1oxAhVwKtj8lk+7DiTznF6PETCEhcG6MOCIwATtuT+q3zO2vyKi65T3BJX9oyaiqkS29sO5WwvD+t8Fan27GRiAtOBigQcgpAA4pt2yxu9ob7C0r/KNk5+oE9neN1jqATWRSIwfzI0Vhoo/UVqPdeYCS0SaY+qLAz7/HGYWUpp1YUh3mo07//kP1n0rGxNyHjBOxMpxv+EW9ZjfCszFDi8AQETWWjJBR5TrPvmBr79arlfAyVhBAVHQGyfivc/6vzewyruz3QwNQM7FDi8c3UcgZfwOO8XS5W6xsBdEUqlH7AoADlcgIkJM8iAzwCLR++9ih8/mEamgNS1Q+g9/6/FX1terZCFCThL11bOtd7nFwvWduZBFcBEFvLcBL4CASKwx7mC56Fn+KICv3LTvWUf957ORFwi5e5yi0hBOGC8ZeI7LiIDYWkCwByK0uXyc1dTxKB8it9gQYIkGz5ccfJSubNAGM2//nX84PVyvVq2qV8G1QzIsIttDXyAM9YuCt8wQtmDLmef0Bz5OImsCUe7AKBBuBQAHIPFZXE+kxFZygCva8ixwCwOAcsDWIOy0u/f0A777I0q7mn0eiQUAChbCAitJBdHkbmXgEbW8dj3834s/Rac5BW94FKs3bUvCUZ/gM89lC0PKpALEdpIk0Q8rB29Cg2KpjFd/+G08/aX7ITNnce1d9+Pd225GuzkFItUXeEiPEEyUEwBZhWiFWt5YeEMlvHnsICa/+iBIazhrr8SW2z8IEwZxQ/QHPgmuaZeKr3QoLIJ07r0iAc8ylOOiPX0WB772EPyZBmAt1mzahvLGrQjbrWhO00d4TspnFMgJwLGhy/+qi27QbhGTf/8Azrx8EN6qUXDQxoYbd0M7Hpi57/BI0hMD8wJ0H7S88IAwwxss4Tv7Hsbrzx2AV1oN02mhWL4c77j1DoSdFkBqWeCTuozpFaCnguWCZ2vgDpZw6JtP4YVvPgV3eAQiDBu0MbZ1J4bHNsIEfmpU/+DRfbWfqwssKzwANiEKq8p47bln8L39D8MdLsUBkQBrceWN70lbPi3fN/i4eycFegVApoJlaXlj4A6V8OZLB3Hgqw9Ae0Uk6zEcBhgc24Ardrw7df++w6fcskAQbCBVnZcBXpihHA/t6Sk887WH0G5OQbkeRBikFKzfwpXv/HUMX7Yhcn+h/sNzxnbpxgAn5ocbKw4WgKh/8LEBjlvE5CN/HEX80mqwNannAcD6HbtgggBsGUQ9XUAkaiuiRcMnrt2tz3QFSOxYaENjKfAQiSL+0Ai+8/gX8L9xxE/gSSmYTgtrttyATbftgZBCseRmwLvwQXsWHAaIV+IvGD7p/9ml+rwAmcATOcIS4SGw1qAwVO5G/FUj3ZaP6yIClHZw8F/3Iey0QUTdVzEERBphexZX7rwDIxuvhQ18ALQoePQw5gToLbw0eMCGBoXSarz6o2/j+09kI36WX6C8Is4cP4RTz/8PQNk1WgG0A7RmULr6Rmy58/fBccddCnzSDeYJwALojDpLgk8i/rGDOPBYJuILY94lAuV60IVi9CCKjCSlwCaEW74cu/7kMbjDowhbs5FIS2h5lmhLKxcEE8GTN0FcfHErOZahvSL82Wl89/G/RjDbhDu0CmwtSOkIjgjCtusRIhDbs3UXD45uu/9RDI1tRGemAdIa4MXDJ/Occ8YAioUQWiQ8C0AKxu/g3754H04ffAYYLMOfOpXZgok8gQqD0F4hb01yh3YQzpzFjrs/i3U73oNOcyoSb0nw+d/zBYgzGAIwLQI+Steui7OvHcP6627FVTtvB1ubunWyxKW9It44+H2cOvojKK+Ys4i0g7B5Fhtu24Mtd9wLf3YaUNFu1tLgMwEw87zsgkgKtRj4pHWN76P8jm24bOvN0YpO1lABmC3cYgFnf/Y82ITQhYG0K5DSMK0ZjP7Kdlz/kc/D+NGyGCiZoS4ePluGBb0xoAFhDVGJOEtYvQWBwxBh53QePjEECq2zPqZePQLlFrpxgAhsAnjDI9h579/AGxxB0JoBKd0X+N43QXL1zAW6Ci0KPvUeAEpH/VYpkNIg0iAoaK+IVuMU2tOnoBw3dUcCgcMOrv/I51DetB3BXLPv8BznJesROQGy/WRJ8HzuBUwWAWkX0yeOw3TmQKRT1w/nGrj6N+/FVbd8AJ3pM9HqcD/hE86eoBsLMJovvBybFiLxJIvQ+PmLQBwcSWuErSbWvfO92P7Bv4Q/2wCUk++K/YAXpJO8rAaxAI1M5dJ/eI49iwjWGEy/fgzQGkQEDnwMlNfhhnu+AGvCjBf2H15SuwETR8F5i6LI3NTP7SqJxwj+3DRmTr4C5RSiVyQEN9/3ZRRHx2ACHwK1zPCS6wb5GIBuoOj3Xp3E/b915iTajTehvQJMZxY7qn+FtdfcgqA1C5BeAfh8F5i3LxCNA/oLz3H/V9pD88Rx2MCH2BCbfuND2PzeD6Mz01gB+PxP3gMay+P22TyWaIzQfONlSKuBNVtuwvYPfTpq+XiouJzwSR1J3cmkPO0C2dWbfsMnijNbTL1yGG5pLXZ+fC+UNwC2YTTSW2b43r0OZJfFG5mM+QWW2PIAorU/B8HsNJonXsbO+x7B0NgmhO25eBV4ZeA5qbvbAxbaF+j/xwksAuUW0XjtCDbu+l1cceMd8Gca0UhvBeGRPqsrQX4yhMxIsE/wUbqCCToYHNuIzRu2IpibiXZ9VxheBGAWKE57QOYtwCAhZAToD3x6nzXwhkajD6zZQuJvEFYSPjfbZXS3xwuhSKARUrLYmDF8yfCpy0WjwMiA/MruSsFL/GywFTZsAEBVJib0vkq5KVAvkOvlukvf4AVdo3ryVgw+qkdAWtmgMzvohS8AgCpPbVYgEhH5sVKuxJ+c9xc+MU7wC3H79D4WgXYhzC9t/rWtU6jVlDp6YibiNeZbbA0JQCKXHnzc95l0AQJM1qtkb3rjtzVFmwxM1frPix6GDmu3uMn4bQFIXTLwqTcTi3KEW7M3HHn0ukM1EaUAQRVQ9erGNkSe0N4AicSLJpcQvLBY8oaUDfz/OvLodYdQi44EKQCoA1wTUQGt+dv2zNQxXRh0hNleQvACUrBhx8I1f4bMFY0E41Nh9SoFjPBjbK2I0sTCklR4scLHfd+ogdXaBu3PHP3itUdREY34JFk6FB4n4sqE6Im71/132Jr7lFMYUkSamYUvXngRFgn1wGo3nD29/8WvbPs7VESj3j03NO/QVHK6qvLUyU84hdF9JujAhr4BoDn+cOCXGj5uLGGxAJQaXEPh7Nn9R7/8q59ETRTGIdnDlLkjMwBw4HYyuycnnfo96/b7ren3CXDCHSo7QprAbFjERj1DkIyu5sN3895qr26hpev58FGB847wWEQsMzMbCKAKw1p0MTStxl+k8A/n4Rf0gORKDhbd9fWXxqh02ech8nHlDqxia2CDDqwJ0uW17LwhnW9nhEn2GXNT7lyZfF5uON7rLZx39SQd5ChoF6Q9GL9lIfIfbMMHj3zp6kNRy1NsVf4679HZ7Omqu548vYGtvluE329NeL3S3hrS0Xc+vQZGrdTT2pnusJAYOe9J4ecLs5AQwgwbtJsCfZRIPUMK/3ho/KqfRhD5Pn9BAsTNQJV6XdWr1bSS9z15ukS+XKN0cdh0ZucVMdnzmQYwTj7RpP+co0yabXL3GYNo+may9zhgDqwMrH3+yEMjZ7J242EQznNu+IKuWq2mdk+KU6vJvLjxy3MJ7a6Jgwuw8f8BWDZQm2cIKUoAAAAASUVORK5CYII='

# ---------------------------------------------------------------- console loader (shown when the command is pasted)
try {
    Write-Host ''
    Write-Host '      /\      ' -ForegroundColor White
    Write-Host '     /  /     ' -ForegroundColor White
    Write-Host '    /  /___   ' -ForegroundColor White
    Write-Host '   /____  /   ' -ForegroundColor Gray
    Write-Host '       / /    ' -ForegroundColor Gray
    Write-Host '      /_/     ' -ForegroundColor DarkGray
    Write-Host ''
    Write-Host '   Loading FRENZY Tweaks...' -ForegroundColor White
    Write-Host ''
} catch {}

# ---------------------------------------------------------------- elevation / STA
$currentId = [Security.Principal.WindowsIdentity]::GetCurrent()
$isAdmin   = (New-Object Security.Principal.WindowsPrincipal($currentId)).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin -or [Threading.Thread]::CurrentThread.ApartmentState -ne 'STA') {
    $target = $PSCommandPath
    if (-not $target) {
        # Started as:  irm <raw url> | iex   -> there is no file yet, so save a copy and relaunch it elevated
        try {
            [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
            $target = Join-Path $env:TEMP 'FrenzyTweaks.ps1'
            Invoke-WebRequest -Uri $RawUrl -UseBasicParsing -OutFile $target -ErrorAction Stop
        } catch {
            Write-Host 'Frenzy Extreme Panel could not download itself to relaunch as Administrator.' -ForegroundColor Yellow
            Write-Host 'Open PowerShell as Administrator (right-click > Run as administrator) and run the command again.' -ForegroundColor Yellow
            return
        }
    }
    $argList = "-NoProfile -ExecutionPolicy Bypass -STA -WindowStyle Hidden -File `"$target`""
    try { Start-Process -FilePath 'powershell.exe' -ArgumentList $argList -Verb RunAs }
    catch { Write-Host 'Administrator permission was not granted, so Frenzy Extreme Panel did not start.' -ForegroundColor Yellow }
    return
}

Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase, System.Xaml

# ---------------------------------------------------------------- splash loader (black & white thunder)
$script:Splash = $null
function Set-Splash([string]$Text, [double]$Pct = -1) {
    if (-not $script:Splash) { return }
    try {
        $script:SplashStatus.Text = $Text
        if ($Pct -ge 0) { $script:SplashFill.Width = [math]::Round(300 * $Pct / 100) }
        $script:Splash.Dispatcher.Invoke([Action]{}, [System.Windows.Threading.DispatcherPriority]::Render)
    } catch {}
}
function Close-Splash { try { if ($script:Splash) { $script:Splash.Close() } } catch {}; $script:Splash = $null }
try {
    [xml]$SplashXaml = @'
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Frenzy Tweaks" Width="460" Height="330" WindowStyle="None" AllowsTransparency="True"
        Background="Transparent" ResizeMode="NoResize" ShowInTaskbar="False" Topmost="True"
        WindowStartupLocation="CenterScreen" UseLayoutRounding="True" SnapsToDevicePixels="True">
  <Border Background="#000000" BorderBrush="#FFFFFF" BorderThickness="1" CornerRadius="16" Margin="8">
    <Border.Effect><DropShadowEffect BlurRadius="24" ShadowDepth="0" Opacity="0.7" Color="#000000"/></Border.Effect>
    <Grid>
      <StackPanel VerticalAlignment="Center" HorizontalAlignment="Center">
        <Viewbox Width="84" Height="84" HorizontalAlignment="Center">
          <Canvas Width="48" Height="64">
            <Path Fill="#FFFFFF" Stroke="#FFFFFF" StrokeThickness="1" StrokeLineJoin="Round"
                  Data="M 30,0 L 6,36 L 22,36 L 14,64 L 42,24 L 26,24 Z">
              <Path.Triggers>
                <EventTrigger RoutedEvent="FrameworkElement.Loaded">
                  <BeginStoryboard>
                    <Storyboard RepeatBehavior="Forever" AutoReverse="True">
                      <DoubleAnimation Storyboard.TargetProperty="Opacity" From="1" To="0.35" Duration="0:0:0.7"/>
                    </Storyboard>
                  </BeginStoryboard>
                </EventTrigger>
              </Path.Triggers>
            </Path>
          </Canvas>
        </Viewbox>
        <TextBlock Text="FRENZY TWEAKS" Foreground="#FFFFFF" FontSize="22" FontWeight="Bold" HorizontalAlignment="Center" Margin="0,14,0,0"/>
        <TextBlock Text="Loading FRENZY Tweaks" Foreground="#9A9A9A" FontSize="12" HorizontalAlignment="Center" Margin="0,4,0,0"/>
        <Border Width="300" Height="3" Background="#262626" CornerRadius="2" Margin="0,22,0,0" HorizontalAlignment="Center">
          <Border x:Name="Fill" Width="0" Background="#FFFFFF" CornerRadius="2" HorizontalAlignment="Left"/>
        </Border>
        <TextBlock x:Name="Status" Text="Starting..." Foreground="#CFCFCF" FontSize="12" HorizontalAlignment="Center" Margin="0,12,0,0"/>
      </StackPanel>
    </Grid>
  </Border>
</Window>
'@
    $script:Splash = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $SplashXaml))
    $script:SplashStatus = $script:Splash.FindName('Status')
    $script:SplashFill   = $script:Splash.FindName('Fill')
    $script:Splash.Show()
    Set-Splash 'Preparing environment...' 12
} catch { $script:Splash = $null }

function Test-Server {
    # quick reachability check of the update server (never blocks longer than ~3 seconds)
    $c = $null
    try {
        $hostName = 'raw.githubusercontent.com'
        if ($RawUrl -notmatch 'YOUR-USER') { try { $hostName = ([Uri]$RawUrl).Host } catch {} }
        $c = New-Object System.Net.Sockets.TcpClient
        $iar = $c.BeginConnect($hostName, 443, $null, $null)
        if ($iar.AsyncWaitHandle.WaitOne(3000) -and $c.Connected) { return $true }
        return $false
    } catch { return $false }
    finally { if ($c) { try { $c.Close() } catch {} } }
}

# ---------------------------------------------------------------- paths / settings
$DataDir      = Join-Path $env:ProgramData 'FrenzyTweaks'
$BackupFile   = Join-Path $DataDir 'backup.json'
$SettingsFile = Join-Path $DataDir 'settings.json'
$LogFile      = Join-Path $DataDir 'frenzytweaks.log'
$GamesFile    = Join-Path $DataDir 'games.json'
New-Item -ItemType Directory -Force -Path $DataDir | Out-Null
Set-Splash 'Connecting with server...' 35
$script:ServerOnline = Test-Server
Set-Splash $(if ($script:ServerOnline) { 'Connected to server' } else { 'Server not reachable - continuing offline' }) 60

function Write-Log([string]$msg) {
    try { Add-Content -LiteralPath $LogFile -Value ("[{0}] {1}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $msg) -Encoding UTF8 } catch {}
}

$script:Settings = [ordered]@{ AutoRestorePoint = $true; ShowAdvanced = $true; ConfirmRisky = $true }
if (Test-Path -LiteralPath $SettingsFile) {
    try {
        $s = Get-Content -LiteralPath $SettingsFile -Raw | ConvertFrom-Json
        foreach ($p in $s.PSObject.Properties) { $script:Settings[$p.Name] = $p.Value }
    } catch {}
}
function Save-Settings { try { $script:Settings | ConvertTo-Json | Set-Content -LiteralPath $SettingsFile -Encoding UTF8 } catch {} }

$script:Backup = @{}
if (Test-Path -LiteralPath $BackupFile) {
    try {
        $j = Get-Content -LiteralPath $BackupFile -Raw | ConvertFrom-Json
        foreach ($p in $j.PSObject.Properties) { $script:Backup[$p.Name] = $p.Value }
    } catch { Write-Log "Backup file unreadable: $($_.Exception.Message)" }
}
function Save-Backup {
    try { $script:Backup | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $BackupFile -Encoding UTF8 }
    catch { Write-Log "Could not save backup: $($_.Exception.Message)" }
}

# ---------------------------------------------------------------- registry helpers
function RegV {
    param($Path, $Name, $Type, $Value, $Default)
    [pscustomobject]@{ Path = $Path; Name = $Name; Type = $Type; Value = $Value; Default = $Default }
}
function SvcV {
    param($Name, $Start, $Default)
    [pscustomobject]@{ Name = $Name; Start = $Start; Default = $Default }
}
function PwrV {
    # power setting: subgroup GUID, setting GUID, target value, Windows default
    param($Sub, $Setting, $Value, $Default)
    [pscustomobject]@{ Sub = $Sub; Setting = $Setting; Value = $Value; Default = $Default }
}

function Get-RegValue([string]$Path, [string]$Name) {
    $res = [pscustomobject]@{ Exists = $false; Type = $null; Value = $null }
    try {
        $k = Get-Item -LiteralPath $Path -ErrorAction Stop
        if ($k.GetValueNames() -contains $Name) {
            $res.Exists = $true
            $res.Type   = $k.GetValueKind($Name).ToString()
            $res.Value  = $k.GetValue($Name, $null, 'DoNotExpandEnvironmentNames')
        }
    } catch {}
    return $res
}

function Set-RegValue([string]$Path, [string]$Name, [string]$Type, $Value) {
    if (-not (Test-Path -LiteralPath $Path)) { New-Item -Path $Path -Force -ErrorAction Stop | Out-Null }
    if ($Type -eq 'Binary') { $Value = [byte[]]@($Value) }
    if ($Type -eq 'MultiString') { $Value = [string[]]@($Value) }
    New-ItemProperty -LiteralPath $Path -Name $Name -PropertyType $Type -Value $Value -Force -ErrorAction Stop | Out-Null
}

function Remove-RegValue([string]$Path, [string]$Name) {
    if (Test-Path -LiteralPath $Path) { Remove-ItemProperty -LiteralPath $Path -Name $Name -Force -ErrorAction SilentlyContinue }
}

function Test-SameValue($cur, $want) {
    if ($cur -is [byte[]] -or $want -is [array]) { return ((@($cur) -join ',') -eq (@($want) -join ',')) }
    return ("$cur" -eq "$want")
}

# ---------------------------------------------------------------- service helpers
function Get-SvcStart([string]$Name) {
    $key = "HKLM:\SYSTEM\CurrentControlSet\Services\$Name"
    if (-not (Test-Path -LiteralPath $key)) { return $null }
    if (-not (Get-Service -Name $Name -ErrorAction SilentlyContinue)) { return $null }
    $start   = (Get-RegValue $key 'Start').Value
    $delayed = (Get-RegValue $key 'DelayedAutostart').Value
    switch ($start) {
        2 { if ($delayed -eq 1) { 'delayed-auto' } else { 'auto' } }
        3 { 'demand' }
        4 { 'disabled' }
        default { "$start" }
    }
}
function Set-SvcStart([string]$Name, [string]$Start) {
    if (-not $Start -or $Start -notin 'auto', 'delayed-auto', 'demand', 'disabled') { return }
    & sc.exe config "$Name" start= $Start | Out-Null
    if ($Start -eq 'disabled') { Stop-Service -Name $Name -Force -ErrorAction SilentlyContinue }
}

# ---------------------------------------------------------------- power helpers
function Get-PowerValue([string]$Sub, [string]$Setting) {
    $out = (& powercfg.exe /qh SCHEME_CURRENT $Sub $Setting 2>$null) | Out-String
    $m = [regex]::Matches($out, '0x[0-9a-fA-F]{8}')
    if ($m.Count -ge 2) { return [Convert]::ToInt64($m[$m.Count - 2].Value, 16) }
    return $null
}
function Set-PowerValue([string]$Sub, [string]$Setting, $Value, [string]$Scheme = 'SCHEME_CURRENT') {
    if (-not $Scheme) { $Scheme = 'SCHEME_CURRENT' }
    & powercfg.exe /setacvalueindex $Scheme $Sub $Setting $Value 2>$null | Out-Null
    & powercfg.exe /setdcvalueindex $Scheme $Sub $Setting $Value 2>$null | Out-Null
    & powercfg.exe /setactive SCHEME_CURRENT 2>$null | Out-Null
}
function Get-ActiveSchemeGuid {
    $o = (& powercfg.exe /getactivescheme) | Out-String
    $m = [regex]::Match($o, '[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}')
    if ($m.Success) { $m.Value.ToLower() } else { $null }
}

# ---------------------------------------------------------------- scheduled task helpers
function Get-TaskObjects([string]$Full) {
    $i = $Full.LastIndexOf('\')
    $path = $Full.Substring(0, $i + 1); $name = $Full.Substring($i + 1)
    @(Get-ScheduledTask -TaskPath $path -TaskName $name -ErrorAction SilentlyContinue)
}

# ---------------------------------------------------------------- appx helpers
$script:AppxNames = @()
function Update-AppxCache { try { $script:AppxNames = @(Get-AppxPackage -ErrorAction SilentlyContinue | ForEach-Object { $_.Name }) } catch { $script:AppxNames = @() } }

# ---------------------------------------------------------------- tweak engine
$script:Tweaks = New-Object System.Collections.Generic.List[object]
$script:State  = @{}
function Add-Tweak([hashtable]$h) {
    foreach ($k in 'Reg','RegFn','Svc','Pow','Tasks','Appx','Test','Apply','Revert','Tags','Only','Note') { if (-not $h.ContainsKey($k)) { $h[$k] = $null } }
    if (-not $h.ContainsKey('Rec'))    { $h.Rec = $false }
    if (-not $h.ContainsKey('Risk'))   { $h.Risk = 'Safe' }
    if (-not $h.ContainsKey('Impact')) { $h.Impact = 'Medium' }
    if (-not $h.Tags) { $h.Tags = @() }
    if (-not $h.ContainsKey('Kind') -or -not $h.Kind) {
        $h.Kind = if ($h.Appx) { 'APPS' } elseif ($h.Pow) { 'POWER' } elseif ($h.Svc -and ($h.Reg -or $h.RegFn)) { 'SERVICE + REG' }
                  elseif ($h.Svc) { 'SERVICE' } elseif ($h.Tasks) { 'TASKS' } elseif ($h.Reg -or $h.RegFn) { 'REGISTRY' } else { 'SYSTEM' }
    }
    $script:Tweaks.Add([pscustomobject]$h)
}
function Get-Tweak([string]$Id) { $script:Tweaks | Where-Object { $_.Id -eq $Id } | Select-Object -First 1 }

function Resolve-Reg($t) {
    if ($t.RegFn) { return @(& $t.RegFn | Where-Object { $_ }) }
    if ($t.Reg)   { return @($t.Reg) }
    return @()
}

function Test-OnlyOk($t) {
    if (-not $t.Only) { return $true }
    switch ($t.Only) {
        'Win11'  { return ($script:SysInfo.Build -ge 22000) }
        'Win10'  { return ($script:SysInfo.Build -lt 22000) }
        'NVIDIA' { return [bool]$script:SysInfo.GpuInstanceId }
    }
    return $true
}

# Returns 'On', 'Off' or 'NA'
function Test-Tweak($t) {
    try {
        if (-not (Test-OnlyOk $t)) { return 'NA' }
        if ($t.Test) {
            $r = & $t.Test
            if ($r -is [string]) { return $r }
            if ($r) { return 'On' } else { return 'Off' }
        }
        $checked = 0
        foreach ($r in (Resolve-Reg $t)) {
            $checked++
            $c = Get-RegValue $r.Path $r.Name
            if (-not $c.Exists -or -not (Test-SameValue $c.Value $r.Value)) { return 'Off' }
        }
        foreach ($s in @($t.Svc)) {
            if (-not $s) { continue }
            $cur = Get-SvcStart $s.Name
            if ($null -eq $cur) { continue }
            $checked++
            if ($cur -ne $s.Start) { return 'Off' }
        }
        foreach ($p in @($t.Pow)) {
            if (-not $p) { continue }
            $cur = Get-PowerValue $p.Sub $p.Setting
            if ($null -eq $cur) { continue }
            $checked++
            if ($cur -ne $p.Value) { return 'Off' }
        }
        foreach ($tk in @($t.Tasks)) {
            if (-not $tk) { continue }
            foreach ($o in (Get-TaskObjects $tk)) { $checked++; if ($o.State -ne 'Disabled') { return 'Off' } }
        }
        if ($t.Appx) {
            $checked++
            foreach ($a in $t.Appx) { if ($script:AppxNames | Where-Object { $_ -like $a }) { return 'Off' } }
        }
        if ($checked -eq 0) { return 'NA' }
        return 'On'
    } catch { Write-Log "Test failed for $($t.Id): $($_.Exception.Message)"; return 'Off' }
}

function Invoke-ApplyTweak($t) {
    Write-Log "APPLY  $($t.Id)  ($($t.Name))"
    $hadBackup = $script:Backup.ContainsKey($t.Id)
    $bk = [ordered]@{ Reg = @(); Svc = @(); Pow = @(); Tasks = @(); Custom = $null; Time = (Get-Date).ToString('s') }

    foreach ($r in (Resolve-Reg $t)) {
        $c = Get-RegValue $r.Path $r.Name
        $v = $c.Value; if ($v -is [byte[]]) { $v = [int[]]$v }
        $bk.Reg += [pscustomobject]@{ Path = $r.Path; Name = $r.Name; Exists = $c.Exists; Type = $c.Type; Value = $v }
        try { Set-RegValue $r.Path $r.Name $r.Type $r.Value } catch { Write-Log "  reg fail $($r.Path)\$($r.Name): $($_.Exception.Message)" }
    }
    foreach ($s in @($t.Svc)) {
        if (-not $s) { continue }
        $cur = Get-SvcStart $s.Name
        if ($null -eq $cur) { continue }
        $bk.Svc += [pscustomobject]@{ Name = $s.Name; Start = $cur }
        Set-SvcStart $s.Name $s.Start
    }
    foreach ($p in @($t.Pow)) {
        if (-not $p) { continue }
        $bk.Pow += [pscustomobject]@{ Sub = $p.Sub; Setting = $p.Setting; Value = (Get-PowerValue $p.Sub $p.Setting); Scheme = (Get-ActiveSchemeGuid) }
        Set-PowerValue $p.Sub $p.Setting $p.Value
    }
    foreach ($tk in @($t.Tasks)) {
        if (-not $tk) { continue }
        foreach ($o in (Get-TaskObjects $tk)) {
            $bk.Tasks += [pscustomobject]@{ Path = $o.TaskPath; Name = $o.TaskName; State = "$($o.State)" }
            try { Disable-ScheduledTask -TaskPath $o.TaskPath -TaskName $o.TaskName -ErrorAction Stop | Out-Null } catch { Write-Log "  task fail $($o.TaskName): $($_.Exception.Message)" }
        }
    }
    if ($t.Appx) {
        $patterns = @($t.Appx)
        Invoke-Background -Title 'Removing apps' -Text "Uninstalling: $($t.Name)" -Arguments (,$patterns) -Script {
            param($pats)
            foreach ($a in $pats) {
                Get-AppxPackage -AllUsers -Name $a -ErrorAction SilentlyContinue | ForEach-Object {
                    try { Remove-AppxPackage -Package $_.PackageFullName -AllUsers -ErrorAction Stop } catch { try { Remove-AppxPackage -Package $_.PackageFullName -ErrorAction SilentlyContinue } catch {} }
                }
                Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like $a } | ForEach-Object {
                    try { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName -ErrorAction SilentlyContinue | Out-Null } catch {}
                }
            }
        } | Out-Null
        Update-AppxCache
    }
    if ($t.Apply) {
        try { $bk.Custom = & $t.Apply } catch { Write-Log "  custom apply fail: $($_.Exception.Message)" }
    }
    if (-not $hadBackup) { $script:Backup[$t.Id] = [pscustomobject]$bk; Save-Backup }
}

function Invoke-RevertTweak($t) {
    Write-Log "REVERT $($t.Id)  ($($t.Name))"
    $bk = $null; if ($script:Backup.ContainsKey($t.Id)) { $bk = $script:Backup[$t.Id] }

    if ($bk -and @($bk.Reg).Count -gt 0) {
        foreach ($e in @($bk.Reg)) {
            if (-not $e) { continue }
            try {
                if ($e.Exists) { Set-RegValue $e.Path $e.Name $e.Type $e.Value } else { Remove-RegValue $e.Path $e.Name }
            } catch { Write-Log "  reg restore fail $($e.Path)\$($e.Name): $($_.Exception.Message)" }
        }
    } else {
        foreach ($r in (Resolve-Reg $t)) {
            try { if ($null -eq $r.Default) { Remove-RegValue $r.Path $r.Name } else { Set-RegValue $r.Path $r.Name $r.Type $r.Default } } catch {}
        }
    }

    if ($bk -and @($bk.Svc).Count -gt 0) {
        foreach ($e in @($bk.Svc)) { if ($e) { Set-SvcStart $e.Name $e.Start; if ($e.Start -match 'auto') { Start-Service -Name $e.Name -ErrorAction SilentlyContinue } } }
    } else {
        foreach ($s in @($t.Svc)) { if ($s -and $s.Default -and $null -ne (Get-SvcStart $s.Name)) { Set-SvcStart $s.Name $s.Default } }
    }

    if ($bk -and @($bk.Pow).Count -gt 0) {
        foreach ($e in @($bk.Pow)) { if ($e -and $null -ne $e.Value) { Set-PowerValue $e.Sub $e.Setting $e.Value $e.Scheme } }
    } else {
        foreach ($p in @($t.Pow)) { if ($p -and $null -ne $p.Default) { Set-PowerValue $p.Sub $p.Setting $p.Default } }
    }

    if ($t.Tasks) {
        if ($bk -and @($bk.Tasks).Count -gt 0) {
            foreach ($e in @($bk.Tasks)) { if ($e -and $e.State -ne 'Disabled') { Enable-ScheduledTask -TaskPath $e.Path -TaskName $e.Name -ErrorAction SilentlyContinue | Out-Null } }
        } else {
            foreach ($tk in @($t.Tasks)) { foreach ($o in (Get-TaskObjects $tk)) { Enable-ScheduledTask -TaskPath $o.TaskPath -TaskName $o.TaskName -ErrorAction SilentlyContinue | Out-Null } }
        }
    }

    if ($t.Revert) {
        $custom = $null; if ($bk) { $custom = $bk.Custom }
        try { & $t.Revert $custom } catch { Write-Log "  custom revert fail: $($_.Exception.Message)" }
    }
    if ($script:Backup.ContainsKey($t.Id)) { $script:Backup.Remove($t.Id); Save-Backup }
}

function Get-TweakChangeText($t) {
    $lines = @()
    foreach ($r in (Resolve-Reg $t)) {
        $v = if ($r.Value -is [array]) { ($r.Value | ForEach-Object { '{0:X2}' -f $_ }) -join ' ' } else { "$($r.Value)" }
        $lines += "REG  $($r.Path.Replace('HKLM:','HKLM').Replace('HKCU:','HKCU'))\$($r.Name) = $v"
    }
    foreach ($s in @($t.Svc))   { if ($s) { $lines += "SERVICE  $($s.Name) -> $($s.Start)" } }
    foreach ($p in @($t.Pow))   { if ($p) { $lines += "POWER  $($p.Setting) -> $($p.Value)  (active plan)" } }
    foreach ($k in @($t.Tasks)) { if ($k) { $lines += "TASK  disable $k" } }
    foreach ($a in @($t.Appx))  { if ($a) { $lines += "APP  remove $a" } }
    if ($t.Note) { $lines += $t.Note }
    if ($lines.Count -eq 0) { $lines += 'System command (see description).' }
    return ($lines -join "`n")
}

# ================================================================ TWEAK CATALOG
$SUB_PROC = '54533251-82be-4824-96c1-47b60b740d00'
$SUB_PCIE = '501a4d13-42af-4429-9fd1-a8218c268e20'
$SUB_USB  = '2a737441-1930-4402-8d77-b2bebba308a3'
$SUB_DISK = '0012ee47-9041-4b5d-9b77-535fba8b1442'
$FF_PLAN  = 'f7a1c0de-3f05-4e2b-9a6b-1c2d3e4f5a6b'
$CDM      = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'
$ADV      = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
$MMCSS    = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile'
$MEMMGMT  = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management'

# ---------------------------------------------------------------- POWER & CPU
Add-Tweak @{ Id='pwr_plan'; Cat='Power & CPU'; Name='Frenzy Tweaks Ultimate Performance Plan'; Impact='High'; Rec=$true; Tags=@('Power Hungry')
    Desc='Creates and activates a dedicated Ultimate Performance power plan so the i5-6500 never waits to ramp up its clocks. Removes the latency of the Balanced plan''s power-saving states. Applied first so the power tweaks below land on this plan.'
    Kind='POWER'
    Note='POWER  duplicate Ultimate Performance (e9a42b02...) as "Frenzy Tweaks Ultimate Performance" and activate it'
    Test={ (Get-ActiveSchemeGuid) -eq $FF_PLAN }
    Apply={
        $prev = Get-ActiveSchemeGuid
        $list = (& powercfg.exe /list) | Out-String
        if ($list -notmatch $FF_PLAN) {
            & powercfg.exe /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 $FF_PLAN 2>$null | Out-Null
            $list = (& powercfg.exe /list) | Out-String
            if ($list -notmatch $FF_PLAN) { & powercfg.exe /duplicatescheme 8c5e7fda-e8bf-4a96-9a85-cf48a8ea3d2b $FF_PLAN 2>$null | Out-Null }
            & powercfg.exe /changename $FF_PLAN 'Frenzy Tweaks Ultimate Performance' 'Maximum performance plan created by Frenzy Tweaks' 2>$null | Out-Null
        }
        & powercfg.exe /setactive $FF_PLAN 2>$null | Out-Null
        @{ Prev = $prev }
    }
    Revert={ param($c)
        $prev = '381b4222-f694-41f0-9685-ff5bb260df2e'
        if ($c -and $c.Prev -and $c.Prev -ne $FF_PLAN) { $prev = $c.Prev }
        & powercfg.exe /setactive $prev 2>$null | Out-Null
        & powercfg.exe /delete $FF_PLAN 2>$null | Out-Null
    } }

Add-Tweak @{ Id='pwr_coreparking'; Cat='Power & CPU'; Name='Disable CPU Core Parking'; Impact='Medium'; Rec=$true; Tags=@('Power Hungry')
    Desc='Keeps all 4 cores of the i5-6500 awake. With only 4 cores and no Hyper-Threading, a parked core that has to wake up during a frame causes micro-stutter.'
    Pow=@( (PwrV $SUB_PROC '0cc5b647-c1df-4637-891a-dec35c318583' 100 10) ) }

Add-Tweak @{ Id='pwr_minstate'; Cat='Power & CPU'; Name='Minimum Processor State 100%'; Impact='Medium'; Rec=$true; Tags=@('Power Hungry')
    Desc='Prevents Windows from down-clocking the CPU between frames. The i5-6500 stays at its full 3.2-3.6 GHz while the plan is active, which smooths frame times in CPU-heavy games.'
    Pow=@( (PwrV $SUB_PROC '893dee8e-2bef-41e0-89c6-b55d0929964c' 100 5) ) }

Add-Tweak @{ Id='pwr_boost'; Cat='Power & CPU'; Name='Aggressive Turbo Boost'; Impact='Low'; Rec=$true; Tags=@('Power Hungry')
    Desc='Sets the processor boost mode to Aggressive so the CPU jumps to its 3.6 GHz turbo immediately instead of easing into it.'
    Pow=@( (PwrV $SUB_PROC 'be337238-0d82-4146-a960-4f3749d470c7' 2 1) ) }

Add-Tweak @{ Id='pwr_epp'; Cat='Power & CPU'; Name='CPU Energy Preference: Maximum Performance'; Impact='Low'; Rec=$true; Tags=@('Power Hungry')
    Desc='Sets the processor Energy Performance Preference (EPP) to 0. On Skylake and newer the CPU picks its own clock speed (Speed Shift / HWP), and EPP tells it to jump to high clocks instantly instead of easing up. Fewer clock dips and less ramp-up lag on frame spikes. Overlaps with the Ultimate Performance plan, which already lowers it, so this mainly matters if you use another plan.'
    Pow=@( (PwrV $SUB_PROC '36687f9e-e3a5-4dbf-b1dc-15eb381c6863' 0 50),
           (PwrV $SUB_PROC '36687f9e-e3a5-4dbf-b1dc-15eb381c6864' 0 50) ) }

Add-Tweak @{ Id='pwr_usb'; Cat='Power & CPU'; Name='Disable USB Selective Suspend'; Impact='Low'; Rec=$true
    Desc='Stops Windows from putting USB ports to sleep. Prevents mouse, keyboard and headset dropouts or the first-input lag after they idle.'
    Pow=@( (PwrV $SUB_USB '48e6b7a6-50f5-4782-a5d4-53bb8f07e226' 0 1) ) }

Add-Tweak @{ Id='pwr_aspm'; Cat='Power & CPU'; Name='Disable PCIe Link State Power Saving'; Impact='Medium'; Rec=$true; Tags=@('Power Hungry')
    Desc='Keeps the PCIe link to the GT 1030 at full power. Power-saving link states add wake-up latency every time the GPU is idle for a moment.'
    Pow=@( (PwrV $SUB_PCIE 'ee12f906-d277-404b-b6da-e5fa1a576df5' 0 1) ) }

Add-Tweak @{ Id='pwr_diskidle'; Cat='Power & CPU'; Name='Never Spin Down Hard Drives'; Impact='Medium'; Rec=$true; Tags=@('HDD')
    Desc='With 3.66 TB of storage you likely have a hard drive. When a sleeping HDD spins back up you get a 2-5 second freeze when a game loads assets. This keeps drives spinning.'
    Pow=@( (PwrV $SUB_DISK '6738e2c4-e8a5-4a42-b16a-e040e769756e' 0 1200) ) }

Add-Tweak @{ Id='pwr_hibernate'; Cat='Power & CPU'; Name='Disable Hibernation & Fast Startup'; Impact='Medium'; Rec=$true; Tags=@('Reboot')
    Desc='Deletes hiberfil.sys (about 12 GB on a 32 GB PC) and turns off Fast Startup, which keeps drivers in a half-saved state between boots and is a common cause of stutter and driver glitches.'
    Kind='SYSTEM'; Note='CMD  powercfg /hibernate off'
    Test={ (Get-RegValue 'HKLM:\SYSTEM\CurrentControlSet\Control\Power' 'HibernateEnabled').Value -eq 0 }
    Apply={ & powercfg.exe /hibernate off 2>$null | Out-Null; $null }
    Revert={ param($c) & powercfg.exe /hibernate on 2>$null | Out-Null } }

Add-Tweak @{ Id='fps_powerthrottle'; Cat='Power & CPU'; Name='Disable Windows Power Throttling'; Impact='Medium'; Rec=$true; Tags=@('Power Hungry','Reboot')
    Desc='Power Throttling slows background processes to save energy - but Windows sometimes classifies game helpers, voice chat or overlays as background. This turns it off system-wide.'
    Reg=@( (RegV 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling' 'PowerThrottlingOff' 'DWord' 1 $null) ) }

# ---------------------------------------------------------------- FPS & LATENCY
Add-Tweak @{ Id='fps_gamemode'; Cat='FPS & Latency'; Name='Enable Windows Game Mode'; Impact='High'; Rec=$true
    Desc='Game Mode stops Windows Update from installing drivers and showing restart prompts while you play and gives the game priority over background work - important on a 4-thread CPU.'
    Reg=@( (RegV 'HKCU:\Software\Microsoft\GameBar' 'AutoGameModeEnabled' 'DWord' 1 $null), (RegV 'HKCU:\Software\Microsoft\GameBar' 'AllowAutoGameMode' 'DWord' 1 $null) ) }

Add-Tweak @{ Id='fps_gamedvr'; Cat='FPS & Latency'; Name='Disable Game DVR Background Recording'; Impact='High'; Rec=$true
    Desc='Background recording constantly encodes your gameplay. The GT 1030 has no NVENC encoder, so this work falls on the CPU and GPU shaders and costs real FPS.'
    Reg=@( (RegV 'HKCU:\System\GameConfigStore' 'GameDVR_Enabled' 'DWord' 0 1),
           (RegV 'HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR' 'AppCaptureEnabled' 'DWord' 0 $null),
           (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR' 'AllowGameDVR' 'DWord' 0 $null) ) }

Add-Tweak @{ Id='fps_gamebar'; Cat='FPS & Latency'; Name='Disable Xbox Game Bar Overlay'; Impact='Medium'; Rec=$true; Tags=@('Feature Breaking')
    Desc='Stops the Win+G overlay from hooking into every game. Saves RAM and removes an overlay layer. You lose the Game Bar widgets (use MSI Afterburner or Steam''s overlay instead).'
    Reg=@( (RegV 'HKCU:\Software\Microsoft\GameBar' 'UseNexusForGameBarEnabled' 'DWord' 0 $null), (RegV 'HKCU:\Software\Microsoft\GameBar' 'ShowStartupPanel' 'DWord' 0 $null) ) }

Add-Tweak @{ Id='fps_hpet'; Cat='FPS & Latency'; Name='Ensure HPET Is Not Forced'; Impact='Medium'; Rec=$true; Tags=@('Reboot')
    Desc='Some "optimizers" force the slow HPET timer as the only clock source, which adds overhead to every timer call. This removes that override so Windows uses the faster TSC timer on Skylake.'
    Kind='BOOT'; Note='CMD  bcdedit /deletevalue useplatformclock'
    Test={ $o = (& bcdedit.exe /enum '{current}') | Out-String; -not ($o -match 'useplatformclock') }
    Apply={ $o = (& bcdedit.exe /enum '{current}') | Out-String; $was = $o -match 'useplatformclock'; & bcdedit.exe /deletevalue useplatformclock 2>$null | Out-Null; @{ Was = $was } }
    Revert={ param($c) if ($c -and $c.Was) { & bcdedit.exe /set useplatformclock true 2>$null | Out-Null } } }

Add-Tweak @{ Id='fps_dyntick'; Cat='FPS & Latency'; Name='Disable Dynamic Tick'; Impact='Low'; Rec=$false; Risk='Moderate'; Tags=@('Power Hungry','Reboot')
    Desc='Keeps the system timer ticking at a constant rate instead of pausing it to save power. Can make input and frame pacing a little more consistent. Desktop only - raises idle power slightly.'
    Kind='BOOT'; Note='CMD  bcdedit /set disabledynamictick yes'
    Test={ $o = (& bcdedit.exe /enum '{current}') | Out-String; $o -match 'disabledynamictick' }
    Apply={ & bcdedit.exe /set disabledynamictick yes 2>$null | Out-Null; $null }
    Revert={ param($c) & bcdedit.exe /deletevalue disabledynamictick 2>$null | Out-Null } }

Add-Tweak @{ Id='fps_fso'; Cat='FPS & Latency'; Name='Disable Fullscreen Optimizations (Global)'; Impact='Low'; Rec=$false; Risk='Moderate'
    Desc='Forces classic exclusive fullscreen in older DirectX 9/11 games, which can lower input latency. On Windows 11 the default (flip model) is often just as good - test with your games.'
    Reg=@( (RegV 'HKCU:\System\GameConfigStore' 'GameDVR_FSEBehaviorMode' 'DWord' 2 2),
           (RegV 'HKCU:\System\GameConfigStore' 'GameDVR_HonorUserFSEBehaviorMode' 'DWord' 1 0),
           (RegV 'HKCU:\System\GameConfigStore' 'GameDVR_FSEBehavior' 'DWord' 2 $null),
           (RegV 'HKCU:\System\GameConfigStore' 'GameDVR_DXGIHonorFSEWindowsCompatible' 'DWord' 1 0) ) }

Add-Tweak @{ Id='fps_mouse'; Cat='FPS & Latency'; Name='Disable Mouse Acceleration'; Impact='Medium'; Rec=$true; Tags=@('Sign-out')
    Desc='Turns off "Enhance pointer precision" so mouse movement is 1:1. Your aim becomes consistent because the same hand movement always turns the same distance.'
    Reg=@( (RegV 'HKCU:\Control Panel\Mouse' 'MouseSpeed' 'String' '0' '1'),
           (RegV 'HKCU:\Control Panel\Mouse' 'MouseThreshold1' 'String' '0' '6'),
           (RegV 'HKCU:\Control Panel\Mouse' 'MouseThreshold2' 'String' '0' '10') ) }

Add-Tweak @{ Id='fps_keyboard'; Cat='FPS & Latency'; Name='Fastest Keyboard Repeat Response'; Impact='Low'; Rec=$true; Tags=@('Sign-out')
    Desc='Sets the shortest key-repeat delay and the fastest repeat rate so held keys respond immediately.'
    Reg=@( (RegV 'HKCU:\Control Panel\Keyboard' 'KeyboardDelay' 'String' '0' '1'), (RegV 'HKCU:\Control Panel\Keyboard' 'KeyboardSpeed' 'String' '31' '31') ) }

Add-Tweak @{ Id='fps_bgapps'; Cat='FPS & Latency'; Name='Stop Background Apps'; Impact='Medium'; Rec=$true; Tags=@('Feature Breaking')
    Desc='Prevents Store apps (Weather, Mail, Phone Link, etc.) from running in the background and stealing CPU time from your 4 cores. Some of those apps will stop sending live notifications.'
    Reg=@( (RegV 'HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications' 'GlobalUserDisabled' 'DWord' 1 $null),
           (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' 'LetAppsRunInBackground' 'DWord' 2 $null) ) }

Add-Tweak @{ Id='fps_edge'; Cat='FPS & Latency'; Name='Stop Edge Startup Boost & Background Mode'; Impact='Medium'; Rec=$true
    Desc='Microsoft Edge preloads itself at boot and keeps running after you close it. This stops both, freeing RAM and CPU. (Edge will show "managed by your organization" - that is normal for this policy.)'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' 'StartupBoostEnabled' 'DWord' 0 $null), (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' 'BackgroundModeEnabled' 'DWord' 0 $null) ) }

Add-Tweak @{ Id='fps_noreboot'; Cat='FPS & Latency'; Name='No Forced Update Restarts While Signed In'; Impact='Low'; Rec=$true
    Desc='Stops Windows Update from restarting the PC automatically while you are logged in - no more surprise restarts in the middle of a match.'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' 'NoAutoRebootWithLoggedOnUsers' 'DWord' 1 $null) ) }

Add-Tweak @{ Id='fps_maint'; Cat='FPS & Latency'; Name='Disable Automatic Maintenance'; Impact='Low'; Rec=$false; Tags=@('Feature Breaking')
    Desc='Stops the Windows idle-time maintenance run (background scans, disk optimization, diagnostics) so it can never start CPU and disk work while you sit in a game menu or lobby. Side effect: automatic TRIM/defrag stops too, so run Boost Up > Optimize drives about once a month.'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance' 'MaintenanceDisabled' 'DWord' 1 $null) ) }

function Get-DiscordSettingsFiles {
    foreach ($d in 'discord', 'discordptb', 'discordcanary') {
        $f = Join-Path $env:APPDATA "$d\settings.json"
        if (Test-Path -LiteralPath $f) { $f }
    }
}
function Set-DiscordHwAccel([string]$File, [bool]$Value) {
    $raw  = [IO.File]::ReadAllText($File)
    $word = if ($Value) { 'true' } else { 'false' }
    if ($raw -match '"enableHardwareAcceleration"\s*:\s*(true|false)') {
        $new = [regex]::Replace($raw, '("enableHardwareAcceleration"\s*:\s*)(true|false)', ('${1}' + $word))
    } elseif ($raw -match '^\s*\{\s*\}\s*$') {
        $new = "{`n  `"enableHardwareAcceleration`": $word`n}"
    } else {
        $rx  = New-Object System.Text.RegularExpressions.Regex('\{')
        $new = $rx.Replace($raw, ("{`n  `"enableHardwareAcceleration`": $word,"), 1)
    }
    # Discord parses this file with JSON.parse, so it must be written WITHOUT a BOM
    [IO.File]::WriteAllText($File, $new, (New-Object System.Text.UTF8Encoding($false)))
}
function Stop-DiscordProcs { Get-Process -Name 'Discord', 'DiscordPTB', 'DiscordCanary' -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue; Start-Sleep -Milliseconds 800 }

Add-Tweak @{ Id='app_discord'; Cat='FPS & Latency'; Name='Discord: Turn Off Hardware Acceleration'; Impact='Low'; Rec=$false; Risk='Moderate'
    Desc='Discord uses the GPU to draw its window and video. On an entry-level GPU that steals a little GPU time and VRAM from the game, mostly while you stream or watch screens in calls. This sets enableHardwareAcceleration to false in Discord settings. Discord is closed to apply it - reopen it afterwards. A backup of settings.json is kept.'
    Kind='SYSTEM'; Note='FILE  %APPDATA%\discord\settings.json  enableHardwareAcceleration = false  (Discord is closed first)'
    Test={ $f = @(Get-DiscordSettingsFiles); if ($f.Count -eq 0) { 'NA' } else { $ok = $true; foreach ($x in $f) { if ([IO.File]::ReadAllText($x) -notmatch '"enableHardwareAcceleration"\s*:\s*false') { $ok = $false } }; $ok } }
    Apply={
        Stop-DiscordProcs
        $saved = @()
        foreach ($f in @(Get-DiscordSettingsFiles)) {
            $raw = [IO.File]::ReadAllText($f)
            $prev = $null; if ($raw -match '"enableHardwareAcceleration"\s*:\s*(true|false)') { $prev = $Matches[1] }
            try { Copy-Item -LiteralPath $f -Destination (Join-Path $DataDir ('discord-' + (Split-Path (Split-Path $f) -Leaf) + '-settings.bak')) -Force } catch {}
            Set-DiscordHwAccel $f $false
            $saved += [pscustomobject]@{ Path = $f; Prev = $prev }
        }
        @{ Files = $saved } }
    Revert={ param($c)
        Stop-DiscordProcs
        if ($c -and $c.Files) {
            foreach ($e in @($c.Files)) { if ($e -and (Test-Path -LiteralPath $e.Path)) { Set-DiscordHwAccel $e.Path ($e.Prev -ne 'false') } }
        } else {
            foreach ($f in @(Get-DiscordSettingsFiles)) { Set-DiscordHwAccel $f $true }
        } } }

Add-Tweak @{ Id='lat_tsc'; Cat='FPS & Latency'; Name='Enhanced TSC Sync Policy'; Impact='Low'; Rec=$false; Risk='Moderate'; Tags=@('Reboot')
    Desc='Forces the enhanced time-stamp-counter synchronisation policy, which can give steadier timer reads across cores. Gains are small and hardware dependent - test your games and revert if anything feels worse.'
    Kind='BOOT'; Note='CMD  bcdedit /set tscsyncpolicy enhanced'
    Test={ $o = (& bcdedit.exe /enum '{current}') | Out-String; $o -match 'tscsyncpolicy\s+Enhanced' }
    Apply={ & bcdedit.exe /set tscsyncpolicy enhanced 2>$null | Out-Null; $null }
    Revert={ param($c) & bcdedit.exe /deletevalue tscsyncpolicy 2>$null | Out-Null } }

# ---------------------------------------------------------------- GPU & DISPLAY
Add-Tweak @{ Id='gpu_hags'; Cat='GPU & Display'; Name='Hardware-Accelerated GPU Scheduling'; Impact='Medium'; Rec=$true; Tags=@('Reboot')
    Desc='Lets the GT 1030 (Pascal) manage its own video memory scheduling instead of the CPU. On a 4-thread CPU this frees CPU time and can lower latency. Requires a recent NVIDIA driver.'
    Reg=@( (RegV 'HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers' 'HwSchMode' 'DWord' 2 1) ) }

Add-Tweak @{ Id='gpu_mpo'; Cat='GPU & Display'; Name='Disable Multiplane Overlay (MPO)'; Impact='Medium'; Rec=$true; Tags=@('Reboot')
    Desc='MPO is a known cause of flickering, black screens and stutter on NVIDIA cards in borderless/windowed games. NVIDIA itself has published this fix. Safe to undo.'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Microsoft\Windows\Dwm' 'OverlayTestMode' 'DWord' 5 $null) ) }

Add-Tweak @{ Id='gpu_winopt'; Cat='GPU & Display'; Name='Optimizations for Windowed Games'; Impact='Medium'; Rec=$true; Only='Win11'; Tags=@('Win11')
    Desc='Upgrades older DirectX 10/11 games running in borderless or windowed mode to the modern flip presentation model - lower latency, close to exclusive fullscreen.'
    Reg=@( (RegV 'HKCU:\Software\Microsoft\DirectX\UserGpuPreferences' 'DirectXUserGlobalSettings' 'String' 'SwapEffectUpgradeEnable=1;' $null) ) }

Add-Tweak @{ Id='gpu_msi'; Cat='GPU & Display'; Name='Enable MSI Mode for NVIDIA GPU'; Impact='Low'; Rec=$false; Risk='Moderate'; Only='NVIDIA'; Tags=@('Reboot')
    Desc='Switches the graphics card from legacy line-based interrupts to Message Signaled Interrupts, which lowers interrupt latency and avoids IRQ sharing. Pascal GPUs support MSI. Re-apply after a clean driver install.'
    RegFn={ if ($script:SysInfo.GpuInstanceId) { RegV "HKLM:\SYSTEM\CurrentControlSet\Enum\$($script:SysInfo.GpuInstanceId)\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" 'MSISupported' 'DWord' 1 0 } } }

Add-Tweak @{ Id='gpu_transparency'; Cat='GPU & Display'; Name='Disable Transparency Effects'; Impact='Medium'; Rec=$true
    Desc='Removes the blur/acrylic effects from the taskbar, Start and windows. Less work for the Desktop Window Manager on the entry-level GT 1030, especially in borderless games.'
    Reg=@( (RegV 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' 'EnableTransparency' 'DWord' 0 1) ) }

Add-Tweak @{ Id='gpu_visualfx'; Cat='GPU & Display'; Name='Visual Effects: Best Performance'; Impact='Medium'; Rec=$true; Tags=@('Sign-out')
    Desc='Turns off window animations, fades, shadows and Aero Peek while keeping smooth fonts and thumbnails. Windows feels snappier and the GPU does less desktop work.'
    Reg=@( (RegV 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects' 'VisualFXSetting' 'DWord' 3 $null),
           (RegV 'HKCU:\Control Panel\Desktop' 'UserPreferencesMask' 'Binary' @(0x90,0x12,0x03,0x80,0x10,0x00,0x00,0x00) @(0x9E,0x1E,0x07,0x80,0x12,0x00,0x00,0x00)),
           (RegV 'HKCU:\Control Panel\Desktop\WindowMetrics' 'MinAnimate' 'String' '0' '1'),
           (RegV $ADV 'TaskbarAnimations' 'DWord' 0 1),
           (RegV $ADV 'ListviewAlphaSelect' 'DWord' 0 1),
           (RegV $ADV 'ListviewShadow' 'DWord' 0 1),
           (RegV 'HKCU:\Software\Microsoft\Windows\DWM' 'EnableAeroPeek' 'DWord' 0 1) ) }

Add-Tweak @{ Id='gpu_nvtelemetry'; Cat='GPU & Display'; Name='Disable NVIDIA Telemetry'; Impact='Low'; Rec=$true
    Desc='Stops the NVIDIA telemetry container and its scheduled reporting tasks. Your driver, control panel and game profiles keep working normally.'
    Svc=@( (SvcV 'NvTelemetryContainer' 'disabled' 'auto') )
    Tasks=@('\NvTmRep*', '\NvTmMon*') }

Add-Tweak @{ Id='gpu_wudrivers'; Cat='GPU & Display'; Name='Stop Windows Update Replacing Drivers'; Impact='Low'; Rec=$true
    Desc='Prevents Windows Update from silently swapping your NVIDIA driver for an older generic one (a common cause of sudden FPS drops). Update the GPU driver from nvidia.com instead.'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' 'ExcludeWUDriversInQualityUpdate' 'DWord' 1 $null) ) }

# ---------------------------------------------------------------- REGISTRY (scheduler / kernel)
Add-Tweak @{ Id='reg_mmcss_games'; Cat='Registry'; Name='Prioritize Games in the Multimedia Scheduler'; Impact='High'; Rec=$true
    Desc='Raises the MMCSS "Games" task profile to High scheduling category, CPU priority 6 and GPU priority 8, so game threads registered with MMCSS win against background work.'
    Reg=@( (RegV "$MMCSS\Tasks\Games" 'GPU Priority' 'DWord' 8 8),
           (RegV "$MMCSS\Tasks\Games" 'Priority' 'DWord' 6 2),
           (RegV "$MMCSS\Tasks\Games" 'Scheduling Category' 'String' 'High' 'Medium'),
           (RegV "$MMCSS\Tasks\Games" 'SFIO Priority' 'String' 'High' 'Normal') ) }

Add-Tweak @{ Id='reg_sysresp'; Cat='Registry'; Name='System Responsiveness for Gaming'; Impact='Medium'; Rec=$true
    Desc='Lowers the CPU share Windows reserves for background tasks during multimedia/gaming from 20% to the minimum of 10%, giving more of your 4 cores to the game.'
    Reg=@( (RegV $MMCSS 'SystemResponsiveness' 'DWord' 10 20) ) }

Add-Tweak @{ Id='reg_priosep'; Cat='Registry'; Name='Foreground Priority Boost (Win32PrioritySeparation)'; Impact='Medium'; Rec=$true
    Desc='Sets short, variable CPU time slices with maximum boost for the focused window (value 0x26). The game you are playing gets the CPU first - ideal for a 4-core / 4-thread CPU.'
    Reg=@( (RegV 'HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl' 'Win32PrioritySeparation' 'DWord' 38 2) ) }

Add-Tweak @{ Id='reg_timerres'; Cat='Registry'; Name='Global Timer Resolution Requests'; Impact='Medium'; Rec=$true; Tags=@('Reboot')
    Desc='Windows 11 ignores high-resolution timer requests from minimized or background processes. This restores the classic global behaviour so games and frame limiters get precise 0.5-1 ms timers.'
    Reg=@( (RegV 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel' 'GlobalTimerResolutionRequests' 'DWord' 1 $null) ) }

Add-Tweak @{ Id='reg_pagingexec'; Cat='Registry'; Name='Keep Kernel & Drivers in RAM'; Impact='Low'; Rec=$true; Tags=@('Reboot')
    Desc='With 32 GB of RAM there is no reason to page kernel code and drivers to disk. Setting DisablePagingExecutive keeps them in memory - especially helpful if Windows is on a hard drive.'
    Reg=@( (RegV $MEMMGMT 'DisablePagingExecutive' 'DWord' 1 0) ) }

Add-Tweak @{ Id='reg_svchost'; Cat='Registry'; Name='Group Service Host Processes (32 GB)'; Impact='Low'; Rec=$true; Tags=@('Reboot')
    Desc='Sets SvcHostSplitThresholdInKB to your installed RAM so Windows groups services into fewer svchost.exe processes - roughly 70 fewer processes and less scheduler overhead.'
    RegFn={ $kb = [int]([math]::Min(2147483647, [math]::Max(3670016, $script:SysInfo.RamBytes / 1KB))); RegV 'HKLM:\SYSTEM\CurrentControlSet\Control' 'SvcHostSplitThresholdInKB' 'DWord' $kb 3670016 } }

Add-Tweak @{ Id='reg_menudelay'; Cat='Registry'; Name='Instant Menus'; Impact='Low'; Rec=$true
    Desc='Removes the 400 ms delay before context sub-menus open (MenuShowDelay = 0). The desktop feels instantly responsive.'
    Reg=@( (RegV 'HKCU:\Control Panel\Desktop' 'MenuShowDelay' 'String' '0' '400') ) }

Add-Tweak @{ Id='reg_startupdelay'; Cat='Registry'; Name='Remove Startup App Delay'; Impact='Low'; Rec=$true
    Desc='Windows deliberately waits before launching startup apps. This removes that artificial delay so the desktop is usable sooner after boot.'
    Reg=@( (RegV 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize' 'StartupDelayInMSec' 'DWord' 0 $null) ) }

Add-Tweak @{ Id='reg_shutdown'; Cat='Registry'; Name='Faster Shutdown & Hung-App Detection'; Impact='Low'; Rec=$true
    Desc='Shortens how long Windows waits for frozen apps and services when shutting down or restarting (HungAppTimeout, WaitToKillAppTimeout, WaitToKillServiceTimeout). Apps still get a chance to save.'
    Reg=@( (RegV 'HKCU:\Control Panel\Desktop' 'HungAppTimeout' 'String' '2000' $null),
           (RegV 'HKCU:\Control Panel\Desktop' 'WaitToKillAppTimeout' 'String' '4000' $null),
           (RegV 'HKLM:\SYSTEM\CurrentControlSet\Control' 'WaitToKillServiceTimeout' 'String' '2000' '5000') ) }

# ---------------------------------------------------------------- MEMORY & STORAGE
Add-Tweak @{ Id='mem_compression'; Cat='Memory & Storage'; Name='Disable Memory Compression'; Impact='Medium'; Rec=$true; Tags=@('Reboot')
    Desc='Memory compression trades CPU time for RAM. You have 32 GB, so you never need it - turning it off returns those CPU cycles to your games.'
    Kind='SYSTEM'; Note='CMD  Disable-MMAgent -MemoryCompression'
    Test={ try { $m = Get-MMAgent -ErrorAction Stop; -not $m.MemoryCompression } catch { 'NA' } }
    Apply={ Disable-MMAgent -MemoryCompression -ErrorAction SilentlyContinue; $null }
    Revert={ param($c) Enable-MMAgent -MemoryCompression -ErrorAction SilentlyContinue } }

Add-Tweak @{ Id='mem_sysmain'; Cat='Memory & Storage'; Name='Disable SysMain (Superfetch)'; Impact='Medium'; Rec=$false; Tags=@('SSD')
    Desc='SysMain preloads apps into RAM. On an SSD it mostly causes background disk and CPU activity. If Windows is on a hard drive, keep it ON - Frenzy Tweaks recommends this only when your system drive is an SSD.'
    Svc=@( (SvcV 'SysMain' 'disabled' 'auto') ) }

Add-Tweak @{ Id='mem_search'; Cat='Memory & Storage'; Name='Disable Search Indexing'; Impact='Medium'; Rec=$false; Tags=@('Feature Breaking')
    Desc='The indexer crawls your 3.66 TB of files in the background, causing disk thrashing on hard drives. Start-menu app search still works, but searching file contents becomes slower.'
    Svc=@( (SvcV 'WSearch' 'disabled' 'delayed-auto') ) }

Add-Tweak @{ Id='sto_lastaccess'; Cat='Memory & Storage'; Name='Disable NTFS Last-Access Timestamps'; Impact='Low'; Rec=$true
    Desc='Stops NTFS from writing a timestamp every time a file is read. Games read thousands of files - this removes those extra disk writes.'
    Reg=@( (RegV 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' 'NtfsDisableLastAccessUpdate' 'DWord' -2147483647 -2147483646) )
    Test={ $v = (Get-RegValue 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' 'NtfsDisableLastAccessUpdate').Value; ($null -ne $v) -and (([int64]$v -band 1) -eq 1) } }

Add-Tweak @{ Id='sto_8dot3'; Cat='Memory & Storage'; Name='Disable 8.3 Short File Names'; Impact='Low'; Rec=$true
    Desc='Stops NTFS creating legacy DOS-style "PROGRA~1" names for every new file, which speeds up file creation in folders with many files (game installs, shader caches).'
    Reg=@( (RegV 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' 'NtfsDisable8dot3NameCreation' 'DWord' 1 2) ) }

# ---------------------------------------------------------------- NETWORK & PING
Add-Tweak @{ Id='net_nagle'; Cat='Network & Ping'; Name="Disable Nagle's Algorithm"; Impact='Medium'; Rec=$true
    Desc='Sends small TCP packets immediately instead of bundling them. Lowers latency in TCP-based online games (MMOs, League, many shooters'' lobbies).'
    RegFn={
        Get-ChildItem 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces' -ErrorAction SilentlyContinue | ForEach-Object {
            $p = Get-ItemProperty -LiteralPath $_.PSPath -ErrorAction SilentlyContinue
            $ip = "$($p.DhcpIPAddress) $(@($p.IPAddress) -join ' ')"
            if ($ip -match '\d+\.\d+\.\d+\.\d+' -and $ip -notmatch '^\s*0\.0\.0\.0\s*$') {
                $path = $_.PSPath -replace '^Microsoft\.PowerShell\.Core\\Registry::HKEY_LOCAL_MACHINE', 'HKLM:'
                RegV $path 'TcpAckFrequency' 'DWord' 1 $null
                RegV $path 'TCPNoDelay' 'DWord' 1 $null
            }
        } } }

Add-Tweak @{ Id='net_throttle'; Cat='Network & Ping'; Name='Disable Network Throttling'; Impact='Low'; Rec=$true
    Desc='Windows throttles non-multimedia network traffic while media plays. Setting NetworkThrottlingIndex to off removes that cap.'
    Reg=@( (RegV $MMCSS 'NetworkThrottlingIndex' 'DWord' -1 10) ) }

Add-Tweak @{ Id='net_nicpower'; Cat='Network & Ping'; Name='Disable Network Adapter Power Saving'; Impact='Low'; Rec=$true
    Desc='Stops Windows from turning off your network adapter to save power, which can cause lag spikes and brief disconnects.'
    Kind='SYSTEM'; Note='NET  "Allow the computer to turn off this device" = off on physical adapters'
    Test={
        $ok = $true; $n = 0
        Get-NetAdapter -Physical -ErrorAction SilentlyContinue | ForEach-Object {
            $pm = Get-NetAdapterPowerManagement -Name $_.Name -ErrorAction SilentlyContinue
            if ($pm -and "$($pm.AllowComputerToTurnOffDevice)" -ne 'Unsupported') { $n++; if ("$($pm.AllowComputerToTurnOffDevice)" -ne 'Disabled') { $ok = $false } }
        }
        if ($n -eq 0) { 'NA' } else { $ok } }
    Apply={
        Get-NetAdapter -Physical -ErrorAction SilentlyContinue | ForEach-Object {
            $pm = Get-NetAdapterPowerManagement -Name $_.Name -ErrorAction SilentlyContinue
            if ($pm -and "$($pm.AllowComputerToTurnOffDevice)" -ne 'Unsupported') { $pm.AllowComputerToTurnOffDevice = 'Disabled'; $pm | Set-NetAdapterPowerManagement -ErrorAction SilentlyContinue }
        }; $null }
    Revert={ param($c)
        Get-NetAdapter -Physical -ErrorAction SilentlyContinue | ForEach-Object {
            $pm = Get-NetAdapterPowerManagement -Name $_.Name -ErrorAction SilentlyContinue
            if ($pm -and "$($pm.AllowComputerToTurnOffDevice)" -ne 'Unsupported') { $pm.AllowComputerToTurnOffDevice = 'Enabled'; $pm | Set-NetAdapterPowerManagement -ErrorAction SilentlyContinue }
        } } }

$script:NicKeywords = @('*EEE', 'EEELinkAdvertisement', 'EnableGreenEthernet', 'GreenEthernet', 'AdvancedEEE', 'PowerSavingMode', '*InterruptModeration')
function Get-NicLatencyProps {
    foreach ($a in @(Get-NetAdapter -Physical -ErrorAction SilentlyContinue)) {
        foreach ($p in @(Get-NetAdapterAdvancedProperty -Name $a.Name -ErrorAction SilentlyContinue)) {
            if ($script:NicKeywords -contains $p.RegistryKeyword) {
                [pscustomobject]@{ Adapter = $a.Name; Keyword = $p.RegistryKeyword; Value = "$(@($p.RegistryValue)[0])" }
            }
        }
    }
}

Add-Tweak @{ Id='net_nicadv'; Cat='Network & Ping'; Name='NIC: Disable Green Ethernet & Interrupt Moderation'; Impact='Low'; Rec=$false; Tags=@('Brief disconnect')
    Desc='Turns off Energy-Efficient Ethernet (the link sleeps between packets and needs a moment to wake) and Interrupt Moderation (the NIC waits to batch packets before telling the CPU). Both trade a little latency and jitter for power or CPU savings. Only settings your adapter driver actually has are changed. The adapter restarts, so the connection drops for a few seconds.'
    Kind='NETWORK'; Note='NET  Adapter advanced properties: EEE / Green Ethernet / Power Saving Mode = 0, Interrupt Moderation = 0 (only where present)'
    Test={ $p = @(Get-NicLatencyProps); if ($p.Count -eq 0) { 'NA' } else { -not ($p | Where-Object { $_.Value -ne '0' }) } }
    Apply={
        $saved = @()
        foreach ($p in @(Get-NicLatencyProps)) {
            if ($p.Value -ne '0') {
                try { Set-NetAdapterAdvancedProperty -Name $p.Adapter -RegistryKeyword $p.Keyword -RegistryValue '0' -NoRestart -ErrorAction Stop; $saved += $p } catch { Write-Log "  nic fail $($p.Adapter) $($p.Keyword): $($_.Exception.Message)" }
            }
        }
        foreach ($n in @($saved | Select-Object -ExpandProperty Adapter -Unique)) { Restart-NetAdapter -Name $n -ErrorAction SilentlyContinue }
        @{ Items = $saved } }
    Revert={ param($c)
        if ($c -and $c.Items) {
            foreach ($i in @($c.Items)) { try { Set-NetAdapterAdvancedProperty -Name $i.Adapter -RegistryKeyword $i.Keyword -RegistryValue $i.Value -NoRestart -ErrorAction Stop } catch {} }
            foreach ($n in @(@($c.Items) | Select-Object -ExpandProperty Adapter -Unique)) { Restart-NetAdapter -Name $n -ErrorAction SilentlyContinue }
        } } }

Add-Tweak @{ Id='net_dosvc'; Cat='Network & Ping'; Name='Stop Peer-to-Peer Update Uploads'; Impact='Medium'; Rec=$true
    Desc='Delivery Optimization uploads Windows updates to other PCs over your internet connection in the background, which can spike your ping. Updates still download normally.'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization' 'DODownloadMode' 'DWord' 0 $null) ) }

Add-Tweak @{ Id='net_dns'; Cat='Network & Ping'; Name='Use Cloudflare DNS (1.1.1.1)'; Impact='Low'; Rec=$false
    Desc='Switches active adapters to Cloudflare''s fast DNS resolvers. Speeds up server lookups and launcher logins; does not change in-game ping. Reverting restores your previous DNS settings.'
    Kind='NETWORK'; Note='NET  IPv4 DNS = 1.1.1.1, 1.0.0.1 on connected adapters'
    Test={ $d = Get-DnsClientServerAddress -AddressFamily IPv4 -ErrorAction SilentlyContinue | Where-Object { $_.ServerAddresses -contains '1.1.1.1' }; [bool]$d }
    Apply={
        $saved = @()
        Get-NetAdapter -Physical -ErrorAction SilentlyContinue | Where-Object Status -eq 'Up' | ForEach-Object {
            $guid = $_.InterfaceGuid
            $static = (Get-RegValue "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$guid" 'NameServer').Value
            $saved += [pscustomobject]@{ Index = $_.ifIndex; Static = "$static" }
            Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ServerAddresses '1.1.1.1', '1.0.0.1' -ErrorAction SilentlyContinue
        }
        Clear-DnsClientCache -ErrorAction SilentlyContinue
        @{ Adapters = $saved } }
    Revert={ param($c)
        if ($c -and $c.Adapters) {
            foreach ($a in @($c.Adapters)) {
                if ([string]::IsNullOrWhiteSpace($a.Static)) { Set-DnsClientServerAddress -InterfaceIndex $a.Index -ResetServerAddresses -ErrorAction SilentlyContinue }
                else { Set-DnsClientServerAddress -InterfaceIndex $a.Index -ServerAddresses ($a.Static -split '[, ]+' | Where-Object { $_ }) -ErrorAction SilentlyContinue }
            }
        } else {
            Get-NetAdapter -Physical -ErrorAction SilentlyContinue | ForEach-Object { Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ResetServerAddresses -ErrorAction SilentlyContinue }
        }
        Clear-DnsClientCache -ErrorAction SilentlyContinue } }

# ---------------------------------------------------------------- DEBLOAT
Add-Tweak @{ Id='dbl_copilot'; Cat='Debloat'; Name='Disable Copilot'; Impact='Low'; Rec=$true
    Desc='Turns off Windows Copilot and hides its taskbar button so it never loads in the background.'
    Reg=@( (RegV 'HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot' 'TurnOffWindowsCopilot' 'DWord' 1 $null),
           (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot' 'TurnOffWindowsCopilot' 'DWord' 1 $null),
           (RegV $ADV 'ShowCopilotButton' 'DWord' 0 $null) ) }

Add-Tweak @{ Id='dbl_widgets'; Cat='Debloat'; Name='Disable Widgets / News & Interests'; Impact='Medium'; Rec=$true
    Desc='Removes the Widgets board (Windows 11) and News & Interests (Windows 10). They run a hidden Edge WebView in the background that uses 100-300 MB of RAM and CPU.'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Dsh' 'AllowNewsAndInterests' 'DWord' 0 $null),
           (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds' 'EnableFeeds' 'DWord' 0 $null) ) }

Add-Tweak @{ Id='dbl_bing'; Cat='Debloat'; Name='Remove Bing Web Results from Start Search'; Impact='Low'; Rec=$true
    Desc='Start-menu search stays local - faster results and no web queries sent to Bing every time you type.'
    Reg=@( (RegV 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search' 'BingSearchEnabled' 'DWord' 0 $null),
           (RegV 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' 'DisableSearchBoxSuggestions' 'DWord' 1 $null) ) }

Add-Tweak @{ Id='dbl_autoinstall'; Cat='Debloat'; Name='Block Auto-Installed Sponsored Apps'; Impact='Medium'; Rec=$true
    Desc='Stops Windows from silently installing promoted apps and games (Candy Crush, TikTok, etc.) after updates.'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' 'DisableWindowsConsumerFeatures' 'DWord' 1 $null),
           (RegV $CDM 'SilentInstalledAppsEnabled' 'DWord' 0 1),
           (RegV $CDM 'PreInstalledAppsEnabled' 'DWord' 0 1),
           (RegV $CDM 'OemPreInstalledAppsEnabled' 'DWord' 0 1) ) }

Add-Tweak @{ Id='dbl_startads'; Cat='Debloat'; Name='Remove Start Menu Suggestions & Tips'; Impact='Low'; Rec=$true
    Desc='Removes promoted apps in Start, "tips & tricks" pop-ups and the post-update welcome experience.'
    Reg=@( (RegV $CDM 'SystemPaneSuggestionsEnabled' 'DWord' 0 1),
           (RegV $CDM 'SubscribedContent-338388Enabled' 'DWord' 0 1),
           (RegV $CDM 'SubscribedContent-338389Enabled' 'DWord' 0 1),
           (RegV $CDM 'SubscribedContent-310093Enabled' 'DWord' 0 1),
           (RegV $CDM 'SoftLandingEnabled' 'DWord' 0 1),
           (RegV $ADV 'Start_IrisRecommendations' 'DWord' 0 $null) ) }

Add-Tweak @{ Id='dbl_settingsads'; Cat='Debloat'; Name='Remove Windows Settings Ads'; Impact='Low'; Rec=$true
    Desc='Removes promotional suggestions and ads from the Windows Settings app.'
    Reg=@( (RegV $CDM 'SubscribedContent-338393Enabled' 'DWord' 0 1),
           (RegV $CDM 'SubscribedContent-353694Enabled' 'DWord' 0 1),
           (RegV $CDM 'SubscribedContent-353696Enabled' 'DWord' 0 1) ) }

Add-Tweak @{ Id='dbl_lockads'; Cat='Debloat'; Name='Remove Lock Screen Ads & Fun Facts'; Impact='Low'; Rec=$true
    Desc='Removes "fun facts", tips and promotions printed on top of the lock-screen picture.'
    Reg=@( (RegV $CDM 'RotatingLockScreenOverlayEnabled' 'DWord' 0 1), (RegV $CDM 'SubscribedContent-338387Enabled' 'DWord' 0 1) ) }

Add-Tweak @{ Id='dbl_recall'; Cat='Debloat'; Name='Disable Recall Snapshots'; Impact='Low'; Rec=$true; Only='Win11'; Tags=@('Win11')
    Desc='Blocks the Windows Recall feature from taking screenshots of your activity (where present).'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI' 'DisableAIDataAnalysis' 'DWord' 1 $null),
           (RegV 'HKCU:\Software\Policies\Microsoft\Windows\WindowsAI' 'DisableAIDataAnalysis' 'DWord' 1 $null) ) }

Add-Tweak @{ Id='dbl_onedrive'; Cat='Debloat'; Name='Prevent OneDrive from Running'; Impact='Medium'; Rec=$false; Tags=@('Feature Breaking')
    Desc='Stops OneDrive from starting and syncing in the background (it can saturate your disk and upload bandwidth). Only use this if you don''t rely on OneDrive.'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive' 'DisableFileSyncNGSC' 'DWord' 1 $null) ) }

Add-Tweak @{ Id='dbl_apps_news'; Cat='Debloat'; Name='Remove News, Weather, Maps & Tips Apps'; Impact='Low'; Rec=$true; Tags=@('Not Reversible')
    Desc='Uninstalls Microsoft News, Weather, Maps, Get Started/Tips, Get Help and Feedback Hub. Any of them can be reinstalled from the Microsoft Store.'
    Appx=@('Microsoft.BingNews','Microsoft.BingWeather','Microsoft.WindowsMaps','Microsoft.Getstarted','Microsoft.GetHelp','Microsoft.WindowsFeedbackHub') }

Add-Tweak @{ Id='dbl_apps_office'; Cat='Debloat'; Name='Remove Office Hub, To Do, Clipchamp & Teams'; Impact='Low'; Rec=$true; Tags=@('Not Reversible')
    Desc='Uninstalls the Microsoft 365 hub, To Do, Power Automate, Clipchamp, Teams (personal), Skype, People and the Copilot app. Reinstall from the Store if needed.'
    Appx=@('Microsoft.MicrosoftOfficeHub','Microsoft.Todos','Microsoft.PowerAutomateDesktop','Clipchamp.Clipchamp','MicrosoftTeams','MSTeams','Microsoft.SkypeApp','Microsoft.People','Microsoft.Copilot') }

Add-Tweak @{ Id='dbl_apps_sponsored'; Cat='Debloat'; Name='Remove Sponsored Games & Apps'; Impact='Low'; Rec=$true; Tags=@('Not Reversible')
    Desc='Uninstalls pre-installed promos such as Candy Crush, Solitaire Collection, TikTok, Facebook, Instagram, Disney+ and Prime Video. Your own Steam / Xbox games are not touched.'
    Appx=@('king.com.*','*CandyCrush*','Microsoft.MicrosoftSolitaireCollection','BytedancePte.Ltd.TikTok','Facebook.*','Disney.*','AmazonVideo.PrimeVideo') }

Add-Tweak @{ Id='dbl_apps_legacy'; Cat='Debloat'; Name='Remove Cortana, 3D Viewer & Mixed Reality'; Impact='Low'; Rec=$true; Tags=@('Not Reversible')
    Desc='Uninstalls Cortana, 3D Viewer, Mixed Reality Portal and Microsoft Wallet - leftovers nobody uses on a gaming desktop.'
    Appx=@('Microsoft.549981C3F5F10','Microsoft.Microsoft3DViewer','Microsoft.MixedReality.Portal','Microsoft.Wallet') }

Add-Tweak @{ Id='dbl_apps_thirdparty'; Cat='Debloat'; Name='Remove Pre-installed Third-Party Promo Apps'; Impact='Low'; Rec=$false; Tags=@('Not Reversible')
    Desc='Uninstalls promo apps some PCs ship with: Netflix, Spotify, Twitter, LinkedIn, Plex, Duolingo, PicsArt, Polarr, Wunderlist, WinZip, Keeper, Eclipse Manager and the Gameloft / Disney / FarmVille style game demos. Spotify and Netflix are removed too, so skip this if you use their Store apps.'
    Appx=@('4DF9E0F8.Netflix','2FE3CB00.PicsArt-PhotoStudio','46928bounde.EclipseManager','613EBCEA.PolarrPhotoEditorAcademicEdition','6Wunderkinder.Wunderlist','7EE7776C.LinkedInforWindows','828B5831.HiddenCityMysteryofShadows','A278AB0D.DisneyMagicKingdoms','A278AB0D.MarchofEmpires','ActiproSoftwareLLC.562882FEEB491','CAF9E577.Plex','D52A8D61.FarmVille2CountryEscape','D5EA27B7.Duolingo-LearnLanguagesforFree','GAMELOFTSA.Asphalt8Airborne','KeeperSecurityInc.Keeper','king.com.BubbleWitch3Saga','SpotifyAB.SpotifyMusic','Twitter.Twitter','WinZipComputing.WinZipUniversal') }

Add-Tweak @{ Id='dbl_apps_extras'; Cat='Debloat'; Name='Remove Dev Home, Journal, Family & Other Extras'; Impact='Low'; Rec=$false; Tags=@('Not Reversible')
    Desc='Uninstalls Dev Home, Journal, Microsoft Family, Network Speed Test, Power BI, Reading List, Whiteboard, Sway, 3D Builder, the new Outlook, the Store Remote Desktop app, the Copilot provider and the Bing Finance / Sports / Food / Health / Translator / Travel apps. Skip it if you use the new Outlook or the Store Remote Desktop app.'
    Appx=@('Microsoft.Windows.DevHome','Microsoft.MicrosoftJournal','MicrosoftCorporationII.MicrosoftFamily','Microsoft.NetworkSpeedTest','Microsoft.MicrosoftPowerBIForWindows','Microsoft.ReadingList','Microsoft.Whiteboard','Microsoft.Office.Sway','Microsoft.3DBuilder','Microsoft.OutlookForWindows','Microsoft.RemoteDesktop','Microsoft.Windows.Ai.Copilot.Provider','Microsoft.BingFinance','Microsoft.BingSports','Microsoft.BingFoodAndDrink','Microsoft.BingHealthAndFitness','Microsoft.BingTranslator','Microsoft.BingTravel') }

Add-Tweak @{ Id='dbl_apps_media'; Cat='Debloat'; Name='Remove Phone Link, Groove, Movies & Messaging'; Impact='Low'; Rec=$false; Tags=@('Feature Breaking','Not Reversible')
    Desc='Uninstalls Phone Link (Your Phone), Groove Music, Movies & TV, Messaging, Mobile Plans (OneConnect), Print 3D and the OneNote app stub. Phone Link stops working, so skip this if you link your phone to this PC.'
    Appx=@('Microsoft.YourPhone','Microsoft.ZuneMusic','Microsoft.ZuneVideo','Microsoft.Messaging','Microsoft.OneConnect','Microsoft.Print3D','Microsoft.Office.OneNote') }

Add-Tweak @{ Id='dbl_apps_xboxoverlay'; Cat='Debloat'; Name='Remove Xbox Game Bar Overlay Apps'; Impact='Low'; Rec=$false; Tags=@('Feature Breaking','Not Reversible')
    Desc='Uninstalls the Xbox Game Bar overlay components (gaming overlay, game overlay and speech-to-text overlay). You lose Win+G, the in-game overlay and Game Bar screen capture. The Xbox app, Game Pass and Xbox sign-in are not touched.'
    Appx=@('Microsoft.XboxGamingOverlay','Microsoft.XboxGameOverlay','Microsoft.XboxSpeechToTextOverlay') }

Add-Tweak @{ Id='dbl_apps_utils'; Cat='Debloat'; Name='Remove Everyday Utility Apps (Sticky Notes, Paint, Camera...)'; Impact='Low'; Rec=$false; Tags=@('Feature Breaking','Not Reversible')
    Desc='Uninstalls Sticky Notes, Paint, Alarms & Clock, Sound Recorder and Camera. These are useful tools, so this is only for people who never use them. Xbox sign-in components are deliberately left alone.'
    Appx=@('Microsoft.MicrosoftStickyNotes','Microsoft.MSPaint','Microsoft.WindowsAlarms','Microsoft.WindowsSoundRecorder','Microsoft.WindowsCamera') }

Add-Tweak @{ Id='dbl_apps_mail'; Cat='Debloat'; Name='Remove Mail & Calendar'; Impact='Low'; Rec=$false; Tags=@('Feature Breaking','Not Reversible')
    Desc='Uninstalls the Mail and Calendar apps. Skip it if you read email or check your calendar in them.'
    Appx=@('microsoft.windowscommunicationsapps') }

Add-Tweak @{ Id='dbl_apps_xboxsuite'; Cat='Debloat'; Name='Remove Xbox App & Gaming App'; Impact='Low'; Rec=$false; Tags=@('Feature Breaking','Not Reversible')
    Desc='Uninstalls the Xbox app and the Gaming App. You can no longer browse, install or launch Game Pass PC games from them. Skip it if you use Game Pass or the Microsoft Store games.'
    Appx=@('Microsoft.XboxApp','Microsoft.GamingApp') }

Add-Tweak @{ Id='dbl_apps_quickassist'; Cat='Debloat'; Name='Remove Quick Assist'; Impact='Low'; Rec=$false; Tags=@('Feature Breaking','Not Reversible')
    Desc='Uninstalls Quick Assist, the built-in remote help tool. Nobody can screen-share into this PC with it, and you cannot use it to help others.'
    Appx=@('MicrosoftCorporationII.QuickAssist') }

Add-Tweak @{ Id='dbl_apps_bingsearch'; Cat='Debloat'; Name='Remove Bing Search App'; Impact='Low'; Rec=$false; Tags=@('Not Reversible')
    Desc='Uninstalls the Bing Search app component that powers web results in Windows search. Pairs well with Remove Bing Web Results from Start Search.'
    Appx=@('Microsoft.BingSearch') }

Add-Tweak @{ Id='dbl_services'; Cat='Debloat'; Name='Disable Unused Services'; Impact='Low'; Rec=$true
    Desc='Disables Fax, Retail Demo, Downloaded Maps Manager, Remote Registry, Windows Media Player network sharing and the Insider service - none are needed on a gaming PC.'
    Svc=@( (SvcV 'Fax' 'disabled' 'demand'), (SvcV 'RetailDemo' 'disabled' 'demand'), (SvcV 'MapsBroker' 'disabled' 'delayed-auto'),
           (SvcV 'RemoteRegistry' 'disabled' 'disabled'), (SvcV 'WMPNetworkSvc' 'disabled' 'demand'), (SvcV 'wisvc' 'disabled' 'demand') ) }

Add-Tweak @{ Id='dbl_xbox'; Cat='Debloat'; Name='Disable Xbox Live Services'; Impact='Low'; Rec=$false; Tags=@('Feature Breaking')
    Desc='Turns off Xbox Live auth, cloud saves and networking services. Only apply this if you do NOT use the Xbox app, Game Pass or Microsoft Store games. Controllers keep working.'
    Svc=@( (SvcV 'XblAuthManager' 'disabled' 'demand'), (SvcV 'XblGameSave' 'disabled' 'demand'), (SvcV 'XboxNetApiSvc' 'disabled' 'demand') ) }

Add-Tweak @{ Id='dbl_spooler'; Cat='Debloat'; Name='Disable Print Spooler'; Impact='Low'; Rec=$false; Tags=@('Feature Breaking')
    Desc='If you have no printer, the Print Spooler is wasted RAM and a known attack surface. Printing (including "Print to PDF") stops working until reverted.'
    Svc=@( (SvcV 'Spooler' 'disabled' 'auto') ) }

# ---------------------------------------------------------------- PRIVACY & TELEMETRY
Add-Tweak @{ Id='prv_telemetry'; Cat='Privacy'; Name='Minimize Windows Telemetry'; Impact='Medium'; Rec=$true
    Desc='Sets diagnostic data to the lowest level your edition allows and stops feedback prompts. Less background data collection and uploading.'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' 'AllowTelemetry' 'DWord' 0 $null),
           (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' 'DoNotShowFeedbackNotifications' 'DWord' 1 $null),
           (RegV 'HKCU:\Software\Microsoft\Siuf\Rules' 'NumberOfSIUFInPeriod' 'DWord' 0 $null) ) }

Add-Tweak @{ Id='prv_diagtrack'; Cat='Privacy'; Name='Disable Telemetry Services (DiagTrack)'; Impact='Medium'; Rec=$true
    Desc='Disables the Connected User Experiences and Telemetry service and the WAP push service that feeds it. These periodically wake up, scan the system and upload data.'
    Svc=@( (SvcV 'DiagTrack' 'disabled' 'auto'), (SvcV 'dmwappushservice' 'disabled' 'demand') ) }

Add-Tweak @{ Id='prv_tasks'; Cat='Privacy'; Name='Disable Telemetry Scheduled Tasks'; Impact='Medium'; Rec=$true
    Desc='Disables the Compatibility Appraiser, Customer Experience Improvement Program and disk-diagnostic tasks. The Appraiser in particular can spike CPU and disk for minutes - sometimes mid-game.'
    Tasks=@('\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser',
            '\Microsoft\Windows\Application Experience\ProgramDataUpdater',
            '\Microsoft\Windows\Customer Experience Improvement Program\Consolidator',
            '\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip',
            '\Microsoft\Windows\Autochk\Proxy',
            '\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector',
            '\Microsoft\Windows\Feedback\Siuf\DmClient',
            '\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload') }

Add-Tweak @{ Id='prv_adid'; Cat='Privacy'; Name='Disable Advertising ID'; Impact='Low'; Rec=$true
    Desc='Stops apps from using your advertising ID to track you across apps for personalized ads.'
    Reg=@( (RegV 'HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' 'Enabled' 'DWord' 0 $null),
           (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo' 'DisabledByGroupPolicy' 'DWord' 1 $null) ) }

Add-Tweak @{ Id='prv_tailored'; Cat='Privacy'; Name='Disable Tailored Experiences'; Impact='Low'; Rec=$true
    Desc='Stops Microsoft using your diagnostic data to show personalized tips, ads and recommendations.'
    Reg=@( (RegV 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy' 'TailoredExperiencesWithDiagnosticDataEnabled' 'DWord' 0 $null),
           (RegV 'HKCU:\Software\Policies\Microsoft\Windows\CloudContent' 'DisableTailoredExperiencesWithDiagnosticData' 'DWord' 1 $null) ) }

Add-Tweak @{ Id='prv_activity'; Cat='Privacy'; Name='Disable Activity History'; Impact='Low'; Rec=$true
    Desc='Stops Windows from recording and uploading a timeline of the apps and files you open.'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' 'EnableActivityFeed' 'DWord' 0 $null),
           (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' 'PublishUserActivities' 'DWord' 0 $null),
           (RegV 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' 'UploadUserActivities' 'DWord' 0 $null) ) }

Add-Tweak @{ Id='prv_wer'; Cat='Privacy'; Name='Disable Windows Error Reporting'; Impact='Low'; Rec=$true
    Desc='Stops crash-dump collection and upload after an app crashes - which otherwise eats CPU and disk right after a game crash.'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting' 'Disabled' 'DWord' 1 $null) )
    Svc=@( (SvcV 'WerSvc' 'disabled' 'demand') ) }

Add-Tweak @{ Id='prv_inking'; Cat='Privacy'; Name='Disable Typing & Inking Data Collection'; Impact='Low'; Rec=$true
    Desc='Stops Windows collecting your typing and handwriting patterns and contacts to "improve" the keyboard dictionary.'
    Reg=@( (RegV 'HKCU:\Software\Microsoft\InputPersonalization' 'RestrictImplicitInkCollection' 'DWord' 1 0),
           (RegV 'HKCU:\Software\Microsoft\InputPersonalization' 'RestrictImplicitTextCollection' 'DWord' 1 0),
           (RegV 'HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore' 'HarvestContacts' 'DWord' 0 1),
           (RegV 'HKCU:\Software\Microsoft\Personalization\Settings' 'AcceptedPrivacyPolicy' 'DWord' 0 1) ) }

Add-Tweak @{ Id='prv_remote'; Cat='Privacy'; Name='Disable Remote Assistance'; Impact='Low'; Rec=$true
    Desc='Closes the Remote Assistance invitation feature - a favourite of tech-support scammers. Remote Desktop and Quick Assist are not affected.'
    Reg=@( (RegV 'HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance' 'fAllowToGetHelp' 'DWord' 0 1) ) }

Add-Tweak @{ Id='prv_location'; Cat='Privacy'; Name='Disable Location Services'; Impact='Low'; Rec=$false; Tags=@('Feature Breaking')
    Desc='Turns off location access for all apps. Weather, Maps and "Find my device" will no longer know where you are.'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location' 'Value' 'String' 'Deny' 'Allow') ) }

# ---------------------------------------------------------------- QUALITY OF LIFE
Add-Tweak @{ Id='qol_stickykeys'; Cat='Quality of Life'; Name='Disable Sticky / Filter / Toggle Keys Pop-ups'; Impact='Low'; Rec=$true
    Desc='Pressing Shift five times in a game will no longer minimize it to ask about Sticky Keys. The accessibility features themselves still work from Settings.'
    Reg=@( (RegV 'HKCU:\Control Panel\Accessibility\StickyKeys' 'Flags' 'String' '506' '510'),
           (RegV 'HKCU:\Control Panel\Accessibility\ToggleKeys' 'Flags' 'String' '58' '62'),
           (RegV 'HKCU:\Control Panel\Accessibility\Keyboard Response' 'Flags' 'String' '122' '126') ) }

Add-Tweak @{ Id='qol_endtask'; Cat='Quality of Life'; Name='"End Task" in Taskbar Right-Click'; Impact='Low'; Rec=$true; Only='Win11'; Tags=@('Win11')
    Desc='Adds End Task to the taskbar right-click menu so you can kill a frozen game without opening Task Manager.'
    Reg=@( (RegV "$ADV\TaskbarDeveloperSettings" 'TaskbarEndTask' 'DWord' 1 $null) ) }

Add-Tweak @{ Id='qol_classicmenu'; Cat='Quality of Life'; Name='Classic Right-Click Menu'; Impact='Low'; Rec=$false; Only='Win11'; Tags=@('Win11')
    Desc='Brings back the full Windows 10 style context menu, which also opens faster than the new one. Explorer restarts to apply.'
    Kind='REGISTRY'; Note='REG  HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32 (Default) = ""'
    Test={ Test-Path -LiteralPath 'HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32' }
    Apply={ New-Item -Path 'HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32' -Value '' -Force | Out-Null; Restart-Explorer; $null }
    Revert={ param($c) Remove-Item -LiteralPath 'HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}' -Recurse -Force -ErrorAction SilentlyContinue; Restart-Explorer } }

Add-Tweak @{ Id='qol_fileext'; Cat='Quality of Life'; Name='Show File Extensions'; Impact='Low'; Rec=$true
    Desc='Shows ".exe", ".zip" etc. in File Explorer - useful for modding games and spotting disguised malware.'
    Reg=@( (RegV $ADV 'HideFileExt' 'DWord' 0 1) ) }

Add-Tweak @{ Id='qol_thispc'; Cat='Quality of Life'; Name='Open File Explorer to This PC'; Impact='Low'; Rec=$false
    Desc='File Explorer opens straight to your drives instead of Home / Quick Access, which is faster when you have several large drives.'
    Reg=@( (RegV $ADV 'LaunchTo' 'DWord' 1 $null) ) }

Add-Tweak @{ Id='qol_verbose'; Cat='Quality of Life'; Name='Show Detailed Boot & Shutdown Status'; Impact='Low'; Rec=$false
    Desc='Displays what Windows is doing during startup and shutdown instead of a spinning circle. Helps spot slow drivers or services.'
    Reg=@( (RegV 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' 'VerboseStatus' 'DWord' 1 $null) ) }

# ---------------------------------------------------------------- ADVANCED (security trade-offs)
Add-Tweak @{ Id='adv_vbs'; Cat='Advanced'; Name='Disable Memory Integrity (VBS / HVCI)'; Impact='High'; Rec=$false; Risk='Risky'; Tags=@('Security Risk','Reboot')
    Desc='Your i5-6500 (6th gen) lacks the MBEC hardware feature, so Memory Integrity is emulated in software and can cost 5-15% FPS. Disabling it is a real gain but lowers protection against kernel-level malware.'
    Reg=@( (RegV 'HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity' 'Enabled' 'DWord' 0 $null),
           (RegV 'HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard' 'EnableVirtualizationBasedSecurity' 'DWord' 0 $null) ) }

Add-Tweak @{ Id='adv_hypervisor'; Cat='Advanced'; Name='Turn Off the Hyper-V Hypervisor at Boot'; Impact='Medium'; Rec=$false; Risk='Moderate'; Tags=@('Feature Breaking','Reboot')
    Desc='When the Windows hypervisor is running, the whole OS (including your game) runs on top of it, which adds a small CPU and memory-access cost even with Memory Integrity off. Switching it off removes that layer. WSL2, Docker, Hyper-V VMs, Windows Sandbox and Android subsystems stop working until reverted. Pairs well with Disable Memory Integrity.'
    Kind='BOOT'; Note='CMD  bcdedit /set hypervisorlaunchtype off'
    Test={ $o = (& bcdedit.exe /enum '{current}') | Out-String; $o -match 'hypervisorlaunchtype\s+Off' }
    Apply={ $o = (& bcdedit.exe /enum '{current}') | Out-String; $was = $null; if ($o -match 'hypervisorlaunchtype\s+(\w+)') { $was = $Matches[1] }; & bcdedit.exe /set hypervisorlaunchtype off 2>$null | Out-Null; @{ Was = $was } }
    Revert={ param($c) if ($c -and $c.Was) { & bcdedit.exe /set hypervisorlaunchtype $c.Was 2>$null | Out-Null } else { & bcdedit.exe /deletevalue hypervisorlaunchtype 2>$null | Out-Null } } }

Add-Tweak @{ Id='adv_spectre'; Cat='Advanced'; Name='Disable Spectre & Meltdown Mitigations'; Impact='High'; Rec=$false; Risk='Risky'; Tags=@('Security Risk','Reboot')
    Desc='Skylake CPUs pay one of the highest costs for these CPU-bug patches (system calls, disk and network I/O). Turning them off can noticeably help frame times, but exposes the PC to those attacks (e.g. via malicious websites).'
    Reg=@( (RegV $MEMMGMT 'FeatureSettingsOverride' 'DWord' 3 $null), (RegV $MEMMGMT 'FeatureSettingsOverrideMask' 'DWord' 3 $null) ) }

# ================================================================ PC SCANNER
function Format-Bytes([double]$b) {
    if ($b -ge 1TB) { return ('{0:N2} TB' -f ($b / 1TB)) }
    if ($b -ge 1GB) { return ('{0:N0} GB' -f ($b / 1GB)) }
    if ($b -ge 1MB) { return ('{0:N0} MB' -f ($b / 1MB)) }
    return ('{0:N0} KB' -f ($b / 1KB))
}

function Get-SystemInfo {
    $i = [ordered]@{}
    # ---- CPU
    $cpu = Get-CimInstance Win32_Processor -ErrorAction SilentlyContinue | Select-Object -First 1
    $i.CpuName    = if ($cpu) { ($cpu.Name -replace '\s+', ' ').Trim() } else { 'Unknown CPU' }
    $i.CpuCores   = if ($cpu) { $cpu.NumberOfCores } else { 0 }
    $i.CpuThreads = if ($cpu) { $cpu.NumberOfLogicalProcessors } else { 0 }
    $i.CpuClock   = if ($cpu) { $cpu.MaxClockSpeed } else { 0 }
    $i.CpuL3      = if ($cpu -and $cpu.L3CacheSize) { '{0} MB' -f [math]::Round($cpu.L3CacheSize / 1024, 0) } else { '-' }
    $i.CpuSocket  = if ($cpu) { $cpu.SocketDesignation } else { '-' }

    # ---- GPU
    $gpus = @(Get-CimInstance Win32_VideoController -ErrorAction SilentlyContinue | Where-Object { $_.Name -notmatch 'Basic Display|Remote|Virtual|Meta' })
    $gpu  = $gpus | Sort-Object { if ($_.Name -match 'NVIDIA|Radeon|Arc') { 0 } else { 1 } } | Select-Object -First 1
    $i.GpuName   = if ($gpu) { $gpu.Name } else { 'Unknown GPU' }
    $i.GpuDriver = if ($gpu) { $gpu.DriverVersion } else { '-' }
    $i.GpuDriverDate = $null
    if ($gpu -and $gpu.DriverDate) { $i.GpuDriverDate = $gpu.DriverDate }
    if ($gpu -and $gpu.Name -match 'NVIDIA' -and $gpu.DriverVersion) {
        $d = ($gpu.DriverVersion -replace '\.', '')
        if ($d.Length -ge 5) { $n = $d.Substring($d.Length - 5); $i.GpuDriver = '{0}.{1}  ({2})' -f $n.Substring(0, 3), $n.Substring(3), $gpu.DriverVersion }
    }
    $i.GpuVram = '-'
    try {
        Get-ChildItem 'HKLM:\SYSTEM\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}' -ErrorAction SilentlyContinue |
            Where-Object { $_.PSChildName -match '^\d{4}$' } | ForEach-Object {
                $p = Get-ItemProperty -LiteralPath $_.PSPath -ErrorAction SilentlyContinue
                if ($p -and $p.DriverDesc -eq $i.GpuName) {
                    $q = $p.'HardwareInformation.qwMemorySize'
                    if (-not $q) { $q = $p.'HardwareInformation.MemorySize'; if ($q -is [byte[]]) { $q = [BitConverter]::ToUInt32($q, 0) } }
                    if ($q) { $i.GpuVram = Format-Bytes ([double]$q) }
                }
            }
    } catch {}
    if ($i.GpuVram -eq '-' -and $gpu -and $gpu.AdapterRAM) { $i.GpuVram = Format-Bytes ([double][uint32]$gpu.AdapterRAM) }
    $i.ResX = if ($gpu) { $gpu.CurrentHorizontalResolution } else { $null }
    $i.ResY = if ($gpu) { $gpu.CurrentVerticalResolution } else { $null }
    $i.Refresh = if ($gpu) { $gpu.CurrentRefreshRate } else { $null }
    $i.GpuInstanceId = $null
    try {
        $pnp = Get-PnpDevice -Class Display -PresentOnly -ErrorAction SilentlyContinue | Where-Object { $_.FriendlyName -match 'NVIDIA' } | Select-Object -First 1
        if ($pnp) { $i.GpuInstanceId = $pnp.InstanceId }
    } catch {}

    # ---- RAM
    $mods = @(Get-CimInstance Win32_PhysicalMemory -ErrorAction SilentlyContinue)
    $cs   = Get-CimInstance Win32_ComputerSystem -ErrorAction SilentlyContinue
    $i.RamBytes  = if ($cs) { [double]$cs.TotalPhysicalMemory } else { 0 }
    $installed   = ($mods | Measure-Object -Property Capacity -Sum).Sum
    $i.RamTotal  = if ($installed) { Format-Bytes ([double]$installed) } else { Format-Bytes $i.RamBytes }
    $i.RamSticks = $mods.Count
    $speed = ($mods | Select-Object -First 1)
    $i.RamSpeed  = if ($speed) { if ($speed.ConfiguredClockSpeed) { "$($speed.ConfiguredClockSpeed) MT/s" } elseif ($speed.Speed) { "$($speed.Speed) MT/s" } else { '-' } } else { '-' }
    $i.RamType   = if ($speed -and $speed.SMBIOSMemoryType -eq 26) { 'DDR4' } elseif ($speed -and $speed.SMBIOSMemoryType -eq 34) { 'DDR5' } elseif ($speed -and $speed.SMBIOSMemoryType -eq 24) { 'DDR3' } else { 'DDR4' }
    $i.RamMaker  = if ($speed -and $speed.Manufacturer) { "$($speed.Manufacturer)".Trim() } else { '-' }
    $slots = (Get-CimInstance Win32_PhysicalMemoryArray -ErrorAction SilentlyContinue | Measure-Object -Property MemoryDevices -Sum).Sum
    $i.RamSlots  = if ($slots) { $slots } else { '-' }
    $i.RamChannel = if ($mods.Count -ge 2) { 'Dual channel' } elseif ($mods.Count -eq 1) { 'Single channel' } else { '-' }

    # ---- Storage
    $i.Disks = @()
    $total = 0
    try {
        foreach ($d in @(Get-PhysicalDisk -ErrorAction Stop)) {
            $type = "$($d.MediaType)"
            if ("$($d.BusType)" -eq 'NVMe') { $type = 'NVMe SSD' }
            elseif ($type -eq 'Unspecified' -and $d.SpindleSpeed -eq 0) { $type = 'SSD' }
            elseif ($type -eq 'Unspecified') { $type = 'Disk' }
            $total += [double]$d.Size
            $i.Disks += [pscustomobject]@{ Number = "$($d.DeviceId)"; Name = "$($d.FriendlyName)".Trim(); Type = $type; Size = Format-Bytes ([double]$d.Size); Bus = "$($d.BusType)" }
        }
    } catch {
        foreach ($d in @(Get-CimInstance Win32_DiskDrive -ErrorAction SilentlyContinue)) {
            $total += [double]$d.Size
            $i.Disks += [pscustomobject]@{ Number = "$($d.Index)"; Name = $d.Model; Type = 'Disk'; Size = Format-Bytes ([double]$d.Size); Bus = $d.InterfaceType }
        }
    }
    $i.StorageTotal = Format-Bytes $total
    $i.SystemDiskType = 'Unknown'
    try {
        $sysLetter = $env:SystemDrive.TrimEnd(':')
        $num = (Get-Partition -DriveLetter $sysLetter -ErrorAction Stop | Select-Object -First 1).DiskNumber
        $sd = $i.Disks | Where-Object { $_.Number -eq "$num" } | Select-Object -First 1
        if ($sd) { $i.SystemDiskType = $sd.Type; $i.SystemDiskName = $sd.Name }
    } catch {}
    $i.SystemIsSSD = ($i.SystemDiskType -match 'SSD')
    $i.SystemIsHDD = ($i.SystemDiskType -eq 'HDD')
    $i.Volumes = @(Get-CimInstance Win32_LogicalDisk -Filter 'DriveType=3' -ErrorAction SilentlyContinue | ForEach-Object {
        [pscustomobject]@{ Letter = $_.DeviceID; Label = $_.VolumeName; Size = [double]$_.Size; Free = [double]$_.FreeSpace }
    })

    # ---- Board / BIOS
    $bb = Get-CimInstance Win32_BaseBoard -ErrorAction SilentlyContinue
    $bios = Get-CimInstance Win32_BIOS -ErrorAction SilentlyContinue
    $i.Board = if ($bb) { ("$($bb.Manufacturer) $($bb.Product)").Trim() } else { '-' }
    $i.Bios  = if ($bios) { "$($bios.SMBIOSBIOSVersion)" } else { '-' }

    # ---- OS
    $os = Get-CimInstance Win32_OperatingSystem -ErrorAction SilentlyContinue
    $cv = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
    $i.Build   = [int]((Get-RegValue $cv 'CurrentBuildNumber').Value)
    $i.UBR     = (Get-RegValue $cv 'UBR').Value
    $i.OsName  = if ($os) { $os.Caption -replace 'Microsoft ', '' } else { 'Windows' }
    if ($i.Build -ge 22000 -and $i.OsName -match 'Windows 10') { $i.OsName = $i.OsName -replace 'Windows 10', 'Windows 11' }
    $i.OsVer   = (Get-RegValue $cv 'DisplayVersion').Value
    if (-not $i.OsVer) { $i.OsVer = (Get-RegValue $cv 'ReleaseId').Value }
    $i.Uptime  = if ($os) { $ts = (Get-Date) - $os.LastBootUpTime; '{0}d {1}h {2}m' -f $ts.Days, $ts.Hours, $ts.Minutes } else { '-' }
    $i.Computer = $env:COMPUTERNAME

    # ---- State checks
    $i.PowerPlan = '-'
    try { $o = (& powercfg.exe /getactivescheme) | Out-String; if ($o -match '\((.+)\)') { $i.PowerPlan = $Matches[1] } } catch {}
    $i.HvciOn = $false
    try {
        $dg = Get-CimInstance -Namespace root\Microsoft\Windows\DeviceGuard -ClassName Win32_DeviceGuard -ErrorAction Stop
        $i.HvciOn = (@($dg.SecurityServicesRunning) -contains 2)
    } catch {}
    $i.StartupCount = @(Get-CimInstance Win32_StartupCommand -ErrorAction SilentlyContinue).Count
    $i.ProcCount = @(Get-Process -ErrorAction SilentlyContinue).Count

    # ---- profile match
    $i.Match = ($i.CpuName -match 'i5-6500') -and ($i.GpuName -match '1030') -and ($i.RamBytes -gt 30GB)
    return [pscustomobject]$i
}

function Get-HealthChecks {
    $s = $script:SysInfo
    $c = @()
    $c += if ($s.HvciOn) { @{ Ok = $false; Title = 'Memory Integrity (HVCI) is ON'; Text = 'Your 6th-gen CPU has to emulate it in software (no MBEC). It can cost 5-15% FPS. See Optimizations > Advanced.' } }
          else { @{ Ok = $true; Title = 'Memory Integrity is off'; Text = 'No virtualization-based security overhead on your Skylake CPU.' } }
    $c += if ($s.SystemIsHDD) { @{ Ok = $false; Title = 'Windows is installed on a hard drive'; Text = 'An SSD is the single biggest upgrade for boot, load times and stutter on this PC. Even a budget 500 GB SATA SSD makes a huge difference.' } }
          elseif ($s.SystemIsSSD) { @{ Ok = $true; Title = "Windows is on an $($s.SystemDiskType)"; Text = 'Fast system drive - good for load times and stutter-free streaming.' } }
          else { @{ Ok = $true; Title = 'System drive type unknown'; Text = 'Could not determine whether Windows is on an SSD or HDD.' } }
    $c += if ($s.RamSticks -eq 1) { @{ Ok = $false; Title = 'RAM is running in single channel'; Text = 'One stick halves memory bandwidth. Two matched sticks (dual channel) give the i5-6500 noticeably better minimum FPS.' } }
          else { @{ Ok = $true; Title = "$($s.RamTotal) $($s.RamType) - $($s.RamChannel)"; Text = "Running at $($s.RamSpeed). Plenty of memory for any game this GPU can run." } }
    $pp = "$($s.PowerPlan)"
    $c += if ($pp -match 'Ultimate|High|Frenzy') { @{ Ok = $true; Title = "Power plan: $pp"; Text = 'CPU is allowed to run at full speed.' } }
          else { @{ Ok = $false; Title = "Power plan: $pp"; Text = 'Balanced/power-saver plans down-clock the CPU between frames. Apply the Frenzy Tweaks Ultimate Performance plan.' } }
    if ($s.GpuDriverDate) {
        $age = ((Get-Date) - [datetime]$s.GpuDriverDate).Days
        $c += if ($age -gt 365) { @{ Ok = $false; Title = "GPU driver is $([math]::Round($age/30)) months old"; Text = 'Download the latest Game Ready driver from nvidia.com (choose "Clean installation").' } }
              else { @{ Ok = $true; Title = 'GPU driver is recent'; Text = "Driver $($s.GpuDriver)" } }
    }
    $c += if ($s.StartupCount -gt 8) { @{ Ok = $false; Title = "$($s.StartupCount) apps launch at startup"; Text = 'Every startup app competes for your 4 CPU threads. Disable the ones you do not need (Boost Up > Startup apps).' } }
          else { @{ Ok = $true; Title = "$($s.StartupCount) startup apps"; Text = 'Startup is lean.' } }
    $sysVol = $s.Volumes | Where-Object { $_.Letter -eq $env:SystemDrive } | Select-Object -First 1
    if ($sysVol -and $sysVol.Size -gt 0) {
        $pct = [math]::Round(100 * $sysVol.Free / $sysVol.Size)
        $c += if ($pct -lt 15) { @{ Ok = $false; Title = "System drive only $pct% free"; Text = 'Windows and shader caches need free space. Run Boost Up > Clean temp files, or move games to another drive.' } }
              else { @{ Ok = $true; Title = "System drive $pct% free"; Text = "$(Format-Bytes $sysVol.Free) free on $($env:SystemDrive)" } }
    }
    if ($s.Refresh) {
        $c += @{ Ok = $true; Title = "Display: $($s.ResX) x $($s.ResY) @ $($s.Refresh) Hz"; Text = 'At 1080p the GT 1030 is best with Low-Medium presets; use 900p or render scale 75-85% in demanding games.' }
    }
    return $c
}

# ================================================================ UI (XAML)
[xml]$MainXaml = @'
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Frenzy Extreme Panel" Width="1320" Height="840" MinWidth="1080" MinHeight="680"
        WindowStartupLocation="CenterScreen" Background="#050505" Foreground="#E8EDF3"
        FontFamily="Segoe UI Variable Display, Segoe UI" FontSize="13"
        TextOptions.TextFormattingMode="Display" UseLayoutRounding="True" SnapsToDevicePixels="True">
  <WindowChrome.WindowChrome>
    <WindowChrome CaptionHeight="44" ResizeBorderThickness="6" GlassFrameThickness="0" CornerRadius="0" UseAeroCaptionButtons="False"/>
  </WindowChrome.WindowChrome>

  <Window.Triggers>
    <EventTrigger RoutedEvent="FrameworkElement.Loaded">
      <BeginStoryboard>
        <Storyboard>
          <DoubleAnimation Storyboard.TargetName="Root" Storyboard.TargetProperty="Opacity" From="0" To="1" Duration="0:0:0.55">
            <DoubleAnimation.EasingFunction><QuadraticEase EasingMode="EaseOut"/></DoubleAnimation.EasingFunction>
          </DoubleAnimation>
        </Storyboard>
      </BeginStoryboard>
    </EventTrigger>
  </Window.Triggers>

  <Window.Resources>
    <FontFamily x:Key="Icons">Segoe Fluent Icons, Segoe MDL2 Assets</FontFamily>

    <!-- premium palette: change these brushes to re-theme the whole app -->
    <LinearGradientBrush x:Key="AccentGrad" StartPoint="0,0" EndPoint="1,1">
      <GradientStop Color="#8B5CF6" Offset="0"/><GradientStop Color="#22D3EE" Offset="1"/>
    </LinearGradientBrush>
    <LinearGradientBrush x:Key="BtnGrad" StartPoint="0,0" EndPoint="1,1">
      <GradientStop Color="#7C3AED" Offset="0"/><GradientStop Color="#4F46E5" Offset="1"/>
    </LinearGradientBrush>
    <LinearGradientBrush x:Key="CardGrad" StartPoint="0,0" EndPoint="0,1">
      <GradientStop Color="#131316" Offset="0"/><GradientStop Color="#0B0B0D" Offset="1"/>
    </LinearGradientBrush>
    <LinearGradientBrush x:Key="CardBorderGrad" StartPoint="0,0" EndPoint="1,1">
      <GradientStop Color="#2E2E38" Offset="0"/><GradientStop Color="#17171C" Offset="1"/>
    </LinearGradientBrush>
    <DropShadowEffect x:Key="AccentGlow" Color="#8B5CF6" BlurRadius="18" ShadowDepth="0" Opacity="0.55"/>
    <DropShadowEffect x:Key="SoftShadow" Color="#000000" BlurRadius="26" ShadowDepth="6" Opacity="0.6"/>

    <!-- text -->
    <Style x:Key="H1" TargetType="TextBlock">
      <Setter Property="FontSize" Value="26"/><Setter Property="FontWeight" Value="SemiBold"/><Setter Property="Foreground" Value="#F3F6F9"/>
    </Style>
    <Style x:Key="H2" TargetType="TextBlock">
      <Setter Property="FontSize" Value="16.5"/><Setter Property="FontWeight" Value="SemiBold"/><Setter Property="Foreground" Value="#F3F6F9"/>
    </Style>
    <Style x:Key="Sub" TargetType="TextBlock">
      <Setter Property="FontSize" Value="13"/><Setter Property="Foreground" Value="#8A8A8A"/><Setter Property="TextWrapping" Value="Wrap"/>
    </Style>
    <Style x:Key="Label" TargetType="TextBlock">
      <Setter Property="FontSize" Value="11"/><Setter Property="FontWeight" Value="Bold"/><Setter Property="Foreground" Value="#F2F2F2"/>
    </Style>

    <Style x:Key="Card" TargetType="Border">
      <Setter Property="Background" Value="{StaticResource CardGrad}"/><Setter Property="BorderBrush" Value="{StaticResource CardBorderGrad}"/>
      <Setter Property="BorderThickness" Value="1"/><Setter Property="CornerRadius" Value="12"/><Setter Property="Padding" Value="22"/>
    </Style>

    <!-- buttons -->
    <Style x:Key="AccentBtn" TargetType="Button">
      <Setter Property="Foreground" Value="#FFFFFF"/><Setter Property="Background" Value="{StaticResource BtnGrad}"/>
      <Setter Property="BorderBrush" Value="Transparent"/><Setter Property="BorderThickness" Value="0"/>
      <Setter Property="FontWeight" Value="SemiBold"/><Setter Property="FontSize" Value="13"/>
      <Setter Property="Padding" Value="18,9"/><Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Border x:Name="B" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}"
                    BorderThickness="{TemplateBinding BorderThickness}" CornerRadius="8" Padding="{TemplateBinding Padding}">
              <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True"><Setter TargetName="B" Property="Opacity" Value="0.94"/><Setter TargetName="B" Property="Effect" Value="{StaticResource AccentGlow}"/></Trigger>
              <Trigger Property="IsPressed" Value="True"><Setter TargetName="B" Property="Opacity" Value="0.72"/></Trigger>
              <Trigger Property="IsEnabled" Value="False"><Setter TargetName="B" Property="Opacity" Value="0.4"/></Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>
    <Style x:Key="GhostBtn" TargetType="Button" BasedOn="{StaticResource AccentBtn}">
      <Setter Property="Background" Value="#141414"/><Setter Property="Foreground" Value="#DDE4ED"/>
      <Setter Property="BorderBrush" Value="#2A2A2A"/><Setter Property="BorderThickness" Value="1"/>
      <Setter Property="FontWeight" Value="Normal"/>
    </Style>
    <Style x:Key="DangerBtn" TargetType="Button" BasedOn="{StaticResource AccentBtn}">
      <Setter Property="Background" Value="#2A1215"/><Setter Property="Foreground" Value="#FF8A8A"/>
      <Setter Property="BorderBrush" Value="#5A2228"/><Setter Property="BorderThickness" Value="1"/>
      <Setter Property="FontWeight" Value="Normal"/>
    </Style>

    <Style x:Key="TitleBtn" TargetType="Button">
      <Setter Property="Width" Value="46"/><Setter Property="Height" Value="36"/>
      <Setter Property="Foreground" Value="#9A9A9A"/><Setter Property="Background" Value="Transparent"/>
      <Setter Property="FontFamily" Value="Segoe MDL2 Assets"/><Setter Property="FontSize" Value="10"/>
      <Setter Property="WindowChrome.IsHitTestVisibleInChrome" Value="True"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Border Background="{TemplateBinding Background}">
              <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
            </Border>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
      <Style.Triggers>
        <Trigger Property="IsMouseOver" Value="True"><Setter Property="Background" Value="#1A1A1A"/><Setter Property="Foreground" Value="White"/></Trigger>
      </Style.Triggers>
    </Style>
    <Style x:Key="CloseBtn" TargetType="Button" BasedOn="{StaticResource TitleBtn}">
      <Style.Triggers>
        <Trigger Property="IsMouseOver" Value="True"><Setter Property="Background" Value="#E81123"/><Setter Property="Foreground" Value="White"/></Trigger>
      </Style.Triggers>
    </Style>

    <Style x:Key="Tile" TargetType="Button">
      <Setter Property="Foreground" Value="#C9D3DE"/><Setter Property="Cursor" Value="Hand"/><Setter Property="Margin" Value="0,0,10,10"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Border x:Name="B" Background="#121212" BorderBrush="#222222" BorderThickness="1" CornerRadius="10" Padding="12,16">
              <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="B" Property="BorderBrush" Value="#F2F2F2"/><Setter TargetName="B" Property="Background" Value="#181818"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <!-- sidebar navigation -->
    <Style x:Key="NavBtn" TargetType="RadioButton">
      <Setter Property="Foreground" Value="#7A7A7A"/><Setter Property="Height" Value="54"/><Setter Property="Cursor" Value="Hand"/>
      <Setter Property="GroupName" Value="Nav"/><Setter Property="FontSize" Value="10.5"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="RadioButton">
            <Grid Background="Transparent">
              <Border x:Name="Bg" Margin="9,3" CornerRadius="10" Background="Transparent"/>
              <Border x:Name="Ind" Width="3" HorizontalAlignment="Left" Margin="0,18" CornerRadius="0,3,3,0" Background="{StaticResource AccentGrad}" Effect="{StaticResource AccentGlow}" Visibility="Hidden"/>
              <StackPanel VerticalAlignment="Center" HorizontalAlignment="Center">
                <TextBlock Text="{Binding Tag, RelativeSource={RelativeSource TemplatedParent}}" FontFamily="{StaticResource Icons}"
                           FontSize="20" HorizontalAlignment="Center"/>
                <ContentPresenter HorizontalAlignment="Center" Margin="0,6,0,0"/>
              </StackPanel>
            </Grid>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="Bg" Property="Background" Value="#111111"/><Setter Property="Foreground" Value="#C9D3DE"/>
              </Trigger>
              <Trigger Property="IsChecked" Value="True">
                <Setter TargetName="Bg" Property="Background" Value="#17142A"/>
                <Setter TargetName="Ind" Property="Visibility" Value="Visible"/>
                <Setter Property="Foreground" Value="#F2F2F2"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <!-- category chips -->
    <Style x:Key="Chip" TargetType="RadioButton">
      <Setter Property="Foreground" Value="#A8A8A8"/><Setter Property="Margin" Value="0,0,8,8"/>
      <Setter Property="Cursor" Value="Hand"/><Setter Property="FontSize" Value="13"/><Setter Property="GroupName" Value="Cat"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="RadioButton">
            <Border x:Name="B" CornerRadius="8" Background="#111111" BorderBrush="#222222" BorderThickness="1" Padding="14,7">
              <ContentPresenter VerticalAlignment="Center"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True"><Setter TargetName="B" Property="BorderBrush" Value="#3A3A3A"/></Trigger>
              <Trigger Property="IsChecked" Value="True">
                <Setter TargetName="B" Property="Background" Value="#1A1530"/>
                <Setter TargetName="B" Property="BorderBrush" Value="#8B5CF6"/>
                <Setter Property="Foreground" Value="#FFFFFF"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <!-- switch -->
    <Style x:Key="Switch" TargetType="ToggleButton">
      <Setter Property="Width" Value="44"/><Setter Property="Height" Value="24"/><Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Focusable" Value="False"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="ToggleButton">
            <Grid>
              <Border x:Name="Track" CornerRadius="12" Background="#1A1A1A" BorderBrush="#3A3A3A" BorderThickness="1"/>
              <Ellipse x:Name="Knob" Width="16" Height="16" Fill="#A8A8A8" HorizontalAlignment="Left" Margin="4,0,0,0">
                <Ellipse.RenderTransform><TranslateTransform x:Name="KnobT" X="0"/></Ellipse.RenderTransform>
              </Ellipse>
            </Grid>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True"><Setter TargetName="Track" Property="BorderBrush" Value="#666666"/></Trigger>
              <Trigger Property="IsChecked" Value="True">
                <Trigger.EnterActions>
                  <BeginStoryboard><Storyboard><DoubleAnimation Storyboard.TargetName="KnobT" Storyboard.TargetProperty="X" To="20" Duration="0:0:0.14"/></Storyboard></BeginStoryboard>
                </Trigger.EnterActions>
                <Trigger.ExitActions>
                  <BeginStoryboard><Storyboard><DoubleAnimation Storyboard.TargetName="KnobT" Storyboard.TargetProperty="X" To="0" Duration="0:0:0.14"/></Storyboard></BeginStoryboard>
                </Trigger.ExitActions>
                <Setter TargetName="Track" Property="Background" Value="{StaticResource AccentGrad}"/>
                <Setter TargetName="Track" Property="BorderBrush" Value="#8B5CF6"/>
                <Setter TargetName="Track" Property="Effect" Value="{StaticResource AccentGlow}"/>
                <Setter TargetName="Knob" Property="Fill" Value="White"/>
              </Trigger>
              <Trigger Property="IsEnabled" Value="False"><Setter Property="Opacity" Value="0.35"/></Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <!-- inputs -->
    <Style x:Key="Input" TargetType="TextBox">
      <Setter Property="Foreground" Value="#E6ECF2"/><Setter Property="CaretBrush" Value="#F2F2F2"/>
      <Setter Property="SelectionBrush" Value="#F2F2F2"/><Setter Property="FontSize" Value="13"/><Setter Property="Padding" Value="10,8"/>
      <Setter Property="VerticalContentAlignment" Value="Center"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="TextBox">
            <Border x:Name="B" Background="#0B0B0B" BorderBrush="#222222" BorderThickness="1" CornerRadius="8">
              <ScrollViewer x:Name="PART_ContentHost" Margin="{TemplateBinding Padding}" VerticalAlignment="{TemplateBinding VerticalContentAlignment}"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsKeyboardFocused" Value="True"><Setter TargetName="B" Property="BorderBrush" Value="#F2F2F2"/></Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <Style x:Key="Bar" TargetType="ProgressBar">
      <Setter Property="Height" Value="6"/><Setter Property="Foreground" Value="#F2F2F2"/><Setter Property="Maximum" Value="100"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="ProgressBar">
            <Grid>
              <Border x:Name="PART_Track" CornerRadius="3" Background="#1A1A1A"/>
              <Border x:Name="PART_Indicator" CornerRadius="3" Background="{StaticResource AccentGrad}" Effect="{StaticResource AccentGlow}" HorizontalAlignment="Left"/>
            </Grid>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <Style TargetType="ToolTip">
      <Setter Property="Background" Value="#181818"/><Setter Property="Foreground" Value="#DDE4ED"/>
      <Setter Property="BorderBrush" Value="#333333"/><Setter Property="Padding" Value="10,8"/><Setter Property="FontSize" Value="12"/>
    </Style>

    <Style TargetType="ScrollBar">
      <Setter Property="Width" Value="8"/><Setter Property="MinWidth" Value="8"/><Setter Property="Background" Value="Transparent"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="ScrollBar">
            <Track x:Name="PART_Track" IsDirectionReversed="True" Orientation="Vertical">
              <Track.Thumb>
                <Thumb>
                  <Thumb.Template>
                    <ControlTemplate TargetType="Thumb"><Border CornerRadius="4" Background="#333333" Margin="1,2"/></ControlTemplate>
                  </Thumb.Template>
                </Thumb>
              </Track.Thumb>
            </Track>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
      <Style.Triggers>
        <Trigger Property="Orientation" Value="Horizontal">
          <Setter Property="Width" Value="Auto"/><Setter Property="MinWidth" Value="0"/><Setter Property="Height" Value="8"/>
          <Setter Property="Template">
            <Setter.Value>
              <ControlTemplate TargetType="ScrollBar">
                <Track x:Name="PART_Track" Orientation="Horizontal">
                  <Track.Thumb>
                    <Thumb>
                      <Thumb.Template>
                        <ControlTemplate TargetType="Thumb"><Border CornerRadius="4" Background="#333333" Margin="2,1"/></ControlTemplate>
                      </Thumb.Template>
                    </Thumb>
                  </Track.Thumb>
                </Track>
              </ControlTemplate>
            </Setter.Value>
          </Setter>
        </Trigger>
      </Style.Triggers>
    </Style>
  </Window.Resources>

  <Grid x:Name="Root">
    <Grid.ColumnDefinitions>
      <ColumnDefinition Width="84"/>
      <ColumnDefinition Width="*"/>
    </Grid.ColumnDefinitions>

    <!-- ===================== SIDEBAR ===================== -->
    <Border Grid.Column="0" Background="#090909" BorderBrush="#141414" BorderThickness="0,0,1,0">
      <Grid>
        <Grid.RowDefinitions>
          <RowDefinition Height="76"/>
          <RowDefinition Height="*"/>
          <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>
        <Border Width="40" Height="40" CornerRadius="11" VerticalAlignment="Center" HorizontalAlignment="Center" Effect="{StaticResource AccentGlow}">
          <Border.Background>
            <LinearGradientBrush StartPoint="0,0" EndPoint="1,1">
              <GradientStop Color="#A78BFA" Offset="0"/>
              <GradientStop Color="#22D3EE" Offset="1"/>
            </LinearGradientBrush>
          </Border.Background>
          <Path Data="M14,1 L4,13 L10.5,13 L8.5,23 L19,9.5 L12.5,9.5 L15.5,1 Z" Fill="#0A0A0A" Stretch="Uniform" Margin="10,8"/>
        </Border>
        <StackPanel Grid.Row="1" Margin="0,6,0,0">
          <RadioButton x:Name="NavDashboard" Style="{StaticResource NavBtn}" Tag="&#xE80F;" Content="Home" IsChecked="True"/>
          <RadioButton x:Name="NavScanner"   Style="{StaticResource NavBtn}" Tag="&#xE9D9;" Content="Scanner"/>
          <RadioButton x:Name="NavTweaks"    Style="{StaticResource NavBtn}" Tag="&#xEC4A;" Content="All"/>
          <RadioButton x:Name="NavFps"       Style="{StaticResource NavBtn}" Tag="&#xE945;" Content="FPS"/>
          <RadioButton x:Name="NavLatency"   Style="{StaticResource NavBtn}" Tag="&#xE916;" Content="Latency"/>
          <RadioButton x:Name="NavBoost"     Style="{StaticResource NavBtn}" Tag="&#xE74D;" Content="Cleanups"/>
          <RadioButton x:Name="NavDebloat"   Style="{StaticResource NavBtn}" Tag="&#xE74C;" Content="Debloat"/>
          <Border Height="1" Background="#1C1C1C" Margin="22,8"/>
          <RadioButton x:Name="NavBackup"    Style="{StaticResource NavBtn}" Tag="&#xE777;" Content="Backups"/>
          <RadioButton x:Name="NavSettings"  Style="{StaticResource NavBtn}" Tag="&#xE713;" Content="Settings"/>
        </StackPanel>
        <TextBlock x:Name="VersionText" Grid.Row="2" Text="v1.0" Foreground="#555555" FontSize="10.5" HorizontalAlignment="Center" Margin="0,0,0,16"/>
      </Grid>
    </Border>

    <!-- ===================== MAIN ===================== -->
    <Grid Grid.Column="1">
      <Grid.RowDefinitions>
        <RowDefinition Height="44"/>
        <RowDefinition Height="*"/>
      </Grid.RowDefinitions>

      <!-- title bar -->
      <Grid Grid.Row="0">
        <StackPanel Orientation="Horizontal" VerticalAlignment="Center" Margin="28,0,0,0">
          <TextBlock Text="FRENZY " FontWeight="Bold" FontSize="13" Foreground="#F3F6F9"/>
          <TextBlock Text="EXTREME PANEL" FontWeight="Bold" FontSize="13" Foreground="#9A9A9A"/>
          <Border CornerRadius="4" Padding="7,2" Margin="12,0,0,0" Background="{StaticResource BtnGrad}" VerticalAlignment="Center">
            <TextBlock Text="PREMIUM" FontSize="9.5" FontWeight="Bold" Foreground="#FFFFFF"/>
          </Border>
          <TextBlock x:Name="TitleProfile" Text="" FontSize="12" Foreground="#6A6A6A" Margin="14,1,0,0"/>
        </StackPanel>
        <StackPanel Orientation="Horizontal" HorizontalAlignment="Right">
          <Border x:Name="RebootBanner" Visibility="Collapsed" Background="#1A1A1A" BorderBrush="#444444" BorderThickness="1" CornerRadius="8" Margin="0,6,12,6" Padding="12,0,4,0">
            <StackPanel Orientation="Horizontal">
              <TextBlock Text="&#xE72C;" FontFamily="{StaticResource Icons}" Foreground="#BDBDBD" VerticalAlignment="Center" Margin="0,0,8,0"/>
              <TextBlock Text="Restart required to finish applying tweaks" Foreground="#DDDDDD" VerticalAlignment="Center" FontSize="12"/>
              <Button x:Name="BtnRestart" Content="Restart now" Style="{StaticResource AccentBtn}" Padding="10,3" FontSize="12" Margin="10,3,0,3" WindowChrome.IsHitTestVisibleInChrome="True"/>
            </StackPanel>
          </Border>
          <Button x:Name="BtnMin"   Style="{StaticResource TitleBtn}" Content="&#xE921;"/>
          <Button x:Name="BtnMax"   Style="{StaticResource TitleBtn}" Content="&#xE922;"/>
          <Button x:Name="BtnClose" Style="{StaticResource CloseBtn}" Content="&#xE8BB;"/>
        </StackPanel>
      </Grid>

      <Grid Grid.Row="1">

        <!-- ===================== DASHBOARD ===================== -->
        <ScrollViewer x:Name="PageDashboard" VerticalScrollBarVisibility="Auto" HorizontalScrollBarVisibility="Disabled">
          <StackPanel Margin="28,6,28,28">
            <Grid>
              <Grid.ColumnDefinitions>
                <ColumnDefinition Width="*"/>
                <ColumnDefinition Width="400"/>
              </Grid.ColumnDefinitions>
              <Border Style="{StaticResource Card}" Padding="26,24">
                <Grid>
                  <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="190"/>
                    <ColumnDefinition Width="*"/>
                  </Grid.ColumnDefinitions>
                  <Grid Width="170" Height="170" HorizontalAlignment="Left">
                    <Ellipse Stroke="#1C1C1C" StrokeThickness="14" Margin="0"/>
                    <Canvas Width="170" Height="170">
                      <Path x:Name="ScoreArc" StrokeThickness="14" StrokeStartLineCap="Round" StrokeEndLineCap="Round" Effect="{StaticResource AccentGlow}">
                        <Path.Stroke>
                          <LinearGradientBrush StartPoint="0,0" EndPoint="1,1">
                            <GradientStop Color="#A78BFA" Offset="0"/>
                            <GradientStop Color="#22D3EE" Offset="1"/>
                          </LinearGradientBrush>
                        </Path.Stroke>
                      </Path>
                    </Canvas>
                    <StackPanel VerticalAlignment="Center" HorizontalAlignment="Center">
                      <TextBlock x:Name="ScoreText" Text="0%" FontSize="38" FontWeight="Bold" HorizontalAlignment="Center" Foreground="#F3F6F9"/>
                      <TextBlock Text="OPTIMIZED" FontSize="10.5" FontWeight="SemiBold" Foreground="#8A8A8A" HorizontalAlignment="Center"/>
                    </StackPanel>
                  </Grid>
                  <StackPanel Grid.Column="1" VerticalAlignment="Center" Margin="18,0,0,0">
                    <TextBlock x:Name="HeroTitle" Text="Scanning your PC..." Style="{StaticResource H1}" TextWrapping="Wrap"/>
                    <TextBlock x:Name="HeroSub" Text="" Style="{StaticResource Sub}" Margin="0,6,0,0"/>
                    <Border Background="#141414" CornerRadius="6" Padding="12,7" Margin="0,14,0,0" HorizontalAlignment="Left">
                      <TextBlock FontSize="13" Foreground="#C9D3DE">
                        <Run x:Name="HeroCount" Text="0" Foreground="#F2F2F2" FontWeight="Bold"/><Run Text=" recommended optimizations can be enabled to make your PC run smoother"/>
                      </TextBlock>
                    </Border>
                    <StackPanel Orientation="Horizontal" Margin="0,18,0,0">
                      <Button x:Name="BtnApplyRec" Style="{StaticResource AccentBtn}" Content="Apply Recommended"/>
                      <Button x:Name="BtnGoTweaks" Style="{StaticResource GhostBtn}" Content="View all optimizations" Margin="10,0,0,0"/>
                    </StackPanel>
                  </StackPanel>
                </Grid>
              </Border>

              <Border Grid.Column="1" Style="{StaticResource Card}" Margin="16,0,0,0">
                <StackPanel>
                  <Grid>
                    <TextBlock Text="THIS PC" Style="{StaticResource Label}"/>
                    <TextBlock x:Name="DashMatch" Text="" FontSize="11" Foreground="#FFFFFF" HorizontalAlignment="Right"/>
                  </Grid>
                  <TextBlock x:Name="DashCpu" Text="-" FontSize="14" FontWeight="SemiBold" Margin="0,12,0,0" TextTrimming="CharacterEllipsis"/>
                  <TextBlock x:Name="DashGpu" Text="-" FontSize="14" FontWeight="SemiBold" Margin="0,4,0,0" TextTrimming="CharacterEllipsis"/>
                  <TextBlock x:Name="DashRam" Text="-" FontSize="12.5" Foreground="#8A8A8A" Margin="0,4,0,0" TextTrimming="CharacterEllipsis"/>
                  <Grid Margin="0,18,0,4">
                    <TextBlock Text="CPU load" Foreground="#A8A8A8" FontSize="12"/>
                    <TextBlock x:Name="CpuPct" Text="-" Foreground="#E8EDF3" FontSize="12" HorizontalAlignment="Right"/>
                  </Grid>
                  <ProgressBar x:Name="CpuBar" Style="{StaticResource Bar}" Value="0"/>
                  <Grid Margin="0,12,0,4">
                    <TextBlock Text="Memory in use" Foreground="#A8A8A8" FontSize="12"/>
                    <TextBlock x:Name="RamPct" Text="-" Foreground="#E8EDF3" FontSize="12" HorizontalAlignment="Right"/>
                  </Grid>
                  <ProgressBar x:Name="RamBar" Style="{StaticResource Bar}" Foreground="#D4D4D4" Value="0"/>
                  <Grid Margin="0,12,0,4">
                    <TextBlock Text="GPU load" Foreground="#A8A8A8" FontSize="12"/>
                    <TextBlock x:Name="GpuPct" Text="-" Foreground="#E8EDF3" FontSize="12" HorizontalAlignment="Right"/>
                  </Grid>
                  <ProgressBar x:Name="GpuBar" Style="{StaticResource Bar}" Foreground="#FFFFFF" Value="0"/>
                </StackPanel>
              </Border>
            </Grid>

            <UniformGrid Columns="4" Margin="0,16,-12,0">
              <Border Style="{StaticResource Card}" Padding="20,16" Margin="0,0,12,0">
                <StackPanel><TextBlock Text="ACTIVE TWEAKS" Style="{StaticResource Label}" Foreground="#8A8A8A"/>
                  <TextBlock x:Name="StatActive" Text="0" FontSize="28" FontWeight="Bold" Margin="0,6,0,0"/></StackPanel>
              </Border>
              <Border Style="{StaticResource Card}" Padding="20,16" Margin="0,0,12,0">
                <StackPanel><TextBlock Text="RECOMMENDED LEFT" Style="{StaticResource Label}" Foreground="#8A8A8A"/>
                  <TextBlock x:Name="StatLeft" Text="0" FontSize="28" FontWeight="Bold" Foreground="#F2F2F2" Margin="0,6,0,0"/></StackPanel>
              </Border>
              <Border Style="{StaticResource Card}" Padding="20,16" Margin="0,0,12,0">
                <StackPanel><TextBlock Text="RUNNING PROCESSES" Style="{StaticResource Label}" Foreground="#8A8A8A"/>
                  <TextBlock x:Name="StatProcs" Text="-" FontSize="28" FontWeight="Bold" Margin="0,6,0,0"/></StackPanel>
              </Border>
              <Border Style="{StaticResource Card}" Padding="20,16" Margin="0,0,12,0">
                <StackPanel><TextBlock Text="TOTAL TWEAKS" Style="{StaticResource Label}" Foreground="#8A8A8A"/>
                  <TextBlock x:Name="StatTotal" Text="0" FontSize="28" FontWeight="Bold" Margin="0,6,0,0"/></StackPanel>
              </Border>
            </UniformGrid>

            <Grid Margin="0,16,0,0">
              <Grid.ColumnDefinitions>
                <ColumnDefinition Width="*"/>
                <ColumnDefinition Width="400"/>
              </Grid.ColumnDefinitions>
              <Border Style="{StaticResource Card}">
                <StackPanel>
                  <StackPanel Orientation="Horizontal">
                    <TextBlock Text="&#xE734;" FontFamily="{StaticResource Icons}" Foreground="#F2F2F2" FontSize="18" VerticalAlignment="Center" Margin="0,0,10,0"/>
                    <StackPanel>
                      <TextBlock Text="Recommendations" Style="{StaticResource H2}"/>
                      <TextBlock Text="Highest-impact tweaks you haven't enabled yet" Style="{StaticResource Sub}" FontSize="12"/>
                    </StackPanel>
                  </StackPanel>
                  <StackPanel x:Name="RecList" Margin="0,16,0,0"/>
                  <Button x:Name="BtnApplyAllRec" Style="{StaticResource AccentBtn}" Content="Apply all" HorizontalAlignment="Left" Margin="0,8,0,0"/>
                </StackPanel>
              </Border>
              <StackPanel Grid.Column="1" Margin="16,0,0,0">
                <Border Style="{StaticResource Card}">
                  <StackPanel>
                    <TextBlock Text="Shortcuts" Style="{StaticResource H2}" Margin="0,0,0,14"/>
                    <UniformGrid Columns="3" Margin="0,0,-10,-10">
                      <Button x:Name="ShortScan" Style="{StaticResource Tile}">
                        <StackPanel><TextBlock Text="&#xE9D9;" FontFamily="{StaticResource Icons}" FontSize="24" HorizontalAlignment="Center"/>
                          <TextBlock Text="PC Scanner" Margin="0,8,0,0" HorizontalAlignment="Center"/></StackPanel>
                      </Button>
                      <Button x:Name="ShortBoost" Style="{StaticResource Tile}">
                        <StackPanel><TextBlock Text="&#xE945;" FontFamily="{StaticResource Icons}" FontSize="24" HorizontalAlignment="Center"/>
                          <TextBlock Text="Boost Up" Margin="0,8,0,0" HorizontalAlignment="Center"/></StackPanel>
                      </Button>
                      <Button x:Name="ShortBackup" Style="{StaticResource Tile}">
                        <StackPanel><TextBlock Text="&#xE777;" FontFamily="{StaticResource Icons}" FontSize="24" HorizontalAlignment="Center"/>
                          <TextBlock Text="Backups" Margin="0,8,0,0" HorizontalAlignment="Center"/></StackPanel>
                      </Button>
                    </UniformGrid>
                  </StackPanel>
                </Border>
                <Border Style="{StaticResource Card}" Margin="0,16,0,0" BorderBrush="#2A2A2A">
                  <StackPanel>
                    <StackPanel Orientation="Horizontal">
                      <TextBlock Text="&#xE946;" FontFamily="{StaticResource Icons}" Foreground="#FFFFFF" FontSize="16" VerticalAlignment="Center" Margin="0,0,8,0"/>
                      <TextBlock Text="Bottleneck insight" Style="{StaticResource H2}"/>
                    </StackPanel>
                    <TextBlock x:Name="InsightText" Style="{StaticResource Sub}" Margin="0,10,0,0" LineHeight="19"/>
                  </StackPanel>
                </Border>
              </StackPanel>
            </Grid>
          </StackPanel>
        </ScrollViewer>

        <!-- ===================== SCANNER ===================== -->
        <ScrollViewer x:Name="PageScanner" Visibility="Collapsed" VerticalScrollBarVisibility="Auto" HorizontalScrollBarVisibility="Disabled">
          <StackPanel Margin="28,6,28,28">
            <Grid Margin="0,0,0,18">
              <StackPanel>
                <TextBlock Text="PC Scanner" Style="{StaticResource H1}"/>
                <TextBlock x:Name="ScanSub" Text="Hardware and system state detected on this PC" Style="{StaticResource Sub}" Margin="0,4,0,0"/>
              </StackPanel>
              <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" VerticalAlignment="Center">
                <Border x:Name="ProfileBadge" CornerRadius="8" Padding="12,7" Margin="0,0,10,0" Background="#101A13" BorderBrush="#333333" BorderThickness="1">
                  <TextBlock x:Name="ProfileText" Text="" Foreground="#E0E0E0" FontSize="12"/>
                </Border>
                <Button x:Name="BtnRescan" Style="{StaticResource GhostBtn}" Content="Rescan"/>
              </StackPanel>
            </Grid>
            <UniformGrid x:Name="ScanGrid" Columns="3" Margin="0,0,-14,0"/>
            <TextBlock Text="Health check" Style="{StaticResource H2}" Margin="0,16,0,4"/>
            <TextBlock Text="What is holding this PC back - and what is already in good shape" Style="{StaticResource Sub}" Margin="0,0,0,12"/>
            <UniformGrid x:Name="HealthList" Columns="2" Margin="0,0,-14,0"/>
          </StackPanel>
        </ScrollViewer>

        <!-- ===================== OPTIMIZATIONS ===================== -->
        <Grid x:Name="PageTweaks" Visibility="Collapsed">
          <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
          </Grid.RowDefinitions>
          <Grid Margin="28,6,28,14">
            <StackPanel>
              <TextBlock x:Name="TweakTitle" Text="All Optimizations" Style="{StaticResource H1}"/>
              <TextBlock x:Name="TweakSummary" Text="" Style="{StaticResource Sub}" Margin="0,4,0,0"/>
              <StackPanel x:Name="PickBar" Orientation="Horizontal" Margin="0,12,0,0" Visibility="Collapsed">
                <Button x:Name="BtnPickApps" Style="{StaticResource AccentBtn}" Content="Select Microsoft apps to remove"/>
                <Button x:Name="BtnPickSvc" Style="{StaticResource GhostBtn}" Content="Select services to disable" Margin="10,0,0,0"/>
              </StackPanel>
            </StackPanel>
            <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" VerticalAlignment="Center">
              <Grid Width="240" Margin="0,0,10,0">
                <TextBox x:Name="SearchBox" Style="{StaticResource Input}" Padding="32,8,10,8"/>
                <TextBlock Text="&#xE721;" FontFamily="{StaticResource Icons}" Foreground="#7A7A7A" VerticalAlignment="Center" Margin="12,0,0,0" IsHitTestVisible="False"/>
                <TextBlock x:Name="SearchHint" Text="Search tweaks" Foreground="#6A6A6A" VerticalAlignment="Center" Margin="34,0,0,0" IsHitTestVisible="False"/>
              </Grid>
              <Button x:Name="BtnTweaksApplyRec" Style="{StaticResource AccentBtn}" Content="Apply Recommended"/>
              <Button x:Name="BtnRevertAll" Style="{StaticResource GhostBtn}" Content="Revert all" Margin="10,0,0,0"/>
            </StackPanel>
          </Grid>
          <WrapPanel x:Name="ChipPanel" Grid.Row="1" Margin="28,0,28,8"/>
          <ScrollViewer x:Name="TweakScroll" Grid.Row="2" VerticalScrollBarVisibility="Auto" HorizontalScrollBarVisibility="Disabled">
            <UniformGrid x:Name="TweakGrid" Columns="3" Margin="28,6,14,28" VerticalAlignment="Top"/>
          </ScrollViewer>
        </Grid>

        <!-- ===================== BOOST ===================== -->
        <ScrollViewer x:Name="PageBoost" Visibility="Collapsed" VerticalScrollBarVisibility="Auto" HorizontalScrollBarVisibility="Disabled">
          <StackPanel Margin="28,6,28,28">
            <TextBlock Text="FRENZY TWEAKS" FontSize="52" FontWeight="Black" Foreground="#FFFFFF" Margin="0,0,0,2"/>
            <Border Height="3" Width="120" HorizontalAlignment="Left" Background="#F2F2F2" CornerRadius="2" Margin="0,0,0,14"/>
            <TextBlock Text="Cleanups &amp; Tools" Style="{StaticResource H2}"/>
            <TextBlock Text="One-click cleanup and boost actions to run before a gaming session" Style="{StaticResource Sub}" Margin="0,4,0,18"/>
            <UniformGrid x:Name="BoostGrid" Columns="3" Margin="0,0,-14,0"/>

            <Grid Margin="0,4,0,0">
              <Grid.ColumnDefinitions>
                <ColumnDefinition Width="*"/>
                <ColumnDefinition Width="*"/>
              </Grid.ColumnDefinitions>
              <Border Style="{StaticResource Card}" Grid.ColumnSpan="2">
                <StackPanel>
                  <TextBlock Text="Game Priority" Style="{StaticResource H2}"/>
                  <TextBlock Text="Games you add here always start with High CPU priority (Image File Execution Options). Enter the game's .exe name, e.g. cs2.exe, FortniteClient-Win64-Shipping.exe, RobloxPlayerBeta.exe" Style="{StaticResource Sub}" FontSize="12" Margin="0,6,0,14"/>
                  <Grid>
                    <Grid.ColumnDefinitions>
                      <ColumnDefinition Width="*"/>
                      <ColumnDefinition Width="Auto"/>
                    </Grid.ColumnDefinitions>
                    <TextBox x:Name="GameExe" Style="{StaticResource Input}"/>
                    <Button x:Name="BtnAddGame" Grid.Column="1" Style="{StaticResource AccentBtn}" Content="Add game" Margin="10,0,0,0"/>
                  </Grid>
                  <StackPanel x:Name="GameList" Margin="0,14,0,0"/>
                </StackPanel>
              </Border>
            </Grid>

          </StackPanel>
        </ScrollViewer>

        <!-- ===================== BACKUPS ===================== -->
        <ScrollViewer x:Name="PageBackup" Visibility="Collapsed" VerticalScrollBarVisibility="Auto" HorizontalScrollBarVisibility="Disabled">
          <StackPanel Margin="28,6,28,28">
            <TextBlock Text="Backups &amp; Restore" Style="{StaticResource H1}"/>
            <TextBlock Text="Every change Frenzy Tweaks makes is recorded so it can be undone." Style="{StaticResource Sub}" Margin="0,4,0,18"/>
            <Grid>
              <Grid.ColumnDefinitions>
                <ColumnDefinition Width="*"/>
                <ColumnDefinition Width="*"/>
              </Grid.ColumnDefinitions>
              <Border Style="{StaticResource Card}" Margin="0,0,8,0">
                <StackPanel>
                  <TextBlock Text="&#xE777;" FontFamily="{StaticResource Icons}" FontSize="26" Foreground="#F2F2F2"/>
                  <TextBlock Text="System Restore point" Style="{StaticResource H2}" Margin="0,10,0,0"/>
                  <TextBlock Text="A full Windows snapshot of the registry and system files. If anything ever goes wrong, boot into System Restore and roll back." Style="{StaticResource Sub}" Margin="0,6,0,16"/>
                  <StackPanel Orientation="Horizontal">
                    <Button x:Name="BtnCreateRP" Style="{StaticResource AccentBtn}" Content="Create restore point"/>
                    <Button x:Name="BtnOpenRstrui" Style="{StaticResource GhostBtn}" Content="Open System Restore" Margin="10,0,0,0"/>
                  </StackPanel>
                </StackPanel>
              </Border>
              <Border Grid.Column="1" Style="{StaticResource Card}" Margin="8,0,0,0">
                <StackPanel>
                  <TextBlock Text="&#xE74E;" FontFamily="{StaticResource Icons}" FontSize="26" Foreground="#D4D4D4"/>
                  <TextBlock Text="Frenzy Tweaks backup" Style="{StaticResource H2}" Margin="0,10,0,0"/>
                  <TextBlock x:Name="BackupInfo" Text="" Style="{StaticResource Sub}" Margin="0,6,0,16"/>
                  <StackPanel Orientation="Horizontal">
                    <Button x:Name="BtnRevertAll2" Style="{StaticResource DangerBtn}" Content="Revert every tweak"/>
                    <Button x:Name="BtnOpenData" Style="{StaticResource GhostBtn}" Content="Open backup folder" Margin="10,0,0,0"/>
                  </StackPanel>
                </StackPanel>
              </Border>
            </Grid>
            <Border Style="{StaticResource Card}" Margin="0,16,0,0">
              <StackPanel>
                <Grid>
                  <TextBlock Text="Activity log" Style="{StaticResource H2}"/>
                  <Button x:Name="BtnRefreshLog" Style="{StaticResource GhostBtn}" Content="Refresh" Padding="12,5" HorizontalAlignment="Right"/>
                </Grid>
                <TextBox x:Name="LogBox" Style="{StaticResource Input}" Height="300" Margin="0,12,0,0" IsReadOnly="True" TextWrapping="Wrap"
                         VerticalScrollBarVisibility="Auto" FontFamily="Consolas" FontSize="12" VerticalContentAlignment="Top"/>
              </StackPanel>
            </Border>
          </StackPanel>
        </ScrollViewer>

        <!-- ===================== SETTINGS ===================== -->
        <ScrollViewer x:Name="PageSettings" Visibility="Collapsed" VerticalScrollBarVisibility="Auto" HorizontalScrollBarVisibility="Disabled">
          <StackPanel Margin="28,6,28,28" MaxWidth="900" HorizontalAlignment="Left">
            <TextBlock Text="Settings" Style="{StaticResource H1}" Margin="0,0,0,18"/>
            <Border Style="{StaticResource Card}">
              <StackPanel>
                <Grid Margin="0,0,0,18">
                  <StackPanel Margin="0,0,70,0">
                    <TextBlock Text="Restore point before any change (always on)" FontSize="14" FontWeight="SemiBold"/>
                    <TextBlock Text="A Windows System Restore point is always created before the first change in each session." Style="{StaticResource Sub}" FontSize="12" Margin="0,3,0,0"/>
                  </StackPanel>
                  <ToggleButton x:Name="SetRestore" Style="{StaticResource Switch}" HorizontalAlignment="Right"/>
                </Grid>
                <Grid Margin="0,0,0,18">
                  <StackPanel Margin="0,0,70,0">
                    <TextBlock Text="Show advanced tweaks" FontSize="14" FontWeight="SemiBold"/>
                    <TextBlock Text="Shows tweaks with security trade-offs (Memory Integrity, Spectre/Meltdown mitigations). They are never applied by 'Apply Recommended'." Style="{StaticResource Sub}" FontSize="12" Margin="0,3,0,0"/>
                  </StackPanel>
                  <ToggleButton x:Name="SetAdvanced" Style="{StaticResource Switch}" HorizontalAlignment="Right"/>
                </Grid>
                <Grid>
                  <StackPanel Margin="0,0,70,0">
                    <TextBlock Text="Confirm risky and feature-breaking tweaks" FontSize="14" FontWeight="SemiBold"/>
                    <TextBlock Text="Asks before enabling a tweak that removes a feature or lowers security." Style="{StaticResource Sub}" FontSize="12" Margin="0,3,0,0"/>
                  </StackPanel>
                  <ToggleButton x:Name="SetConfirm" Style="{StaticResource Switch}" HorizontalAlignment="Right"/>
                </Grid>
              </StackPanel>
            </Border>
            <Border Style="{StaticResource Card}" Margin="0,16,0,0">
              <StackPanel>
                <TextBlock Text="About Frenzy Tweaks" Style="{StaticResource H2}"/>
                <TextBlock x:Name="AboutText" Style="{StaticResource Sub}" Margin="0,8,0,0" LineHeight="19"/>
                <StackPanel Orientation="Horizontal" Margin="0,16,0,0">
                  <Button x:Name="BtnUpdate" Style="{StaticResource AccentBtn}" Content="Check for updates"/>
                  <Button x:Name="BtnRepo" Style="{StaticResource GhostBtn}" Content="Open GitHub page" Margin="10,0,0,0"/>
                </StackPanel>
              </StackPanel>
            </Border>
          </StackPanel>
        </ScrollViewer>
      </Grid>
    </Grid>

    <!-- ===================== OVERLAY ===================== -->
    <Grid x:Name="Overlay" Grid.ColumnSpan="2" Background="#E6000000" Visibility="Collapsed" Panel.ZIndex="50">
      <Border Style="{StaticResource Card}" Width="460" HorizontalAlignment="Center" VerticalAlignment="Center" Padding="28,24" BorderBrush="#3A3560" Effect="{StaticResource SoftShadow}">
        <StackPanel>
          <TextBlock x:Name="OverlayTitle" Text="Working..." Style="{StaticResource H2}"/>
          <TextBlock x:Name="OverlayText" Text="" Style="{StaticResource Sub}" Margin="0,6,0,16" TextTrimming="CharacterEllipsis" TextWrapping="NoWrap"/>
          <ProgressBar x:Name="OverlayBar" Style="{StaticResource Bar}" Value="10"/>
        </StackPanel>
      </Border>
    </Grid>

    <!-- ===================== TOAST ===================== -->
    <Border x:Name="Toast" Grid.ColumnSpan="2" Panel.ZIndex="60" HorizontalAlignment="Right" VerticalAlignment="Bottom" Margin="0,0,26,24"
            Background="#16161B" BorderBrush="#3A3560" BorderThickness="1" CornerRadius="10" Padding="16,12" Opacity="0" Effect="{StaticResource SoftShadow}" IsHitTestVisible="False" MaxWidth="420">
      <StackPanel Orientation="Horizontal">
        <TextBlock x:Name="ToastIcon" Text="&#xE73E;" FontFamily="{StaticResource Icons}" Foreground="#FFFFFF" FontSize="15" VerticalAlignment="Center" Margin="0,0,10,0"/>
        <TextBlock x:Name="ToastText" Text="" Foreground="#E8EDF3" TextWrapping="Wrap" VerticalAlignment="Center" MaxWidth="360"/>
      </StackPanel>
    </Border>
  </Grid>
</Window>
'@

# ================================================================ BUILD WINDOW
Set-Splash 'Loading interface...' 85
try {
    $script:Window = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $MainXaml))
} catch {
    $msg = $_.Exception.Message; if ($_.Exception.InnerException) { $msg += "`n`n" + $_.Exception.InnerException.Message }
    Write-Log "UI load failed: $msg"
    Close-Splash
    [System.Windows.MessageBox]::Show("Frenzy Tweaks could not load its interface:`n`n$msg", 'Frenzy Tweaks', 'OK', 'Error') | Out-Null
    exit
}
$Window = $script:Window
$ui = @{}
foreach ($m in [regex]::Matches($MainXaml.OuterXml, 'x:Name="([^"]+)"')) {
    $n = $m.Groups[1].Value
    $el = $Window.FindName($n)
    if ($el) { $ui[$n] = $el }
}

$NS   = 'xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"'
$BC   = New-Object System.Windows.Media.BrushConverter
$IconFont = New-Object System.Windows.Media.FontFamily('Segoe Fluent Icons, Segoe MDL2 Assets')
function Brush([string]$hex) { $BC.ConvertFromString($hex) }
function New-El([string]$x) { [Windows.Markup.XamlReader]::Parse($x.Replace('%NS%', $NS)) }
function Update-UI { try { $Window.Dispatcher.Invoke([Action]{}, [System.Windows.Threading.DispatcherPriority]::Background) } catch {} }

# window icon
try {
    $bytes = [Convert]::FromBase64String($IconB64)
    $bmp = New-Object System.Windows.Media.Imaging.BitmapImage
    $bmp.BeginInit(); $bmp.StreamSource = New-Object System.IO.MemoryStream(, $bytes); $bmp.CacheOption = 'OnLoad'; $bmp.EndInit(); $bmp.Freeze()
    $Window.Icon = $bmp
} catch {}
$ui.VersionText.Text = "v$AppVersion"

# ================================================================ OVERLAY / TOAST / DIALOGS
function Show-Busy([string]$Title, [string]$Text, $Pct = $null) {
    $ui.OverlayTitle.Text = $Title; $ui.OverlayText.Text = $Text
    if ($null -ne $Pct) { $ui.OverlayBar.Value = $Pct }
    $ui.Overlay.Visibility = 'Visible'
    Update-UI
}
function Hide-Busy { $ui.Overlay.Visibility = 'Collapsed' }

function Invoke-Background {
    param([string]$Title, [string]$Text, [scriptblock]$Script, [object[]]$Arguments = @())
    $wasVisible = ($ui.Overlay.Visibility -eq 'Visible')
    Show-Busy $Title $Text
    $job = Start-Job -ScriptBlock $Script -ArgumentList $Arguments
    $v = [double]$ui.OverlayBar.Value; if ($v -ge 90) { $v = 5 }
    while ($job.State -eq 'NotStarted' -or $job.State -eq 'Running') {
        $v = $v + (95 - $v) * 0.02; $ui.OverlayBar.Value = $v
        Update-UI; Start-Sleep -Milliseconds 90
    }
    $out = Receive-Job $job -ErrorAction SilentlyContinue
    Remove-Job $job -Force -ErrorAction SilentlyContinue
    if (-not $wasVisible) { Hide-Busy }
    return $out
}

$script:ToastTimer = New-Object System.Windows.Threading.DispatcherTimer
$script:ToastTimer.Interval = [TimeSpan]::FromSeconds(3.8)
$script:ToastTimer.Add_Tick({
    $script:ToastTimer.Stop()
    $a = New-Object System.Windows.Media.Animation.DoubleAnimation
    $a.To = 0; $a.Duration = New-Object System.Windows.Duration([TimeSpan]::FromMilliseconds(350))
    $ui.Toast.BeginAnimation([System.Windows.UIElement]::OpacityProperty, $a)
})
function Show-Toast([string]$Text, [string]$Kind = 'ok') {
    switch ($Kind) {
        'ok'   { $ui.ToastIcon.Text = [string][char]0xE73E; $ui.ToastIcon.Foreground = Brush '#22D3EE' }
        'info' { $ui.ToastIcon.Text = [string][char]0xE946; $ui.ToastIcon.Foreground = Brush '#BDBDBD' }
        'warn' { $ui.ToastIcon.Text = [string][char]0xE7BA; $ui.ToastIcon.Foreground = Brush '#F5A524' }
        'err'  { $ui.ToastIcon.Text = [string][char]0xE783; $ui.ToastIcon.Foreground = Brush '#EF4444' }
    }
    $ui.ToastText.Text = $Text
    $a = New-Object System.Windows.Media.Animation.DoubleAnimation
    $a.To = 1; $a.Duration = New-Object System.Windows.Duration([TimeSpan]::FromMilliseconds(200))
    $ui.Toast.BeginAnimation([System.Windows.UIElement]::OpacityProperty, $a)
    $script:ToastTimer.Stop(); $script:ToastTimer.Start()
}

function Ask([string]$Text, [string]$Icon = 'Question') {
    ([System.Windows.MessageBox]::Show($Window, $Text, 'Frenzy Tweaks', 'YesNo', $Icon) -eq 'Yes')
}

function Invoke-Safe([scriptblock]$Block) {
    try { & $Block }
    catch {
        Hide-Busy
        Write-Log "ERROR: $($_.Exception.Message) @ $($_.InvocationInfo.ScriptLineNumber)"
        Show-Toast "Something went wrong: $($_.Exception.Message)" 'err'
    }
}

function Restart-Explorer {
    Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
    Start-Sleep -Milliseconds 1800
    if (-not (Get-Process -Name explorer -ErrorAction SilentlyContinue)) { Start-Process "$env:WINDIR\explorer.exe" }
}

# ================================================================ RESTORE POINT
$script:RestorePointDone = $false
function New-RestorePoint {
    $r = Invoke-Background -Title 'Creating a restore point' -Text 'Taking a System Restore snapshot - this can take up to a minute...' -Script {
        try {
            Enable-ComputerRestore -Drive "$env:SystemDrive\" -ErrorAction SilentlyContinue
            $k = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore'
            New-ItemProperty -Path $k -Name 'SystemRestorePointCreationFrequency' -PropertyType DWord -Value 0 -Force | Out-Null
            Checkpoint-Computer -Description 'Frenzy Tweaks - before optimizations' -RestorePointType 'MODIFY_SETTINGS' -ErrorAction Stop
            Remove-ItemProperty -Path $k -Name 'SystemRestorePointCreationFrequency' -ErrorAction SilentlyContinue
            'OK'
        } catch { "ERR: $($_.Exception.Message)" }
    }
    $r = "$r"
    Write-Log "Restore point: $r"
    $script:RestorePointDone = ($r -match 'OK')
    return ($r -match 'OK')
}
function Confirm-RestorePoint {
    if ($script:RestorePointDone) { return $true }
    if (New-RestorePoint) { return $true }
    return (Ask "A System Restore point could not be created (System Protection may be off for this drive).`n`nContinue WITHOUT a restore point? Frenzy's own backup of original values is still kept." 'Warning')
}

# ================================================================ TWEAK CARDS
$CardXaml = @'
<Border %NS% CornerRadius="12" Background="#0E0E0E" BorderThickness="1" Margin="0,0,14,14" Padding="20,18,20,14" Height="244">
  <Border.Style>
    <Style TargetType="Border">
      <Setter Property="BorderBrush" Value="#1C1C1C"/>
      <Style.Triggers><Trigger Property="IsMouseOver" Value="True"><Setter Property="BorderBrush" Value="#6D55C9"/></Trigger></Style.Triggers>
    </Style>
  </Border.Style>
  <Grid>
    <Grid.RowDefinitions>
      <RowDefinition Height="Auto"/><RowDefinition Height="Auto"/><RowDefinition Height="*"/><RowDefinition Height="Auto"/><RowDefinition Height="Auto"/>
    </Grid.RowDefinitions>
    <Grid>
      <StackPanel Orientation="Horizontal">
        <Border CornerRadius="5" Background="#1A1A1A" Padding="8,3"><TextBlock x:Name="Cat" Foreground="#A8A8A8" FontSize="11.5"/></Border>
        <Border CornerRadius="5" BorderBrush="#2A2A2A" BorderThickness="1" Padding="7,2" Margin="6,0,0,0" VerticalAlignment="Center">
          <TextBlock x:Name="Kind" Foreground="#7A7A7A" FontSize="10" FontWeight="SemiBold"/>
        </Border>
      </StackPanel>
      <TextBlock x:Name="Info" Text="&#xE946;" FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Foreground="#6A6A6A" FontSize="15"
                 HorizontalAlignment="Right" VerticalAlignment="Center" Cursor="Help" ToolTipService.ShowDuration="60000" ToolTipService.InitialShowDelay="150"/>
    </Grid>
    <TextBlock x:Name="Title" Grid.Row="1" FontSize="16" FontWeight="SemiBold" Foreground="#F2F5F8" Margin="0,12,0,6" TextTrimming="CharacterEllipsis"/>
    <TextBlock x:Name="Desc" Grid.Row="2" TextWrapping="Wrap" TextTrimming="WordEllipsis" Foreground="#8A8A8A" FontSize="12.5" LineHeight="18"/>
    <WrapPanel x:Name="Tags" Grid.Row="3" Margin="0,8,0,0" Height="18" ClipToBounds="True"/>
    <Border Grid.Row="4" BorderBrush="#1C1C1C" BorderThickness="0,1,0,0" Margin="-20,10,-20,0" Padding="20,10,20,0">
      <Grid>
        <TextBlock x:Name="Impact" FontSize="11.5" VerticalAlignment="Center"/>
        <StackPanel Orientation="Horizontal" HorizontalAlignment="Right">
          <TextBlock x:Name="Status" Foreground="#8A8A8A" FontSize="12" VerticalAlignment="Center" Margin="0,0,10,0"/>
          <ToggleButton x:Name="Toggle" Style="{DynamicResource Switch}"/>
        </StackPanel>
      </Grid>
    </Border>
  </Grid>
</Border>
'@

$TagDefs = @{
    'Recommended'      = @{ G = 0xE734; C = '#F2F2F2' }
    'Power Hungry'     = @{ G = 0xE945; C = '#CFCFCF' }
    'Feature Breaking' = @{ G = 0xE7BA; C = '#F5A524' }
    'Security Risk'    = @{ G = 0xE72E; C = '#F87171' }
    'Not Reversible'   = @{ G = 0xE74D; C = '#F87171' }
    'Reboot'           = @{ G = 0xE72C; C = '#BDBDBD' }
    'Sign-out'         = @{ G = 0xE72C; C = '#BDBDBD' }
    'HDD'              = @{ G = 0xEDA2; C = '#9A9A9A' }
    'SSD'              = @{ G = 0xEDA2; C = '#9A9A9A' }
    'Win11'            = @{ G = 0xE770; C = '#9A9A9A' }
}
function New-TagEl([string]$Name) {
    $d = $TagDefs[$Name]; if (-not $d) { $d = @{ G = 0xE946; C = '#8A8A8A' } }
    $sp = New-Object System.Windows.Controls.StackPanel; $sp.Orientation = 'Horizontal'; $sp.Margin = '0,0,12,0'
    $g = New-Object System.Windows.Controls.TextBlock; $g.Text = [string][char]$d.G; $g.FontFamily = $IconFont; $g.FontSize = 11; $g.Foreground = Brush $d.C; $g.VerticalAlignment = 'Center'
    $t = New-Object System.Windows.Controls.TextBlock; $t.Text = $Name; $t.FontSize = 11.5; $t.Foreground = Brush $d.C; $t.Margin = '5,0,0,0'; $t.VerticalAlignment = 'Center'
    [void]$sp.Children.Add($g); [void]$sp.Children.Add($t)
    return $sp
}

$script:Cards = @{}
$script:Filter = 'All'
$ImpactW = @{ High = 3; Medium = 2; Low = 1 }

function New-TweakCard($t) {
    $card = New-El $CardXaml
    $card.FindName('Cat').Text   = $t.Cat
    $card.FindName('Kind').Text  = $t.Kind
    $card.FindName('Title').Text = $t.Name
    $card.FindName('Title').ToolTip = $t.Name
    $card.FindName('Desc').Text  = $t.Desc
    $tip = New-Object System.Windows.Controls.TextBlock
    $tip.Text = "What this changes:`n`n" + (Get-TweakChangeText $t); $tip.FontFamily = 'Consolas'; $tip.FontSize = 11.5; $tip.MaxWidth = 720; $tip.TextWrapping = 'Wrap'
    $card.FindName('Info').ToolTip = $tip
    $desc = New-Object System.Windows.Controls.TextBlock; $desc.Text = $t.Desc; $desc.MaxWidth = 420; $desc.TextWrapping = 'Wrap'
    $card.FindName('Desc').ToolTip = $desc
    $tags = $card.FindName('Tags')
    $list = @(); if ($t.Rec) { $list += 'Recommended' }; $list += @($t.Tags)
    foreach ($tg in ($list | Select-Object -First 3)) { [void]$tags.Children.Add((New-TagEl $tg)) }
    $imp = $card.FindName('Impact')
    switch ($t.Impact) {
        'High'   { $imp.Text = [string][char]0x25CF + [char]0x25CF + [char]0x25CF + '  High impact';   $imp.Foreground = Brush '#FFFFFF' }
        'Medium' { $imp.Text = [string][char]0x25CF + [char]0x25CF + [char]0x25CB + '  Medium impact'; $imp.Foreground = Brush '#CFCFCF' }
        default  { $imp.Text = [string][char]0x25CF + [char]0x25CB + [char]0x25CB + '  Low impact';    $imp.Foreground = Brush '#7A7A7A' }
    }
    $toggle = $card.FindName('Toggle')
    $toggle.Tag = $t.Id
    $toggle.Add_Click({ param($s, $e) Invoke-Safe { Invoke-TweakToggle $s } })
    $script:Cards[$t.Id] = @{ Card = $card; Toggle = $toggle; Status = $card.FindName('Status') }
    return $card
}

function Update-Card($t) {
    $c = $script:Cards[$t.Id]; if (-not $c) { return }
    $st = $script:State[$t.Id]
    $c.Toggle.IsChecked = ($st -eq 'On')
    $c.Toggle.IsEnabled = ($st -ne 'NA') -and -not ($t.Appx -and $st -eq 'On')
    switch ($st) {
        'On'    { $c.Status.Text = if ($t.Appx) { 'Removed' } else { 'Active' }; $c.Status.Foreground = Brush '#22D3EE'; $c.Card.Opacity = 1 }
        'NA'    { $c.Status.Text = 'Not needed on this PC'; $c.Status.Foreground = Brush '#6A6A6A'; $c.Card.Opacity = 0.6 }
        default { $c.Status.Text = 'Activate'; $c.Status.Foreground = Brush '#8A8A8A'; $c.Card.Opacity = 1 }
    }
}

function Build-TweakCards {
    $ui.TweakGrid.Children.Clear()
    foreach ($t in $script:Tweaks) { [void]$ui.TweakGrid.Children.Add((New-TweakCard $t)) }

    $script:Chips = @{}
    $ui.ChipPanel.Children.Clear()
    $defs = @('All', 'Recommended', 'Active', 'FPS & Latency', 'GPU & Display', 'Power & CPU', 'Registry', 'Memory & Storage', 'Network & Ping', 'Debloat', 'Privacy', 'Quality of Life', 'Advanced')
    foreach ($d in $defs) {
        $rb = New-Object System.Windows.Controls.RadioButton
        $rb.Style = $Window.FindResource('Chip'); $rb.Tag = $d; $rb.Content = $d
        if ($d -eq 'All') { $rb.IsChecked = $true }
        $rb.Add_Checked({ param($s, $e) $script:Filter = [string]$s.Tag; Update-Filter; $ui.TweakScroll.ScrollToTop() })
        [void]$ui.ChipPanel.Children.Add($rb)
        $script:Chips[$d] = $rb
    }
}

function Test-Visible($t) {
    if ($t.Only -and -not (Test-OnlyOk $t)) { return $false }
    if ($t.Cat -eq 'Advanced' -and -not $script:Settings.ShowAdvanced) { return $false }
    return $true
}

function Update-Filter {
    $q = "$($ui.SearchBox.Text)".Trim()
    foreach ($t in $script:Tweaks) {
        $c = $script:Cards[$t.Id]; if (-not $c) { continue }
        $vis = (Test-Visible $t) -and (Test-InTab $t)
        if ($vis) {
            switch ($script:Filter) {
                'All'         { }
                'Recommended' { $vis = [bool]$t.Rec }
                'Active'      { $vis = ($script:State[$t.Id] -eq 'On') }
                default       { $vis = ($t.Cat -eq $script:Filter) }
            }
        }
        if ($vis -and $q) { $vis = ($t.Name -like "*$q*") -or ($t.Desc -like "*$q*") -or ($t.Cat -like "*$q*") -or ($t.Kind -like "*$q*") }
        $c.Card.Visibility = if ($vis) { 'Visible' } else { 'Collapsed' }
    }
}

function Update-ChipCounts {
    $vis = @($script:Tweaks | Where-Object { (Test-Visible $_) -and (Test-InTab $_) })
    foreach ($k in $script:Chips.Keys) {
        $n = switch ($k) {
            'All'         { $vis.Count }
            'Recommended' { @($vis | Where-Object { $_.Rec }).Count }
            'Active'      { @($vis | Where-Object { $script:State[$_.Id] -eq 'On' }).Count }
            default       { @($vis | Where-Object { $_.Cat -eq $k }).Count }
        }
        $script:Chips[$k].Content = "$k  $([char]0x00B7)  $n"
        $script:Chips[$k].Visibility = if ($n -eq 0 -and $k -ne 'Active') { 'Collapsed' } else { 'Visible' }
    }
}

function Update-AllStates([switch]$Progress) {
    $i = 0; $n = $script:Tweaks.Count
    foreach ($t in $script:Tweaks) {
        $i++
        if ($Progress -and ($i % 4 -eq 0)) { $ui.OverlayText.Text = "Checking: $($t.Name)"; $ui.OverlayBar.Value = 40 + 55 * $i / $n; Update-UI }
        $script:State[$t.Id] = Test-Tweak $t
        Update-Card $t
    }
    Update-ChipCounts
    Update-Filter
    Update-Dashboard
}

$script:NeedReboot = $false
function Set-RebootFlag($t) {
    if (@($t.Tags) -contains 'Reboot') { $script:NeedReboot = $true; $ui.RebootBanner.Visibility = 'Visible' }
}

function Test-ShouldConfirm($t) {
    if (-not $script:Settings.ConfirmRisky) { return $false }
    return ($t.Risk -eq 'Risky' -or $t.Risk -eq 'Moderate' -or (@($t.Tags) | Where-Object { $_ -in 'Feature Breaking', 'Security Risk', 'Not Reversible' }))
}

function Invoke-TweakToggle($tg) {
    $t = Get-Tweak ([string]$tg.Tag)
    if (-not $t) { return }
    $want = [bool]$tg.IsChecked
    if ($want) {
        if (Test-ShouldConfirm $t) {
            $warn = @()
            if (@($t.Tags) -contains 'Security Risk') { $warn += 'SECURITY TRADE-OFF: this lowers protection against some attacks.' }
            if (@($t.Tags) -contains 'Feature Breaking') { $warn += 'This turns off a Windows feature you may use.' }
            if (@($t.Tags) -contains 'Not Reversible') { $warn += 'Removed apps can only be restored by reinstalling them from the Microsoft Store.' }
            if ($t.Risk -eq 'Moderate') { $warn += 'This is an advanced tweak - test your games afterwards and revert if anything feels worse.' }
            if (-not (Ask ("Enable '$($t.Name)'?`n`n$($t.Desc)`n`n" + ($warn -join "`n")) 'Warning')) { $tg.IsChecked = $false; return }
        }
        if (-not (Confirm-RestorePoint)) { $tg.IsChecked = $false; return }
        Show-Busy 'Applying optimization' $t.Name 50
        Invoke-ApplyTweak $t
    } else {
        if ($t.Appx) {
            [System.Windows.MessageBox]::Show($Window, "These apps were uninstalled. To get any of them back, open the Microsoft Store and install it again.", 'Frenzy Tweaks', 'OK', 'Information') | Out-Null
            $tg.IsChecked = $true; return
        }
        Show-Busy 'Reverting optimization' $t.Name 50
        Invoke-RevertTweak $t
    }
    $script:State[$t.Id] = Test-Tweak $t
    if ($t.Id -eq 'pwr_plan') { foreach ($x in $script:Tweaks | Where-Object { $_.Pow }) { $script:State[$x.Id] = Test-Tweak $x; Update-Card $x } }
    Hide-Busy
    Update-Card $t; Update-ChipCounts; Update-Filter; Update-Dashboard; Update-BackupInfo
    $on = ($script:State[$t.Id] -eq 'On')
    if ($want -and $on) {
        Set-RebootFlag $t
        $extra = if (@($t.Tags) -contains 'Reboot') { ' Restart to finish.' } elseif (@($t.Tags) -contains 'Sign-out') { ' Sign out or restart to see it.' } else { '' }
        Show-Toast "$($t.Name) enabled.$extra"
    } elseif ($want -and -not $on) {
        Show-Toast "$($t.Name) could not be fully applied - see the log in Backups." 'warn'
    } else {
        Set-RebootFlag $t
        Show-Toast "$($t.Name) reverted." 'info'
    }
}

function Invoke-ApplyRecommended {
    $list = @($script:Tweaks | Where-Object { $_.Rec -and $_.Risk -ne 'Risky' -and ($script:LatencyFpsIds -contains $_.Id) -and -not $_.Appx -and -not $_.Svc -and -not $_.Tasks -and $script:State[$_.Id] -eq 'Off' -and (Test-Visible $_) })
    if ($list.Count -eq 0) { Show-Toast 'All recommended low-latency and FPS tweaks are already active.'; return }
    $fb = @($list | Where-Object { @($_.Tags) -contains 'Feature Breaking' -or @($_.Tags) -contains 'Not Reversible' } | ForEach-Object { "  - $($_.Name)" })
    $msg = "Apply $($list.Count) recommended low-latency and FPS tweaks for this PC?"
    if ($fb.Count) { $msg += "`n`nThese ones remove or turn off Windows features:`n" + ($fb -join "`n") + "`n`n(You can still toggle any of them back afterwards, except removed apps.)" }
    $msg += "`n`nOnly latency and FPS tweaks are included. No Microsoft apps are removed, no services are disabled and nothing is cleaned up."
    if (-not (Ask $msg)) { return }
    if (-not (Confirm-RestorePoint)) { return }
    $i = 0
    foreach ($t in $list) {
        $i++
        Show-Busy 'Applying low-latency and FPS tweaks' "$i of $($list.Count)  -  $($t.Name)" ([int](100 * $i / $list.Count))
        try { Invoke-ApplyTweak $t; Set-RebootFlag $t } catch { Write-Log "  failed $($t.Id): $($_.Exception.Message)" }
    }
    Show-Busy 'Almost done' 'Re-checking every optimization...' 40
    Update-AllStates -Progress
    Hide-Busy; Update-BackupInfo
    Show-Toast "$($list.Count) optimizations applied. Restart your PC to get the full effect."
}

function Invoke-RevertAll {
    $ids = @($script:Backup.Keys)
    $list = @($script:Tweaks | Where-Object { $ids -contains $_.Id -and -not $_.Appx })
    [array]::Reverse($list)
    $hasSvc = $script:Backup.ContainsKey('custom_services')
    if ($list.Count -eq 0 -and -not $hasSvc) { Show-Toast 'Nothing to revert - Frenzy Tweaks has no active changes.' 'info'; return }
    if (-not (Ask "Revert all $($list.Count) Frenzy Tweaks tweaks and restore your original Windows settings?`n`n(Removed Store apps are not reinstalled automatically.)" 'Warning')) { return }
    if ($hasSvc) { Restore-CustomServices }
    $i = 0
    foreach ($t in $list) {
        $i++
        Show-Busy 'Reverting optimizations' "$i of $($list.Count)  -  $($t.Name)" ([int](100 * $i / $list.Count))
        try { Invoke-RevertTweak $t; Set-RebootFlag $t } catch { Write-Log "  revert failed $($t.Id): $($_.Exception.Message)" }
    }
    Show-Busy 'Almost done' 'Re-checking every optimization...' 40
    Update-AllStates -Progress
    Hide-Busy; Update-BackupInfo
    Show-Toast 'All tweaks reverted. Restart your PC to complete.' 'info'
}

# ================================================================ DASHBOARD
$RecRowXaml = @'
<Border %NS% CornerRadius="10" Background="#111111" Padding="16,12" Margin="0,0,0,8">
  <Grid>
    <Grid.ColumnDefinitions><ColumnDefinition Width="*"/><ColumnDefinition Width="Auto"/></Grid.ColumnDefinitions>
    <StackPanel Margin="0,0,16,0">
      <StackPanel Orientation="Horizontal">
        <TextBlock x:Name="Name" FontSize="14" FontWeight="SemiBold" Foreground="#F2F5F8"/>
        <TextBlock x:Name="Gain" FontSize="12" Foreground="#F2F2F2" Margin="10,1,0,0" VerticalAlignment="Center"/>
      </StackPanel>
      <TextBlock x:Name="Desc" FontSize="12" Foreground="#8A8A8A" TextTrimming="CharacterEllipsis" Margin="0,4,0,0"/>
    </StackPanel>
    <ToggleButton x:Name="Toggle" Grid.Column="1" Style="{DynamicResource Switch}" VerticalAlignment="Center"/>
  </Grid>
</Border>
'@

function Get-Score {
    $tot = 0; $got = 0
    foreach ($t in $script:Tweaks) {
        if (-not $t.Rec -or $t.Risk -eq 'Risky' -or -not (Test-Visible $t)) { continue }
        $st = $script:State[$t.Id]; if ($st -eq 'NA' -or -not $st) { continue }
        $w = $ImpactW[$t.Impact]; $tot += $w; if ($st -eq 'On') { $got += $w }
    }
    if ($tot -eq 0) { return @{ Score = 100; Total = 1 } }
    return @{ Score = [math]::Round(100 * $got / $tot); Total = $tot }
}

$script:ScoreShown = 0.0; $script:ScoreTarget = 0.0
function Set-Arc([double]$Pct) {
    if ($Pct -le 0.3) { $ui.ScoreArc.Data = $null; return }
    $Pct = [math]::Min($Pct, 99.9)
    $r = 78.0; $cx = 85.0; $cy = 85.0
    $ang = 360.0 * $Pct / 100.0; $rad = ($ang - 90.0) * [math]::PI / 180.0
    $x = $cx + $r * [math]::Cos($rad); $y = $cy + $r * [math]::Sin($rad)
    $large = if ($ang -gt 180) { 1 } else { 0 }
    $d = [string]::Format([Globalization.CultureInfo]::InvariantCulture, 'M {0},{1} A {2},{2} 0 {3} 1 {4:0.###},{5:0.###}', $cx, ($cy - $r), $r, $large, $x, $y)
    $ui.ScoreArc.Data = [System.Windows.Media.Geometry]::Parse($d)
}
$script:ScoreTimer = New-Object System.Windows.Threading.DispatcherTimer
$script:ScoreTimer.Interval = [TimeSpan]::FromMilliseconds(16)
$script:ScoreTimer.Add_Tick({
    $diff = $script:ScoreTarget - $script:ScoreShown
    if ([math]::Abs($diff) -lt 0.4) { $script:ScoreShown = $script:ScoreTarget; $script:ScoreTimer.Stop() }
    else { $script:ScoreShown += $diff * 0.10 }
    Set-Arc $script:ScoreShown
    $ui.ScoreText.Text = ('{0:0}%' -f $script:ScoreShown)
})

function Update-Dashboard {
    $sc = Get-Score
    $script:ScoreTarget = [double]$sc.Score
    $script:ScoreTimer.Start()
    $left = @($script:Tweaks | Where-Object { $_.Rec -and $_.Risk -ne 'Risky' -and $script:State[$_.Id] -eq 'Off' -and (Test-Visible $_) })
    $active = @($script:Tweaks | Where-Object { $script:State[$_.Id] -eq 'On' -and (Test-Visible $_) })
    $ui.HeroCount.Text = "$($left.Count)"
    if ($sc.Score -ge 97) { $ui.HeroTitle.Text = 'Fully optimized. Nice.'; $ui.HeroSub.Text = 'Every recommended optimization for this PC is active. Check Boost Up for the GPU settings that still matter.' }
    elseif ($sc.Score -ge 70) { $ui.HeroTitle.Text = 'Almost there. Enhance your PC to the max'; $ui.HeroSub.Text = 'A few more recommended tweaks are waiting - each one removes overhead or latency.' }
    else { $ui.HeroTitle.Text = 'Your PC could run smoother'; $ui.HeroSub.Text = "Windows is running with default settings that waste CPU time and add latency on a 4-core system like yours." }
    $ui.StatActive.Text = "$($active.Count)"
    $ui.StatLeft.Text   = "$($left.Count)"
    $ui.StatTotal.Text  = "$(@($script:Tweaks | Where-Object { Test-Visible $_ }).Count)"
    $ui.BtnApplyAllRec.Content = if ($left.Count) { "Apply all $($left.Count) recommendations" } else { 'All recommendations applied' }
    $ui.BtnApplyAllRec.IsEnabled = ($left.Count -gt 0)
    $ui.BtnApplyRec.IsEnabled = ($left.Count -gt 0)
    $ui.BtnTweaksApplyRec.IsEnabled = ($left.Count -gt 0)
    $ui.TweakSummary.Text = "$(@($script:Tweaks | Where-Object { Test-Visible $_ }).Count) optimizations  $([char]0x00B7)  $($active.Count) active  $([char]0x00B7)  $($left.Count) recommended left  $([char]0x00B7)  hover the (i) icon on a card to see exactly what it changes"

    $ui.RecList.Children.Clear()
    $top = $left | Sort-Object @{ Expression = { $ImpactW[$_.Impact] }; Descending = $true } | Select-Object -First 6
    if (-not $top) {
        $tb = New-Object System.Windows.Controls.TextBlock; $tb.Text = 'Nothing left - every recommended optimization is active.'; $tb.Foreground = Brush '#8A8A8A'; $tb.Margin = '0,0,0,8'
        [void]$ui.RecList.Children.Add($tb)
    }
    foreach ($t in $top) {
        $row = New-El $RecRowXaml
        $row.FindName('Name').Text = $t.Name
        $row.FindName('Gain').Text = ('+{0:0.0}% score' -f (100.0 * $ImpactW[$t.Impact] / $sc.Total))
        $row.FindName('Desc').Text = $t.Desc
        $tg = $row.FindName('Toggle'); $tg.Tag = $t.Id
        $tg.Add_Click({ param($s, $e) Invoke-Safe { Invoke-TweakToggle $s } })
        [void]$ui.RecList.Children.Add($row)
    }
}

# ================================================================ SCANNER PAGE
$SpecXaml = @'
<Border %NS% CornerRadius="12" Background="#0E0E0E" BorderBrush="#1C1C1C" BorderThickness="1" Margin="0,0,14,14" Padding="20,18">
  <StackPanel>
    <StackPanel Orientation="Horizontal">
      <Border Width="34" Height="34" CornerRadius="9" Background="#1F1F1F">
        <TextBlock x:Name="Glyph" FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" FontSize="16" Foreground="#F2F2F2" HorizontalAlignment="Center" VerticalAlignment="Center"/>
      </Border>
      <TextBlock x:Name="Label" Foreground="#8A8A8A" FontSize="11" FontWeight="Bold" VerticalAlignment="Center" Margin="12,0,0,0"/>
    </StackPanel>
    <TextBlock x:Name="Main" FontSize="16" FontWeight="SemiBold" Foreground="#F3F6F9" Margin="0,14,0,10" TextWrapping="Wrap"/>
    <StackPanel x:Name="Rows"/>
  </StackPanel>
</Border>
'@
$HealthXaml = @'
<Border %NS% CornerRadius="10" Background="#0E0E0E" BorderBrush="#1C1C1C" BorderThickness="1" Margin="0,0,14,12" Padding="16,14">
  <Grid>
    <Grid.ColumnDefinitions><ColumnDefinition Width="Auto"/><ColumnDefinition Width="*"/></Grid.ColumnDefinitions>
    <TextBlock x:Name="Icon" FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" FontSize="16" Margin="0,2,14,0" VerticalAlignment="Top"/>
    <StackPanel Grid.Column="1">
      <TextBlock x:Name="Title" FontSize="13.5" FontWeight="SemiBold" Foreground="#F2F5F8" TextWrapping="Wrap"/>
      <TextBlock x:Name="Text" FontSize="12" Foreground="#8A8A8A" TextWrapping="Wrap" Margin="0,4,0,0" LineHeight="17"/>
    </StackPanel>
  </Grid>
</Border>
'@

function Add-SpecCard([int]$Glyph, [string]$Label, [string]$Main, [object[]]$Rows) {
    $c = New-El $SpecXaml
    $c.FindName('Glyph').Text = [string][char]$Glyph
    $c.FindName('Label').Text = $Label
    $c.FindName('Main').Text = $Main
    $rp = $c.FindName('Rows')
    foreach ($r in $Rows) {
        $g = New-Object System.Windows.Controls.Grid; $g.Margin = '0,0,0,6'
        $k = New-Object System.Windows.Controls.TextBlock; $k.Text = [string]$r[0]; $k.Foreground = Brush '#7A7A7A'; $k.FontSize = 12.5
        $v = New-Object System.Windows.Controls.TextBlock; $v.Text = [string]$r[1]; $v.Foreground = Brush '#D5DDE7'; $v.FontSize = 12.5
        $v.HorizontalAlignment = 'Right'; $v.TextTrimming = 'CharacterEllipsis'; $v.Margin = '110,0,0,0'; $v.TextAlignment = 'Right'; $v.ToolTip = [string]$r[1]
        [void]$g.Children.Add($k); [void]$g.Children.Add($v)
        [void]$rp.Children.Add($g)
    }
    [void]$ui.ScanGrid.Children.Add($c)
}

function Show-ScanResults {
    $s = $script:SysInfo
    $ui.ScanGrid.Children.Clear()
    Add-SpecCard 0xE950 'PROCESSOR' $s.CpuName @(
        @('Cores / threads', "$($s.CpuCores) / $($s.CpuThreads)"), @('Base clock', ('{0:N2} GHz' -f ($s.CpuClock / 1000))),
        @('L3 cache', $s.CpuL3), @('Socket', $s.CpuSocket))
    Add-SpecCard 0xE7FC 'GRAPHICS' $s.GpuName @(
        @('Video memory', $s.GpuVram), @('Driver', $s.GpuDriver),
        @('Driver date', $(if ($s.GpuDriverDate) { ([datetime]$s.GpuDriverDate).ToString('yyyy-MM-dd') } else { '-' })),
        @('MSI-capable', $(if ($s.GpuInstanceId) { 'Yes (Pascal)' } else { '-' })))
    Add-SpecCard 0xE8F1 'MEMORY' "$($s.RamTotal) $($s.RamType)" @(
        @('Speed', $s.RamSpeed), @('Modules', "$($s.RamSticks) of $($s.RamSlots) slots"), @('Mode', $s.RamChannel), @('Manufacturer', $s.RamMaker))
    $diskRows = @(); foreach ($d in $s.Disks) { $diskRows += , @("$($d.Type)  $($d.Size)", $d.Name) }
    Add-SpecCard 0xEDA2 'STORAGE' "$($s.StorageTotal) total" ($diskRows + , @('Windows drive', "$($env:SystemDrive) on $($s.SystemDiskType)"))
    $volRows = @(); foreach ($v in $s.Volumes) { $volRows += , @("$($v.Letter) $($v.Label)", ('{0} free of {1}' -f (Format-Bytes $v.Free), (Format-Bytes $v.Size))) }
    Add-SpecCard 0xE8B7 'VOLUMES' "$(@($s.Volumes).Count) drive letter(s)" $volRows
    Add-SpecCard 0xE770 'OPERATING SYSTEM' "$($s.OsName)" @(
        @('Version', "$($s.OsVer)"), @('Build', "$($s.Build).$($s.UBR)"), @('Uptime', $s.Uptime), @('Computer', $s.Computer))
    Add-SpecCard 0xE7F4 'DISPLAY' $(if ($s.ResX) { "$($s.ResX) x $($s.ResY)" } else { 'Unknown' }) @(
        @('Refresh rate', $(if ($s.Refresh) { "$($s.Refresh) Hz" } else { '-' })), @('Output', $s.GpuName))
    Add-SpecCard 0xE9D9 'MOTHERBOARD' $s.Board @( , @('BIOS', $s.Bios) )
    Add-SpecCard 0xE945 'POWER & SECURITY' $s.PowerPlan @(
        @('Memory Integrity', $(if ($s.HvciOn) { 'On (costs FPS)' } else { 'Off' })), @('Startup apps', "$($s.StartupCount)"), @('Processes', "$($s.ProcCount)"))

    $ui.HealthList.Children.Clear()
    foreach ($h in (Get-HealthChecks)) {
        $r = New-El $HealthXaml
        $ic = $r.FindName('Icon')
        if ($h.Ok) { $ic.Text = [string][char]0xE73E; $ic.Foreground = Brush '#FFFFFF' } else { $ic.Text = [string][char]0xE7BA; $ic.Foreground = Brush '#F5A524' }
        $r.FindName('Title').Text = $h.Title
        $r.FindName('Text').Text = $h.Text
        [void]$ui.HealthList.Children.Add($r)
    }

    if ($s.Match) {
        $ui.ProfileText.Text = [string][char]0x2713 + '  Profile matched: i5-6500 + GT 1030 + 32 GB'
        $ui.ProfileBadge.Background = Brush '#101A13'; $ui.ProfileBadge.BorderBrush = Brush '#333333'; $ui.ProfileText.Foreground = Brush '#E0E0E0'
        $ui.DashMatch.Text = [string][char]0x25CF + ' Tuned profile active'
        $ui.TitleProfile.Text = 'tuned for i5-6500  +  GT 1030  +  32 GB'
    } else {
        $ui.ProfileText.Text = 'Different hardware detected - tweaks adapt automatically'
        $ui.ProfileBadge.Background = Brush '#1F1F1F'; $ui.ProfileBadge.BorderBrush = Brush '#333333'; $ui.ProfileText.Foreground = Brush '#CFCFCF'
        $ui.DashMatch.Text = ''
        $ui.TitleProfile.Text = $s.CpuName
    }
    $ui.ScanSub.Text = "Scanned $(Get-Date -Format 'HH:mm')  $([char]0x00B7)  $($s.Computer)"

    $ui.DashCpu.Text = $s.CpuName
    $ui.DashGpu.Text = "$($s.GpuName)  $([char]0x00B7)  $($s.GpuVram)"
    $ui.DashRam.Text = "$($s.RamTotal) $($s.RamType) $($s.RamSpeed)  $([char]0x00B7)  $($s.StorageTotal) storage  $([char]0x00B7)  $($s.OsName)"
    $ui.StatProcs.Text = "$($s.ProcCount)"

    $gpuNote = if ($s.GpuName -match '1030') {
        "Your GeForce GT 1030 ($($s.GpuVram)) is the main FPS limiter - the i5-6500 and 32 GB of RAM could feed a much faster card. Frenzy Tweaks strips Windows overhead, background activity and input latency so every cycle goes to your game; expect the biggest gains in smoothness and 1% lows, and in CPU-heavy games. For large jumps in average FPS, lower resolution / render scale and textures (see Boost Up). A low-profile GTX 1650 (75 W, no power cable needed) is the classic drop-in upgrade for this kind of PC."
    } else {
        "Frenzy Tweaks removes Windows overhead, background activity and input latency. Your graphics card ($($s.GpuName)) still sets the FPS ceiling in most games - in-game settings (resolution, textures, shadows) decide how close you get to it."
    }
    if ($s.SystemIsHDD) { $gpuNote += "`n`nWindows is on a hard drive: moving Windows and your most-played games to an SSD will cut loading stutter more than any tweak." }
    $ui.InsightText.Text = $gpuNote
}

# Apply Recommended only ever touches these latency / FPS tweaks.
# No app removal, no service changes, no cleanups, no privacy/debloat, no security trade-offs.
$script:LatencyFpsIds = @(
    'pwr_plan','pwr_coreparking','pwr_minstate','pwr_boost','pwr_epp','pwr_usb','pwr_aspm','pwr_diskidle','fps_powerthrottle',
    'fps_gamemode','fps_gamedvr','fps_hpet','fps_mouse','fps_keyboard',
    'gpu_hags','gpu_mpo','gpu_winopt',
    'reg_mmcss_games','reg_sysresp','reg_priosep','reg_timerres','reg_pagingexec',
    'mem_compression','net_nagle','net_throttle','net_nicpower'
)

function Set-AdaptiveRecommendations {
    $s = $script:SysInfo
    $t = Get-Tweak 'mem_sysmain'
    if ($s.SystemIsSSD) { $t.Rec = $true; $t.Desc += ' Detected: Windows is on an SSD - recommended.' }
    elseif ($s.SystemIsHDD) { $t.Rec = $false; $t.Desc += ' Detected: Windows is on a hard drive - keep SysMain ON.' }
    $t = Get-Tweak 'pwr_diskidle'
    if (-not (@($s.Disks) | Where-Object { $_.Type -eq 'HDD' })) { $t.Rec = $false; $t.Desc = 'Prevents Windows from spinning down hard drives. No hard drive was detected in this PC, so this is optional.' }
    $t = Get-Tweak 'mem_compression'
    if ($s.RamBytes -lt 15GB) { $t.Rec = $false }
    $t = Get-Tweak 'adv_vbs'
    if (-not $s.HvciOn) { $t.Desc += ' (Currently not running on this PC.)' }
    # keep "Recommended" limited to latency / FPS tweaks (badges, counts, score and the button all agree)
    foreach ($x in $script:Tweaks) {
        if ($x.Rec -and (($script:LatencyFpsIds -notcontains $x.Id) -or $x.Appx -or $x.Svc -or $x.Tasks)) { $x.Rec = $false }
    }
}

# ================================================================ BOOST PAGE
$BoostXaml = @'
<Border %NS% CornerRadius="12" Background="#0E0E0E" BorderBrush="#1C1C1C" BorderThickness="1" Margin="0,0,14,14" Padding="20,18" Height="178">
  <Grid>
    <Grid.RowDefinitions><RowDefinition Height="Auto"/><RowDefinition Height="*"/><RowDefinition Height="Auto"/></Grid.RowDefinitions>
    <StackPanel Orientation="Horizontal">
      <Border Width="34" Height="34" CornerRadius="9" Background="#1F1F1F">
        <TextBlock x:Name="Glyph" FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" FontSize="16" Foreground="#F2F2F2" HorizontalAlignment="Center" VerticalAlignment="Center"/>
      </Border>
      <TextBlock x:Name="Title" FontSize="15" FontWeight="SemiBold" Foreground="#F3F6F9" VerticalAlignment="Center" Margin="12,0,0,0"/>
    </StackPanel>
    <TextBlock x:Name="Desc" Grid.Row="1" FontSize="12" Foreground="#8A8A8A" TextWrapping="Wrap" TextTrimming="WordEllipsis" Margin="0,10,0,0" LineHeight="17"/>
    <Button x:Name="Run" Grid.Row="2" Style="{DynamicResource GhostBtn}" HorizontalAlignment="Left" Padding="14,6"/>
  </Grid>
</Border>
'@

$BoostActions = @(
    @{ Key = 'fullclean'; G = 0xE74D; T = 'Full cleanup'; B = 'Run all'; D = 'One click, live loader: temp files, update downloads, crash dumps, thumbnails, shader caches, browser caches and the Recycle Bin. Asks first.' }
    @{ Key = 'pickapps'; G = 0xE74C; T = 'Remove Microsoft apps'; B = 'Choose apps'; D = 'Pick exactly which Microsoft Store apps to uninstall. Xbox apps are flagged with a warning. Restore point first.' }
    @{ Key = 'picksvc';  G = 0xE713; T = 'Disable services'; B = 'Choose services'; D = 'Pick optional Windows services to turn off. Xbox services are flagged. Originals are saved so you can revert.' }
    @{ Key = 'browser';  G = 0xE774; T = 'Clear browser caches'; B = 'Clear'; D = 'Chrome, Edge, Brave and Firefox cache files only. Passwords, cookies and history stay.' }
    @{ Key = 'recycle';  G = 0xE74D; T = 'Empty Recycle Bin'; B = 'Empty'; D = 'Permanently deletes everything in the Recycle Bin on all drives. Asks first.' }
    @{ Key = 'thumbs';   G = 0xE91B; T = 'Clear thumbnail cache'; B = 'Clear'; D = 'Deletes the Explorer thumbnail cache. Windows rebuilds it as you browse folders.' }
    @{ Key = 'temp';     G = 0xE74D; T = 'Clean temp files';        B = 'Clean now';  D = 'Deletes temporary files, old Windows Update downloads and crash dumps. Frees space and speeds up file scans.' }
    @{ Key = 'deepclean'; G = 0xE894; T = 'Deep clean'; B = 'Deep clean'; D = 'Clears downloaded Windows Update files, the Delivery Optimization cache, crash dumps (including MEMORY.DMP) and error reports. Asks first, files in use are skipped.' }
    @{ Key = 'bgclose';  G = 0xE711; T = 'Close background apps';   B = 'Close apps'; D = 'Closes OneDrive, Teams, Edge, Phone Link, Widgets and similar apps before you launch a game. Asks first.' }
    @{ Key = 'ram'; G = 0xE945; T = 'Free up RAM'; B = 'Free RAM'; D = 'Empties app working sets and the standby list so more memory is free before a game. Windows refills the list as you play, so the gain is temporary.' }
    @{ Key = 'shader';   G = 0xE7FC; T = 'Reset shader cache';      B = 'Reset';      D = 'Clears NVIDIA and DirectX shader caches. Do this after a driver update if games stutter - shaders rebuild on first launch.' }
    @{ Key = 'prefetch'; G = 0xE81C; T = 'Clear Prefetch'; B = 'Clear'; D = 'Deletes the Prefetch app-launch cache. Windows rebuilds it, so the first start of each app is a bit slower. It does not raise FPS. Asks first.' }
    @{ Key = 'wureset'; G = 0xE895; T = 'Reset Windows Update cache'; B = 'Reset'; D = 'Stops the update services, empties the SoftwareDistribution folder and starts them again. Fixes stuck or failing updates. Update history is cleared. Asks first.' }
    @{ Key = 'printq'; G = 0xE749; T = 'Clear print queue'; B = 'Clear'; D = 'Cancels stuck print jobs by emptying the spooler queue and restarting the Print Spooler. Asks first.' }
    @{ Key = 'bloatscan'; G = 0xE721; T = 'Scan for bloatware'; B = 'Scan'; D = 'Looks for pre-installed apps that the Debloat tweaks can remove and lists what it finds. Nothing is changed until you pick tweaks in Optimize.' }
    @{ Key = 'dns';      G = 0xE774; T = 'Flush DNS cache';         B = 'Flush';      D = 'Clears cached DNS records. Fixes "can''t connect to server" errors after a game changes servers.' }
    @{ Key = 'explorer'; G = 0xE72C; T = 'Restart Explorer';        B = 'Restart';    D = 'Restarts the taskbar and desktop shell - clears a laggy taskbar or Start menu without a reboot.' }
    @{ Key = 'startup';  G = 0xE7E8; T = 'Startup apps';            B = 'Open';       D = 'Opens Task Manager on the Startup tab. Disable everything you do not need when Windows starts.' }
    @{ Key = 'defrag';   G = 0xEDA2; T = 'Optimize drives';         B = 'Open';       D = 'Opens Optimize Drives - defragments your hard drive(s) and TRIMs SSDs. Run it on the drive your games live on.' }
    @{ Key = 'cleanmgr'; G = 0xE8B7; T = 'Disk Cleanup';            B = 'Open';       D = 'Opens Windows Disk Cleanup for deeper cleaning such as old Windows Update and upgrade files.' }
    @{ Key = 'gfx';      G = 0xE7F4; T = 'Windows graphics settings'; B = 'Open';     D = 'Per-game GPU preference, HAGS and "Optimizations for windowed games" in Windows Settings.' }
)

function Build-BoostPage {
    $ui.BoostGrid.Children.Clear()
    foreach ($a in $BoostActions) {
        $c = New-El $BoostXaml
        $c.FindName('Glyph').Text = [string][char]$a.G
        $c.FindName('Title').Text = $a.T
        $c.FindName('Desc').Text = $a.D
        $b = $c.FindName('Run'); $b.Content = $a.B; $b.Tag = $a.Key
        $b.Add_Click({ param($s, $e) Invoke-Safe { Invoke-BoostAction ([string]$s.Tag) } })
        [void]$ui.BoostGrid.Children.Add($c)
    }


}

$CleanJob = {
    param($paths)
    $freed = [int64]0
    foreach ($p in $paths) {
        if (-not (Test-Path -LiteralPath $p)) { continue }
        Get-ChildItem -LiteralPath $p -Force -Recurse -File -ErrorAction SilentlyContinue | ForEach-Object {
            $len = $_.Length
            try { Remove-Item -LiteralPath $_.FullName -Force -ErrorAction Stop; $freed += $len } catch {}
        }
        Get-ChildItem -LiteralPath $p -Force -Recurse -Directory -ErrorAction SilentlyContinue | Sort-Object { $_.FullName.Length } -Descending | ForEach-Object {
            try { Remove-Item -LiteralPath $_.FullName -Force -ErrorAction Stop } catch {}
        }
    }
    $freed
}


# ---------------------------------------------------------------- cleanup helpers
function Stop-UpdateServices {
    $was = @()
    foreach ($n in 'wuauserv', 'UsoSvc', 'bits', 'dosvc') {
        $svc = Get-Service -Name $n -ErrorAction SilentlyContinue
        if ($svc -and $svc.Status -eq 'Running') { $was += $n; Stop-Service -Name $n -Force -ErrorAction SilentlyContinue }
    }
    return $was
}
function Start-UpdateServices($Was) {
    foreach ($n in 'dosvc', 'bits', 'UsoSvc', 'wuauserv') {
        if (@($Was) -contains $n) { Start-Service -Name $n -ErrorAction SilentlyContinue }
    }
}

function Invoke-RamPurge {
    if (-not ('FrenzyMemCleaner' -as [type])) {
        Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;
public class FrenzyMemCleaner
{
    [DllImport("ntdll.dll")]
    public static extern int NtSetSystemInformation(int infoClass, IntPtr info, int length);
    [DllImport("advapi32.dll", SetLastError = true)]
    public static extern bool OpenProcessToken(IntPtr processHandle, int desiredAccess, out IntPtr tokenHandle);
    [DllImport("advapi32.dll", SetLastError = true)]
    public static extern bool LookupPrivilegeValue(string systemName, string name, out long luid);
    [DllImport("advapi32.dll", SetLastError = true)]
    public static extern bool AdjustTokenPrivileges(IntPtr tokenHandle, bool disableAllPrivileges, ref TOKEN_PRIVILEGES newState, int bufferLength, IntPtr previousState, IntPtr returnLength);
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct TOKEN_PRIVILEGES { public int PrivilegeCount; public long Luid; public int Attributes; }
    private const int TOKEN_ADJUST_PRIVILEGES = 0x20;
    private const int TOKEN_QUERY = 0x8;
    private const int SE_PRIVILEGE_ENABLED = 0x2;
    private const int SystemMemoryListInformation = 80;
    public static void EnablePrivilege(string privilegeName)
    {
        IntPtr tokenHandle;
        OpenProcessToken(System.Diagnostics.Process.GetCurrentProcess().Handle, TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, out tokenHandle);
        TOKEN_PRIVILEGES tp = new TOKEN_PRIVILEGES();
        tp.PrivilegeCount = 1; tp.Attributes = SE_PRIVILEGE_ENABLED;
        LookupPrivilegeValue(null, privilegeName, out tp.Luid);
        AdjustTokenPrivileges(tokenHandle, false, ref tp, 0, IntPtr.Zero, IntPtr.Zero);
    }
    public static int Purge(int command)
    {
        IntPtr ptr = Marshal.AllocHGlobal(4);
        try { Marshal.WriteInt32(ptr, command); return NtSetSystemInformation(SystemMemoryListInformation, ptr, 4); }
        finally { Marshal.FreeHGlobal(ptr); }
    }
}
'@
    }
    [FrenzyMemCleaner]::EnablePrivilege('SeProfileSingleProcessPrivilege')
    [FrenzyMemCleaner]::EnablePrivilege('SeIncreaseQuotaPrivilege')
    $before = (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory / 1KB
    $rc1 = [FrenzyMemCleaner]::Purge(2)   # empty working sets
    $rc2 = [FrenzyMemCleaner]::Purge(4)   # purge standby list
    Start-Sleep -Seconds 1
    $after = (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory / 1KB
    return @{ Before = [math]::Round($before, 0); After = [math]::Round($after, 0); Ok = (($rc1 -eq 0) -and ($rc2 -eq 0)) }
}

function Invoke-BoostAction([string]$Key) {
    switch ($Key) {
        'temp' {
            $paths = @($env:TEMP, "$env:WINDIR\Temp", "$env:WINDIR\SoftwareDistribution\Download", "$env:LOCALAPPDATA\CrashDumps")
            $r = Invoke-Background -Title 'Cleaning temp files' -Text 'Deleting temporary files (files in use are skipped)...' -Script $CleanJob -Arguments (, $paths)
            $freed = [double](@($r) | Select-Object -Last 1)
            Write-Log "Temp clean freed $freed bytes"
            Show-Toast "Cleaned $(Format-Bytes $freed) of temporary files."
        }
        'shader' {
            if (-not (Ask "Reset the NVIDIA and DirectX shader caches?`n`nGames will rebuild their shaders the next time they start, so the first few minutes may stutter. Close your games first.")) { return }
            $paths = @("$env:LOCALAPPDATA\NVIDIA\DXCache", "$env:LOCALAPPDATA\NVIDIA\GLCache", "$env:LOCALAPPDATA\D3DSCache", "$env:ProgramData\NVIDIA Corporation\NV_Cache")
            $r = Invoke-Background -Title 'Resetting shader cache' -Text 'Deleting cached shaders...' -Script $CleanJob -Arguments (, $paths)
            Show-Toast "Shader cache reset ($(Format-Bytes ([double](@($r) | Select-Object -Last 1))) cleared)."
        }
        'bgclose' {
            $names = 'OneDrive', 'Teams', 'ms-teams', 'msedge', 'PhoneExperienceHost', 'YourPhone', 'Widgets', 'WidgetService', 'Cortana', 'SkypeApp', 'GoogleDriveFS', 'Dropbox', 'Copilot'
            $running = @(Get-Process -Name $names -ErrorAction SilentlyContinue)
            if ($running.Count -eq 0) { Show-Toast 'No common background apps are running.' 'info'; return }
            $list = ($running | Select-Object -ExpandProperty ProcessName -Unique) -join ', '
            if (-not (Ask "Close these background apps now?`n`n$list`n`nSave any open work in them first.")) { return }
            $running | Stop-Process -Force -ErrorAction SilentlyContinue
            Show-Toast "Closed: $list"
        }
        'deepclean' {
            if (-not (Ask "Run a deep clean?`n`nThis briefly stops the Windows Update services, then deletes:`n  - downloaded update files and the Delivery Optimization cache`n  - crash dumps (including MEMORY.DMP) and Windows error reports`n`nNone of it is needed to run Windows. Close your games first.")) { return }
            $was = @(Stop-UpdateServices)
            try {
                $paths = @("$env:WINDIR\SoftwareDistribution\Download", "$env:ProgramData\Microsoft\Windows\DeliveryOptimization\Cache", "$env:WINDIR\Minidump", "$env:WINDIR\LiveKernelReports", "$env:WINDIR\MEMORY.DMP", "$env:ProgramData\Microsoft\Windows\WER\ReportArchive", "$env:ProgramData\Microsoft\Windows\WER\ReportQueue", "$env:LOCALAPPDATA\CrashDumps", "$env:LOCALAPPDATA\Microsoft\Windows\WER")
                $r = Invoke-Background -Title 'Deep cleaning' -Text 'Deleting update caches, crash dumps and error reports (files in use are skipped)...' -Script $CleanJob -Arguments (, $paths)
            } finally { Start-UpdateServices $was }
            $freed = [double](@($r) | Select-Object -Last 1)
            Write-Log "Deep clean freed $freed bytes"
            Show-Toast "Deep clean finished - $(Format-Bytes $freed) reclaimed."
        }
        'prefetch' {
            if (-not (Ask "Clear the Prefetch folder?`n`nPrefetch only speeds up app launches a little. Windows rebuilds it by itself, so the first start of each app afterwards can be slightly slower. This does not raise FPS.")) { return }
            $r = Invoke-Background -Title 'Clearing Prefetch' -Text 'Deleting prefetch files...' -Script $CleanJob -Arguments (, @("$env:WINDIR\Prefetch"))
            $freed = [double](@($r) | Select-Object -Last 1)
            Write-Log "Prefetch clear freed $freed bytes"
            Show-Toast "Prefetch cleared ($(Format-Bytes $freed) removed)."
        }
        'wureset' {
            if (-not (Ask "Reset the Windows Update cache?`n`nThis stops the update services, empties C:\Windows\SoftwareDistribution (downloaded updates and the local update database), then starts the services again. Windows rebuilds it on the next update check and your update history list will be empty.`n`nUse it when updates are stuck or failing. Close your games first." 'Warning')) { return }
            $was = @(Stop-UpdateServices)
            try {
                $r = Invoke-Background -Title 'Resetting Windows Update' -Text 'Emptying the update cache (files in use are skipped)...' -Script $CleanJob -Arguments (, @("$env:WINDIR\SoftwareDistribution"))
            } finally { Start-UpdateServices $was }
            $freed = [double](@($r) | Select-Object -Last 1)
            Write-Log "Windows Update cache reset, freed $freed bytes"
            Show-Toast "Windows Update cache reset ($(Format-Bytes $freed) cleared). Check for updates once to rebuild it."
        }
        'printq' {
            if (-not (Ask "Clear the print queue?`n`nThis cancels every pending print job and restarts the Print Spooler.")) { return }
            $sp = Get-Service -Name 'Spooler' -ErrorAction SilentlyContinue
            $wasRunning = [bool]($sp -and $sp.Status -eq 'Running')
            if ($wasRunning) { Stop-Service -Name 'Spooler' -Force -ErrorAction SilentlyContinue }
            try {
                $r = Invoke-Background -Title 'Clearing print queue' -Text 'Deleting pending print jobs...' -Script $CleanJob -Arguments (, @("$env:WINDIR\System32\spool\PRINTERS"))
            } finally { if ($wasRunning) { Start-Service -Name 'Spooler' -ErrorAction SilentlyContinue } }
            Write-Log 'Print queue cleared'
            Show-Toast 'Print queue cleared.'
        }
        'ram' {
            Show-Busy 'Freeing RAM' 'Emptying working sets and the standby list...' 40
            try { $res = Invoke-RamPurge } finally { Hide-Busy }
            Write-Log "RAM purge: free $($res.Before) MB -> $($res.After) MB (ok=$($res.Ok))"
            if (-not $res.Ok) { Show-Toast 'Windows refused part of the RAM purge. Run Frenzy Tweaks as Administrator.' 'warn'; return }
            $gain = [int]$res.After - [int]$res.Before
            if ($gain -gt 0) { Show-Toast "Free RAM: $($res.Before) MB to $($res.After) MB (about $gain MB freed)." }
            else { Show-Toast 'Memory was already lean - nothing more to free.' 'info' }
        }
        'bloatscan' {
            $patterns = @($script:Tweaks | Where-Object { $_.Appx } | ForEach-Object { $_.Appx } | Select-Object -Unique)
            Show-Busy 'Scanning apps' 'Looking for removable pre-installed apps...' 40
            try { $installed = @(Get-AppxPackage -AllUsers -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Name -Unique) } finally { Hide-Busy }
            $found = @()
            foreach ($n in $installed) {
                foreach ($pat in $patterns) { if ($n -like $pat) { $found += $n; break } }
            }
            $found = @($found | Sort-Object -Unique)
            Write-Log "Bloatware scan: $($found.Count) removable app(s) found"
            if ($found.Count -eq 0) { Show-Toast 'No removable bloatware apps found - this PC is already clean.' 'info'; return }
            $list = ($found | Select-Object -First 25) -join "`n"
            $more = if ($found.Count -gt 25) { "`n...and $($found.Count - 25) more" } else { '' }
            if (Ask "Found $($found.Count) removable app(s):`n`n$list$more`n`nNothing was changed. Open the Optimize page now to choose which Debloat tweaks to apply?") { $ui.NavTweaks.IsChecked = $true }
        }
        'fullclean' { Invoke-FullCleanup }
        'pickapps'  { Invoke-PickApps }
        'picksvc'   { Invoke-PickServices }
        'browser'   { Invoke-BrowserClean }
        'recycle'   { Invoke-RecycleClean }
        'thumbs'    { $r = Invoke-Background -Title 'Clearing thumbnails' -Text 'Deleting thumbnail cache...' -Script $ThumbJob; Show-Toast "Thumbnail cache cleared ($(Format-Bytes ([double](@($r) | Select-Object -Last 1))))." }
        'dns'      { & ipconfig.exe /flushdns | Out-Null; Show-Toast 'DNS cache flushed.' }
        'explorer' { Restart-Explorer; Show-Toast 'Explorer restarted.' }
        'startup'  { Start-Process -FilePath 'taskmgr.exe' -ArgumentList '/0 /startup' }
        'defrag'   { Start-Process -FilePath "$env:WINDIR\System32\dfrgui.exe" }
        'cleanmgr' { Start-Process -FilePath "$env:WINDIR\System32\cleanmgr.exe" -ArgumentList "/d $($env:SystemDrive.TrimEnd(':'))" }
        'gfx'      { Start-Process 'ms-settings:display-advancedgraphics' }
    }
}

# ---------------------------------------------------------------- game priority
$IFEO = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options'
function Get-GameList {
    if (-not (Test-Path -LiteralPath $GamesFile)) { return @() }
    try { $j = Get-Content -LiteralPath $GamesFile -Raw | ConvertFrom-Json; return @($j | ForEach-Object { $_ } | Where-Object { $_ }) } catch { return @() }
}
function Save-GameList($list) { ConvertTo-Json -InputObject @($list) | Set-Content -LiteralPath $GamesFile -Encoding UTF8 }

function Show-Games {
    $ui.GameList.Children.Clear()
    $games = Get-GameList
    if ($games.Count -eq 0) {
        $tb = New-Object System.Windows.Controls.TextBlock; $tb.Text = 'No games added yet.'; $tb.Foreground = Brush '#6A6A6A'
        [void]$ui.GameList.Children.Add($tb); return
    }
    foreach ($g in $games) {
        $bd = New-Object System.Windows.Controls.Border; $bd.Background = Brush '#111111'; $bd.CornerRadius = '8'; $bd.Padding = '14,8,8,8'; $bd.Margin = '0,0,0,6'
        $grid = New-Object System.Windows.Controls.Grid
        $sp = New-Object System.Windows.Controls.StackPanel; $sp.Orientation = 'Horizontal'; $sp.VerticalAlignment = 'Center'
        $n = New-Object System.Windows.Controls.TextBlock; $n.Text = $g; $n.FontWeight = 'SemiBold'; $n.VerticalAlignment = 'Center'
        $p = New-Object System.Windows.Controls.TextBlock; $p.Text = 'High priority'; $p.Foreground = Brush '#CFCFCF'; $p.FontSize = 11.5; $p.Margin = '10,0,0,0'; $p.VerticalAlignment = 'Center'
        [void]$sp.Children.Add($n); [void]$sp.Children.Add($p)
        $b = New-Object System.Windows.Controls.Button; $b.Content = 'Remove'; $b.Style = $Window.FindResource('GhostBtn'); $b.Padding = '10,4'; $b.HorizontalAlignment = 'Right'; $b.Tag = $g
        $b.Add_Click({ param($s, $e) Invoke-Safe { Remove-Game ([string]$s.Tag) } })
        [void]$grid.Children.Add($sp); [void]$grid.Children.Add($b); $bd.Child = $grid
        [void]$ui.GameList.Children.Add($bd)
    }
}
function Add-Game {
    $exe = "$($ui.GameExe.Text)".Trim().Trim('"')
    if ($exe -match '[\\/]') { $exe = Split-Path $exe -Leaf }
    if ($exe -notmatch '\.exe$') { $exe += '.exe' }
    if ($exe -notmatch '^[\w\-\. \(\)\[\]]+\.exe$' -or $exe -in 'explorer.exe', 'svchost.exe', 'csrss.exe', 'dwm.exe', 'lsass.exe', 'winlogon.exe') { Show-Toast 'Enter a valid game .exe name, e.g. cs2.exe' 'warn'; return }
    Set-RegValue "$IFEO\$exe\PerfOptions" 'CpuPriorityClass' 'DWord' 3
    $list = @(Get-GameList | Where-Object { $_ -ne $exe }) + $exe
    Save-GameList $list
    Write-Log "Game priority: added $exe"
    $ui.GameExe.Text = ''
    Show-Games
    Show-Toast "$exe will now start with High CPU priority."
}
function Remove-Game([string]$exe) {
    $k = "$IFEO\$exe"
    Remove-Item -LiteralPath "$k\PerfOptions" -Recurse -Force -ErrorAction SilentlyContinue
    try {
        $item = Get-Item -LiteralPath $k -ErrorAction Stop
        if ($item.SubKeyCount -eq 0 -and $item.ValueCount -eq 0) { Remove-Item -LiteralPath $k -Force -ErrorAction SilentlyContinue }
    } catch {}
    Save-GameList @(Get-GameList | Where-Object { $_ -ne $exe })
    Write-Log "Game priority: removed $exe"
    Show-Games
    Show-Toast "$exe priority reset to normal." 'info'
}

# ================================================================ BACKUP / SETTINGS PAGES
function Update-BackupInfo {
    $n = $script:Backup.Count
    $ui.BackupInfo.Text = "$n tweak(s) have their original Windows values saved and can be restored exactly.`nStored in: $BackupFile"
    $ui.BtnRevertAll2.IsEnabled = ($n -gt 0)
    $ui.BtnRevertAll.IsEnabled = ($n -gt 0)
}
function Show-Log {
    if (Test-Path -LiteralPath $LogFile) { $ui.LogBox.Text = (Get-Content -LiteralPath $LogFile -Tail 300) -join "`r`n"; $ui.LogBox.ScrollToEnd() }
    else { $ui.LogBox.Text = 'No activity yet.' }
}

$ui.AboutText.Text = "Frenzy Extreme Panel $AppVersion - a Windows FPS and latency optimizer that scans your PC and adapts to your hardware.`n`n" +
    "It applies $($script:Tweaks.Count) individually reversible tweaks: power and CPU scheduling, GPU and display, registry/kernel settings, memory and storage, network latency, debloat and privacy. " +
    "Before changing anything it records the original value, and you can create a System Restore point at any time.`n`n" +
    "Honest note: no software can turn your graphics card into a faster one. These tweaks remove overhead, background activity and latency - the result is smoother frame times, fewer stutters and better 1% lows, with the largest FPS gains in CPU-heavy games. Pair them with the in-game settings on the Boost Up page.`n`n" +
    "Source: $RepoUrl`nData folder: $DataDir"

# ================================================================ LIVE STATS
$script:NvSmi = @("$env:WINDIR\System32\nvidia-smi.exe", "$env:ProgramFiles\NVIDIA Corporation\NVSMI\nvidia-smi.exe") | Where-Object { Test-Path -LiteralPath $_ } | Select-Object -First 1
$script:Tick = 0
$script:StatsTimer = New-Object System.Windows.Threading.DispatcherTimer
$script:StatsTimer.Interval = [TimeSpan]::FromSeconds(2)
$script:StatsTimer.Add_Tick({
    if ($ui.PageDashboard.Visibility -ne 'Visible' -or $ui.Overlay.Visibility -eq 'Visible' -or $Window.WindowState -eq 'Minimized') { return }
    $script:Tick++
    try {
        $cpu = (Get-CimInstance Win32_PerfFormattedData_PerfOS_Processor -Filter "Name='_Total'" -ErrorAction Stop).PercentProcessorTime
        $ui.CpuBar.Value = [double]$cpu; $ui.CpuPct.Text = "$cpu%"
        $os = Get-CimInstance Win32_OperatingSystem -ErrorAction Stop
        $usedPct = [math]::Round(100 * (1 - $os.FreePhysicalMemory / $os.TotalVisibleMemorySize))
        $usedGb = ($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / 1MB
        $ui.RamBar.Value = $usedPct; $ui.RamPct.Text = ('{0:N1} GB  ({1}%)' -f $usedGb, $usedPct)
    } catch {}
    if ($script:NvSmi -and ($script:Tick % 2 -eq 1)) {
        try {
            $o = (& $script:NvSmi --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total --format=csv,noheader,nounits 2>$null | Select-Object -First 1)
            $p = "$o" -split ',\s*'
            if ($p.Count -ge 4) {
                $ui.GpuBar.Value = [double]$p[0]
                $ui.GpuPct.Text = "$($p[0])%  $([char]0x00B7)  $($p[1]) $([char]0x00B0)C  $([char]0x00B7)  VRAM $($p[2]) / $($p[3]) MB"
            }
        } catch {}
    } elseif (-not $script:NvSmi) { $ui.GpuPct.Text = 'n/a (NVIDIA driver tools not found)' }
    if ($script:Tick % 10 -eq 0) { $ui.StatProcs.Text = "$(@(Get-Process).Count)" }
})

# ================================================================ EXTREME PANEL: TABS / PICKERS / FULL CLEANUP
$script:Tab = 'All'
$script:LatencyIds = @('fps_hpet', 'fps_dyntick', 'fps_mouse', 'fps_keyboard', 'pwr_usb', 'pwr_aspm', 'pwr_epp', 'gpu_msi', 'lat_tsc')

function Test-InTab($t) {
    $lat = ($script:LatencyIds -contains $t.Id) -or ($t.Cat -in 'Registry', 'Network & Ping', 'Memory & Storage')
    switch ($script:Tab) {
        'FPS'     { return ((-not $lat) -and ($t.Cat -in 'FPS & Latency', 'GPU & Display', 'Power & CPU', 'Advanced')) }
        'Latency' { return $lat }
        'Debloat' { return ($t.Cat -in 'Debloat', 'Privacy', 'Quality of Life') }
        default   { return $true }
    }
}

function Set-Tab([string]$NavName) {
    $map = @{ NavTweaks = 'All'; NavFps = 'FPS'; NavLatency = 'Latency'; NavDebloat = 'Debloat' }
    if (-not $map.ContainsKey($NavName)) { return }
    $script:Tab = $map[$NavName]
    $titles = @{ All = 'All Optimizations'; FPS = 'FPS Boost'; Latency = 'Latency'; Debloat = 'Debloat & Privacy' }
    $ui.TweakTitle.Text = $titles[$script:Tab]
    $ui.PickBar.Visibility = if ($script:Tab -eq 'Debloat') { 'Visible' } else { 'Collapsed' }
    $script:Filter = 'All'
    if ($script:Chips -and $script:Chips['All']) { $script:Chips['All'].IsChecked = $true }
    Update-ChipCounts; Update-Filter
    $ui.TweakScroll.ScrollToTop()
}

# ---------------------------------------------------------------- checklist dialog
$DlgXaml = @'
<Window %NS% Title="Frenzy Extreme Panel" Width="800" Height="780" MinWidth="640" MinHeight="520" WindowStartupLocation="CenterOwner"
        Background="#050505" Foreground="#E8E8E8" FontFamily="Segoe UI Variable Display, Segoe UI" FontSize="13" ShowInTaskbar="False">
  <Grid Margin="24,20,24,20">
    <Grid.RowDefinitions>
      <RowDefinition Height="Auto"/><RowDefinition Height="Auto"/><RowDefinition Height="Auto"/><RowDefinition Height="Auto"/><RowDefinition Height="*"/><RowDefinition Height="Auto"/>
    </Grid.RowDefinitions>
    <TextBlock x:Name="DT" FontSize="22" FontWeight="SemiBold" Foreground="#FFFFFF"/>
    <TextBlock x:Name="DS" Grid.Row="1" Foreground="#8A8A8A" TextWrapping="Wrap" Margin="0,6,0,12"/>
    <Border x:Name="DB" Grid.Row="2" Visibility="Collapsed" Background="#2A1215" BorderBrush="#5A2228" BorderThickness="1" CornerRadius="8" Padding="12,10" Margin="0,0,0,12">
      <TextBlock x:Name="DBT" Foreground="#FF8A8A" TextWrapping="Wrap"/>
    </Border>
    <Grid Grid.Row="3" Margin="0,0,0,10">
      <Grid.ColumnDefinitions><ColumnDefinition Width="*"/><ColumnDefinition Width="Auto"/></Grid.ColumnDefinitions>
      <TextBox x:Name="DQ" Style="{DynamicResource Input}"/>
      <StackPanel Grid.Column="1" Orientation="Horizontal" Margin="10,0,0,0">
        <Button x:Name="DAll" Content="Select all" Style="{DynamicResource GhostBtn}" Padding="12,6"/>
        <Button x:Name="DNone" Content="Clear" Style="{DynamicResource GhostBtn}" Padding="12,6" Margin="8,0,0,0"/>
      </StackPanel>
    </Grid>
    <Border Grid.Row="4" Background="#0E0E0E" BorderBrush="#1C1C1C" BorderThickness="1" CornerRadius="10">
      <ScrollViewer VerticalScrollBarVisibility="Auto"><StackPanel x:Name="DL" Margin="6"/></ScrollViewer>
    </Border>
    <Grid Grid.Row="5" Margin="0,14,0,0">
      <TextBlock x:Name="DC" Foreground="#8A8A8A" VerticalAlignment="Center"/>
      <StackPanel Orientation="Horizontal" HorizontalAlignment="Right">
        <Button x:Name="DCancel" Content="Cancel" Style="{DynamicResource GhostBtn}"/>
        <Button x:Name="DGo" Style="{DynamicResource AccentBtn}" Margin="10,0,0,0"/>
      </StackPanel>
    </Grid>
  </Grid>
</Window>
'@

function Update-DlgCount {
    $n = @($script:DlgRows | Where-Object { $_.Cb.IsChecked }).Count
    $script:DlgUi.DC.Text = "$n of $(@($script:DlgRows).Count) selected"
}

function Show-ChecklistDialog {
    param([string]$Title, [string]$Subtitle, [object[]]$Items, [string]$GoText = 'Apply', [string]$Banner = '')
    $d = New-El $DlgXaml
    $d.Resources.MergedDictionaries.Add($Window.Resources)
    $d.Owner = $Window
    $e = @{}
    foreach ($n in 'DT', 'DS', 'DB', 'DBT', 'DQ', 'DAll', 'DNone', 'DL', 'DC', 'DCancel', 'DGo') { $e[$n] = $d.FindName($n) }
    $e.DT.Text = $Title; $e.DS.Text = $Subtitle; $e.DGo.Content = $GoText
    if ($Banner) { $e.DBT.Text = $Banner; $e.DB.Visibility = 'Visible' }
    $script:DlgRows = @(); $script:DlgUi = $e; $script:DlgResult = $null; $script:DlgWin = $d
    foreach ($it in $Items) {
        $bd = New-Object System.Windows.Controls.Border; $bd.BorderBrush = Brush '#161616'; $bd.BorderThickness = '0,0,0,1'; $bd.Padding = '8,9,8,9'
        $sp = New-Object System.Windows.Controls.StackPanel
        $cb = New-Object System.Windows.Controls.CheckBox
        $cb.Content = $it.Name; $cb.FontWeight = 'SemiBold'; $cb.FontSize = 13.5; $cb.IsChecked = [bool]$it.Checked
        $cb.Foreground = if ($it.Xbox) { Brush '#FF8A8A' } else { Brush '#F2F2F2' }
        $cb.Add_Click({ Update-DlgCount })
        [void]$sp.Children.Add($cb)
        if ($it.Detail) {
            $dt = New-Object System.Windows.Controls.TextBlock; $dt.Text = $it.Detail; $dt.FontSize = 12; $dt.Foreground = Brush '#8A8A8A'; $dt.TextWrapping = 'Wrap'; $dt.Margin = '24,3,0,0'
            [void]$sp.Children.Add($dt)
        }
        if ($it.Warn) {
            $w = New-Object System.Windows.Controls.TextBlock; $w.Text = $it.Warn; $w.FontSize = 11.5; $w.Foreground = Brush '#F5A524'; $w.TextWrapping = 'Wrap'; $w.Margin = '24,3,0,0'
            if ($it.Xbox) { $w.Foreground = Brush '#FF8A8A' }
            [void]$sp.Children.Add($w)
        }
        $bd.Child = $sp
        [void]$e.DL.Children.Add($bd)
        $script:DlgRows += [pscustomobject]@{ Item = $it; Cb = $cb; Row = $bd; Search = "$($it.Name) $($it.Detail) $($it.Id)" }
    }
    Update-DlgCount
    $e.DQ.Add_TextChanged({
        $q = "$($script:DlgUi.DQ.Text)".Trim()
        foreach ($r in $script:DlgRows) { $r.Row.Visibility = if ((-not $q) -or ($r.Search -like "*$q*")) { 'Visible' } else { 'Collapsed' } }
    })
    $e.DAll.Add_Click({ foreach ($r in $script:DlgRows) { if ($r.Row.Visibility -eq 'Visible') { $r.Cb.IsChecked = $true } }; Update-DlgCount })
    $e.DNone.Add_Click({ foreach ($r in $script:DlgRows) { $r.Cb.IsChecked = $false }; Update-DlgCount })
    $e.DCancel.Add_Click({ $script:DlgWin.Close() })
    $e.DGo.Add_Click({
        $script:DlgResult = @($script:DlgRows | Where-Object { $_.Cb.IsChecked } | ForEach-Object { $_.Item })
        $script:DlgWin.Close()
    })
    [void]$d.ShowDialog()
    return $script:DlgResult
}

# ---------------------------------------------------------------- Microsoft app picker
$script:AppProtectRx = '^(Microsoft\.(WindowsStore|StorePurchaseApp|DesktopAppInstaller|SecHealthUI|Windows\.ShellExperienceHost|Windows\.StartMenuExperienceHost|AAD\.BrokerPlugin|AccountsControl|Windows\.CloudExperienceHost|Windows\.ContentDeliveryManager|Windows\.Search|LockApp|UI\.Xaml|VCLibs|NET\.|WindowsAppRuntime|Win32WebViewHost|Windows\.Apprep|CredDialogHost|ECApp|Windows\.PeopleExperienceHost|Windows\.PinningConfirmationDialog|BioEnrollment|AsyncTextService|Windows\.OOBE|Windows\.CapturePicker|Windows\.SecureAssessmentBrowser|Windows\.XGpuEjectDialog|Windows\.PrintQueueActionCenter|Windows\.NarratorQuickStart)|windows\.|MicrosoftWindows\.|NVIDIACorp|RealtekSemiconductorCorp|c5e2524a)'
$script:XboxRx = 'Xbox|GamingApp|GamingServices'
$script:XboxAppWarn = 'XBOX: removing this can break Game Pass, Xbox sign-in, the Game Bar overlay, cloud saves and some Microsoft Store games (Minecraft, Forza, Sea of Thieves...). Keep it if you play any of them.'

function Invoke-PickApps {
    Show-Busy 'Scanning apps' 'Reading installed Microsoft Store apps...' 40
    try {
        $apps = @(Get-AppxPackage -AllUsers -ErrorAction SilentlyContinue | Where-Object {
            -not $_.IsFramework -and -not $_.NonRemovable -and "$($_.SignatureKind)" -ne 'System' -and $_.Name -notmatch $script:AppProtectRx
        } | Sort-Object Name -Unique)
    } finally { Hide-Busy }
    if ($apps.Count -eq 0) { Show-Toast 'No removable apps were found.' 'info'; return }
    $recPats = @($script:Tweaks | Where-Object { $_.Rec -and $_.Appx } | ForEach-Object { $_.Appx })
    $items = @()
    foreach ($a in $apps) {
        $isX = ($a.Name -match $script:XboxRx)
        $rec = $false
        foreach ($pat in $recPats) { if ($a.Name -like $pat) { $rec = $true; break } }
        $friendly = ($a.Name -replace '^Microsoft\.', '' -replace '([a-z])([A-Z])', '$1 $2')
        $items += [pscustomobject]@{
            Id = $a.Name; Name = $friendly; Detail = "$($a.Name)   v$($a.Version)"
            Warn = $(if ($isX) { $script:XboxAppWarn } else { '' }); Checked = ($rec -and -not $isX); Xbox = $isX
        }
    }
    $items = @($items | Sort-Object Name)
    $banner = 'Removed apps cannot be restored by this panel - reinstall them from the Microsoft Store. Apps marked XBOX (red) can break Game Pass, Xbox sign-in and some Store games. Windows core apps and the Store itself are hidden.'
    $sel = @(Show-ChecklistDialog -Title 'Select Microsoft apps to remove' -Subtitle "$($items.Count) removable apps found. Ticked apps are the usual bloat; nothing is removed until you press the button." -Items $items -GoText 'Remove selected' -Banner $banner)
    if ($sel.Count -eq 0) { return }
    $names = @($sel | ForEach-Object { $_.Id })
    $xb = @($sel | Where-Object { $_.Xbox })
    if ($xb.Count -gt 0) {
        $xl = ($xb | ForEach-Object { "  - $($_.Name)" }) -join "`n"
        if (-not (Ask "XBOX WARNING`n`nYou selected Xbox / gaming components:`n$xl`n`nRemoving them can break Game Pass, Xbox sign-in, the Game Bar, cloud saves and some Microsoft Store games. This cannot be undone here.`n`nRemove them anyway?" 'Warning')) { return }
    }
    if (-not (Ask "Remove $($names.Count) app(s)?`n`nA System Restore point is created first. Removed apps can only come back via the Microsoft Store." 'Warning')) { return }
    if (-not (Confirm-RestorePoint)) { return }
    Write-Log ("APPS REMOVE: " + ($names -join ', '))
    Invoke-Background -Title 'Removing apps' -Text "Uninstalling $($names.Count) app(s)..." -Arguments (, $names) -Script {
        param($list)
        foreach ($n in $list) {
            Get-AppxPackage -AllUsers -Name $n -ErrorAction SilentlyContinue | ForEach-Object {
                try { Remove-AppxPackage -Package $_.PackageFullName -AllUsers -ErrorAction Stop } catch { try { Remove-AppxPackage -Package $_.PackageFullName -ErrorAction SilentlyContinue } catch {} }
            }
            Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -eq $n } | ForEach-Object {
                try { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName -ErrorAction SilentlyContinue | Out-Null } catch {}
            }
        }
    } | Out-Null
    Update-AppxCache
    Update-AllStates
    Update-BackupInfo
    Show-Toast "$($names.Count) app(s) removed."
}

# ---------------------------------------------------------------- service picker
function SvcC([string]$Name, [string]$Title, [string]$Detail, [bool]$Rec = $false, [string]$Warn = '', [bool]$Xbox = $false) {
    [pscustomobject]@{ Name = $Name; Title = $Title; Detail = $Detail; Rec = $Rec; Warn = $Warn; Xbox = $Xbox }
}
$script:SvcCatalog = @(
    (SvcC 'Fax' 'Fax' 'Sends and receives faxes. Nobody needs it on a gaming PC.' $true)
    (SvcC 'RetailDemo' 'Retail Demo Service' 'Store demo mode helper.' $true)
    (SvcC 'MapsBroker' 'Downloaded Maps Manager' 'Background updates for offline maps.' $true)
    (SvcC 'RemoteRegistry' 'Remote Registry' 'Lets other PCs edit your registry. Safer off.' $true)
    (SvcC 'WMPNetworkSvc' 'Windows Media Player Network Sharing' 'Shares media over the network.' $true)
    (SvcC 'wisvc' 'Windows Insider Service' 'Only used for Insider builds.' $true)
    (SvcC 'DiagTrack' 'Connected User Experiences and Telemetry' 'Collects and uploads diagnostic data.' $true)
    (SvcC 'dmwappushservice' 'WAP Push Message Routing' 'Feeds telemetry; unused on desktops.' $true)
    (SvcC 'WerSvc' 'Windows Error Reporting' 'Collects and uploads crash reports after a game crashes.' $true)
    (SvcC 'diagnosticshub.standardcollector.service' 'Diagnostics Hub Collector' 'Developer diagnostics collector.' $true)
    (SvcC 'AJRouter' 'AllJoyn Router' 'IoT device protocol router.' $true)
    (SvcC 'ALG' 'Application Layer Gateway' 'Internet Connection Sharing plug-ins.' $true)
    (SvcC 'TrkWks' 'Distributed Link Tracking Client' 'Tracks NTFS links across a domain.' $true)
    (SvcC 'lltdsvc' 'Link-Layer Topology Discovery Mapper' 'Network map feature.' $true)
    (SvcC 'workfolderssvc' 'Work Folders' 'Corporate file sync.' $true)
    (SvcC 'WpcMonSvc' 'Parental Controls' 'Family safety monitoring.' $true)
    (SvcC 'SEMgrSvc' 'Payments and NFC/SE Manager' 'NFC payments. Desktops rarely have it.' $true)
    (SvcC 'WalletService' 'Wallet Service' 'Windows Wallet backend.' $true)
    (SvcC 'SmsRouter' 'Microsoft Windows SMS Router' 'SMS routing for mobile plans.' $true)
    (SvcC 'PhoneSvc' 'Phone Service' 'Telephony state for mobile plans.' $true)
    (SvcC 'icssvc' 'Windows Mobile Hotspot Service' 'Share your connection as a hotspot.' $true '' $false)
    (SvcC 'ScDeviceEnum' 'Smart Card Device Enumeration' 'Smart card readers.' $true)
    (SvcC 'SCPolicySvc' 'Smart Card Removal Policy' 'Locks PC when a smart card is removed.' $true)
    (SvcC 'SCardSvr' 'Smart Card' 'Smart card access.' $true)
    (SvcC 'CscService' 'Offline Files' 'Corporate offline file cache.' $false)
    (SvcC 'PcaSvc' 'Program Compatibility Assistant' 'Pops up compatibility prompts for old games/apps.' $false 'Some very old games rely on its shims.')
    (SvcC 'SensrSvc' 'Sensor Monitoring Service' 'Light/orientation sensors (laptops, tablets).' $false)
    (SvcC 'SensorService' 'Sensor Service' 'Sensor framework.' $false)
    (SvcC 'SensorDataService' 'Sensor Data Service' 'Sensor data delivery.' $false)
    (SvcC 'DoSvc' 'Delivery Optimization' 'Peer-to-peer update delivery. Updates still download without it.' $false)
    (SvcC 'SysMain' 'SysMain (Superfetch)' 'Preloads apps into RAM. Keep it ON if Windows is on a hard drive.' $false 'Only disable on an SSD.')
    (SvcC 'WSearch' 'Windows Search' 'File indexer. Start-menu app search still works, file-content search gets slower.' $false 'Feature loss: slower file search.')
    (SvcC 'Spooler' 'Print Spooler' 'Needed for ALL printing, including Print to PDF.' $false 'Printing (and Print to PDF) will stop working.')
    (SvcC 'PrintNotify' 'Printer Extensions and Notifications' 'Printer pop-ups.' $false)
    (SvcC 'lfsvc' 'Geolocation Service' 'Location for Weather, Maps, Find my device.' $false 'Weather/Maps/Find my device lose your location.')
    (SvcC 'WbioSrvc' 'Windows Biometric Service' 'Windows Hello fingerprint / face sign-in.' $false 'Windows Hello biometrics stop working.')
    (SvcC 'TabletInputService' 'Touch Keyboard and Handwriting' 'On-screen keyboard and pen input.' $false 'Touch keyboard and handwriting stop working.')
    (SvcC 'bthserv' 'Bluetooth Support Service' 'Needed for Bluetooth headsets, mice and controllers.' $false 'Bluetooth devices will stop working.')
    (SvcC 'BthAvctpSvc' 'AVCTP Service' 'Bluetooth audio/video control.' $false 'Bluetooth headsets lose button control.')
    (SvcC 'SSDPSRV' 'SSDP Discovery' 'Finds UPnP devices (some consoles, DLNA).' $false 'Some network device discovery and UPnP port mapping stops.')
    (SvcC 'upnphost' 'UPnP Device Host' 'Hosts UPnP devices.' $false)
    (SvcC 'FDResPub' 'Function Discovery Resource Publication' 'Makes this PC visible on the network.' $false 'This PC no longer shows up in Network.')
    (SvcC 'stisvc' 'Windows Image Acquisition' 'Scanners and some cameras.' $false 'Scanners stop working.')
    (SvcC 'FrameServer' 'Windows Camera Frame Server' 'Shares webcam between apps.' $false 'Webcams may stop working in Discord/Teams/Zoom.')
    (SvcC 'TermService' 'Remote Desktop Services' 'Incoming Remote Desktop connections.' $false 'Nobody can Remote Desktop into this PC.')
    (SvcC 'SessionEnv' 'Remote Desktop Configuration' 'RDP configuration.' $false)
    (SvcC 'UmRdpService' 'Remote Desktop Port Redirector' 'RDP device redirection.' $false)
    (SvcC 'LanmanServer' 'Server (file and printer sharing)' 'Lets other PCs reach shared folders on this one.' $false 'Folder / printer sharing from this PC stops.')
    (SvcC 'XblAuthManager' 'Xbox Live Auth Manager' 'Xbox sign-in for games and the Xbox app.' $false $script:XboxAppWarn $true)
    (SvcC 'XblGameSave' 'Xbox Live Game Save' 'Cloud saves for Xbox / Store games.' $false $script:XboxAppWarn $true)
    (SvcC 'XboxNetApiSvc' 'Xbox Live Networking Service' 'Xbox Live multiplayer networking.' $false $script:XboxAppWarn $true)
    (SvcC 'XboxGipSvc' 'Xbox Accessory Management Service' 'Xbox wireless controller / accessory support.' $false 'XBOX: Xbox controllers and accessories can stop working or lose firmware updates.' $true)
    (SvcC 'GamingServices' 'Gaming Services' 'Required by Game Pass and many Microsoft Store games.' $false $script:XboxAppWarn $true)
    (SvcC 'GamingServicesNet' 'Gaming Services Net' 'Networking for Gaming Services.' $false $script:XboxAppWarn $true)
)

function Restore-CustomServices {
    if (-not $script:Backup.ContainsKey('custom_services')) { return }
    $b = $script:Backup['custom_services']
    foreach ($e in @($b.Svc)) {
        if (-not $e -or -not $e.Name) { continue }
        Set-SvcStart $e.Name $e.Start
        if ("$($e.Start)" -match 'auto') { Start-Service -Name $e.Name -ErrorAction SilentlyContinue }
        Write-Log "SERVICE RESTORED $($e.Name) -> $($e.Start)"
    }
    $script:Backup.Remove('custom_services'); Save-Backup
}

function Invoke-PickServices {
    $items = @()
    foreach ($c in $script:SvcCatalog) {
        $cur = Get-SvcStart $c.Name
        if ($null -eq $cur) { continue }
        $note = if ($cur -eq 'disabled') { '  (already disabled)' } else { "  (start type: $cur)" }
        $items += [pscustomobject]@{
            Id = $c.Name; Name = $c.Title; Detail = "$($c.Name)  -  $($c.Detail)$note"; Warn = $c.Warn
            Checked = ($c.Rec -and $cur -ne 'disabled'); Xbox = $c.Xbox
        }
    }
    if ($items.Count -eq 0) { Show-Toast 'None of the optional services exist on this PC.' 'info'; return }
    $banner = 'Disabled services keep their original start type in the Frenzy backup - "Revert every tweak" (Backups page) turns them back on. Services marked XBOX (red) can break Game Pass, Xbox sign-in and Store games; amber notes list features you lose. Only optional services are shown - core Windows services are hidden.'
    $sel = @(Show-ChecklistDialog -Title 'Select services to disable' -Subtitle "$($items.Count) optional services found on this PC. Ticked services are safe on most gaming PCs." -Items $items -GoText 'Disable selected' -Banner $banner)
    if ($sel.Count -eq 0) { return }
    $names = @($sel | ForEach-Object { $_.Id })
    $xb = @($sel | Where-Object { $_.Xbox })
    if ($xb.Count -gt 0) {
        $xl = ($xb | ForEach-Object { "  - $($_.Name)" }) -join "`n"
        if (-not (Ask "XBOX WARNING`n`nYou selected Xbox services:`n$xl`n`nDisabling them can break Game Pass, Xbox sign-in, cloud saves, Xbox controllers and some Microsoft Store games.`n`nThey can be restored from Backups > Revert every tweak.`n`nDisable them anyway?" 'Warning')) { return }
    }
    if (-not (Ask "Disable $($names.Count) service(s)?`n`nA System Restore point is created first." 'Warning')) { return }
    if (-not (Confirm-RestorePoint)) { return }
    $have = @{}
    if ($script:Backup.ContainsKey('custom_services')) { foreach ($e in @($script:Backup['custom_services'].Svc)) { if ($e -and $e.Name) { $have[$e.Name] = $e.Start } } }
    Show-Busy 'Disabling services' 'Working...' 20
    $i = 0
    foreach ($n in $names) {
        $i++
        $ui.OverlayText.Text = "$i of $($names.Count)  -  $n"; $ui.OverlayBar.Value = [int](100 * $i / $names.Count); Update-UI
        $st = Get-SvcStart $n
        if ($st -and $st -ne 'disabled' -and -not $have.ContainsKey($n)) { $have[$n] = $st }
        Set-SvcStart $n 'disabled'
        Write-Log "SERVICE DISABLED $n (was $st)"
    }
    $script:Backup['custom_services'] = [pscustomobject]@{
        Svc = @($have.GetEnumerator() | ForEach-Object { [pscustomobject]@{ Name = $_.Key; Start = $_.Value } }); Time = (Get-Date).ToString('s')
    }
    Save-Backup
    Hide-Busy
    Update-AllStates; Update-BackupInfo
    Show-Toast "$($names.Count) service(s) disabled. Restart recommended."
}

# ---------------------------------------------------------------- full cleanup with loader
$ThumbJob = {
    $f = [int64]0
    Get-ChildItem "$env:LOCALAPPDATA\Microsoft\Windows\Explorer" -Filter 'thumbcache_*.db' -Force -ErrorAction SilentlyContinue | ForEach-Object {
        $l = $_.Length
        try { Remove-Item -LiteralPath $_.FullName -Force -ErrorAction Stop; $f += $l } catch {}
    }
    $f
}
$RecycleJob = {
    $sum = [int64]0
    try { $sh = New-Object -ComObject Shell.Application; foreach ($i in $sh.NameSpace(0xA).Items()) { $sum += [int64]$i.Size } } catch {}
    try { Clear-RecycleBin -Force -ErrorAction SilentlyContinue } catch {}
    $sum
}
function Get-BrowserCachePaths {
    $l = $env:LOCALAPPDATA
    $p = @()
    foreach ($b in "$l\Google\Chrome\User Data", "$l\Microsoft\Edge\User Data", "$l\BraveSoftware\Brave-Browser\User Data") {
        foreach ($sub in 'Default\Cache\Cache_Data', 'Default\Code Cache', 'Default\GPUCache', 'ShaderCache', 'GrShaderCache') { $p += (Join-Path $b $sub) }
    }
    $p += @(Get-ChildItem "$l\Mozilla\Firefox\Profiles" -Directory -ErrorAction SilentlyContinue | ForEach-Object { Join-Path $_.FullName 'cache2' })
    return $p
}
function Invoke-BrowserClean {
    if (-not (Ask "Clear browser caches?`n`nDeletes cached files for Chrome, Edge, Brave and Firefox only. Passwords, cookies, history and logins are NOT touched. Close your browsers first so locked files can be removed.")) { return }
    $r = Invoke-Background -Title 'Clearing browser caches' -Text 'Deleting cached web files...' -Script $CleanJob -Arguments (, @(Get-BrowserCachePaths))
    Show-Toast "Browser caches cleared ($(Format-Bytes ([double](@($r) | Select-Object -Last 1))))."
}
function Invoke-RecycleClean {
    if (-not (Ask 'Empty the Recycle Bin for all drives? Files in it are deleted permanently.' 'Warning')) { return }
    $r = Invoke-Background -Title 'Emptying Recycle Bin' -Text 'Deleting recycled files...' -Script $RecycleJob
    Show-Toast "Recycle Bin emptied (about $(Format-Bytes ([double](@($r) | Select-Object -Last 1))) freed)."
}
function Invoke-FullCleanup {
    if (-not (Ask "Run the full cleanup?`n`nThis removes, in order:`n  1. User and Windows temp files`n  2. Windows Update downloads and Delivery Optimization cache`n  3. Crash dumps and error reports`n  4. Explorer thumbnail cache`n  5. NVIDIA / DirectX shader caches (games rebuild them)`n  6. Browser caches (no passwords or history)`n  7. Recycle Bin`n`nYour documents and games are never touched. Close your games and browsers first.")) { return }
    $steps = @(
        @{ N = 'Temp files';             P = @($env:TEMP, "$env:WINDIR\Temp", "$env:LOCALAPPDATA\Temp") }
        @{ N = 'Update downloads';       P = @("$env:WINDIR\SoftwareDistribution\Download", "$env:ProgramData\Microsoft\Windows\DeliveryOptimization\Cache") }
        @{ N = 'Crash dumps and reports'; P = @("$env:WINDIR\Minidump", "$env:WINDIR\LiveKernelReports", "$env:WINDIR\MEMORY.DMP", "$env:LOCALAPPDATA\CrashDumps", "$env:ProgramData\Microsoft\Windows\WER\ReportArchive", "$env:ProgramData\Microsoft\Windows\WER\ReportQueue") }
        @{ N = 'Thumbnail cache';        J = 'thumb' }
        @{ N = 'Shader caches';          P = @("$env:LOCALAPPDATA\NVIDIA\DXCache", "$env:LOCALAPPDATA\NVIDIA\GLCache", "$env:LOCALAPPDATA\D3DSCache", "$env:ProgramData\NVIDIA Corporation\NV_Cache") }
        @{ N = 'Browser caches';         P = @(Get-BrowserCachePaths) }
        @{ N = 'Recycle Bin';            J = 'recycle' }
    )
    $was = @(Stop-UpdateServices)
    $total = [double]0; $i = 0; $n = $steps.Count
    try {
        foreach ($s in $steps) {
            $i++
            $title = "Full cleanup  -  step $i of $n"
            Show-Busy $title $s.N ([int](100 * ($i - 1) / $n))
            if ($s.J -eq 'thumb')       { $r = Invoke-Background -Title $title -Text "Cleaning: $($s.N)" -Script $ThumbJob }
            elseif ($s.J -eq 'recycle') { $r = Invoke-Background -Title $title -Text "Cleaning: $($s.N)" -Script $RecycleJob }
            else                        { $r = Invoke-Background -Title $title -Text "Cleaning: $($s.N)" -Script $CleanJob -Arguments (, $s.P) }
            $got = [double](@($r) | Select-Object -Last 1)
            $total += $got
            Write-Log "Full cleanup - $($s.N): $got bytes"
        }
    } finally { Start-UpdateServices $was; Hide-Busy }
    Show-Toast "Full cleanup finished - $(Format-Bytes $total) reclaimed."
}

# ================================================================ WIRING
$NavMap = [ordered]@{
    NavDashboard = 'PageDashboard'; NavScanner = 'PageScanner'; NavTweaks = 'PageTweaks'; NavFps = 'PageTweaks'; NavLatency = 'PageTweaks'; NavDebloat = 'PageTweaks'
    NavBoost = 'PageBoost'; NavBackup = 'PageBackup'; NavSettings = 'PageSettings'
}
function Show-Page([string]$Page) {
    foreach ($p in $NavMap.Values) { $ui[$p].Visibility = 'Collapsed' }
    $ui[$Page].Visibility = 'Visible'
    try {
        $fa = New-Object System.Windows.Media.Animation.DoubleAnimation
        $fa.From = 0; $fa.To = 1; $fa.Duration = New-Object System.Windows.Duration([TimeSpan]::FromMilliseconds(260))
        $fa.EasingFunction = New-Object System.Windows.Media.Animation.QuadraticEase
        $ui[$Page].BeginAnimation([System.Windows.UIElement]::OpacityProperty, $fa)
    } catch {}
    if ($Page -eq 'PageBackup') { Show-Log; Update-BackupInfo }
}
foreach ($k in $NavMap.Keys) {
    $ui[$k].Add_Checked({ param($s, $e) Invoke-Safe { Set-Tab $s.Name; Show-Page $NavMap[$s.Name] } })
}

# window chrome
$ui.BtnMin.Add_Click({ $Window.WindowState = 'Minimized' })
$ui.BtnMax.Add_Click({ $Window.WindowState = if ($Window.WindowState -eq 'Maximized') { 'Normal' } else { 'Maximized' } })
$ui.BtnClose.Add_Click({ $Window.Close() })
$Window.Add_StateChanged({
    if ($Window.WindowState -eq 'Maximized') { $ui.Root.Margin = '7'; $ui.BtnMax.Content = [string][char]0xE923 }
    else { $ui.Root.Margin = '0'; $ui.BtnMax.Content = [string][char]0xE922 }
})
$ui.BtnRestart.Add_Click({
    if (Ask 'Restart the PC now to finish applying tweaks? Save your work first.') { & shutdown.exe /r /t 5 /c 'Frenzy Tweaks: restarting to apply optimizations' }
})

# dashboard
$ui.BtnApplyRec.Add_Click({ Invoke-Safe { Invoke-ApplyRecommended } })
$ui.BtnApplyAllRec.Add_Click({ Invoke-Safe { Invoke-ApplyRecommended } })
$ui.BtnGoTweaks.Add_Click({ $ui.NavTweaks.IsChecked = $true })
$ui.ShortScan.Add_Click({ $ui.NavScanner.IsChecked = $true })
$ui.ShortBoost.Add_Click({ $ui.NavBoost.IsChecked = $true })
$ui.ShortBackup.Add_Click({ $ui.NavBackup.IsChecked = $true })

# scanner
$ui.BtnRescan.Add_Click({
    Invoke-Safe {
        Show-Busy 'Scanning your PC' 'Reading hardware information...' 30
        $script:SysInfo = Get-SystemInfo
        Show-ScanResults
        Hide-Busy
        Show-Toast 'Scan complete.'
    }
})

# optimizations
$ui.BtnTweaksApplyRec.Add_Click({ Invoke-Safe { Invoke-ApplyRecommended } })
$ui.BtnRevertAll.Add_Click({ Invoke-Safe { Invoke-RevertAll } })
$ui.SearchBox.Add_TextChanged({
    $ui.SearchHint.Visibility = if ([string]::IsNullOrEmpty($ui.SearchBox.Text)) { 'Visible' } else { 'Collapsed' }
    Update-Filter
})
$ui.TweakScroll.Add_SizeChanged({
    $w = $ui.TweakScroll.ActualWidth
    $ui.TweakGrid.Columns = if ($w -lt 980) { 2 } elseif ($w -gt 1720) { 4 } else { 3 }
})

# boost
$ui.BtnAddGame.Add_Click({ Invoke-Safe { Add-Game } })
$ui.GameExe.Add_KeyDown({ param($s, $e) if ($e.Key -eq 'Return') { Invoke-Safe { Add-Game } } })
$ui.BtnPickApps.Add_Click({ Invoke-Safe { Invoke-PickApps } })
$ui.BtnPickSvc.Add_Click({ Invoke-Safe { Invoke-PickServices } })

# backups
$ui.BtnCreateRP.Add_Click({
    Invoke-Safe {
        if (New-RestorePoint) { Show-Toast 'Restore point created.' }
        else { Show-Toast 'Windows could not create a restore point. Check that System Protection is enabled for drive C:.' 'warn' }
        Show-Log
    }
})
$ui.BtnOpenRstrui.Add_Click({ Start-Process "$env:WINDIR\System32\rstrui.exe" })
$ui.BtnRevertAll2.Add_Click({ Invoke-Safe { Invoke-RevertAll } })
$ui.BtnOpenData.Add_Click({ Start-Process explorer.exe $DataDir })
$ui.BtnRefreshLog.Add_Click({ Show-Log })

# settings
$script:Settings.AutoRestorePoint = $true; $ui.SetRestore.IsChecked = $true; $ui.SetRestore.IsEnabled = $false
$ui.SetAdvanced.IsChecked = [bool]$script:Settings.ShowAdvanced
$ui.SetConfirm.IsChecked  = [bool]$script:Settings.ConfirmRisky
$ui.SetRestore.Add_Click({ $script:Settings.AutoRestorePoint = [bool]$ui.SetRestore.IsChecked; Save-Settings })
$ui.SetConfirm.Add_Click({ $script:Settings.ConfirmRisky = [bool]$ui.SetConfirm.IsChecked; Save-Settings })
$ui.SetAdvanced.Add_Click({
    $script:Settings.ShowAdvanced = [bool]$ui.SetAdvanced.IsChecked; Save-Settings
    Update-ChipCounts; Update-Filter; Update-Dashboard
})

function Invoke-UpdateCheck {
    if ($RawUrl -match 'YOUR-USER') { Show-Toast 'Update source is not set. Edit $RawUrl at the top of the script.' 'warn'; return }
    Show-Busy 'Checking for updates' 'Contacting GitHub...' 30
    $txt = $null
    try {
        [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
        $txt = (Invoke-WebRequest -Uri $RawUrl -UseBasicParsing -TimeoutSec 20 -ErrorAction Stop).Content
    } catch { Write-Log "Update check failed: $($_.Exception.Message)" }
    Hide-Busy
    if (-not $txt) { Show-Toast 'Could not reach GitHub. Check your internet connection.' 'warn'; return }
    if ($txt -notmatch '\$AppVersion\s*=\s*''([\d\.]+)''') { Show-Toast 'Could not read the latest version number.' 'warn'; return }
    $remote = $Matches[1]
    $isNewer = $false
    try { $isNewer = ([version]$remote -gt [version]$AppVersion) } catch {}
    if (-not $isNewer) { Show-Toast "You are on the latest version ($AppVersion)."; return }
    if (-not (Ask "Version $remote is available (you have $AppVersion).`n`nDownload it and restart Frenzy Tweaks now?")) { return }
    $dest = Join-Path $env:TEMP 'FrenzyTweaks.ps1'
    [IO.File]::WriteAllText($dest, $txt, (New-Object System.Text.UTF8Encoding($false)))
    Write-Log "Updating $AppVersion -> $remote"
    Start-Process -FilePath 'powershell.exe' -ArgumentList "-NoProfile -ExecutionPolicy Bypass -STA -WindowStyle Hidden -File `"$dest`""
    $Window.Close()
}
$ui.BtnUpdate.Add_Click({ Invoke-Safe { Invoke-UpdateCheck } })
$ui.BtnRepo.Add_Click({ if ($RepoUrl -match 'YOUR-USER') { Show-Toast 'GitHub page is not set. Edit $RepoUrl at the top of the script.' 'warn' } else { Start-Process $RepoUrl } })

$Window.Add_Closing({ $script:StatsTimer.Stop(); $script:ScoreTimer.Stop(); $script:ToastTimer.Stop(); Write-Log 'Frenzy Tweaks closed' })

# ================================================================ STARTUP
$Window.Add_ContentRendered({
    Close-Splash
    Invoke-Safe {
        Write-Log "Frenzy Tweaks $AppVersion started"
        Show-Busy 'Scanning your PC' 'Reading system info: CPU, GPU, memory and storage...' 8
        $script:SysInfo = Get-SystemInfo
        Set-AdaptiveRecommendations
        Show-Busy 'Scanning your PC' 'Checking installed apps...' 25
        Update-AppxCache
        Show-Busy 'Scanning your PC' 'Building optimization list...' 35
        Build-TweakCards
        Build-BoostPage
        Show-Games
        Show-ScanResults
        Show-Busy 'Scanning your PC' 'Checking which optimizations are already active...' 40
        Update-AllStates -Progress
        Update-BackupInfo
        Hide-Busy
        $script:StatsTimer.Start()
        Write-Log ("Scan: {0} | {1} | {2} | system drive {3}" -f $script:SysInfo.CpuName, $script:SysInfo.GpuName, $script:SysInfo.RamTotal, $script:SysInfo.SystemDiskType)
    }
})

# fit smaller screens
try {
    $wa = [System.Windows.SystemParameters]::WorkArea
    if ($Window.Height -gt $wa.Height) { $Window.MinHeight = [math]::Min($Window.MinHeight, $wa.Height - 10); $Window.Height = $wa.Height - 10 }
    if ($Window.Width -gt $wa.Width)   { $Window.MinWidth = [math]::Min($Window.MinWidth, $wa.Width - 10);   $Window.Width = $wa.Width - 10 }
} catch {}

$script:ConHwnd = [IntPtr]::Zero
if (-not $PSCommandPath) {
    # started with  irm | iex  -> hide the PowerShell console while the app is open
    try {
        if (-not ('FrenzyWin.Native' -as [type])) {
            Add-Type -Namespace FrenzyWin -Name Native -MemberDefinition '[DllImport("kernel32.dll")] public static extern IntPtr GetConsoleWindow(); [DllImport("user32.dll")] public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);'
        }
        $script:ConHwnd = [FrenzyWin.Native]::GetConsoleWindow()
        if ($script:ConHwnd -ne [IntPtr]::Zero) { [void][FrenzyWin.Native]::ShowWindow($script:ConHwnd, 0) }
    } catch { $script:ConHwnd = [IntPtr]::Zero }
}
try {
    [void]$Window.ShowDialog()
} finally {
    if ($script:ConHwnd -ne [IntPtr]::Zero) { try { [void][FrenzyWin.Native]::ShowWindow($script:ConHwnd, 5) } catch {} }
}
