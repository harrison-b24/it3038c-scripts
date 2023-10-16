This script does 3 things

First, it changes the user's group(s) and removes existing groups
Second, it resets the user's password and enables their account
And third, it updates their account information

Note, the updated account information is defined before everything else due to how the script is written more as a test than anything.
If account information needs to be updated using the script, enter it towards the top for the designated variables. If not, this part can be commented out.
This script would have been better as three different scripts rather than one but this is really just a test of the active directory module more than anything.
