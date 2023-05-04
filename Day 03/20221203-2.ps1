$path = ".\Day 03\input.txt"
$items = Get-Content -Path $path

$size = 3
$alphabet = (97..122) + (65..90) | ForEach-Object { [char]$_ }
Remove-Variable badges
$badges = @()

for ($i = 0; ($i * $size) -lt $items.Length; $i++) {
    $start = $i * $size
    $middle = ($i * $size) + 1
    $end = ($i * $size) + 2
    $groupItems = @()
    $groupitems += $items[$start, $middle, $end]

    $elf1 = $groupItems[0]
    $elf1Array = $elf1.ToCharArray()
    $elf2 = $groupitems[1]
    $elf2Array = $elf2.ToCharArray()
    $elf3 = $groupitems[2]
    $elf3Array = $elf3.ToCharArray()

    $possiblebadge = Compare-Object -IncludeEqual -ExcludeDifferent -CaseSensitive -PassThru $elf1array $elf2array | Sort-Object -Unique
    $badge = Compare-Object -IncludeEqual -ExcludeDifferent -CaseSensitive -PassThru $possiblebadge $elf3array | Sort-Object -Unique
    $badges += $badge

}

$priorities = @()

foreach ($character in $badges) {
    $index = $alphabet.IndexOf($character)
    $priority = ($($index) + 1)
    $priorities += $priority
}

$sum = $priorities | Measure-Object -Sum
$sum.Sum