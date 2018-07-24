# Example of a simple slack message sent via powershell

$Input_Testenvironment = "PRD"
$Input_TestURL = "https://www.google.com"
$Input_Category = "Smoke"

$testsTotal = 100
$testsPassed = 99
$testsFailed = 1

$SlackWebHookUri = "https://hooks.slack.com/services/<your webhook info>" 
$Payload = @{ "text" = "$Input_Testenvironment - $Input_TestURL - UI tests finished for $Input_Category
TOTAL=$testsTotal, PASSED=$testsPassed, FAILED=$testsFailed";}

Invoke-RestMethod -Method Post -Uri $SlackWebHookUri -Body (ConvertTo-Json -InputObject $Payload)