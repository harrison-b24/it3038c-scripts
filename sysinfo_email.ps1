function getIP {
    (Get-NetIPAddress).IPv4Address | Select-String "192*"
}

$IP = getIP
$User = $env:UserName
$ver = $PSVersionTable.PSVersion.Major.ToString()
$HOSTNAME = $env:COMPUTERNAME
$DATE = Get-Date -Format "dddd, MMMM dd, yyyy"

$BODY = "This machine's IP is $IP. User is $User. Hostname is $HOSTNAME. PowerShell version is $ver. Today's Date is $DATE."

Send-MailMessage -To "tallharry2000@gmail.com" -From "tallharry2000@gmail.com" -Subject "IT3038C Windows SysInfo" -Body $BODY -SmtpServer smtp.gmail.com -port 587 -UseSSL -Credential (Get-Credential) 


write-host($BODY)