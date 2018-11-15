Function CreateHiveAlert {
param(
    [Parameter(mandatory=$True)] [string]$Title,
    [Parameter(mandatory=$True)] $Description,
    [Parameter(mandatory=$True)] [string]$Source,
    [Parameter(mandatory=$True)] [string]$SourceRef,
    [Parameter(mandatory=$True)] [string]$Token,
    [Parameter(mandatory=$True)] [int]$Severity = 1
)

    [int]$tlp = 1
    [string]$API_Uri = "$HiveUri/alert"
    [string]$API_Method = "Post"
    $description = $Alert_Description -replace '<[^>]+>',''
    
    $API_headers = @{Authorization = "Bearer $Token"}
    $body = @{
        title = "$title"
        description = "$description"
        type ="external"
        source ="$Source"
        sourceRef ="$SourceRef"
        severity = $Severity
        tlp = $tlp
    }
    $JsonBody = $body | ConvertTo-Json
    Invoke-RestMethod -Uri $API_Uri -Headers $API_headers -Body $JsonBody -Method $API_Method -ContentType 'application/json' -Verbose
}
