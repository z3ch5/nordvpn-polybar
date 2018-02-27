#!/usr/bin/env python3
import configparser
from configparser import SafeConfigParser
import subprocess

config = SafeConfigParser()
configfile = '(full path of openpyn.conf)'
#config['DEFAULT'] = {'country':'','servertype':'','protocol':'tcp','topservers':'3'}

config.read(configfile)
country = config['vpn_settings']['country']
servertype = config['vpn_settings']['servertype']
protocol = config['vpn_settings']['protocol']
topservers = config['vpn_settings']['topservers']

if servertype == "p2p":
  if protocol == "udp":
    subprocess.call(["openpyn", "-d", "-f", "-t " + topservers, "-u","--p2p", country])
  else:
    subprocess.call(["openpyn", "-d", "-f", "-t " + topservers,"--p2p", country])
elif servertype == "dedicated":
  if protocol == "udp":
    subprocess.call(["openpyn", "-d", "-f", "-t " + topservers, "-u","--dedicated", country])
  else:
    subprocess.call(["openpyn", "-d", "-f", "-t " + topservers,"--dedicated", country])
elif servertype == "double":
  if protocol == "udp":
    subprocess.call(["openpyn", "-d", "-f", "-t " + topservers, "-u","--double", country])
  else:
    subprocess.call(["openpyn", "-d", "-f", "-t " + topservers,"--double", country])
elif servertype == "anti-ddos":
  if protocol == "udp":
    subprocess.call(["openpyn", "-d", "-f", "-t " + topservers, "-u","--anti-ddos", country])
  else:
    subprocess.call(["openpyn", "-d", "-f", "-t " + topservers,"--anti-ddos", country])
#########not supported yet######
#elif servertype = "obfuscated"
#  if protocol = "udp"
#    subprocess.call(["openpyn", "-d", "-f", "-t " + topservers, "-u","--obfuscated" ,country])
#  else
#    subprocess.call(["openpyn", "-d", "-f", "-t " + topservers,"--obfuscated" ,country])
else:
  if protocol == "udp":
    subprocess.call(["openpyn", "-d", "-f", "-t " + topservers, "-u", country])
  else:
    subprocess.call(["openpyn", "-d", "-f", "-t " + topservers, country])
