echo "---------Installing NTP----------"
yum install ntp ntpdate
chkconfig ntpd on
ntpdate pool.ntp.org
/etc/init.d/ntpd start

echo "---------Disabling PRELINKING----------"
if grep -q ^PRELINKING /etc/sysconfig/prelink
then
  sed -i 's/PRELINKING.*/PRELINKING=no/g' /etc/sysconfig/prelink
else
  echo -e "\n# Set PRELINKING=no per security requirements" >> /etc/sysconfig/prelink
  echo "PRELINKING=no" >> /etc/sysconfig/prelink
fi

echo "---------Install AIDE - Advanced Intrusion Detection Environment----------"

yum install aide -y && /usr/sbin/aide --init && cp /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz && /usr/sbin/aide --check

echo "Configure periodic execution of AIDE, runs every morning at 04:30:"

echo "05 4 * * * root /usr/sbin/aide --check" >> /etc/crontab
