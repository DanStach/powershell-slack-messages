# Example of attachment with logo slack message  sent via powershell

$Input_Testenvironment = "PRD"
$Input_TestURL = "https://www.google.com"
$Input_Category = "Smoke"
$testsTotal = 100
$testsPassed = 99
$testsFailed = 1
$testsBuildId = 55555
$testsName = "TFS_Build_Name_Example"
$buildBranch = "origin/of-life"
$Text1 = "*Experiment please disregard - AttachmentLogo*"
$Text2 = "*http://lmgtfy.com/?q=$testsBuildId|$testsName>*
$Input_TestURL $Input_Category
<http://lmgtfy.com/?q=$buildBranch|$buildBranch> 
TOTAL:$testsTotal, PASS=$testsPassed, FAIL=$testsFailed"
$SlackWebHookUri = "https://hooks.slack.com/services/<your webhook info>"
$logo = "https://media1.tenor.com/images/90f6c9e9a524b23833622a846ce3ecfc/tenor.gif?itemid=5630386"
$Color = "#006a4d"

$Payload = [pscustomobject] @{
  channel = $Channel
  text = $Text1
  attachments = , [pscustomobject] @{
    mrkdwn_in = , 'text'
    color = $Color
    thumb_url = $logo 
    text = $Text2
  }
}
Invoke-RestMethod -Method Post -Uri $SlackWebHookUri -Body (ConvertTo-Json -InputObject $Payload)