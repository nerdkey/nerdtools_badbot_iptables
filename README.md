nerdtools_badbot_iptables
=========================

Uses information from the NerdTools Bad Bots database with iptables to reject access for known bots. 

###How does it work?###
The script is periodically ran via crontab and works by downloading a list of recent bad IP addresses using cURL. Each IP address is parsed into an iptables rule which denies further access.

Designed with flexability in mind, existing firewall rules will be saved before any new ones are added.

###Requirements###
* Crontab
* Curl
* iptables

###FAQ###
* How often is it recommended to run this script?
  Every 15 minutes
