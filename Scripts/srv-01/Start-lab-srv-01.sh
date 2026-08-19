#!/bin/sh

# Sanitization note: paths, TAP names, MAC addresses, and virtual disk
# filenames are lab-local examples. Replace them for your environment and use
# only properly licensed vendor images.

#  console line 4000+ 
#  aux line 5000+
 


#pe1

sudo qemu-system-x86_64  -enable-kvm  -daemonize -cpu Westmere  -smp cores=1,threads=1,sockets=1 -m 5120M  -hda /home/lab/BBLAB/new_xr/pe1.qcow2 -name pe1,process="pe1"  -display none  -rtc base=utc \
-serial telnet::4000,server,nowait -serial telnet::5000,server,nowait \
-netdev tap,id=tap0,ifname=tap0,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap0,id=mgmt0,mac=00:01:ee:09:01:00 \
-netdev tap,id=tap1001,ifname=tap1001,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1001,id=data0,mac=00:01:ee:01:01:01 \
-netdev tap,id=tap1002,ifname=tap1002,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1002,id=data1,mac=00:01:ee:01:01:02 \
-netdev tap,id=tap1003,ifname=tap1003,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1003,id=data2,mac=00:01:ee:01:01:03 \
-netdev tap,id=tap1004,ifname=tap1004,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1004,id=data3,mac=00:01:ee:01:01:04 \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9101,dstport=9102,udp=on,rxsession=0x91019102,txsession=0x91019102,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=data4,mac=00:01:ee:01:91:02  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9103,dstport=9104,udp=on,rxsession=0x91039104,txsession=0x91039104,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=data5,mac=00:01:ee:01:91:04  \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9169,dstport=9170,udp=on,rxsession=0x91699170,txsession=0x91699170,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=data6,mac=00:01:ee:01:91:70 \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9171,dstport=9172,udp=on,rxsession=0x91719172,txsession=0x91719172,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=data7,mac=00:01:ee:01:91:72 \
-pidfile /home/lab/BBLAB/new_xr/pids/pe1.pid


#pe2

sudo qemu-system-x86_64  -enable-kvm -daemonize -cpu Westmere  -smp cores=1,threads=1,sockets=1 -m 5120M  -hda /home/lab/BBLAB/new_xr/pe2.qcow2 -name pe2,process="pe2" -display none -rtc base=utc \
-serial telnet::4001,server,nowait -serial telnet::5001,server,nowait \
-netdev tap,id=tap1,ifname=tap1,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap1,id=mgmt0,mac=00:01:ee:09:01:01 \
-netdev tap,id=tap1225,ifname=tap1227,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1227,id=res1,mac=00:01:ee:01:02:27 \
-netdev tap,id=tap1226,ifname=tap1228,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1228,id=res2,mac=00:01:ee:01:02:28 \
-netdev tap,id=tap1005,ifname=tap1005,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1005,id=data0,mac=00:01:ee:01:01:05 \
-netdev tap,id=tap1006,ifname=tap1006,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1006,id=data1,mac=00:01:ee:01:01:06 \
-netdev tap,id=tap1007,ifname=tap1007,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1007,id=data2,mac=00:01:ee:01:01:07 \
-netdev tap,id=tap1008,ifname=tap1008,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1008,id=data3,mac=00:01:ee:01:01:08 \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9105,dstport=9106,udp=on,rxsession=0x91059106,txsession=0x91059106,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=data4,mac=00:01:ee:01:91:06  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9107,dstport=9108,udp=on,rxsession=0x91079108,txsession=0x91079108,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=data5,mac=00:01:ee:01:91:08  \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9165,dstport=9166,udp=on,rxsession=0x91659166,txsession=0x91659166,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=data6,mac=00:01:ee:01:91:66 \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9167,dstport=9168,udp=on,rxsession=0x91679168,txsession=0x91679168,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=data7,mac=00:01:ee:01:91:68 \
-pidfile /home/lab/BBLAB/new_xr/pids/pe2.pid

#pe3

sudo qemu-system-x86_64  -enable-kvm -daemonize -cpu Westmere  -smp cores=1,threads=1,sockets=1 -m 5120M  -hda /home/lab/BBLAB/new_xr/pe3.qcow2 -name pe3,process="pe3" -display none -rtc base=utc \
-serial telnet::4002,server,nowait -serial telnet::5002,server,nowait \
-netdev tap,id=tap2,ifname=tap2,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap2,id=mgmt0,mac=00:01:ee:09:01:02 \
-netdev tap,id=tap1009,ifname=tap1009,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1009,id=data0,mac=00:01:ee:01:01:09 \
-netdev tap,id=tap1010,ifname=tap1010,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1010,id=data1,mac=00:01:ee:01:01:10 \
-netdev tap,id=tap1011,ifname=tap1011,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1011,id=data2,mac=00:01:ee:01:01:11 \
-netdev tap,id=tap1012,ifname=tap1012,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1012,id=data3,mac=00:01:ee:01:01:12 \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9109,dstport=9110,udp=on,rxsession=0x91099110,txsession=0x91099110,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=p2p1,mac=00:01:ee:01:91:10  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9111,dstport=9112,udp=on,rxsession=0x91119112,txsession=0x91119112,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=p2p2,mac=00:01:ee:01:91:12  \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9173,dstport=9174,udp=on,rxsession=0x91739174,txsession=0x91739174,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=p2p3,mac=00:01:ee:01:91:74 \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9175,dstport=9176,udp=on,rxsession=0x91759176,txsession=0x91759176,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=p2p4,mac=00:01:ee:01:91:76 \
-pidfile /home/lab/BBLAB/new_xr/pids/pe3.pid

