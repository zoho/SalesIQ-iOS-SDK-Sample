main()
{
	IFS=@
	[ $5 ] || { echo " Usage: <PROJECT_HOME> <PROJECT_NAME> <SCHME_NAME> <PLIST_PATH> <CONFIGURATION>"; exit 1;}

	SetVariable "${1}" "${2}" "${3}" "${4}" "${5}"
	
        GenerateApp
        GenerateArchive

}
SetVariable()
{
	CURDIR=`pwd`
	PROJECT_HOME="${1}"
	PROJECT_NAME="${2}"
	SCHME_NAME="${3}"
	PLIST_PATH="${4}"
	CONFIGURATION="${5}"

	XCODE_VERSION="10_2"
	cd ${PROJECT_HOME}
}
GenerateApp()
{
    /Applications/Xcode_${XCODE_VERSION}.app/Contents/Developer/usr/bin/xcodebuild -scheme "${SCHME_NAME}" clean
    /Applications/Xcode_${XCODE_VERSION}.app/Contents/Developer/usr/bin/xcodebuild -scheme "${SCHME_NAME}" -configuration "${CONFIGURATION}" archive -archivePath "${PROJECT_HOME}/${PROJECT_NAME}.xcarchive" -project "${PROJECT_NAME}.xcodeproj" -UseModernBuildSystem=NO

}
GenerateArchive()
{
 	/Applications/Xcode_${XCODE_VERSION}.app/Contents/Developer/usr/bin/xcodebuild -exportArchive -exportOptionsPlist ${PLIST_PATH} -archivePath "${PROJECT_HOME}/${PROJECT_NAME}.xcarchive" -exportPath "${PROJECT_HOME}/${PROJECT_NAME}.xcarchive/Products/Applications"
}

main "${1}" "${2}" "${3}" "${4}" "${5}"

