$path = ".\Day 04\testinput.txt"
$lists = Get-Content -Path $path

$overlap = 0

foreach ($list in $lists) {
    $groups = $list -split ","
    $group1 = $groups[0] -split "-"
    $group2 = $groups[1] -split "-"

    $range1 = (([int]$group1[0])..([int]$group1[1]))
    $range2 = (([int]$group2[0])..([int]$group2[1]))

    $comparison = Compare-Object -IncludeEqual -ExcludeDifferent -PassThru $range1 $range2
    if ($null -eq $comparison) {
    }
    else {
        $overlap += 1
    } 
}

$overlap