#pe4

sudo qemu-system-x86_64  -enable-kvm -daemonize -cpu Westmere  -smp cores=1,threads=1,sockets=1 -m 5120M  -hda /home/lab/BBLAB/new_xr/pe4.qcow2 -name pe4,process="pe4" -display none -rtc base=utc \
-serial telnet::4003,server,nowait -serial telnet::5003,server,nowait \
-netdev tap,id=tap3,ifname=tap3,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap3,id=mgmt0,mac=00:01:ee:09:01:03 \
-netdev tap,id=tap1013,ifname=tap1013,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1013,id=data0,mac=00:01:ee:01:01:13 \
-netdev tap,id=tap1014,ifname=tap1014,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1014,id=data1,mac=00:01:ee:01:01:14 \
-netdev tap,id=tap1015,ifname=tap1015,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1015,id=data2,mac=00:01:ee:01:01:15 \
-netdev tap,id=tap1016,ifname=tap1016,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1016,id=data3,mac=00:01:ee:01:01:16 \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9113,dstport=9114,udp=on,rxsession=0x91139114,txsession=0x91139114,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=p2p1,mac=00:01:ee:01:91:14  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9115,dstport=9116,udp=on,rxsession=0x91159116,txsession=0x91159116,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=p2p2,mac=00:01:ee:01:91:16  \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9177,dstport=9178,udp=on,rxsession=0x91779178,txsession=0x91779178,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=p2p3,mac=00:01:ee:01:91:78 \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9179,dstport=9180,udp=on,rxsession=0x91799180,txsession=0x91799180,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=p2p4,mac=00:01:ee:01:91:80 \
-pidfile /home/lab/BBLAB/new_xr/pids/pe4.pid

#p1.xr9k612.vlab01
	
sudo qemu-system-x86_64  -enable-kvm -daemonize -cpu Westmere  -smp cores=1,threads=1,sockets=1 -m 5120M  -hda /home/lab/BBLAB/new_xr/p1.xr9k612.vlab01.qcow2 -name p1.xr9k612.vlab01,process="p1.vlab01" -display none -rtc base=utc \
-serial telnet::4004,server,nowait -serial telnet::5004,server,nowait \
-netdev tap,id=tap4,ifname=tap4,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap4,id=mgmt0,mac=00:01:ee:09:01:04 \
-netdev tap,id=tap1017,ifname=tap1017,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1017,id=data0,mac=00:01:ee:01:01:17 \
-netdev tap,id=tap1018,ifname=tap1018,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1018,id=data1,mac=00:01:ee:01:01:18 \
-netdev tap,id=tap1019,ifname=tap1019,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1019,id=data2,mac=00:01:ee:01:01:19 \
-netdev tap,id=tap1020,ifname=tap1020,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1020,id=data3,mac=00:01:ee:01:01:20 \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9117,dstport=9118,udp=on,rxsession=0x91179118,txsession=0x91179118,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=p2p1,mac=00:01:ee:01:91:18  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9119,dstport=9120,udp=on,rxsession=0x91199120,txsession=0x91199120,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=p2p2,mac=00:01:ee:01:91:20  \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9121,dstport=9122,udp=on,rxsession=0x91219122,txsession=0x91219122,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=p2p3,mac=00:01:ee:01:91:22  \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9123,dstport=9124,udp=on,rxsession=0x91239124,txsession=0x91239124,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=p2p4,mac=00:01:ee:01:91:24  \
-netdev l2tpv3,id=p2p5,src=127.0.0.1,dst=127.0.0.1,srcport=9213,dstport=9214,udp=on,rxsession=0x92139214,txsession=0x92139214,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p5,id=p2p5,mac=00:01:ee:01:92:13  \
-pidfile /home/lab/BBLAB/new_xr/pids/p1.xr9k612.vlab01.pid

#p2.xr9k612.vlab01

sudo qemu-system-x86_64  -enable-kvm -daemonize -cpu Westmere  -smp cores=1,threads=1,sockets=1 -m 5120M  -hda /home/lab/BBLAB/new_xr/p2.xr9k612.vlab01.qcow2  -name p2.xr9k612.vlab01,process="p2.vlab01" -display none -rtc base=utc \
-serial telnet::4005,server,nowait -serial telnet::5005,server,nowait \
-netdev tap,id=tap5,ifname=tap5,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap5,id=mgmt0,mac=00:01:ee:09:01:05 \
-netdev tap,id=tap1021,ifname=tap1021,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1021,id=data0,mac=00:01:ee:01:01:21 \
-netdev tap,id=tap1022,ifname=tap1022,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1022,id=data1,mac=00:01:ee:01:01:22 \
-netdev tap,id=tap1023,ifname=tap1023,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1023,id=data2,mac=00:01:ee:01:01:23 \
-netdev tap,id=tap1024,ifname=tap1024,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1024,id=data3,mac=00:01:ee:01:01:24 \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9125,dstport=9126,udp=on,rxsession=0x91259126,txsession=0x91259126,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=p2p1,mac=00:01:ee:01:91:26  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9127,dstport=9128,udp=on,rxsession=0x91279128,txsession=0x91079108,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=p2p2,mac=00:01:ee:01:91:28  \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9129,dstport=9130,udp=on,rxsession=0x91299130,txsession=0x91279128,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=p2p3,mac=00:01:ee:01:91:30  \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9131,dstport=9132,udp=on,rxsession=0x91319132,txsession=0x91319132,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=p2p4,mac=00:01:ee:01:91:32  \
-netdev l2tpv3,id=p2p5,src=127.0.0.1,dst=127.0.0.1,srcport=9214,dstport=9213,udp=on,rxsession=0x92139214,txsession=0x92139214,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p5,id=p2p5,mac=00:01:ee:01:92:14  \
-pidfile /home/lab/BBLAB/new_xr/pids/p2.xr9k612.vlab01.pid

