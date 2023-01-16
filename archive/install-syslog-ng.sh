sudo DEBIAN_FRONTEND=noninteractive apt install -y syslog-ng

cd /etc/syslog-ng
sudo mv syslog-ng.conf syslog-ng.conf.dist
sudo mkdir -p /var/log/syslog-ng
sudo touch /var/log/syslog-ng/messages /var/log/syslog-ng/audit
sudo chmod 644 /var/log/syslog-ng/messages /var/log/syslog-ng/audit

sudo tee /etc/syslog-ng/syslog-ng.conf <<EOF
@version: 3.25
@include "scl.conf"
@include "/usr/share/syslog-ng/include/scl/system/tty10.conf"
    options {
        time-reap(30);
        mark-freq(10);
        keep-hostname(yes);
        };

# Vault audit logs
template t_imp {
  template("\$MSG\n");
  template_escape(no);
};

source s_vault_tcp {
         network(
           flags(no-parse)
           log-msg-size(268435456)
           transport(tcp) port(1515));
       };

destination d_vault {
        file(
            "/var/log/syslog-ng/audit"
            template(t_imp)
            owner("root")
            group("root")
            perm(0644)
            ); };

# System messages
source s_messages_tcp { network(transport(tcp) port(1514)); };
destination d_messages {
        file(
            "/var/log/syslog-ng/messages"
            owner("root")
            group("root")
            perm(0644)
            ); };

log { source(s_messages_tcp); destination(d_messages); };
log { source(s_vault_tcp); destination(d_vault); };


EOF

sudo systemctl restart syslog-ng

sudo netstat -anp | grep :151

# forward vault audit logs
vault audit enable socket address=10.0.143.159:1515 socket_type=tcp hmac_accessor=false
vault audit enable socket address=127.0.0.1:1515 socket_type=tcp hmac_accessor=false log_raw=true


# forward system logs from vault nodes
sudo tee /etc/rsyslog.d/70-vault-remote.conf <<EOF
*.* @@10.0.143.159:1514
EOF
sudo systemctl restart rsyslog
