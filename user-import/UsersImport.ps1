Import-Module ActiveDirectory
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