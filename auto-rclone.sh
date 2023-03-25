#!/bin/bash
COUNTER=0
SOURCE="Your source:"
DESTINATION="Your destination:"
while [ $COUNTER -lt 100 ]; do
echo [$(date +%H:%M:%S)] Using service account $COUNTER
/usr/bin/rclone --config="/rclone/config/location/path/rclone.conf" \
sync \
"$SOURCE" \
"$DESTINATION" \
--drive-service-account-file "/service/accounts/path/$COUNTER.json" \
--drive-stop-on-upload-limit=true \
--drive-server-side-across-configs \
--fast-list --transfers=10 --tpslimit 5 \
--drive-acknowledge-abuse \
-P
exitcode=$?
if [ $exitcode -eq 0 ]; then
echo [$(date +%H:%M:%S)] Everything is up to date and synced!
exit $exitcode
fi
let COUNTER=COUNTER+1
done
echo [$(date +%H:%M:%S)] Ran out of all Service Accounts. Quitting.
