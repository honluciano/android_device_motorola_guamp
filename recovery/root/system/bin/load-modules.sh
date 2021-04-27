#!/system/bin/sh

insmod /vendor/lib/modules/chipone_tddi_mmi.ko
insmod /vendor/lib/modules/fpc1020_mmi.ko
insmod /vendor/lib/modules/goodix_fod_mmi.ko
insmod /vendor/lib/modules/himax_v3_mmi.ko
insmod /vendor/lib/modules/himax_v3_mmi_hx83102d.ko
insmod /vendor/lib/modules/ili9882_mmi.ko
insmod /vendor/lib/modules/mmi_annotate.ko
insmod /vendor/lib/modules/mmi_info.ko
insmod /vendor/lib/modules/mmi_sys_temp.ko
insmod /vendor/lib/modules/sensors_class.ko
insmod /vendor/lib/modules/exfat.ko
wait 1

setprop modules.loaded 1

exit 0