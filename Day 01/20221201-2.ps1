$path = '.\Day 01\input.txt'
$calories = Get-Content -Path $path

$entries = @()


foreach ($calorie in $calories) {
    $number = [int]$calorie
    $entries += $number
}
    

$total = 0
$allCalories = @()

foreach ($entry in $entries) {
    if ($entry -ne 0) {

        $sum = $total += $entry

    }
    else {
        $sum = $sum | Measure-Object -Sum
        $newEntry = $sum.Sum
        $allCalories += $newEntry
        $total = 0

    }   
}

$sortedCalories = $allCalories | Sort-Object -Descending
$topThreeElves = ($sortedCalories[0],$sortedCalories[1],$sortedCalories[2]) | Measure-Object -Sum
$topThreeElves.Sum

