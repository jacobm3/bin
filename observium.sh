# 
dir="~/observium"
mkdir $dir && cd $dir

wget http://www.observium.org/observium_installscript.sh
chmod +x observium_installscript.sh
sudo ./observium_installscript.sh


# setup snmpd 
sudo apt install -y snmpd
sudo cp /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.dist
sudo sed -i 's/^sysLocation .*/sysLocation Houston Office/' /etc/snmp/snmpd.conf
sudo sed -i 's/^agentaddress .*/agentaddress 0.0.0.0/' /etc/snmp/snmpd.conf
sudo sed -i 's/^rocommunity .*/rocommunity  public default/' /etc/snmp/snmpd.conf

