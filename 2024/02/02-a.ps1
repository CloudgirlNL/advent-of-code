$path = "C:\tmp\advent-of-code\2024\02\testinput.txt"
$AoCinput = Get-Content -Path $path

<#
Rules
- Must only increase or decrease
- Min 1 difference, max 3 
#>


#Divide the left and right part of the lists and add them to separate arrays
foreach ($line in $AoCinput) {
    $numbers = $line.Trim() -split "\s+"

    for ($i = 0;$i -lt ($numbers.count -1);$i++) {
        if ($numbers[$i+1] -lt $numbers[$i]) {
            Write-Host "$($numbers[$i+1]) is kleiner dan $($numbers[$i])"
        } else { 
            Write-Output "Klopt niet"
            break
        }
            
        }
    }
 Write-Output "pauze"

