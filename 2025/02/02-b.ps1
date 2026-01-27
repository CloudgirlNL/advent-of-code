# Nog niet af
<#

#Import puzzle input.
$path = ".\testinput.txt"
$AoCInput = Get-Content -Path $path

$ranges = $AoCInput -split ","
$invalidIDs = 0

foreach ($range in $ranges) {
    $IDs = $range -split "-"
    [long]$firstID = $IDs[0]
    [long]$lastID = $IDs[1]

    for ($currentID = $firstID; $currentID -le $lastID; $currentID++) {
        $IDAsString = $currentID.ToString()
        $IDLength = $IDAsString.Length
        $divider = 2

        

            if ($IDLength % $divider -eq 0) {
                "$($IDLength) can be divided by $($divider)"
            }
            else {
            
            }

        
    }
}


$invalidIDs
#>
