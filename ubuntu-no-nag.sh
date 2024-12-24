# Disable Ubuntu Pro advertising in /etc/motd
# works in 24.04.1 LTS
sudo sed -Ezi.orig \
  -e 's/(def _output_esm_service_status.outstream, have_esm_service, service_type.:\n)/\1    return\n/' \
  -e 's/(def _output_esm_package_alert.*?\n.*?\n.:\n)/\1    return\n/' \
  /usr/lib/update-notifier/apt_check.py

sudo /usr/lib/update-notifier/update-motd-updates-available --force

