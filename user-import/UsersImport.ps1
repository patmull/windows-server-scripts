Import-Module ActiveDirectory # It works also without this, but the purpose is btw the error Handling: If the script encounters any Active Directory-related errors, the lack of the Import-Module ActiveDirectory command may make it more difficult to troubleshoot and diagnose the issue, as the script won't have access to the module-specific error messages and debugging tools.
$firstname = Read-Host -Prompt "Enter first name"
$lastname = Read-Host -Prompt "Enter last name"

New-ADUser `
    -Name "$($firstname.ToLower())-$($lastname.ToLower())" `
    -GivenName $firstname `
    -Surname $lastname `
    -UserPrincipalName "$($firstname.ToLower())-$($lastname.ToLower())" `
    -AccountPassword (ConvertTo-SecureString "Braf1234" -AsPlainText -Force) `
    -Path "OU=Domain Users,OU=osu,DC=opsy,DC=local" `
    -ChangePasswordAtLogon 1 `
    -Enable 1

<#
# Passwords:

$secureString = ConvertTo-SecureString "TestPassword123" -AsPlainText -Force
$secureString
$encryptedString = ConvertFrom-SecureString -SecureString $secureString
$encryptedString

# Be aware comments are displayed too after running the script!
# Do not put any sensitive info here!
#>
