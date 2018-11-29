# adlds-docker - A Docker Image for Active Directory Lightweight Directory Services

## Adding information to the directory with Powershell

```powershell
$secpasswd = ConvertTo-SecureString "4DLD$4dmin2017!" -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ("ADLDSAdmin", $secpasswd)

New-ADUser GlenJohn -Type iNetOrgPerson -Path "DC=local" -server localhost:389 -authtype 1 -credential $mycreds
```
