# Created directory called Test 
# adds 10 directories titled 1-10
# adds a file to each directory based on directory name
# adds text value of file/directory name to each file
# folder 3 has file 3 has number 3 inside it 

Set-Location -Path C:\

for ($i=1; $i -le 10; $i++) {
#make dir
New-Item -Path c:\Test -ItemType directory -Name $i
# set date to x
$date = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
# append date + command to log
"$date New-Item -Path c:\Test -ItemType directory -Name $i" | Out-File c:\Test\log.txt -Append
}

# go to new folder test
Set-Location -Path C:\Test

Get-ChildItem -Recurse -Directory | ForEach-Object {
# get date
$date = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
# add file + content
New-Item -ItemType file -Path "$($_.FullName)" -Name "$($_.Name).txt"  -Value "$($_.Name)"
# write to log
"$date New-Item -ItemType file -Path $($_.FullName) -Name $($_.Name).txt  -Value $($_.Name)" | Out-File c:\Test\log.txt -Append 
}


<#
About Execution Policies
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-6&viewFallbackFrom=powershell-Microsoft.PowerShell.Core
  View Exe Policy
    Get-ExecutionPolicy
 
  Change Your Execution Policy
    Set-ExecutionPolicy -ExecutionPolicy <name>

AllSigned
  signed Scripts can run.
Unrestricted
  everything runs - not great

Requires that all scripts and configuration files be signed by a trusted publisher, including scripts that you write on the local computer.

Prompts you before running scripts from publishers that you have not yet classified as trusted or untrusted.

Risks running signed, but malicious, scripts.

Manage Signed and Unsigned Scripts -- just gonna let unsigned scripts run for now


# Set-Location -Path C:\users

# mkdir, md
# New-Item -Path c:\Test -ItemType directory
# New-Item -Path . -Name "testfile1.txt" -ItemType "file" -Value "This is a text string."


for ( i = 0: i > 10; i++)
{
    New-Item -Path c:\Test -ItemType directory
    New-Item -Path . -Name "testfile1.txt" -ItemType "file" -Value "This is a text string."
}

create log
loop x
    create dir, file, context
    wrire to log



# for loop prints $i in new line
# for ($i=1; $i -le 10; $i++) {mkdir $i}

# Get-ChildItem: Gets the items and child items in one or more specified locations.
#   -Recurse parameter to get items in all child containers 
#   -Depth parameter to limit the number of levels to recurse.
#   -Attributes parameter
#     Gets files and folders with the specified attributes. This parameter supports all attributes and lets you specify complex combinations of attributes.
#     -Directory gets directories 

# To find files and folders with commonly used attributes, you can use the -Attributes parameter, or the -Directory, -File, -Hidden, -ReadOnly, and -System switch parameters.
# Get-ChildItem -Recurse -Directory | ForEach-Object {New-Item -ItemType file -Path "$($_.FullName)" -Name "$($_.Name).txt"  -Value "$($_.Name)" }



"Something happened" | Out-File c:\log.txt -Append

Found on Spiceworks: https://community.spiceworks.com/topic/1233789-add-logging-to-powershell-script?utm_source=copy_paste&utm_campaign=growth



for ($i=1; $i -le 10; $i++) {
#make dir
New-Item -Path c:\Test -ItemType directory -Name $i

# set date to x
$x = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)

# append date + command to log
"$x New-Item -Path c:\Test -ItemType directory -Name $i" | Out-File c:\Test\log.txt -Append
}

Get-ChildItem -Recurse -Directory | ForEach-Object {New-Item -ItemType file -Path "$($_.FullName)" -Name "$($_.Name).txt"  -Value "$($_.Name)" }
Get-ChildItem -Recurse -Directory | ForEach-Object {"New-Item -ItemType file -Path $($_.FullName) -Name $($_.Name).txt  -Value $($_.Name)" | Out-File c:\Test\log.txt -Append }

#>


 

