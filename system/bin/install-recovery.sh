#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:9111552:b4895727f3674eb9786bbd1a261fc7d7451dc6bd; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:8144896:197cba14991f2d893a917b4d041833656db90e71 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 0b70e3085ff28f7b882510241290c813585c6b78 9109504 197cba14991f2d893a917b4d041833656db90e71:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=9109504 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
