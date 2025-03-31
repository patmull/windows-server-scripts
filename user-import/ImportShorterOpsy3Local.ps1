Import-Module ActiveDirectory

$filepath = Read-Host -Prompt "Enter the path to CSV file"
$users = Import-Csv $filepath

foreach($user in $users) {
    $loginName = "$($user.FirstName.ToLower())-$($user.LastName.ToLower())"
    echo $user
    $userParams = @{
        UserPrincipalName = $loginName
        Name = $loginName
        GivenName = $user.FirstName
        Surname = $user.LastName
        Enabled = $True
        DisplayName = "$($user.FirstName) $($user.LastName)"
        ChangePasswordAtLogon = 1
        AccountPassword = (ConvertTo-SecureString $user.Password -AsPlainText -Force)
        Path = $user.OU # I need to set the OU here. Show what happend without this.
    }
    echo "User params created."
    New-ADUser @userParams
    echo "New user added"
}

echo "Users succesfully added!"
