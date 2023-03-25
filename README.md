# OneDriveEnumeration
To assess a remote domain for OneDrive enumeration.

# The Code

$domain = "example.com" # replace with your target domain <br>
$vulnUrl = "https://$domain/personal/" # OneDrive URL to check <br>

try { <br>
    $response = Invoke-WebRequest $vulnUrl -UseBasicParsing -ErrorAction Stop <br>
    $status = $response.StatusCode <br>
} catch { <br>
    $status = $_.Exception.Response.StatusCode.Value__ <br>
} <br>

if ($status -eq 200) { <br>
    Write-Host "OneDrive Enumeration possible on $domain" <br>
} else { <br>
    Write-Host "OneDrive Enumeration not possible on $domain" <br>
}

# Explaination

In this code, we are using the Invoke-WebRequest cmdlet to make a request to the OneDrive URL for the remote domain. We are checking the status code of the response to determine if the OneDrive enumeration is possible or not.
