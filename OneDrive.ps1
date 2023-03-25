$domain = "acmecomputercompany-my.sharepoint.com/" # replace with your target domain
$vulnUrl = "https://$domain/personal/" # OneDrive URL to check

try {
    $response = Invoke-WebRequest $vulnUrl -UseBasicParsing -ErrorAction Stop
    $status = $response.StatusCode
} catch {
    $status = $_.Exception.Response.StatusCode.Value__
}

if ($status -eq 200) {
    Write-Host "OneDrive Enumeration possible on $domain"
} else {
    Write-Host "OneDrive Enumeration not possible on $domain"
}
