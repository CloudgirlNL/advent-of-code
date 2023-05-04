$path = ".\Day 03\input.txt"
$items = Get-Content -Path $path

Remove-Variable uniquedoubles
$uniqueDoubles = @()
$alphabet = (97..122) + (65..90) | ForEach-Object { [char]$_ }

foreach ($item in $items) {
    $halflength = ($item.length / 2)

    $compartment1 = $item.Substring(0, $halflength)
    $firstarray = $compartment1.ToCharArray()

    $compartment2 = $item.Substring($halflength)
    $secondarray = $compartment2.ToCharArray()


    $uniqueDouble = Compare-Object -IncludeEqual -ExcludeDifferent -CaseSensitive -PassThru $firstarray $secondarray | Sort-Object -Unique

    $uniqueDoubles += $uniqueDouble
}

$priorities = @()

foreach ($character in $uniqueDoubles) {
    $index = $alphabet.IndexOf($character)
    $priority = ($($index) + 1)
    $priorities += $priority
}

$sum = $priorities | Measure-Object -Sum
$sum.Sum