#pe5

sudo qemu-system-x86_64  -enable-kvm -daemonize -cpu Westmere  -smp cores=1,threads=1,sockets=1 -m 5120M  -hda /home/lab/BBLAB/new_xr/pe5.qcow2 -name pe5,process="pe5" -display none -rtc base=utc \
-serial telnet::4006,server,nowait -serial telnet::5006,server,nowait \
-netdev tap,id=tap6,ifname=tap6,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap6,id=mgmt0,mac=00:01:ee:09:01:06 \
-netdev tap,id=tap1025,ifname=tap1025,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1025,id=data0,mac=00:01:ee:01:01:25 \
-netdev tap,id=tap1026,ifname=tap1026,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1026,id=data1,mac=00:01:ee:01:01:26 \
-netdev tap,id=tap1027,ifname=tap1027,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1027,id=data2,mac=00:01:ee:01:01:27 \
-netdev tap,id=tap1028,ifname=tap1028,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1028,id=data3,mac=00:01:ee:01:01:28 \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9133,dstport=9134,udp=on,rxsession=0x91339134,txsession=0x91339134,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=p2p1,mac=00:01:ee:01:91:34  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9135,dstport=9136,udp=on,rxsession=0x91359136,txsession=0x91359136,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=p2p2,mac=00:01:ee:01:91:36  \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9158,dstport=9157,udp=on,rxsession=0x91579158,txsession=0x91579158,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=p2p3,mac=00:01:ee:01:91:57  \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9164,dstport=9163,udp=on,rxsession=0x91639164,txsession=0x91639164,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=p2p4,mac=00:01:ee:01:91:63 \
-netdev l2tpv3,id=p2p5,src=127.0.0.1,dst=127.0.0.1,srcport=9184,dstport=9183,udp=on,rxsession=0x91839184,txsession=0x91839184,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p5,id=p2p5,mac=00:01:ee:01:91:83 \
-netdev l2tpv3,id=p2p6,src=127.0.0.1,dst=127.0.0.1,srcport=9186,dstport=9185,udp=on,rxsession=0x91859186,txsession=0x91859186,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p6,id=p2p6,mac=00:01:ee:01:91:85 \
-netdev l2tpv3,id=p2p7,src=127.0.0.1,dst=127.0.0.1,srcport=9192,dstport=9191,udp=on,rxsession=0x91919192,txsession=0x91919192,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p7,id=p2p7,mac=00:01:ee:01:91:91 \
-netdev l2tpv3,id=p2p8,src=127.0.0.1,dst=127.0.0.1,srcport=9194,dstport=9193,udp=on,rxsession=0x91939194,txsession=0x91939194,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p8,id=p2p8,mac=00:01:ee:01:91:93 \
-pidfile /home/lab/BBLAB/new_xr/pids/pe5.pid

#pe6

sudo qemu-system-x86_64  -enable-kvm -daemonize -cpu Westmere  -smp cores=1,threads=1,sockets=1 -m 5120M  -hda /home/lab/BBLAB/new_xr/pe6.qcow2 -name pe6,process="pe6" -display none -rtc base=utc \
-serial telnet::4007,server,nowait -serial telnet::5007,server,nowait \
-netdev tap,id=tap7,ifname=tap7,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap7,id=mgmt0,mac=00:01:ee:09:01:07 \
-netdev tap,id=tap1029,ifname=tap1029,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1029,id=data0,mac=00:01:ee:01:01:29 \
-netdev tap,id=tap1030,ifname=tap1030,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1030,id=data1,mac=00:01:ee:01:01:30 \
-netdev tap,id=tap1031,ifname=tap1031,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1031,id=data2,mac=00:01:ee:01:01:31 \
-netdev tap,id=tap1032,ifname=tap1032,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1032,id=data3,mac=00:01:ee:01:01:32 \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9137,dstport=9138,udp=on,rxsession=0x91379138,txsession=0x91379138,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=p2p1,mac=00:01:ee:01:91:38  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9139,dstport=9140,udp=on,rxsession=0x91399140,txsession=0x91399140,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=p2p2,mac=00:01:ee:01:91:40  \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9160,dstport=9159,udp=on,rxsession=0x91599160,txsession=0x91599160,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=p2p3,mac=00:01:ee:01:91:59  \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9162,dstport=9161,udp=on,rxsession=0x91619162,txsession=0x91619162,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=p2p4,mac=00:01:ee:01:91:61  \
-netdev l2tpv3,id=p2p5,src=127.0.0.1,dst=127.0.0.1,srcport=9182,dstport=9181,udp=on,rxsession=0x91819182,txsession=0x91819182,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p5,id=p2p5,mac=00:01:ee:01:91:81 \
-netdev l2tpv3,id=p2p6,src=127.0.0.1,dst=127.0.0.1,srcport=9188,dstport=9187,udp=on,rxsession=0x91879188,txsession=0x91879188,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p6,id=p2p6,mac=00:01:ee:01:91:87 \
-netdev l2tpv3,id=p2p7,src=127.0.0.1,dst=127.0.0.1,srcport=9190,dstport=9189,udp=on,rxsession=0x91899190,txsession=0x91899190,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p7,id=p2p7,mac=00:01:ee:01:91:89 \
-netdev l2tpv3,id=p2p8,src=127.0.0.1,dst=127.0.0.1,srcport=9196,dstport=9195,udp=on,rxsession=0x91959196,txsession=0x91959196,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p8,id=p2p8,mac=00:01:ee:01:91:95 \
-pidfile /home/lab/BBLAB/new_xr/pids/pe6.pid

