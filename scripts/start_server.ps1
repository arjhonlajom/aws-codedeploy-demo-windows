
$url = "https://www.apachehaus.com/downloads/httpd-2.4.55-o111s-x86-vs17.zip" 
$download_loc = "scripts/apache_.zip"

## download from apache from apache house
Invoke-WebRequest -Uri $url -MaximumRedirection 0 -o $download_loc

## extract apache to tempfolder
$apache_extract_folder = "scripts/apache24"
Expand-Archive -LiteralPath $download_loc -DestinationPath $apache_extract_folder -Force

$TargetApacheFolder = "C:\Apache24"
if (Test-Path $TargetApacheFolder) {
    Write-Host "Folder Exists. Dont do anything"
    # Remove-Item -Path $TargetApacheFolder -Confirm:$false -Force -Recurse
    #Move-Item -Path $apache_extract_folder"/Apache24" -Destination $TargetApacheFolder -Force
}else{
    Write-Host "Folder Doesn't Exists"
    Move-Item -Path $apache_extract_folder"/Apache24" -Destination $TargetApacheFolder -Force
}

$apache_httpd_path = "C:\Apache24\bin\httpd.exe"
Start-Process -NoNewWindow -FilePath $apache_httpd_path -ArgumentList "-k install"
Start-Process -NoNewWindow -FilePath $apache_httpd_path -ArgumentList





