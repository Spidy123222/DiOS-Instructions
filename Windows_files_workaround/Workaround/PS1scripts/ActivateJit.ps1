$CurrentPath = (get-location).path

cd $CurrentPath
cd..

$CurrentPathforUDID = (get-location).path
$UDID = Get-Content $CurrentPathforUDID\UDID.txt
# Goes to LibimobileDevice Path from workaround files execution
cd $CurrentPath
cd..
cd..




echo "Path:"
$Ps1FileLocation

echo ""
echo ""


#$GetUDID = ./idevice_id.exe --list


echo "UDID:" $UDID

echo ""
echo ""

$AppID = Read-Host "Please enter your AppID/BundleID"

$Activate = .\idevicedebug.exe -u $UDID -n --detach run $AppID
$Activate = .\idevicedebug.exe -u $UDID --detach run $AppID

pause










