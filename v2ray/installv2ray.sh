#!/bin/bash

# 检查当前用户是否具有足够权限
if [ "$(id -u)" != "0" ]; then
  echo "请使用 root 权限运行此脚本。"
  exit 1
fi

# 设置目标目录
install_dir="/usr/local"
mkdir "$install_dir/share/v2ray/"
mkdir "$install_dir/etc/v2ray/"

# 复制文件到目标目录
cp v2ray "$install_dir/bin/"
cp v2ctl "$install_dir/bin/"
cp geoip.dat "$install_dir/share/v2ray/"
cp geosite.dat "$install_dir/share/v2ray/"
cp config.json "$install_dir/etc/v2ray/"

# 创建日志目录和文件
log_dir="/var/log/v2ray"
mkdir -p "$log_dir"
touch "$log_dir/access.log" "$log_dir/error.log"

# 复制 systemd 服务文件
cp v2ray.service /etc/systemd/system/
cp v2ray@.service /etc/systemd/system/

# 设置文件权限
chmod +x "$install_dir/bin/v2ray" "$install_dir/bin/v2ctl"
chmod 644 "$install_dir/share/v2ray/geoip.dat" "$install_dir/share/v2ray/geosite.dat"
chmod 644 "$install_dir/etc/v2ray/config.json"
chmod 644 "$log_dir/access.log" "$log_dir/error.log"
chmod 644 /etc/systemd/system/v2ray.service /etc/systemd/system/v2ray@.service

# 重新加载 systemd 配置
systemctl daemon-reload

echo "安装完成。"

