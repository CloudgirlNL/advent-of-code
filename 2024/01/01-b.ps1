$path = "C:\tmp\advent-of-code\2024\01\input.txt"
$AoCinput = Get-Content -Path $path

$leftList = @()
$rightList = @()
$simScores = 0

#Divide the left and right part of the lists and add them to separate arrays
foreach ($line in $AoCinput) {
    $numbers = $line.Trim() -split "\s+"

    if ($numbers.Count -eq 2) {
        $leftList += $numbers[0]
        $rightList += $numbers[1]
    }
}


#Loop through the left list, compare the number to the right list and find how many times this is found. Then multiply these two and add to a variable called simScores.
for ($i = 0; $i -lt $leftList.Count; $i++) {
    [int]$left = $leftList[$i]

    $count = $rightList | Where-Object { $_ -eq $left } | Measure-Object
    $simScore = $count.count * $left
    $simScores += $simScore	
}


#Add up all values in the differences variable and output this.
($simScores | Measure-Object -Sum).Sum
