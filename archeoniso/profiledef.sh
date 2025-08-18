#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_date="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%m%d%Y)"

iso_name="archeon"
iso_label="ARCHEON_${iso_date}"
iso_publisher="Erffy <https://github.com/erffy>"
iso_application="Archeon Live/Rescue DVD"
iso_version="${iso_date}"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
iso_fullname="${iso_name}-${iso_date}-${arch}.iso"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '22' '-b' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/gshadow"]="0:0:400"
  ["/etc/polkit-1/rules.d"]="0:0:750"
  ["/root"]="0:0:750"
  ["/usr/local/bin/switch-nm"]="0:0:755"
  ["/usr/local/bin/fix-keyring"]="0:0:755"
)