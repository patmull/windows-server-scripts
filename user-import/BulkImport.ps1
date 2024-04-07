Import-Module ActiveDirectory

# 1st part: trying loading files
$filepath = Read-Host -Prompt "Enter file path to CSV"
$users = Import-Csv $filepath
# 2nd part
foreach ($User in $users) {
    # Define the parameters using a hashtable
    $UserParams = @{
        UserPrincipalName     = "$($User.firstname.ToLower())-$($User.lastname.ToLower())"
        Name                  = "$($User.firstname.ToLower())-$($User.lastname.ToLower())" # = user name (= login)
        GivenName             = $User.firstname
        Surname               = $User.lastname
        Initial               = $User.initials
        Enabled               = $True
        DisplayName           = "$($User.firstname) $($User.lastname)"
        Path                  = $User.ou # This field refers to the OU the user account is to be created in
        City                  = $User.city
        PostalCode            = $User.zipcode
        Country               = $User.country
        Company               = $User.company
        State                 = $User.state
        StreetAddress         = $User.streetaddress
        OfficePhone           = $User.telephone
        EmailAddress          = $User.email
        Title                 = $User.jobtitle
        Department            = $User.department
        AccountPassword       = (ConvertTo-secureString $User.password -AsPlainText -Force)
        ChangePasswordAtLogon = 1
    }

    # Better way to handle the params:
    New-ADUser @UserParams
    echo "Account created"
}