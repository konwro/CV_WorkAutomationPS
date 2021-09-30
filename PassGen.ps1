# password generator
#
# random password generator with options regarding password length, using capitals, numbers and special characters
# usage - enter .\passgen in CMD/PS prompt, answer displayed questions

# symbols sets
$set = "abcdefghijklmnopqrstuvwxyz0123456789"
$set_capitals = "ABCDEFGHIJKLMNOPRSTUVWXYZ"
$set_specials = "!?@#$%^&*"

# prompt for parameters
Write-Host "--- PASSWORD GENERATOR ---"
$L = Write-Host "Enter length [int]: "
$C = Write-Host "Include capitals [y/n]: "
$S = Write-Host "Include special characters [y/n]: "

# determine symbol set
if ($C -eq 'y') {
    $set += $set_capitals
}

if ($S -eq 'y') {
    $set += $set_specials
}

# generate password
$pass = $set | Get-Random -Count $L | %{[char]$_} | Out-String
$pass = $pass.replace("`r`n", "")

# print password
Write-Host "Generated password:"
Wite-Host $pass

# clear vars
Remove-Variable set 
Remove-Variable L 
Remove-Variable C 
Remove-Variable S 

exit
