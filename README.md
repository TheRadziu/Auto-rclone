# Auto-rclone
Simple bash(linux) and batch(windows) script to autorotate the service accounts using vanilla rclone. When quota is reached on current service account script will immidiately move to next service account. 

## Requirements:
- rclone at least version 1.61.1
- service account files in single directory named from 0.json to 99.json (amount of service accounts can be lower or higher, for more info look below)

## How to use
### Linux
Download `auto-rclone.sh` and edit those lines:  
`SOURCE="Your source:"` with source remote,  
`DESTINATION="Your destination:"` with destination remote,  
`/usr/bin/rclone --config="/rclone/config/location/path/rclone.conf" \` with path to your config, remove this argument if you dont need custom config location,  
`--drive-service-account-file "/service/accounts/path/$COUNTER.json" \` with path to the directory with Service Account json files, leaving `/$COUNTER.json` at the end

Optional changes you can make:  
`COUNTER=0` edit to desired service account's number if you know previous ones are still quota'ed. For example if 0-37 are quota'ed change this value to 38,  
`while [ $COUNTER -lt 100 ]; do` where 100 is number of service accounts +1 (in this case 99). if you only have 50 service accounts edit this 100 to 51,  
`--drive-server-side-across-configs \` delete this line if you want your files reuploaded rather than copied via google's cables.

### Windows
Download `auto-rclone.bat` and edit those lines:  
`SET SOURCE=Your Source:` with source remote,  
`SET DESTINATION=Your Destination:` with destination remote,  
`SET SUBDIRECTORY=Subdirectory if Needed` If set, it will only sync selected subdirectory, will sync everything if left empty  
`SET arguments="--config=C:\rclone\config\location\path\rclone.conf" "--fast-list" "--drive-server-side-across-configs" "--transfers=10" "--tpslimit=5" "--drive-acknowledge-abuse" "-P"` with your desired arguments. Delete or add arguments if needed. Set path to rclone.conf if you are using custom config location,  
`SET rclone_location="C:\path\rclone.exe"` with direct path to rclone.exe,  
`SET SA_location="C:\service\accounts\path"` with path to the directory with Service Account json files, without trailing slash.

Optional changes you can make:  
`SET /a COUNTER=0` edit to desired service account's number if you know previous ones are still quota'ed. For example if 0-37 are quota'ed change this value to 38,  
`SET /a AMOUNT_OF_SA=99` where 99 is number of service accounts. If you only have 50 service accounts edit this 99 to 50,  
`"--drive-server-side-across-configs"` delete this flag from `SET arguments=` if you want your files reuploaded rather than copied via google's cables.
