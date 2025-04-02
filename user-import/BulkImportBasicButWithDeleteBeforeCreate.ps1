Import-Module ActiveDirectory

$filePath = Read-Host -Prompt "enter file path for csv"

$usersCsv = Import-Csv $filePath


foreach($userRow in $usersCsv) {
    echo $userRow.FirstName
    Remove-ADUser -Identity "$($userRow.FirstName.ToLower()).$($userRow.LastName.ToLower())" -Confirm:$false
    New-ADUser `
        -Name "$($userRow.FirstName.ToLower()).$($userRow.LastName.ToLower())" `
        -AccountPassword (ConvertTo-SecureString "TestUser1234" -AsPlainText -Force) `
        -GivenName $userRow.FirstName `
        -Surname $userRow.Lastname `
        -UserPrincipalName "$($userRow.FirstName.ToLower()).$($userRow.LastName.ToLower())" `
        -Path "OU=studentsUsersTest,OU=students,OU=opsy,DC=opsy3,DC=local" `
        -Enabled 1
    `
    echo "user created"
}


<# enter file path for csv: C:\Users\Administrator\Scripts\NewUsersEdited.csv #>