#!/bin/bash 

# Install dependancies
apt install hostapd bridge-utils

# Setup DHCP 
if grep -q "denyinterfaces wlan0" /etc/dhcpcd.conf;
then
    echo "denyinterfaces wlan0" >> /etc/dhcpcd.conf
fi

if grep -q "denyinterfaces eth0" /etc/dhcpcd.conf;
then
    echo "denyinterfaces eth0" >> /etc/dhcpcd.conf
fi

# Add bridge information interface 
if grep -q "br0" /etc/network/interfaces;
then 
    echo "# Bridge setup" >> /etc/network/interfaces
    echo "auto br0" >> /etc/network/interfaces
    echo "iface br0 inet manual" >> /etc/network/interfaces
    echo "bridge_ports eth0 wlan0" >> /etc/network/interfaces
fi

ifup bro 
systemctl restart dhcpcd 

# Configuration hostapd

cat >/etc/hostapd/hostapd.conf <<EOL 
interface=wlan0
bridge=br0
#driver=nl80211
ssid=NameOfNetwork
hw_mode=g
channel=7
wmm_enabled=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=1234578
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
EOL

cat >/etc/default/hostapd <<EOL 
DAEMON_CONF="/etc/hostapd/hostapd.conf"
EOL

sed "11d" /lib/systemd/system/hostapd.service

systemctl unmask hostapd
systemctl enable hostapd
systemctl start hostapd

