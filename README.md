nerdtools_badbot_iptables
=========================

Using the latest information from the NerdTools Bad Bots Intrusion & Spam detection database, this script works with iptables to reject access for known bots.

###How does it work?###
This bash script is to be periodically ran via crontab and works by downloading a list of recent bad IP addresses using cURL. Each IP address is parsed into an iptables rule which denies further access for known bad hosts.

Designed with flexability in mind, existing firewall rules will be saved before any new ones are added.

###Requirements###
* Crontab
* Curl
* iptables

###FAQ###
* Q. How often is it recommended to run this script? A. Every 15 minutes

###Support###
More information or support can be found at http://www.nerdtools.co.uk/badbots/ or by emailing contact@nerdtools.co.uk