#rrr1

sudo qemu-system-x86_64  -enable-kvm -daemonize -cpu Westmere  -smp cores=1,threads=1,sockets=1 -m 5120M  -hda /home/lab/BBLAB/new_xr/rrr1.qcow2 -name rrr1,process="rrr1" -display none -rtc base=utc   \
-serial telnet::4008,server,nowait -serial telnet::5008,server,nowait \
-netdev tap,id=tap8,ifname=tap8,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap8,id=mgmt0,mac=00:01:ee:09:01:08 \
-netdev tap,id=tap1033,ifname=tap1033,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1033,id=data0,mac=00:01:ee:01:01:33 \
-netdev tap,id=tap1034,ifname=tap1034,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1034,id=data1,mac=00:01:ee:01:01:34 \
-netdev tap,id=tap1035,ifname=tap1035,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1035,id=data2,mac=00:01:ee:01:01:35 \
-netdev tap,id=tap1036,ifname=tap1036,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1036,id=data3,mac=00:01:ee:01:01:36 \
-pidfile /home/lab/BBLAB/new_xr/pids/rrr1.pid 

#rrr2

sudo qemu-system-x86_64  -enable-kvm -daemonize -cpu Westmere  -smp cores=1,threads=1,sockets=1 -m 5120M -name rrr2,process="ce1" -hda /home/lab/BBLAB/new_xr/rrr2.qcow2 -name rrr2,process="rrr2" -display none -rtc base=utc   \
-serial telnet::4009,server,nowait -serial telnet::5009,server,nowait \
-netdev tap,id=tap9,ifname=tap9,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap9,id=mgmt0,mac=00:01:ee:09:01:09 \
-netdev tap,id=tap1037,ifname=tap1037,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1037,id=data0,mac=00:01:ee:01:01:37 \
-netdev tap,id=tap1038,ifname=tap1038,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1038,id=data1,mac=00:01:ee:01:01:38 \
-netdev tap,id=tap1039,ifname=tap1039,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1039,id=data2,mac=00:01:ee:01:01:39 \
-netdev tap,id=tap1040,ifname=tap1040,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1040,id=data3,mac=00:01:ee:01:01:40 \
-pidfile /home/lab/BBLAB/new_xr/pids/rrr2.pid

#nxos-01.vlab01

sudo qemu-system-x86_64 -enable-kvm  -daemonize  -cpu host -smp 2 -m 6144M -name ce1,process="ce1" -display none -rtc base=utc  \
-drive if=pflash,format=raw,readonly,file=/usr/share/OVMF/OVMF_CODE.fd \
-drive if=pflash,format=raw,file=/home/lab/BBLAB/nxos/9k/703I61/ce1_OVMF_VARS.fd \
-device ahci,id=ahci0,bus=pci.0 -drive file=/home/lab/BBLAB/nxos/9k/703I61/ce1.qcow2,if=none,id=drive-sata-disk0,format=qcow2 \
-device ide-drive,drive=drive-sata-disk0,bus=ahci0.0,id=hda01 \
-serial telnet::4012,server,nowait -serial telnet::5012,server,nowait \
-netdev tap,id=tap12,ifname=tap12,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap12,id=mgmt0,mac=00:01:ee:09:01:12,   \
-netdev tap,id=tap1061,ifname=tap1061,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1061,id=data0,mac=00:01:ee:01:01:61   \
-netdev tap,id=tap1062,ifname=tap1062,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1062,id=data1,mac=00:01:ee:01:01:62   \
-netdev tap,id=tap1063,ifname=tap1063,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1063,id=data2,mac=00:01:ee:01:01:63   \
-netdev tap,id=tap1064,ifname=tap1064,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1064,id=data3,mac=00:01:ee:01:01:64   \
-netdev tap,id=tap1065,ifname=tap1065,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1065,id=data4,mac=00:01:ee:01:01:65   \
-netdev tap,id=tap1066,ifname=tap1066,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1066,id=data5,mac=00:01:ee:01:01:66   \
-netdev l2tpv3,id=xbar1,src=127.0.0.1,dst=127.0.0.1,srcport=9141,dstport=9142,udp=on,rxsession=0x91419142,txsession=0x91419142,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar1,id=xbar1,mac=00:01:ee:01:91:42  \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9102,dstport=9101,udp=on,rxsession=0x91019102,txsession=0x91019102,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=p2p1,mac=00:01:ee:01:91:01,  \
-netdev l2tpv3,id=xbar2,src=127.0.0.1,dst=127.0.0.1,srcport=9145,dstport=9146,udp=on,rxsession=0x91459146,txsession=0x91459146,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar2,id=xbar2,mac=00:01:ee:01:91:45 \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9104,dstport=9103,udp=on,rxsession=0x91039104,txsession=0x91039104,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=p2p2,mac=00:01:ee:01:91:03,  \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9166,dstport=9165,udp=on,rxsession=0x91659166,txsession=0x91659166,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=p2p3,mac=00:01:ee:01:91:65 \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9168,dstport=9167,udp=on,rxsession=0x91679168,txsession=0x91679168,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=p2p4,mac=00:01:ee:01:91:67 \
-pidfile /home/lab/BBLAB/nxos/9k/703I61/ce1.pid



