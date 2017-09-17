`crontab -e`
add to crontab:
`@reboot PATH="$PATH:/usr/local/bin/"; /home/pi/.npm/bin/cnc >> /home/pi/cnc.log 2>&1`
