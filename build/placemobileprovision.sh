main()
{
        SetVariables "${1}"
}
SetVariables()
{
        CDIR=`pwd`
        PROFILE_DIR="${1}"
        InstallProfiles
}
InstallProfiles()
{
        cd ${PROFILE_DIR}
        for pfile in `find . -name "*.mobileprovision" | sed 's/.\///g'`
        do
        	uuid=`${CDIR}/mobileprovisionParser -f "${pfile}" -o uuid`
        	output="${HOME}/Library/MobileDevice/Provisioning Profiles/${uuid}.mobileprovision"
        	cp "${pfile}" "${output}"

                echo "Profile Name: ${pfile}"
		echo "Profile UUID: ${uuid}"
		echo "Profile Copied Location: ${output}"
        done
}
main "${1}"