#nxos-02.vlab01

sudo qemu-system-x86_64 -enable-kvm  -daemonize  -cpu host -smp 2 -m 6144M -name ce2,process="ce2" -display none -rtc base=utc  \
-drive if=pflash,format=raw,readonly,file=/usr/share/OVMF/OVMF_CODE.fd \
-drive if=pflash,format=raw,file=/home/lab/BBLAB/nxos/9k/703I61/ce2_OVMF_VARS.fd \
-device ahci,id=ahci0,bus=pci.0 -drive file=/home/lab/BBLAB/nxos/9k/703I61/ce2.qcow2,if=none,id=drive-sata-disk0,format=qcow2 \
-device ide-drive,drive=drive-sata-disk0,bus=ahci0.0,id=hda01 \
-serial telnet::4013,server,nowait -serial telnet::5013,server,nowait \
-netdev tap,id=tap13,ifname=tap13,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap13,id=mgmt0,mac=00:01:ee:09:01:13,  \
-netdev tap,id=tap1071,ifname=tap1071,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1071,id=data0,mac=00:01:ee:01:01:71   \
-netdev tap,id=tap1072,ifname=tap1072,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1072,id=data1,mac=00:01:ee:01:01:72   \
-netdev tap,id=tap1073,ifname=tap1073,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1073,id=data2,mac=00:01:ee:01:01:73   \
-netdev tap,id=tap1074,ifname=tap1074,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1074,id=data3,mac=00:01:ee:01:01:74   \
-netdev tap,id=tap1075,ifname=tap1075,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1075,id=data4,mac=00:01:ee:01:01:75   \
-netdev tap,id=tap1076,ifname=tap1076,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1076,id=data5,mac=00:01:ee:01:01:76   \
-netdev l2tpv3,id=xbar1,src=127.0.0.1,dst=127.0.0.1,srcport=9142,dstport=9141,udp=on,rxsession=0x91419142,txsession=0x91419142,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar1,id=xbar1,mac=00:01:ee:01:91:41  \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9106,dstport=9105,udp=on,rxsession=0x91059106,txsession=0x91059106,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=p2p1,mac=00:01:ee:01:91:05,  \
-netdev l2tpv3,id=xbar2,src=127.0.0.1,dst=127.0.0.1,srcport=9146,dstport=9145,udp=on,rxsession=0x91459146,txsession=0x91459146,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar2,id=xbar2,mac=00:01:ee:01:91:46  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9108,dstport=9107,udp=on,rxsession=0x91079108,txsession=0x91079108,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=p2p2,mac=00:01:ee:01:91:07,  \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9170,dstport=9169,udp=on,rxsession=0x91699170,txsession=0x91699170,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=p2p3,mac=00:01:ee:01:91:69 \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9172,dstport=9171,udp=on,rxsession=0x91719172,txsession=0x91719172,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=p2p4,mac=00:01:ee:01:91:71 \
-pidfile /home/lab/BBLAB/nxos/9k/703I61/ce2.pid



#nxos-03.vlab01

sudo qemu-system-x86_64 -enable-kvm  -daemonize  -cpu host -smp 2 -m 6144M -name ce3,process="ce3" -display none -rtc base=utc  \
-drive if=pflash,format=raw,readonly,file=/usr/share/OVMF/OVMF_CODE.fd \
-drive if=pflash,format=raw,file=/home/lab/BBLAB/nxos/9k/703I61/ce3_OVMF_VARS.fd \
-device ahci,id=ahci0,bus=pci.0 -drive file=/home/lab/BBLAB/nxos/9k/703I61/ce3.qcow2,if=none,id=drive-sata-disk0,format=qcow2 \
-device ide-drive,drive=drive-sata-disk0,bus=ahci0.0,id=hda01 \
-serial telnet::4014,server,nowait -serial telnet::5014,server,nowait \
-netdev tap,id=tap14,ifname=tap14,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap14,id=mgmt0,mac=00:01:ee:09:01:14  \
-netdev tap,id=tap1081,ifname=tap1081,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1081,id=data0,mac=00:01:ee:01:01:81   \
-netdev tap,id=tap1082,ifname=tap1082,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1082,id=data1,mac=00:01:ee:01:01:82   \
-netdev tap,id=tap1083,ifname=tap1083,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1083,id=data2,mac=00:01:ee:01:01:83   \
-netdev tap,id=tap1084,ifname=tap1084,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1084,id=data3,mac=00:01:ee:01:01:84   \
-netdev tap,id=tap1085,ifname=tap1085,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1085,id=data4,mac=00:01:ee:01:01:85   \
-netdev tap,id=tap1086,ifname=tap1086,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1086,id=data5,mac=00:01:ee:01:01:86   \
-netdev l2tpv3,id=xbar1,src=127.0.0.1,dst=127.0.0.1,srcport=9143,dstport=9144,udp=on,rxsession=0x91439144,txsession=0x91439144,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar1,id=xbar1,mac=00:01:ee:01:91:44  \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9110,dstport=9109,udp=on,rxsession=0x91099110,txsession=0x91099110,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on  -device e1000,netdev=p2p1,id=p2p1,mac=00:01:ee:01:91:09,  \
-netdev l2tpv3,id=xbar2,src=127.0.0.1,dst=127.0.0.1,srcport=9147,dstport=9148,udp=on,rxsession=0x91479148,txsession=0x91479148,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar2,id=xbar2,mac=00:01:ee:01:91:47  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9112,dstport=9111,udp=on,rxsession=0x91119112,txsession=0x91119112,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=p2p2,mac=00:01:ee:01:91:11,  \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9178,dstport=9177,udp=on,rxsession=0x91779178,txsession=0x91779178,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=p2p3,mac=00:01:ee:01:91:77 \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9180,dstport=9179,udp=on,rxsession=0x91799180,txsession=0x91799180,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=p2p4,mac=00:01:ee:01:91:79 \
-pidfile /home/lab/BBLAB/nxos/9k/703I61/ce3.pid


