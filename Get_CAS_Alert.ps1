Function FetchO365Alerts {
param(
    [Parameter(mandatory=$True)] [string]$Alert_id,
    [Parameter(mandatory=$True)] [string]$API_Token,
    [Parameter(mandatory=$True)] [string]$API_uri
)

    [string]$endpoint = "alerts"
    [string]$API_Uri = "$API_uri/$endpoint/$Alert_id/"
    [string]$API_Method = "Get"
    $API_headers = @{Authorization = "Token $API_Token"}

    Invoke-RestMethod -Uri $API_Uri -Headers $API_headers -Method $API_Method -Verbose
}
