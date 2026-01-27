#Import puzzle input.
$path = ".\input.txt"
$AoCInput = Get-Content -Path $path

$ranges = $AoCInput -split ","
$invalidIDs = 0

foreach ($range in $ranges) {
    $IDs = $range -split "-"
    [long]$firstID = $IDs[0]
    [long]$lastID = $IDs[1]

    
    for ($i = $firstID; $i -le $lastID; $i++) {
        $iAsString = $i.ToString()
        $stringLength = $iasString.Length
        $evenNumber = $stringLength % 2 -eq 0

        if ($evenNumber -eq $true) {
            $halfLength = $stringLength / 2
            $firstHalf = $iasString.Substring(0, $halfLength)
            $secondHalf = $iasString.Substring(($halfLength), $halfLength)
            if ($firstHalf -eq $secondHalf) {
                $invalidIDS += $i
            } 
        }

    }
}

$invalidIDs
