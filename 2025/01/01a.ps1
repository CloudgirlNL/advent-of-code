$path =
$rotations = Get-Content -Path $path

$start = 50
$timeszero = 0

foreach ($rotation in $rotations) {
    $direction = $rotation[0]
    [int]$number = $rotation.Substring(1)

    if ($number -gt 100) {
        $number %= 100
    }

    if ($direction -eq "L") {
        $start -= $number
    }
    else {
        $start += $number
    }

    if ($start -lt 0) {
        $start += 100
    }
    elseif ($start -gt 99) {
        $start -= 100
    }

    if ($start -eq 0) {
        $timeszero += 1
    }
}

"Password is $($timeszero)"
