$path = ".\Day 04\input.txt"
$lists = Get-Content -Path $path

$fullyContains = 0

foreach ($list in $lists) {
    $groups = $list -split ","
    $group1 = $groups[0] -split "-"
    $group2 = $groups[1] -split "-"

    $range1 = (([int]$group1[0])..([int]$group1[1]))
    $range2 = (([int]$group2[0])..([int]$group2[1]))

    $comparison1 = $range1 | Where-Object { $range2 -notcontains $_ }
    $comparison2 = $range2 | Where-Object { $range1 -notcontains $_ }

    if (($null -eq $comparison1) -or ($null -eq $comparison2)) {
        $fullyContains += 1
    } 

}

$fullyContains