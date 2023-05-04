$path = ".\Day 02\testinput.txt"
$strategies = Get-Content -Path $path

$score = 0

<#
"A is Rock  X is Rock
B is Paper  Y is Paper
C is Scissors  Z is Scissors"

"
A wins Z
B wins X
C wins Y

A ties X
B ties Y
C ties Z

A loses Y
B loses Z
C loses X

X means you need to lose
Y means you need to tie
Z means you need to win
"
#>

$outcomes = @()
$choices = @()

foreach ($strategy in $strategies) {
    if ($strategy -match "X") {
        switch -Wildcard ($strategy) {
            "*A*" { $choices += "Scissors" }
            "*B*" { $choices += "Rock" }
            "*C*" { $choices += "Paper" }
        } 
    }
    elseif ($strategy -match "Y") {


        switch -Wildcard ($strategy) {
            "*A*" { $choices += "Rock" }
            "*B*" { $choices += "Paper" }
            "*C*" { $choices += "Scissors" }
        }
    }
    else {

        switch -Wildcard ($strategy) {
            "*A*" { $choices += "Paper" }
            "*B*" { $choices += "Scissors" }
            "*C*" { $choices += "Rock" }
        }

    }
    switch -Wildcard ($strategy) {
        "*X*" { $outcomes += "Lose" }
        "*Y*" { $outcomes += "Tie" }
        "*Z*" { $outcomes += "Win" }
    } 
}


foreach ($choice in $choices) {
    switch ($choice) {
        "Rock" { $score += 1 }
        "Paper" { $score += 2 }
        "Scissors" { $score += 3 }
    }
}

foreach ($outcome in $outcomes) {
    switch ($outcome) {
        "Win" { $score += 6 }
        "Tie" { $score += 3 }
        "Lose" {}
    }
}

$score