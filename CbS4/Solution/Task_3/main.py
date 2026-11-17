from scapy.all import IP, TCP, send

ip = IP(dst="127.0.0.1")
tcp = TCP(sport=1234, dport=12345, flags="PA")
data = b"Dear Steel Cat! This is no attack, it's my humster Pinkie you should track"

packet = ip / tcp / data
send(packet)
