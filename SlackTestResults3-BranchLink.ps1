# Example of a code branch link in a slack message sent via powershell

$Input_Testenvironment = "PRD"
$Input_TestURL = "https://www.google.com"
$Input_Category = "Smoke"
$testsTotal = 100
$testsPassed = 99
$testsFailed = 1
$testsBuildId = 55555
$testsName = "TFS_Build_Name_Example"
$buildBranch = "origin/of-life"
$Text = "*Experiment please disregard - BranchLink*
*<http://lmgtfy.com/?q=$testsBuildId |$testsName>*
$Input_TestURL $Input_Category
<http://lmgtfy.com/?q=$buildBranch |$buildBranch>
TOTAL:$testsTotal, PASS=$testsPassed, FAIL=$testsFailed"
$SlackWebHookUri = "https://hooks.slack.com/services/<your webhook info>" 

$Payload = @{ "text" = "$Text";}
Invoke-RestMethod -Method Post -Uri $SlackWebHookUri -Body (ConvertTo-Json -InputObject $Payload)