#nxos-04.vlab01

sudo qemu-system-x86_64 -enable-kvm  -daemonize  -cpu host -smp 2 -m 6144M -name ce4,process="ce4" -display none -rtc base=utc  \
-drive if=pflash,format=raw,readonly,file=/usr/share/OVMF/OVMF_CODE.fd \
-drive if=pflash,format=raw,file=/home/lab/BBLAB/nxos/9k/703I61/ce4_OVMF_VARS.fd \
-device ahci,id=ahci0,bus=pci.0 -drive file=/home/lab/BBLAB/nxos/9k/703I61/ce4.qcow2,if=none,id=drive-sata-disk0,format=qcow2 \
-device ide-drive,drive=drive-sata-disk0,bus=ahci0.0,id=hda01 \
-serial telnet::4015,server,nowait -serial telnet::5015,server,nowait \
-netdev tap,id=tap15,ifname=tap15,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap15,id=mgmt0,mac=00:01:ee:09:01:15,  \
-netdev tap,id=tap1091,ifname=tap1091,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1091,id=data0,mac=00:01:ee:01:01:91   \
-netdev tap,id=tap1092,ifname=tap1092,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1092,id=data1,mac=00:01:ee:01:01:92   \
-netdev tap,id=tap1093,ifname=tap1093,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1093,id=data2,mac=00:01:ee:01:01:93   \
-netdev tap,id=tap1094,ifname=tap1094,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1094,id=data3,mac=00:01:ee:01:01:94   \
-netdev tap,id=tap1095,ifname=tap1095,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1095,id=data4,mac=00:01:ee:01:01:95   \
-netdev tap,id=tap1096,ifname=tap1096,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1096,id=data5,mac=00:01:ee:01:01:96   \
-netdev l2tpv3,id=xbar1,src=127.0.0.1,dst=127.0.0.1,srcport=9144,dstport=9143,udp=on,rxsession=0x91439144,txsession=0x91439144,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar1,id=xbar1,mac=00:01:ee:01:91:43  \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9114,dstport=9113,udp=on,rxsession=0x91139114,txsession=0x91139114,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=p2p1,mac=00:01:ee:01:91:13,  \
-netdev l2tpv3,id=xbar2,src=127.0.0.1,dst=127.0.0.1,srcport=9148,dstport=9147,udp=on,rxsession=0x91479148,txsession=0x91479148,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar2,id=xbar2,mac=00:01:ee:01:91:48  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9116,dstport=9115,udp=on,rxsession=0x91159116,txsession=0x91159116,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=p2p2,mac=00:01:ee:01:91:15,  \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9174,dstport=9173,udp=on,rxsession=0x91739174,txsession=0x91739174,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=p2p3,mac=00:01:ee:01:91:73 \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9176,dstport=9175,udp=on,rxsession=0x91759176,txsession=0x91759176,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=p2p4,mac=00:01:ee:01:91:75 \
-pidfile /home/lab/BBLAB/nxos/9k/703I61/ce4.pid

#nxos-05.vlab01

sudo qemu-system-x86_64 -enable-kvm  -daemonize  -cpu  host -smp 2 -m 6144M -name ce5,process="ce5" -display none -rtc base=utc  \
-drive if=pflash,format=raw,readonly,file=/usr/share/OVMF/OVMF_CODE.fd \
-drive if=pflash,format=raw,file=/home/lab/BBLAB/nxos/9k/703I61/ce5_OVMF_VARS.fd \
-device ahci,id=ahci0,bus=pci.0 -drive file=/home/lab/BBLAB/nxos/9k/703I61/ce5.qcow2,if=none,id=drive-sata-disk0,format=qcow2 \
-device ide-drive,drive=drive-sata-disk0,bus=ahci0.0,id=hda01 \
-serial telnet::4016,server,nowait -serial telnet::5016,server,nowait \
-netdev tap,id=tap16,ifname=tap16,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap16,id=mgmt0,mac=00:01:ee:09:01:16  \
-netdev tap,id=tap1201,ifname=tap1201,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1201,id=data0,mac=00:01:ee:01:02:01 \
-netdev tap,id=tap1202,ifname=tap1202,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1202,id=data1,mac=00:01:ee:01:02:02 \
-netdev tap,id=tap1203,ifname=tap1203,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1203,id=data2,mac=00:01:ee:01:02:03 \
-netdev tap,id=tap1204,ifname=tap1204,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1204,id=data3,mac=00:01:ee:01:02:04 \
-netdev tap,id=tap1205,ifname=tap1205,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1205,id=data4,mac=00:01:ee:01:02:05 \
-netdev tap,id=tap1206,ifname=tap1206,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1206,id=data5,mac=00:01:ee:01:02:06 \
-netdev l2tpv3,id=xbar1,src=127.0.0.1,dst=127.0.0.1,srcport=9149,dstport=9150,udp=on,rxsession=0x91499150,txsession=0x91499150,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar1,id=xbar1,mac=00:01:ee:01:91:50  \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9134,dstport=9133,udp=on,rxsession=0x91339134,txsession=0x91339134,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=p2p1,mac=00:01:ee:01:91:33  \
-netdev l2tpv3,id=xbar2,src=127.0.0.1,dst=127.0.0.1,srcport=9151,dstport=9152,udp=on,rxsession=0x91519152,txsession=0x91519152,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar2,id=xbar2,mac=00:01:ee:01:91:52  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9157,dstport=9158,udp=on,rxsession=0x91579158,txsession=0x91579158,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=p2p2,mac=00:01:ee:01:91:58  \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9159,dstport=9160,udp=on,rxsession=0x91599160,txsession=0x91599160,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=p2p3,mac=00:01:ee:01:91:60  \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9181,dstport=9182,udp=on,rxsession=0x91819182,txsession=0x91819182,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=p2p4,mac=00:01:ee:01:91:82 \
-pidfile /home/lab/BBLAB/nxos/9k/703I61/ce5.pid


