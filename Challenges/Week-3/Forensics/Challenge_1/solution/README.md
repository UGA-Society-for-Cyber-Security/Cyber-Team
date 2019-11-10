# Solution

This challenge involves packet sniffing!

> When any data has to be transmitted over the computer network, it is broken down into smaller units at the sender’s node called data packets and reassembled at receiver’s node in original format. It is the smallest unit of communication over a computer network. It is also called a block, a segment, a datagram or a cell. The act of capturing data packet across the computer network is called packet sniffing. It is similar to as wire tapping to a telephone network. It is mostly used by crackers and hackers to collect information illegally about network. It is also used by ISPs, advertisers and governments. -- https://www.geeksforgeeks.org/what-is-packet-sniffing/

Opening up the flag.pcapng file with a packet sniffing software such as Wireshark will allow you to easily see the unencrypted traffic (this traffic was speficially sent to 127.0.0.1, or localhost, the same computer).

Due to the small number of packets captured in the flag.pcapng file, you can easily parse through each until you reach the packet that contains the unencrypted flag transmission.

`ugascs{p4ck3ts_4_dayz}`

