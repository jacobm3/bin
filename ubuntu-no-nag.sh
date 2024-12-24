# Disable Ubuntu Pro advertising in /etc/motd
# works in 24.04.1 LTS
sudo sed -Ezi.orig \
  -e 's/(def _output_esm_service_status.outstream, have_esm_service, service_type.:\n)/\1    return\n/' \
  -e 's/(def _output_esm_package_alert.*?\n.*?\n.:\n)/\1    return\n/' \
  /usr/lib/update-notifier/apt_check.py

set -e

cd /etc/update-motd.d 
sudo mkdir -p bak 
for file in 10-help-text 50-landscape-sysinfo 50-motd-news; do
       if [ -f $file ]; then sudo mv $file bak; fi
       done

sudo /usr/lib/update-notifier/update-motd-updates-available --force

