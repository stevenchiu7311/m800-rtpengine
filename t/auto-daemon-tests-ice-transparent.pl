#!/usr/bin/perl

use strict;
use warnings;
use NGCP::Rtpengine::Test;
use NGCP::Rtpclient::SRTP;
use NGCP::Rtpengine::AutoTest;
use Test::More;
use NGCP::Rtpclient::ICE;
use POSIX;


autotest_start(qw(--config-file=none -t -1 -i 203.0.113.1 -i 2001:db8:4321::1
			-n 2223 -c 12345 -f -L 7 -E -u 2222 --silence-detect=1))
		or die;


new_call;

# "ICE=transparent-force DTLS=disable replace-origin SDES-off ";
offer('enable ice transparent - offer', {'transport-protocol' => 'UDP/TLS/RTP/SAVPF', ICE => 'transparent-force', DTLS => 'disable', replace => ['origin'], flags => ['SDES-off']}, <<SDP);
v=0
o=M800-Transcoder 1635465364 1635465365 IN IP4 18.139.166.77
s=M800-Transcoder
c=IN IP4 18.139.166.77
t=0 0
m=audio 13128 UDP/TLS/RTP/SAVPF 111 110
a=mid:0
a=rtpmap:111 opus/48000/2
a=fmtp:111 useinbandfec=1; minptime=10
a=rtpmap:110 telephone-event/48000
a=fmtp:110 0-16
a=sendrecv
a=rtcp:13129
a=rtcp-mux
a=setup:actpass
a=fingerprint:sha-256 ED:8B:66:E7:23:C9:64:D8:F1:FD:44:19:EB:F3:69:37:F4:3A:6C:A0:C0:E8:CF:A3:93:D8:45:A8:D1:09:F7:19
a=ptime:20
a=ice-ufrag:ggXVITGF
a=ice-pwd:VoYFlvnqqMLN2BKiGsCwwengGa
a=ice-options:trickle
a=candidate:vYXqkIqzsVZQ4yQf 1 UDP 2130706431 18.139.166.77 13128 typ host generation 0 network-id 800 network-cost 999
a=candidate:vYXqkIqzsVZQ4yQf 2 UDP 2130706430 18.139.166.77 13129 typ host generation 0 network-id 800 network-cost 999
a=end-of-candidates
----------------------------------
v=0
o=M800-Transcoder 1635465364 1635465365 IN IP4 203.0.113.1
s=M800-Transcoder
c=IN IP4 203.0.113.1
t=0 0
m=audio PORT UDP/TLS/RTP/SAVPF 111 110
a=setup:actpass
a=fingerprint:sha-256 ED:8B:66:E7:23:C9:64:D8:F1:FD:44:19:EB:F3:69:37:F4:3A:6C:A0:C0:E8:CF:A3:93:D8:45:A8:D1:09:F7:19
a=ice-ufrag:ggXVITGF
a=ice-pwd:VoYFlvnqqMLN2BKiGsCwwengGa
a=ice-options:trickle
a=mid:0
a=rtpmap:111 opus/48000/2
a=fmtp:111 useinbandfec=1; minptime=10
a=rtpmap:110 telephone-event/48000
a=fmtp:110 0-16
a=sendrecv
a=rtcp:PORT
a=rtcp-mux
a=ptime:20
a=candidate:ICEBASE 1 UDP 2097152255 203.0.113.1 PORT typ host generation 0 network-id 800 network-cost 999
a=candidate:ICEBASE 1 UDP 4294967295 2001:db8:4321::1 PORT typ host generation 0 network-id 800 network-cost 999
a=candidate:ICEBASE 2 UDP 2097152254 203.0.113.1 PORT typ host generation 0 network-id 800 network-cost 999
a=candidate:ICEBASE 2 UDP 4294967294 2001:db8:4321::1 PORT typ host generation 0 network-id 800 network-cost 999
a=end-of-candidates
SDP



answer('enable ice transparent - answer', {'transport-protocol' => 'UDP/TLS/RTP/SAVPF', ICE => 'transparent-force', DTLS => 'disable', replace => ['origin'], flags => ['SDES-off']}, <<SDP);
v=0
o=xmserver 1635489319 1635489321 IN IP4 192.168.135.171
s=xmserver
c=IN IP4 192.168.135.171
b=AS:44
t=0 0
a=ice-lite
a=ice-options:trickle
m=audio 49180 UDP/TLS/RTP/SAVPF 111 110
b=AS:44
a=rtcp-mux
a=rtpmap:111 opus/48000/2
a=fmtp:111 useinbandfec=1
a=sendrecv
a=candidate:1 1 UDP 2130706175 192.168.135.171 49180 typ host
a=end-of-candidates
a=ice-ufrag:kihW
a=ice-pwd:U7BusVZF2Aybg0qlL+a7BQ
a=setup:active
a=fingerprint:sha-256 00:4A:E1:6A:80:B0:2C:A4:10:9A:D0:17:CA:35:1B:4A:D2:18:EC:F4:A4:3A:65:BD:E4:94:F2:D5:44:8F:FA:61
a=rtpmap:110 telephone-event/48000
a=fmtp:110 0-15
----------------------------------
v=0
o=xmserver 1635489319 1635489321 IN IP4 203.0.113.1
s=xmserver
c=IN IP4 203.0.113.1
b=AS:44
t=0 0
a=ice-lite
a=ice-options:trickle
m=audio PORT UDP/TLS/RTP/SAVPF 111 110
b=AS:44
a=ice-ufrag:kihW
a=ice-pwd:U7BusVZF2Aybg0qlL+a7BQ
a=setup:active
a=fingerprint:sha-256 00:4A:E1:6A:80:B0:2C:A4:10:9A:D0:17:CA:35:1B:4A:D2:18:EC:F4:A4:3A:65:BD:E4:94:F2:D5:44:8F:FA:61
a=mid:0
a=rtpmap:111 opus/48000/2
a=fmtp:111 useinbandfec=1
a=rtpmap:110 telephone-event/48000
a=fmtp:110 0-15
a=sendrecv
a=rtcp:PORT
a=rtcp-mux
a=ptime:20
a=candidate:ICEBASE 1 UDP 2130706431 203.0.113.1 PORT typ host generation 0 network-id 800 network-cost 999
a=candidate:ICEBASE 1 UDP 2130706175 2001:db8:4321::1 PORT typ host generation 0 network-id 800 network-cost 999
a=end-of-candidates
SDP

done_testing();
