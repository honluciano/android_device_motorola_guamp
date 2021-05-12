#!/system/bin/sh

insmod /vendor/lib/modules/nova_0flash_mmi.ko
insmod /vendor/lib/modules/mmi_annotate.ko
insmod /vendor/lib/modules/mmi_info.ko
insmod /vendor/lib/modules/mmi_sys_temp.ko
insmod /vendor/lib/modules/sensors_class.ko
insmod /vendor/lib/modules/exfat.ko
wait 1

setprop modules.loaded 1

exit 0