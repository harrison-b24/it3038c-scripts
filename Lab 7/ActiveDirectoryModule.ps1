# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user's details
$UserName = "JohnDoe"  # Replace with the target username
$NewGroup = "NewGroup"  # Replace with the name of the new group
$NewPassword = "NewPassword123"  # Replace with the new password
$NewName = "John Doe"  # Replace with the new name
$NewEmailAddress = "johndoe@example.com"  # Replace with the new email address

# Step 1: Change User's Group
# Get the user's current group memberships
$User = Get-AdUser -Identity $UserName
$CurrentGroups = $User.MemberOf

# Remove the user from all groups (except the primary group)
$CurrentGroups | ForEach-Object {
    if ($_ -notlike "*CN=$NewGroup,*") {
        Remove-ADGroupMember -Identity $_ -Members $User -Confirm:$false
    }
}

# Add the user to the new group
Add-ADGroupMember -Identity $NewGroup -Members $User

# Step 2: Reset User's Password
Set-ADAccountPassword -Identity $User -NewPassword (ConvertTo-SecureString -String $NewPassword -AsPlainText -Force)
Enable-ADAccount -Identity $User

# Step 3: Update User Information
Set-AdUser -Identity $UserName -DisplayName $NewName -EmailAddress $NewEmailAddress

# Display a success message
Write-Host "User $UserName has been updated:"
Write-Host "New Group: $NewGroup"
Write-Host "Password Reset: Yes"
Write-Host "New Name: $NewName"
Write-Host "New Email Address: $NewEmailAddress"
