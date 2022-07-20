# This script is for batch removing a list of users from a list of AD groups.
$userlist = import-csv C:\TEMP\users.csv
$grouplist = import-csv C:\TEMP\groups.csv

# The script looks for columns with the headers "account" and "grouplist".
ForEach($group in $grouplist)
    {
    Get-ADGroupMember -Identity $group.grouplist | 
    %{Remove-ADGroupMember -Identity $group.grouplist -Members $userlist.account -Confirm:$false}
    }