title: TCP 3-way Handshake
categories:
- Internet
tags:
- protocols
date: 2015-10-13 21:36:36
---
![](/img/2015/10/internet.jpg)

TCP (Transmission Control Protocol) and UDP (User Datagram Protocol) both work in the transportation layer. TCP is a connection-oriented protocol, while UDP is considered as a connectionless protocol.

The connection-oriented feature for TCP is represented by the 3-way handshake procedure:
![](/img/2015/10/tcp-3-way-handshake.jpg)

1. When typing a URL in the web browser, the web browser will translate the request into a packet, with a SYN segment, and send it to the server.
2. The server receives the packet, and replies with another packet with a SYN-ACK segment (ACK refers to Ackowledge).
3. The web browser receives the SYN-ACK packet, and replies with a packet with an ACT segment. Hence the handshake completes and connection is built.


