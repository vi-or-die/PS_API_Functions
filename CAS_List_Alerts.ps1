Function ListO365Alerts {
param(
    [Parameter(mandatory=$True)] [string]$API_Token,
    [Parameter(mandatory=$True)] [string]$API_uri
)
    [string]$endpoint = "alerts"
    [string]$API_Uri = "$API_uri/$endpoint/"
    [string]$API_Method = "Post"
    $API_headers = @{Authorization = "Token $API_Token"}
    $body = @{
        limit = 100
        skip = 0
        filters = @{
            read = @{
                eq = $False
            }
            resolutionStatus = @{
                eq = 0
            }
        }
    }
    Invoke-RestMethod -Uri $API_Uri -Headers $API_headers -Method $API_Method -Body ($body | ConvertTo-Json -Depth 2) -Verbose
}
