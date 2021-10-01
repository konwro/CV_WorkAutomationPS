# Open frequently used APS/URLS using JSON sourcefile
#
# PS script enabling fast access to frequently used URLs through Windows CMD. It uses pre-prepared JSON database file with urls and additional informations to be printed
#  usage - prepare JSON file according to the template and save It (JSON_urls.json)
#       - in cmd use syntax .\openurl <app> <ver>, ex. .\openurl google img 

# provide app and ver as script parameters
$app = $args[0]
$ver = $args[1]

# read source JSON database
$PSO = Get-Content JSON_urls.json | ConvertFrom-json

# option of printing all available apps/urls with all + <any> parameters
if ($app -eq 'all')
{
    $PSO
}

$i=0

while ($i -lt 2000){
    if (($PSO[$i].app -eq $app) -and ($PSO[$i].ver -eq $ver))
    {
        $url = $PSO[$i].url
        $app_id = $PSO[$i].app_id
    }
    $i+=1
}

Write-Host ""
Write-Host "URL: $url"
Write-Host "appID: $app_id"
Write-Host ""

# open url - option 1 - default web browser
Start-Process $url

# open url - option 2 - selected browser (outcomment)
#Start-Process iexplore.exe $url
#Start-Process edge.exe $url
#Start-Process chrome.exe $url


exit