#nxos-06.vlab01

sudo qemu-system-x86_64 -enable-kvm  -daemonize  -cpu host -smp 2 -m 6144M -name ce6,process="ce6" -display none -rtc base=utc  \
-drive if=pflash,format=raw,readonly,file=/usr/share/OVMF/OVMF_CODE.fd \
-drive if=pflash,format=raw,file=/home/lab/BBLAB/nxos/9k/703I61/ce6_OVMF_VARS.fd \
-device ahci,id=ahci0,bus=pci.0 -drive file=/home/lab/BBLAB/nxos/9k/703I61/ce6.qcow2,if=none,id=drive-sata-disk0,format=qcow2 \
-device ide-drive,drive=drive-sata-disk0,bus=ahci0.0,id=hda01 \
-serial telnet::4017,server,nowait -serial telnet::5017,server,nowait \
-netdev tap,id=tap17,ifname=tap17,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap17,id=mgmt0,mac=00:01:ee:09:01:17  \
-netdev tap,id=tap1207,ifname=tap1207,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1207,id=data0,mac=00:01:ee:01:02:07 \
-netdev tap,id=tap1208,ifname=tap1208,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1208,id=data1,mac=00:01:ee:01:02:08 \
-netdev tap,id=tap1209,ifname=tap1209,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1209,id=data2,mac=00:01:ee:01:02:09 \
-netdev tap,id=tap1210,ifname=tap1210,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1210,id=data3,mac=00:01:ee:01:02:10 \
-netdev tap,id=tap1211,ifname=tap1211,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1211,id=data4,mac=00:01:ee:01:02:11 \
-netdev tap,id=tap1212,ifname=tap1212,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1212,id=data5,mac=00:01:ee:01:02:12 \
-netdev l2tpv3,id=xbar1,src=127.0.0.1,dst=127.0.0.1,srcport=9150,dstport=9149,udp=on,rxsession=0x91499150,txsession=0x91499150,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar1,id=xbar1,mac=00:01:ee:01:91:49  \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9138,dstport=9137,udp=on,rxsession=0x91379138,txsession=0x91379138,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=p2p1,mac=00:01:ee:01:91:37  \
-netdev l2tpv3,id=xbar2,src=127.0.0.1,dst=127.0.0.1,srcport=9152,dstport=9151,udp=on,rxsession=0x91519152,txsession=0x91519152,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar2,id=xbar2,mac=00:01:ee:01:91:51  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9161,dstport=9162,udp=on,rxsession=0x91619162,txsession=0x91619162,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=p2p2,mac=00:01:ee:01:91:62  \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9163,dstport=9164,udp=on,rxsession=0x91639164,txsession=0x91639164,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=p2p3,mac=00:01:ee:01:91:64 \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9183,dstport=9184,udp=on,rxsession=0x91839184,txsession=0x91839184,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=p2p4,mac=00:01:ee:01:91:84 \
-pidfile /home/lab/BBLAB/nxos/9k/703I61/ce6.pid


#nxos-07.vlab01

