$CurrentPath = (get-location).path
$UDID = Get-Content $CurrentPath\UDID.txt
# Goes to LibimobileDevice Path from workaround files execution
cd $CurrentPath
cd..
$LibiPath = (get-location).path


$AppID = Read-Host "Please enter your AppID/BundleID"
echo ""
echo "Copy this and place in a file"
echo "Results:"
echo ""

echo "$LibiPath\idevicedebug -u $UDID -n --detach run $AppID"
echo ""
pause