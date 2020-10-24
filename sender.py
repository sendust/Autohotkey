import socket
import time

MCAST_GRP = '224.1.1.1'
MCAST_PORT = 5007
# regarding socket.IP_MULTICAST_TTL
# ---------------------------------
# for all packets sent, after two hops on the network the packet will not
# be re-sent/broadcast (see https://www.tldp.org/HOWTO/Multicast-HOWTO-6.html)
MULTICAST_TTL = 2

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
# sock.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_TTL, MULTICAST_TTL)

# For Python 3, change next line to 'sock.sendto(b"robot", ...' to avoid the
# "bytes-like object is required" msg (https://stackoverflow.com/a/42612820)
count = 0
while(1):
    sock.sendto(bytes("robot  " + str(count), "utf-8"), (MCAST_GRP, MCAST_PORT))
    print("Send byte data " + str(count))
    time.sleep(1)
    count = count + 1
