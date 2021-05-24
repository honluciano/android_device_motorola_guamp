#!/system/bin/sh
insmod /v/lib/modules/chipone_tddi_mmi.ko
insmod /vendor/lib/modules/chipone_tddi_mmi.ko
insmod /vendor/lib/modules/fpc1020_mmi.ko
insmod /vendor/lib/modules/goodix_fod_mmi.ko
insmod /vendor/lib/modules/himax_v3_mmi.ko
insmod /vendor/lib/modules/himax_v3_mmi_hx83102d.ko
insmod /vendor/lib/modules/ili9882_mmi.ko

wait 1

setprop modules.loaded 1

firmware_path=/vendor/firmware/ICNL9911.bin
flash_path=/sys/chipone-tddi/cts_firmware

wait_for_poweron()
{
	local wait_nomore
	local readiness
	local count
	wait_nomore=60
	count=0
	readiness=$(cat $touch_path_fts/poweron)
	while true; do
		if [ "$readiness" == "1" ]; then
			break;
		fi
		count=$((count+1))
		[ $count -eq $wait_nomore ] && break
		sleep 1
	done
	if [ $count -eq $wait_nomore ]; then
		return 1
	fi
	return 0
}

if [ ! -d $touch_path_chipone ];
then
    wait_for_poweron
    echo $firmware_path > $flash_path/update_from_file
fi

exit 0
