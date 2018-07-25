# Example of attachment with logo slack message  sent via powershell
$Input_Testenvironment = "PRD"
$Input_TestURL = "google.com"
$Input_Category = "Smoke"
$testsTotal = 100
$testsPassed = 99
$testsFailed = 1
$testsBuildId = 55555
$testsName = "TFS_Build_Name_Example"
$buildBranch = "origin/of-life"

$Text1 = "*Experiment please disregard - AttachmentFields*"
$Text2 = "*<http://lmgtfy.com/?q=$testsBuildId | $testsName>*"
$Test3 = "<http://lmgtfy.com/?q=$buildBranch | $buildBranch>"
$Test4 = "TOTAL:$testsTotal, PASS=$testsPassed, FAIL=$testsFailed"
$SlackWebHookUri = "https://hooks.slack.com/services/<your webhook info>"
$logo = "https://media1.tenor.com/images/90f6c9e9a524b23833622a846ce3ecfc/tenor.gif?itemid=5630386"
$Color = "#006a4d"

$Payload = [pscustomobject] @{
  channel = $Channel
  text = $Text1
  attachments = , [pscustomobject] @{

    color = $Color
    thumb_url = $logo 
    mrkdwn_in = , 'text'
    title = $testsName
    title_link = "https://tfs.cbre.com/tfs/CBRE01/CBRE.com/_build/index?buildId=$testsBuildId"
    fields= [pscustomobject] @{
                title = "Catigory"
                value = $Input_Category
                short = $true
            },

            @{
                title = "URL"
                value = $Input_TestURL
                short = $true
            },
            @{
                title = "Results"
                value = $Test4
                short = $true
            },
            @{
                title = "Branch"
                value = $Test3
                short = $true
            }
  }
}
Invoke-RestMethod -Method Post -Uri $SlackWebHookUri -Body (ConvertTo-Json -Depth 4 -InputObject $Payload)