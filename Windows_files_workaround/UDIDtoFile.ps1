$CurrentPath = (get-location).path
$CurrentPathforUDID = (get-location).path

cd $CurrentPath
cd..
$GetUDID = ./idevice_id.exe --list
$UDID = $GetUDID
cd $CurrentPath


Clear-Content $CurrentPath\UDID.txt
Add-Content $CurrentPath\UDID.txt $UDID
clear
echo "UDID:"
$UDID

pause



