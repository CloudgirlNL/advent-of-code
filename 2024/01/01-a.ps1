$path = ". \testinput.txt"
$AoCinput = Get-Content -Path $path

$leftList = @()
$rightList = @()
$differences = @()

#Divide the left and right part of the lists and add them to separate arrays
foreach ($line in $AoCinput) {
    $numbers = $line.Trim() -split "\s+"

    if ($numbers.Count -eq 2) {
        $leftList += $numbers[0]
        $rightList += $numbers[1]
    }
}

#Order both lists from lowest to highest
$orderedLeftList = $leftList | Sort-Object
$orderedRightList = $rightList | Sort-Object

#Loop through the left list, compare the number to the corresponding one in the right list and find the difference, add the difference to a variable called differences.
for ($i = 0; $i -lt $orderedLeftList.Count; $i++) {
    [int]$left = $orderedLeftList[$i]
    [int]$right = $orderedRightList[$i]

    if ($left -le $right) {
        $diff = $right - $left
    }
    else {
        $diff = $left - $right
    }

    $differences += $diff
}

#Add up all values in the differences variable and output this.
($differences | Measure-Object -Sum).Sum
