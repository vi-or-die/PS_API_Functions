Function UpdateO365Alert {
param(
    [Parameter(mandatory=$True)] [string]$Alert_id,
    [Parameter(mandatory=$True)] [string]$API_Token,
    [Parameter(mandatory=$True)] [string]$API_uri,
    [Parameter(Mandatory=$True)] [ValidateSet("unread","read","dismissed")] [String]$Action
)
    
    [string]$endpoint = "alerts"
    [string]$API_Uri = "$API_uri/$endpoint/$Alert_id"
    [string]$API_Method = "Post"
    $API_headers = @{Authorization = "Token $API_Token"}

    if($Action -eq "unread"){
        Invoke-RestMethod -Uri "$API_Uri/unread/" -Headers $API_headers -Method $API_Method -Verbose
    }
    elseif($Action -eq "read"){
        Invoke-RestMethod -Uri "$API_Uri/read/" -Headers $API_headers -Method $API_Method -Verbose
    }
    elseif($Action -eq "dismissed"){
        Invoke-RestMethod -Uri "$API_Uri/dismiss/" -Headers $API_headers -Method $API_Method -Verbose
    }
    
}
