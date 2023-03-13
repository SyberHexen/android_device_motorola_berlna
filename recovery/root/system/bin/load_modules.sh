#!/sbin/sh

module_path=/lib/modules

load_modules()
{
    SLOT=$(getprop ro.boot.slot_suffix)
    mount /dev/block/mapper/vendor$SLOT /oem -O ro
    device_brand=""
    device_brand=$(getprop ro.product.brand)
    echo "device brand is: [$device_brand]"
    cp /oem/lib/modules/* /lib/modules
    case $device_brand in
        motorola)
            insmod $module_path/exfat.ko
            insmod $module_path/mmi_charger.ko
            insmod $module_path/mmi_sys_temp.ko
            insmod $module_path/utags.ko
            insmod $module_path/qpnp_adaptive_charge.ko
            insmod $module_path/bm_adsp_ulog.ko
            insmod $module_path/qti_glink_charger.ko
            insmod $module_path/snd_event_dlkm.ko
            insmod $module_path/q6_pdr_dlkm.ko
            insmod $module_path/q6_notifier_dlkm.ko
            insmod $module_path/apr_dlkm.ko
            insmod $module_path/adsp_loader_dlkm.ko
## Extra Modules ##
#            insmod $module_path/hdmi_dlkm.ko
#            insmod $module_path/hid-aksys.ko
#            insmod $module_path/rdbg.ko
#            insmod $module_path/moto_f_usbnet.ko
#            insmod $module_path/rmnet_ctl.ko
#            insmod $module_path/rmnet_core.ko
#            insmod $module_path/rmnet_shs.ko
#            insmod $module_path/rmnet_offload.ko
#            insmod $module_path/fc0012.ko
#            insmod $module_path/mt2063.ko
#            insmod $module_path/tda18212.ko
#            insmod $module_path/watchdogtest.ko
#            insmod $module_path/fc0013.ko
#            insmod $module_path/mt20xx.ko
#            insmod $module_path/rx_macro_dlkm.ko
#            insmod $module_path/tda18218.ko
#            insmod $module_path/wcd937x_dlkm.ko
#            insmod $module_path/fc2580.ko
#            insmod $module_path/mt2131.ko
#            insmod $module_path/qcom_edac.ko
#            insmod $module_path/tda18250.ko
#            insmod $module_path/wcd937x_slave_dlkm.ko
#            insmod $module_path/aw882xx_k504.ko
#            insmod $module_path/mt2266.ko
#            insmod $module_path/qm1d1b0004.ko
#            insmod $module_path/si2157.ko
#            insmod $module_path/tda9887.ko
#            insmod $module_path/wcd938x_dlkm.ko
#            insmod $module_path/mxl301rf.ko
#            insmod $module_path/qm1d1c0042.ko
#            insmod $module_path/slimbus-ngd.ko
#            insmod $module_path/tea5761.ko
#            insmod $module_path/wcd938x_slave_dlkm.ko
#            insmod $module_path/bolero_cdc_dlkm.ko
#            insmod $module_path/mxl5005s.ko
#            insmod $module_path/slimbus.ko
#            insmod $module_path/tea5767.ko
#            insmod $module_path/wcd9xxx_dlkm.ko
#            insmod $module_path/bt_fm_slim.ko
#            insmod $module_path/it913x.ko
#            insmod $module_path/mxl5007t.ko
#            insmod $module_path/qt1010.ko
#            insmod $module_path/wcd_core_dlkm.ko
#            insmod $module_path/btpower.ko
#            insmod $module_path/llcc_perfmon.ko
#            insmod $module_path/native_dlkm.ko
#            insmod $module_path/st21nfc.ko
#            insmod $module_path/tua9001.ko
#            insmod $module_path/m88rs6000t.ko
#            insmod $module_path/r820t.ko
#            insmod $module_path/stub_dlkm.ko
#            insmod $module_path/tuner-simple.ko
#            insmod $module_path/wsa883x_dlkm.ko
#            insmod $module_path/cci_intf.ko
#            insmod $module_path/machine_dlkm.ko
#            insmod $module_path/pinctrl_lpi_dlkm.ko
#            insmod $module_path/swr_ctrl_dlkm.ko
#            insmod $module_path/tuner-types.ko
#            insmod $module_path/wsa_macro_dlkm.ko
#            insmod $module_path/e4000.ko
#            insmod $module_path/max2165.ko
#            insmod $module_path/pinctrl_wcd_dlkm.ko
#            insmod $module_path/swr_dlkm.ko
#            insmod $module_path/tuner-xc2028.ko
#            insmod $module_path/xc4000.ko
#            insmod $module_path/ets_fps_mmi.ko
#            insmod $module_path/mbhc_dlkm.ko
#            insmod $module_path/msi001.ko
#            insmod $module_path/platform_dlkm.ko
#            insmod $module_path/swr_dmic_dlkm.ko
#            insmod $module_path/tx_macro_dlkm.ko
#            insmod $module_path/xc5000.ko
#            insmod $module_path/mc44s803.ko
#            insmod $module_path/q6_dlkm.ko
#            insmod $module_path/swr_haptics_dlkm.ko
#            insmod $module_path/fc0011.ko
#            insmod $module_path/mt2060.ko
#            insmod $module_path/sx937x_sar.ko
#            insmod $module_path/va_macro_dlkm.ko
            ;;
        *)
		    echo "$device_brand not supported"
            ;;
    esac
    umount /oem
}
load_modules

setprop twrp.modules.loaded true

exit 0
