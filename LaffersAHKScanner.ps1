$OutputFile = "C:\AHKScanReport.txt"
$ScanRoot   = "C:\"

Write-Host ""
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host "   Lafferr's AHK File Scanner" -ForegroundColor Cyan
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host "Scanning $ScanRoot for .ahk files..." -ForegroundColor Yellow
Write-Host ""

$ahkFiles = Get-ChildItem -Path $ScanRoot -Filter "*.ahk" -Recurse -File -Force -ErrorAction SilentlyContinue

$count = ($ahkFiles | Measure-Object).Count

if ($count -eq 0) {
    Write-Host "No .ahk files found on this machine." -ForegroundColor Red
    Read-Host "Press Enter to close this window"
    exit
}

Write-Host "Found $count .ahk file(s). Building report..." -ForegroundColor Green
Write-Host ""

$lines = @()
$lines += "=========================================="
$lines += "  Scan Report"
$lines += "  Scanned   : $ScanRoot"
$lines += "  Total     : $count file(s) found"
$lines += "=========================================="
$lines += ""

$index = 1
foreach ($file in $ahkFiles | Sort-Object LastWriteTime -Descending) {
    $lines += "[$index]  $($file.Name)"
    $lines += "     Location      : $($file.FullName)"
    $lines += "     Last Modified : $($file.LastWriteTime.ToString('yyyy-MM-dd  HH:mm:ss'))"
    $lines += "     Size          : $([math]::Round($file.Length / 1KB, 2)) KB"
    $lines += ""
    $index++
}

$lines | Out-File -FilePath $OutputFile -Encoding UTF8

foreach ($line in $lines) { Write-Host $line }

Write-Host ""
Write-Host "Report saved to: $OutputFile" -ForegroundColor Green
Write-Host ""
Read-Host "Press Enter to close this window"
