# Import the required module for web requests
Import-Module -Name Microsoft.PowerShell.Utility
# Set the URL of the website you want to scrape
$url = "https://example.com"
# Send a GET request to the URL
$response = Invoke-WebRequest -Uri $url
# Check if the request was successful
if ($response.StatusCode -eq 200) {
    # Parse the HTML content
    $html = $response.Content
    # Use regular expressions, HTML parsers, or other methods to extract data
    $itemNames = $html | Select-String -Pattern '<div class="item-name">(.*?)</div>' | ForEach-Object { $_.Matches.Groups[1].Value }
    $itemPrices = $html | Select-String -Pattern '<div class="item-price">(.*?)</div>' | ForEach-Object { $_.Matches.Groups[1].Value }
    
    # Print the extracted data
    for ($i = 0; $i -lt $itemNames.Count; $i++) {
        Write-Host "Item Name: $($itemNames[$i]) - Price: $($itemPrices[$i])"
    }
} else {
    Write-Host "Failed to retrieve the webpage. Status code: $($response.StatusCode)"
}