sudo qemu-system-x86_64 -enable-kvm  -daemonize  -cpu host -smp 2 -m 6144M -name ce7,process="ce7" -display none -rtc base=utc  \
-drive if=pflash,format=raw,readonly,file=/usr/share/OVMF/OVMF_CODE.fd \
-drive if=pflash,format=raw,file=/home/lab/BBLAB/nxos/9k/703I61/ce7_OVMF_VARS.fd \
-device ahci,id=ahci0,bus=pci.0 -drive file=/home/lab/BBLAB/nxos/9k/703I61/ce7.qcow2,if=none,id=drive-sata-disk0,format=qcow2 \
-device ide-drive,drive=drive-sata-disk0,bus=ahci0.0,id=hda01 \
-serial telnet::4018,server,nowait -serial telnet::5018,server,nowait \
-netdev tap,id=tap18,ifname=tap18,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap18,id=mgmt0,mac=00:01:ee:09:01:18  \
-netdev tap,id=tap1213,ifname=tap1213,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1213,id=data0,mac=00:01:ee:01:02:13 \
-netdev tap,id=tap1214,ifname=tap1214,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1214,id=data1,mac=00:01:ee:01:02:14 \
-netdev tap,id=tap1215,ifname=tap1215,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1215,id=data2,mac=00:01:ee:01:02:15 \
-netdev tap,id=tap1216,ifname=tap1216,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1216,id=data3,mac=00:01:ee:01:02:16 \
-netdev tap,id=tap1217,ifname=tap1217,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1217,id=data4,mac=00:01:ee:01:02:17 \
-netdev tap,id=tap1218,ifname=tap1218,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1218,id=data5,mac=00:01:ee:01:02:18 \
-netdev l2tpv3,id=xbar1,src=127.0.0.1,dst=127.0.0.1,srcport=9153,dstport=9154,udp=on,rxsession=0x91539154,txsession=0x91539154,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar1,id=xbar1,mac=00:01:ee:01:91:54  \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9136,dstport=9135,udp=on,rxsession=0x91359136,txsession=0x91359136,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=p2p1,mac=00:01:ee:01:91:35  \
-netdev l2tpv3,id=xbar2,src=127.0.0.1,dst=127.0.0.1,srcport=9155,dstport=9156,udp=on,rxsession=0x91479148,txsession=0x91479148,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar2,id=xbar2,mac=00:01:ee:01:91:56  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9185,dstport=9186,udp=on,rxsession=0x91859186,txsession=0x91859186,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=p2p2,mac=00:01:ee:01:91:86 \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9187,dstport=9188,udp=on,rxsession=0x91879188,txsession=0x91879188,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=p2p3,mac=00:01:ee:01:91:88 \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9189,dstport=9190,udp=on,rxsession=0x91899190,txsession=0x91899190,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=p2p4,mac=00:01:ee:01:91:90 \
-pidfile /home/lab/BBLAB/nxos/9k/703I61/ce7.pid

#nxos-08.vlab01

sudo qemu-system-x86_64 -enable-kvm  -daemonize  -cpu host  -smp 2 -m 6144M -name ce8,process="ce8" -display none -rtc base=utc  \
-drive if=pflash,format=raw,readonly,file=/usr/share/OVMF/OVMF_CODE.fd \
-drive if=pflash,format=raw,file=/home/lab/BBLAB/nxos/9k/703I61/ce8_OVMF_VARS.fd \
-device ahci,id=ahci0,bus=pci.0 -drive file=/home/lab/BBLAB/nxos/9k/703I61/ce8.qcow2,if=none,id=drive-sata-disk0,format=qcow2 \
-device ide-drive,drive=drive-sata-disk0,bus=ahci0.0,id=hda01 \
-serial telnet::4019,server,nowait -serial telnet::5019,server,nowait \
-netdev tap,id=tap19,ifname=tap19,script=/home/lab/BBLAB/tap-mgmt-ifup,downscript=/home/lab/BBLAB/tap-mgmt-ifdown -device e1000,netdev=tap19,id=mgmt0,mac=00:01:ee:09:01:19  \
-netdev tap,id=tap1219,ifname=tap1219,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1219,id=data0,mac=00:01:ee:01:02:19 \
-netdev tap,id=tap1220,ifname=tap1220,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1220,id=data1,mac=00:01:ee:01:02:20 \
-netdev tap,id=tap1221,ifname=tap1221,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1221,id=data2,mac=00:01:ee:01:02:21 \
-netdev tap,id=tap1222,ifname=tap1222,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1222,id=data3,mac=00:01:ee:01:02:22 \
-netdev tap,id=tap1223,ifname=tap1223,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1223,id=data4,mac=00:01:ee:01:02:23 \
-netdev tap,id=tap1224,ifname=tap1224,script=/home/lab/BBLAB/tap-data-ifup,downscript=/home/lab/BBLAB/tap-data-ifdown -device e1000,netdev=tap1224,id=data5,mac=00:01:ee:01:02:24 \
-netdev l2tpv3,id=xbar1,src=127.0.0.1,dst=127.0.0.1,srcport=9154,dstport=9153,udp=on,rxsession=0x91539154,txsession=0x91539154,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar1,id=xbar1,mac=00:01:ee:01:91:53  \
-netdev l2tpv3,id=p2p1,src=127.0.0.1,dst=127.0.0.1,srcport=9140,dstport=9139,udp=on,rxsession=0x91399140,txsession=0x91399140,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p1,id=p2p1,mac=00:01:ee:01:91:39  \
-netdev l2tpv3,id=xbar2,src=127.0.0.1,dst=127.0.0.1,srcport=9156,dstport=9155,udp=on,rxsession=0x91479148,txsession=0x91479148,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=xbar2,id=xbar2,mac=00:01:ee:01:91:55  \
-netdev l2tpv3,id=p2p2,src=127.0.0.1,dst=127.0.0.1,srcport=9195,dstport=9196,udp=on,rxsession=0x91959196,txsession=0x91959196,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p2,id=p2p2,mac=00:01:ee:01:91:96 \
-netdev l2tpv3,id=p2p3,src=127.0.0.1,dst=127.0.0.1,srcport=9191,dstport=9192,udp=on,rxsession=0x91919192,txsession=0x91919192,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p3,id=p2p3,mac=00:01:ee:01:91:92 \
-netdev l2tpv3,id=p2p4,src=127.0.0.1,dst=127.0.0.1,srcport=9193,dstport=9194,udp=on,rxsession=0x91939194,txsession=0x91939194,rxcookie=0x012345678,txcookie=0x012345678,counter=off,pincounter=on -device e1000,netdev=p2p4,id=p2p4,mac=00:01:ee:01:91:94 \
-pidfile /home/lab/BBLAB/nxos/9k/703I61/ce8.pid
