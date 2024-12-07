$path = "C:\git\advent-of-code\2024\02\input.txt"
$AoCinput = Get-Content -Path $path

$safeLines = 0
$unsafeLines = 0

foreach ($line in $AoCinput) {
    $numbers = $line.Trim() -split "\s+"

    $isValid = $true
    $isIncreasing = $null

    for ($i = 1; $i -lt $numbers.length; $i++) {

 
        $current = [int]$numbers[$i]
        $previous = [int]$numbers[$i - 1]
        $difference = $current - $previous

        if (-not $isIncreasing) {
            $isIncreasing = $difference -gt 0
        }


        if (($isIncreasing -and ($difference -lt 1 -or $difference -gt 3)) -or
        (-not $isIncreasing -and ($difference -gt -1 -or $difference -lt -3))) {
            $isValid = $false
            break
       



        }
    }
    if ($isValid) {
        if ($isIncreasing) {
            $safeLines += 1
        }
        else { 
            $safeLines += 1
        }
    } else {
        $unsafeLines +=1
    }
}

Write-Host $safeLines
Write-Host $unsafeLines