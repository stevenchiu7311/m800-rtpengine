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

# "RTP/AVP replace-session-connection rtcp-mux-demux replace-origin ICE=remove "
offer('[pstn-out] unified plan compatible with mid - offer', {'transport-protocol' => 'RTP/AVP', ICE => 'remove', replace => ['origin', 'session-connection'], 'rtcp-mux' => ['demux']}, <<SDP);
v=0
o=- 680859237751261969 1635404482128 IN IP4 172.30.251.188
s=-
t=0 0
a=extmap-allow-mixed
a=msid-semantic: WMS 8b80498e-b785-4d32-b16f-c3d4abb67141
a=group:BUNDLE 0 1
m=audio 34777 UDP/TLS/RTP/SAVPF 111 0 8 110 126
c=IN IP4 207.226.217.78
a=rtpmap:111 opus/48000/2
a=fmtp:111 minptime=20;useinbandfec=1;stereo=0;cbr=0;maxaveragebitrate=16000;usedtx=0;maxplaybackrate=16000;sprop-maxcapturerate=16000
a=rtpmap:0 PCMU/8000
a=rtpmap:8 PCMA/8000
a=rtpmap:110 telephone-event/48000
a=rtpmap:126 telephone-event/8000
a=sendrecv
a=rtcp:9 IN IP4 0.0.0.0
a=rtcp-fb:111 transport-cc
a=extmap:1 urn:ietf:params:rtp-hdrext:ssrc-audio-level
a=extmap:2 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time
a=extmap:3 http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01
a=extmap:4 urn:ietf:params:rtp-hdrext:sdes:mid
a=extmap:5 urn:ietf:params:rtp-hdrext:sdes:rtp-stream-id
a=extmap:6 urn:ietf:params:rtp-hdrext:sdes:repaired-rtp-stream-id
a=setup:actpass
a=mid:0
a=msid:8b80498e-b785-4d32-b16f-c3d4abb67141 bba2a80b-698f-4186-99a4-a174e551a93b
a=ptime:20
a=maxptime:20
a=ice-ufrag:w7up
a=ice-pwd:6gQ7fY3b2nQtTZsspwzw1ZCE
a=fingerprint:sha-256 D5:15:36:32:88:0E:A9:24:13:B1:6A:1F:FE:6B:C1:81:16:09:3A:A2:B2:A6:9D:10:DB:65:00:9A:AB:92:3A:8F
a=candidate:4261937680 1 udp 25108991 207.226.217.78 34777 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:4261937680 1 udp 25108479 207.226.217.78 13632 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:1484720548 1 udp 25108735 207.226.217.79 57923 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:1484720548 1 udp 25108223 207.226.217.79 54404 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=ice-options:trickle
a=ssrc:2503300119 cname:/XncNVyLpTGYzDGV
a=ssrc:2503300119 msid:8b80498e-b785-4d32-b16f-c3d4abb67141 bba2a80b-698f-4186-99a4-a174e551a93b
a=ssrc:2503300119 mslabel:8b80498e-b785-4d32-b16f-c3d4abb67141
a=ssrc:2503300119 label:bba2a80b-698f-4186-99a4-a174e551a93b
a=rtcp-mux
m=video 56843 UDP/TLS/RTP/SAVPF 96 98 100 102 125 35 124 123 114 116
c=IN IP4 207.226.217.79
b=AS:2000
a=rtpmap:96 VP8/90000
a=rtpmap:98 VP9/90000
a=fmtp:98 profile-id=0;
a=rtpmap:100 VP9/90000
a=fmtp:100 profile-id=2;
a=rtpmap:102 H264/90000
a=fmtp:102 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtpmap:125 H264/90000
a=fmtp:125 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtpmap:35 AV1X/90000
a=rtpmap:124 H264/90000
a=fmtp:124 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtpmap:123 H264/90000
a=fmtp:123 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtpmap:114 red/90000
a=rtpmap:116 ulpfec/90000
a=sendrecv
a=rtcp:9 IN IP4 0.0.0.0
a=rtcp-fb:96 goog-remb
a=rtcp-fb:96 transport-cc
a=rtcp-fb:96 ccm fir
a=rtcp-fb:96 nack
a=rtcp-fb:96 nack pli
a=rtcp-fb:98 goog-remb
a=rtcp-fb:98 transport-cc
a=rtcp-fb:98 ccm fir
a=rtcp-fb:98 nack
a=rtcp-fb:98 nack pli
a=rtcp-fb:100 goog-remb
a=rtcp-fb:100 transport-cc
a=rtcp-fb:100 ccm fir
a=rtcp-fb:100 nack
a=rtcp-fb:100 nack pli
a=rtcp-fb:102 goog-remb
a=rtcp-fb:102 transport-cc
a=rtcp-fb:102 ccm fir
a=rtcp-fb:102 nack
a=rtcp-fb:102 nack pli
a=rtcp-fb:125 goog-remb
a=rtcp-fb:125 transport-cc
a=rtcp-fb:125 ccm fir
a=rtcp-fb:125 nack
a=rtcp-fb:125 nack pli
a=rtcp-fb:35 goog-remb
a=rtcp-fb:35 transport-cc
a=rtcp-fb:35 ccm fir
a=rtcp-fb:35 nack
a=rtcp-fb:35 nack pli
a=rtcp-fb:124 goog-remb
a=rtcp-fb:124 transport-cc
a=rtcp-fb:124 ccm fir
a=rtcp-fb:124 nack
a=rtcp-fb:124 nack pli
a=rtcp-fb:123 goog-remb
a=rtcp-fb:123 transport-cc
a=rtcp-fb:123 ccm fir
a=rtcp-fb:123 nack
a=rtcp-fb:123 nack pli
a=extmap:14 urn:ietf:params:rtp-hdrext:toffset
a=extmap:2 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time
a=extmap:13 urn:3gpp:video-orientation
a=extmap:3 http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01
a=extmap:12 http://www.webrtc.org/experiments/rtp-hdrext/playout-delay
a=extmap:11 http://www.webrtc.org/experiments/rtp-hdrext/video-content-type
a=extmap:7 http://www.webrtc.org/experiments/rtp-hdrext/video-timing
a=extmap:8 http://www.webrtc.org/experiments/rtp-hdrext/color-space
a=extmap:4 urn:ietf:params:rtp-hdrext:sdes:mid
a=extmap:5 urn:ietf:params:rtp-hdrext:sdes:rtp-stream-id
a=extmap:6 urn:ietf:params:rtp-hdrext:sdes:repaired-rtp-stream-id
a=setup:actpass
a=mid:1
a=msid:8b80498e-b785-4d32-b16f-c3d4abb67141 00c4011d-9b8c-47dc-91a0-ce6f805d6658
a=ice-ufrag:w7up
a=ice-pwd:6gQ7fY3b2nQtTZsspwzw1ZCE
a=fingerprint:sha-256 D5:15:36:32:88:0E:A9:24:13:B1:6A:1F:FE:6B:C1:81:16:09:3A:A2:B2:A6:9D:10:DB:65:00:9A:AB:92:3A:8F
a=candidate:4261937680 1 udp 25108479 207.226.217.78 56843 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:1484720548 1 udp 25108735 207.226.217.79 59784 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:4261937680 1 udp 25108991 207.226.217.78 12249 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:1484720548 1 udp 25108223 207.226.217.79 61025 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=ice-options:trickle
a=ssrc:296967711 cname:/XncNVyLpTGYzDGV
a=ssrc:296967711 msid:8b80498e-b785-4d32-b16f-c3d4abb67141 00c4011d-9b8c-47dc-91a0-ce6f805d6658
a=ssrc:296967711 mslabel:8b80498e-b785-4d32-b16f-c3d4abb67141
a=ssrc:296967711 label:00c4011d-9b8c-47dc-91a0-ce6f805d6658
a=ssrc:1746529774 cname:/XncNVyLpTGYzDGV
a=ssrc:1746529774 msid:8b80498e-b785-4d32-b16f-c3d4abb67141 00c4011d-9b8c-47dc-91a0-ce6f805d6658
a=ssrc:1746529774 mslabel:8b80498e-b785-4d32-b16f-c3d4abb67141
a=ssrc:1746529774 label:00c4011d-9b8c-47dc-91a0-ce6f805d6658
a=ssrc-group:FID 296967711 1746529774
a=rtcp-mux
a=rtcp-rsize
----------------------------------
v=0
o=- 680859237751261969 1635404482128 IN IP4 203.0.113.1
s=-
t=0 0
a=extmap-allow-mixed
a=msid-semantic: WMS 8b80498e-b785-4d32-b16f-c3d4abb67141
m=audio PORT RTP/AVP 111 0 8 110 126
c=IN IP4 203.0.113.1
a=extmap:1 urn:ietf:params:rtp-hdrext:ssrc-audio-level
a=extmap:2 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time
a=extmap:3 http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01
a=extmap:4 urn:ietf:params:rtp-hdrext:sdes:mid
a=extmap:5 urn:ietf:params:rtp-hdrext:sdes:rtp-stream-id
a=extmap:6 urn:ietf:params:rtp-hdrext:sdes:repaired-rtp-stream-id
a=msid:8b80498e-b785-4d32-b16f-c3d4abb67141 bba2a80b-698f-4186-99a4-a174e551a93b
a=maxptime:20
a=mid:0
a=rtpmap:111 opus/48000/2
a=fmtp:111 minptime=20;useinbandfec=1;stereo=0;cbr=0;maxaveragebitrate=16000;usedtx=0;maxplaybackrate=16000;sprop-maxcapturerate=16000
a=rtcp-fb:111 transport-cc
a=rtpmap:0 PCMU/8000
a=rtpmap:8 PCMA/8000
a=rtpmap:110 telephone-event/48000
a=rtpmap:126 telephone-event/8000
a=sendrecv
a=rtcp:PORT
a=ptime:20
m=video PORT RTP/AVP 96 98 100 102 125 35 124 123 114 116
c=IN IP4 203.0.113.1
b=AS:2000
a=extmap:14 urn:ietf:params:rtp-hdrext:toffset
a=extmap:2 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time
a=extmap:13 urn:3gpp:video-orientation
a=extmap:3 http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01
a=extmap:12 http://www.webrtc.org/experiments/rtp-hdrext/playout-delay
a=extmap:11 http://www.webrtc.org/experiments/rtp-hdrext/video-content-type
a=extmap:7 http://www.webrtc.org/experiments/rtp-hdrext/video-timing
a=extmap:8 http://www.webrtc.org/experiments/rtp-hdrext/color-space
a=extmap:4 urn:ietf:params:rtp-hdrext:sdes:mid
a=extmap:5 urn:ietf:params:rtp-hdrext:sdes:rtp-stream-id
a=extmap:6 urn:ietf:params:rtp-hdrext:sdes:repaired-rtp-stream-id
a=msid:8b80498e-b785-4d32-b16f-c3d4abb67141 00c4011d-9b8c-47dc-91a0-ce6f805d6658
a=ssrc-group:FID 296967711 1746529774
a=rtcp-rsize
a=mid:1
a=rtpmap:96 VP8/90000
a=rtcp-fb:96 goog-remb
a=rtcp-fb:96 transport-cc
a=rtcp-fb:96 ccm fir
a=rtcp-fb:96 nack
a=rtcp-fb:96 nack pli
a=rtpmap:98 VP9/90000
a=fmtp:98 profile-id=0;
a=rtcp-fb:98 goog-remb
a=rtcp-fb:98 transport-cc
a=rtcp-fb:98 ccm fir
a=rtcp-fb:98 nack
a=rtcp-fb:98 nack pli
a=rtpmap:100 VP9/90000
a=fmtp:100 profile-id=2;
a=rtcp-fb:100 goog-remb
a=rtcp-fb:100 transport-cc
a=rtcp-fb:100 ccm fir
a=rtcp-fb:100 nack
a=rtcp-fb:100 nack pli
a=rtpmap:102 H264/90000
a=fmtp:102 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtcp-fb:102 goog-remb
a=rtcp-fb:102 transport-cc
a=rtcp-fb:102 ccm fir
a=rtcp-fb:102 nack
a=rtcp-fb:102 nack pli
a=rtpmap:125 H264/90000
a=fmtp:125 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtcp-fb:125 goog-remb
a=rtcp-fb:125 transport-cc
a=rtcp-fb:125 ccm fir
a=rtcp-fb:125 nack
a=rtcp-fb:125 nack pli
a=rtpmap:35 AV1X/90000
a=rtcp-fb:35 goog-remb
a=rtcp-fb:35 transport-cc
a=rtcp-fb:35 ccm fir
a=rtcp-fb:35 nack
a=rtcp-fb:35 nack pli
a=rtpmap:124 H264/90000
a=fmtp:124 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtcp-fb:124 goog-remb
a=rtcp-fb:124 transport-cc
a=rtcp-fb:124 ccm fir
a=rtcp-fb:124 nack
a=rtcp-fb:124 nack pli
a=rtpmap:123 H264/90000
a=fmtp:123 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtcp-fb:123 goog-remb
a=rtcp-fb:123 transport-cc
a=rtcp-fb:123 ccm fir
a=rtcp-fb:123 nack
a=rtcp-fb:123 nack pli
a=rtpmap:114 red/90000
a=rtpmap:116 ulpfec/90000
a=sendrecv
a=rtcp:PORT
SDP

#"UDP/TLS/RTP/SAVPF rtcp-mux-offer replace-origin ICE=force force-unified SDES-off ";
answer('[pstn-out]  unified plan compatible with mid in offer - answer', {'transport-protocol' => 'UDP/TLS/RTP/SAVPF', ICE => 'force', replace => ['origin'], 'rtcp-mux' => ['offer'], flags => ['force-unified', 'SDES-off']}, <<SDP);
v=0
o=M800-Transcoder 1635387700 1635387701 IN IP4 10.0.5.14
s=M800-Transcoder
c=IN IP4 10.0.5.14
t=0 0
m=audio 16782 RTP/AVP 111 110
a=rtpmap:111 opus/48000/2
a=fmtp:111 useinbandfec=1; minptime=20
a=rtpmap:110 telephone-event/48000
a=fmtp:110 0-16
a=ptime:20
a=rtcp:16783 IN IP4 10.0.5.14
m=video 0 RTP/AVP 19
----------------------------------
v=0
o=M800-Transcoder 1635387700 1635387701 IN IP4 203.0.113.1
s=M800-Transcoder
c=IN IP4 203.0.113.1
t=0 0
m=audio PORT UDP/TLS/RTP/SAVPF 111 110
a=mid:0
a=rtpmap:111 opus/48000/2
a=fmtp:111 useinbandfec=1; minptime=20
a=rtpmap:110 telephone-event/48000
a=fmtp:110 0-16
a=sendrecv
a=rtcp:PORT
a=rtcp-mux
a=setup:active
a=fingerprint:sha-256 FINGERPRINT256
a=ptime:20
a=ice-ufrag:ICEUFRAG
a=ice-pwd:ICEPWD
a=ice-options:trickle
a=candidate:ICEBASE 1 UDP 2130706431 203.0.113.1 PORT typ host generation 0 network-id 800 network-cost 999
a=candidate:ICEBASE 1 UDP 2130706175 2001:db8:4321::1 PORT typ host generation 0 network-id 800 network-cost 999
a=end-of-candidates
m=video 0 UDP/TLS/RTP/SAVPF 19
a=mid:1
a=end-of-candidates
SDP


new_call;

# "RTP/AVP replace-session-connection rtcp-mux-demux replace-origin ICE=remove "
offer('[pstn-out] unified plan compatible without mid in offer - offer', {'transport-protocol' => 'RTP/AVP', ICE => 'remove', replace => ['origin', 'session-connection'], 'rtcp-mux' => ['demux']}, <<SDP);
v=0
o=- 680859237751261969 1635404482128 IN IP4 172.30.251.188
s=-
t=0 0
a=extmap-allow-mixed
a=msid-semantic: WMS 8b80498e-b785-4d32-b16f-c3d4abb67141
a=group:BUNDLE 0 1
m=audio 34777 UDP/TLS/RTP/SAVPF 111 0 8 110 126
c=IN IP4 207.226.217.78
a=rtpmap:111 opus/48000/2
a=fmtp:111 minptime=20;useinbandfec=1;stereo=0;cbr=0;maxaveragebitrate=16000;usedtx=0;maxplaybackrate=16000;sprop-maxcapturerate=16000
a=rtpmap:0 PCMU/8000
a=rtpmap:8 PCMA/8000
a=rtpmap:110 telephone-event/48000
a=rtpmap:126 telephone-event/8000
a=sendrecv
a=rtcp:9 IN IP4 0.0.0.0
a=rtcp-fb:111 transport-cc
a=extmap:1 urn:ietf:params:rtp-hdrext:ssrc-audio-level
a=extmap:2 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time
a=extmap:3 http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01
a=extmap:4 urn:ietf:params:rtp-hdrext:sdes:mid
a=extmap:5 urn:ietf:params:rtp-hdrext:sdes:rtp-stream-id
a=extmap:6 urn:ietf:params:rtp-hdrext:sdes:repaired-rtp-stream-id
a=setup:actpass
a=msid:8b80498e-b785-4d32-b16f-c3d4abb67141 bba2a80b-698f-4186-99a4-a174e551a93b
a=ptime:20
a=maxptime:20
a=ice-ufrag:w7up
a=ice-pwd:6gQ7fY3b2nQtTZsspwzw1ZCE
a=fingerprint:sha-256 D5:15:36:32:88:0E:A9:24:13:B1:6A:1F:FE:6B:C1:81:16:09:3A:A2:B2:A6:9D:10:DB:65:00:9A:AB:92:3A:8F
a=candidate:4261937680 1 udp 25108991 207.226.217.78 34777 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:4261937680 1 udp 25108479 207.226.217.78 13632 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:1484720548 1 udp 25108735 207.226.217.79 57923 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:1484720548 1 udp 25108223 207.226.217.79 54404 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=ice-options:trickle
a=ssrc:2503300119 cname:/XncNVyLpTGYzDGV
a=ssrc:2503300119 msid:8b80498e-b785-4d32-b16f-c3d4abb67141 bba2a80b-698f-4186-99a4-a174e551a93b
a=ssrc:2503300119 mslabel:8b80498e-b785-4d32-b16f-c3d4abb67141
a=ssrc:2503300119 label:bba2a80b-698f-4186-99a4-a174e551a93b
a=rtcp-mux
m=video 56843 UDP/TLS/RTP/SAVPF 96 98 100 102 125 35 124 123 114 116
c=IN IP4 207.226.217.79
b=AS:2000
a=rtpmap:96 VP8/90000
a=rtpmap:98 VP9/90000
a=fmtp:98 profile-id=0;
a=rtpmap:100 VP9/90000
a=fmtp:100 profile-id=2;
a=rtpmap:102 H264/90000
a=fmtp:102 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtpmap:125 H264/90000
a=fmtp:125 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtpmap:35 AV1X/90000
a=rtpmap:124 H264/90000
a=fmtp:124 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtpmap:123 H264/90000
a=fmtp:123 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtpmap:114 red/90000
a=rtpmap:116 ulpfec/90000
a=sendrecv
a=rtcp:9 IN IP4 0.0.0.0
a=rtcp-fb:96 goog-remb
a=rtcp-fb:96 transport-cc
a=rtcp-fb:96 ccm fir
a=rtcp-fb:96 nack
a=rtcp-fb:96 nack pli
a=rtcp-fb:98 goog-remb
a=rtcp-fb:98 transport-cc
a=rtcp-fb:98 ccm fir
a=rtcp-fb:98 nack
a=rtcp-fb:98 nack pli
a=rtcp-fb:100 goog-remb
a=rtcp-fb:100 transport-cc
a=rtcp-fb:100 ccm fir
a=rtcp-fb:100 nack
a=rtcp-fb:100 nack pli
a=rtcp-fb:102 goog-remb
a=rtcp-fb:102 transport-cc
a=rtcp-fb:102 ccm fir
a=rtcp-fb:102 nack
a=rtcp-fb:102 nack pli
a=rtcp-fb:125 goog-remb
a=rtcp-fb:125 transport-cc
a=rtcp-fb:125 ccm fir
a=rtcp-fb:125 nack
a=rtcp-fb:125 nack pli
a=rtcp-fb:35 goog-remb
a=rtcp-fb:35 transport-cc
a=rtcp-fb:35 ccm fir
a=rtcp-fb:35 nack
a=rtcp-fb:35 nack pli
a=rtcp-fb:124 goog-remb
a=rtcp-fb:124 transport-cc
a=rtcp-fb:124 ccm fir
a=rtcp-fb:124 nack
a=rtcp-fb:124 nack pli
a=rtcp-fb:123 goog-remb
a=rtcp-fb:123 transport-cc
a=rtcp-fb:123 ccm fir
a=rtcp-fb:123 nack
a=rtcp-fb:123 nack pli
a=extmap:14 urn:ietf:params:rtp-hdrext:toffset
a=extmap:2 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time
a=extmap:13 urn:3gpp:video-orientation
a=extmap:3 http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01
a=extmap:12 http://www.webrtc.org/experiments/rtp-hdrext/playout-delay
a=extmap:11 http://www.webrtc.org/experiments/rtp-hdrext/video-content-type
a=extmap:7 http://www.webrtc.org/experiments/rtp-hdrext/video-timing
a=extmap:8 http://www.webrtc.org/experiments/rtp-hdrext/color-space
a=extmap:4 urn:ietf:params:rtp-hdrext:sdes:mid
a=extmap:5 urn:ietf:params:rtp-hdrext:sdes:rtp-stream-id
a=extmap:6 urn:ietf:params:rtp-hdrext:sdes:repaired-rtp-stream-id
a=setup:actpass
a=msid:8b80498e-b785-4d32-b16f-c3d4abb67141 00c4011d-9b8c-47dc-91a0-ce6f805d6658
a=ice-ufrag:w7up
a=ice-pwd:6gQ7fY3b2nQtTZsspwzw1ZCE
a=fingerprint:sha-256 D5:15:36:32:88:0E:A9:24:13:B1:6A:1F:FE:6B:C1:81:16:09:3A:A2:B2:A6:9D:10:DB:65:00:9A:AB:92:3A:8F
a=candidate:4261937680 1 udp 25108479 207.226.217.78 56843 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:1484720548 1 udp 25108735 207.226.217.79 59784 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:4261937680 1 udp 25108991 207.226.217.78 12249 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:1484720548 1 udp 25108223 207.226.217.79 61025 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=ice-options:trickle
a=ssrc:296967711 cname:/XncNVyLpTGYzDGV
a=ssrc:296967711 msid:8b80498e-b785-4d32-b16f-c3d4abb67141 00c4011d-9b8c-47dc-91a0-ce6f805d6658
a=ssrc:296967711 mslabel:8b80498e-b785-4d32-b16f-c3d4abb67141
a=ssrc:296967711 label:00c4011d-9b8c-47dc-91a0-ce6f805d6658
a=ssrc:1746529774 cname:/XncNVyLpTGYzDGV
a=ssrc:1746529774 msid:8b80498e-b785-4d32-b16f-c3d4abb67141 00c4011d-9b8c-47dc-91a0-ce6f805d6658
a=ssrc:1746529774 mslabel:8b80498e-b785-4d32-b16f-c3d4abb67141
a=ssrc:1746529774 label:00c4011d-9b8c-47dc-91a0-ce6f805d6658
a=ssrc-group:FID 296967711 1746529774
a=rtcp-mux
a=rtcp-rsize
----------------------------------
v=0
o=- 680859237751261969 1635404482128 IN IP4 203.0.113.1
s=-
t=0 0
a=extmap-allow-mixed
a=msid-semantic: WMS 8b80498e-b785-4d32-b16f-c3d4abb67141
m=audio PORT RTP/AVP 111 0 8 110 126
c=IN IP4 203.0.113.1
a=extmap:1 urn:ietf:params:rtp-hdrext:ssrc-audio-level
a=extmap:2 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time
a=extmap:3 http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01
a=extmap:4 urn:ietf:params:rtp-hdrext:sdes:mid
a=extmap:5 urn:ietf:params:rtp-hdrext:sdes:rtp-stream-id
a=extmap:6 urn:ietf:params:rtp-hdrext:sdes:repaired-rtp-stream-id
a=msid:8b80498e-b785-4d32-b16f-c3d4abb67141 bba2a80b-698f-4186-99a4-a174e551a93b
a=maxptime:20
a=rtpmap:111 opus/48000/2
a=fmtp:111 minptime=20;useinbandfec=1;stereo=0;cbr=0;maxaveragebitrate=16000;usedtx=0;maxplaybackrate=16000;sprop-maxcapturerate=16000
a=rtcp-fb:111 transport-cc
a=rtpmap:0 PCMU/8000
a=rtpmap:8 PCMA/8000
a=rtpmap:110 telephone-event/48000
a=rtpmap:126 telephone-event/8000
a=sendrecv
a=rtcp:PORT
a=ptime:20
m=video PORT RTP/AVP 96 98 100 102 125 35 124 123 114 116
c=IN IP4 203.0.113.1
b=AS:2000
a=extmap:14 urn:ietf:params:rtp-hdrext:toffset
a=extmap:2 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time
a=extmap:13 urn:3gpp:video-orientation
a=extmap:3 http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01
a=extmap:12 http://www.webrtc.org/experiments/rtp-hdrext/playout-delay
a=extmap:11 http://www.webrtc.org/experiments/rtp-hdrext/video-content-type
a=extmap:7 http://www.webrtc.org/experiments/rtp-hdrext/video-timing
a=extmap:8 http://www.webrtc.org/experiments/rtp-hdrext/color-space
a=extmap:4 urn:ietf:params:rtp-hdrext:sdes:mid
a=extmap:5 urn:ietf:params:rtp-hdrext:sdes:rtp-stream-id
a=extmap:6 urn:ietf:params:rtp-hdrext:sdes:repaired-rtp-stream-id
a=msid:8b80498e-b785-4d32-b16f-c3d4abb67141 00c4011d-9b8c-47dc-91a0-ce6f805d6658
a=ssrc-group:FID 296967711 1746529774
a=rtcp-rsize
a=rtpmap:96 VP8/90000
a=rtcp-fb:96 goog-remb
a=rtcp-fb:96 transport-cc
a=rtcp-fb:96 ccm fir
a=rtcp-fb:96 nack
a=rtcp-fb:96 nack pli
a=rtpmap:98 VP9/90000
a=fmtp:98 profile-id=0;
a=rtcp-fb:98 goog-remb
a=rtcp-fb:98 transport-cc
a=rtcp-fb:98 ccm fir
a=rtcp-fb:98 nack
a=rtcp-fb:98 nack pli
a=rtpmap:100 VP9/90000
a=fmtp:100 profile-id=2;
a=rtcp-fb:100 goog-remb
a=rtcp-fb:100 transport-cc
a=rtcp-fb:100 ccm fir
a=rtcp-fb:100 nack
a=rtcp-fb:100 nack pli
a=rtpmap:102 H264/90000
a=fmtp:102 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtcp-fb:102 goog-remb
a=rtcp-fb:102 transport-cc
a=rtcp-fb:102 ccm fir
a=rtcp-fb:102 nack
a=rtcp-fb:102 nack pli
a=rtpmap:125 H264/90000
a=fmtp:125 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtcp-fb:125 goog-remb
a=rtcp-fb:125 transport-cc
a=rtcp-fb:125 ccm fir
a=rtcp-fb:125 nack
a=rtcp-fb:125 nack pli
a=rtpmap:35 AV1X/90000
a=rtcp-fb:35 goog-remb
a=rtcp-fb:35 transport-cc
a=rtcp-fb:35 ccm fir
a=rtcp-fb:35 nack
a=rtcp-fb:35 nack pli
a=rtpmap:124 H264/90000
a=fmtp:124 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtcp-fb:124 goog-remb
a=rtcp-fb:124 transport-cc
a=rtcp-fb:124 ccm fir
a=rtcp-fb:124 nack
a=rtcp-fb:124 nack pli
a=rtpmap:123 H264/90000
a=fmtp:123 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f;
a=rtcp-fb:123 goog-remb
a=rtcp-fb:123 transport-cc
a=rtcp-fb:123 ccm fir
a=rtcp-fb:123 nack
a=rtcp-fb:123 nack pli
a=rtpmap:114 red/90000
a=rtpmap:116 ulpfec/90000
a=sendrecv
a=rtcp:PORT
SDP

#"UDP/TLS/RTP/SAVPF rtcp-mux-offer replace-origin ICE=force force-unified SDES-off ";
answer('[pstn-out] unified plan compatible without mid in offer - answer', {'transport-protocol' => 'UDP/TLS/RTP/SAVPF', ICE => 'force', replace => ['origin'], 'rtcp-mux' => ['offer'], flags => ['force-unified', 'SDES-off']}, <<SDP);
v=0
o=M800-Transcoder 1635387700 1635387701 IN IP4 10.0.5.14
s=M800-Transcoder
c=IN IP4 10.0.5.14
t=0 0
m=audio 16782 RTP/AVP 111 110
a=rtpmap:111 opus/48000/2
a=fmtp:111 useinbandfec=1; minptime=20
a=rtpmap:110 telephone-event/48000
a=fmtp:110 0-16
a=ptime:20
a=rtcp:16783 IN IP4 10.0.5.14
m=video 0 RTP/AVP 19
----------------------------------
v=0
o=M800-Transcoder 1635387700 1635387701 IN IP4 203.0.113.1
s=M800-Transcoder
c=IN IP4 203.0.113.1
t=0 0
m=audio PORT UDP/TLS/RTP/SAVPF 111 110
a=mid:0
a=rtpmap:111 opus/48000/2
a=fmtp:111 useinbandfec=1; minptime=20
a=rtpmap:110 telephone-event/48000
a=fmtp:110 0-16
a=sendrecv
a=rtcp:PORT
a=rtcp-mux
a=setup:active
a=fingerprint:sha-256 FINGERPRINT256
a=ptime:20
a=ice-ufrag:ICEUFRAG
a=ice-pwd:ICEPWD
a=ice-options:trickle
a=candidate:ICEBASE 1 UDP 2130706431 203.0.113.1 PORT typ host generation 0 network-id 800 network-cost 999
a=candidate:ICEBASE 1 UDP 2130706175 2001:db8:4321::1 PORT typ host generation 0 network-id 800 network-cost 999
a=end-of-candidates
m=video 0 UDP/TLS/RTP/SAVPF 19
a=mid:1
a=end-of-candidates
SDP

new_call;

# "UDP/TLS/RTP/SAVPF rtcp-mux-offer replace-origin ICE=force force-unified SDES-off ";
offer('[tf-in] unified plan compatible without mid in offer - offer', {'transport-protocol' => 'UDP/TLS/RTP/SAVPF', ICE => 'force', replace => ['origin'], 'rtcp-mux' => ['offer'], flags => ['force-unified', 'SDES-off']}, <<SDP);
v=0
o=M800-Transcoder 1635387700 1635387701 IN IP4 10.0.5.14
s=M800-Transcoder
c=IN IP4 10.0.5.14
t=0 0
m=audio 16782 RTP/AVP 111 110
a=rtpmap:111 opus/48000/2
a=fmtp:111 useinbandfec=1; minptime=20
a=rtpmap:110 telephone-event/48000
a=fmtp:110 0-16
a=ptime:20
a=rtcp:16783 IN IP4 10.0.5.14
----------------------------------
v=0
o=M800-Transcoder 1635387700 1635387701 IN IP4 203.0.113.1
s=M800-Transcoder
c=IN IP4 203.0.113.1
t=0 0
m=audio PORT UDP/TLS/RTP/SAVPF 111 110
a=mid:0
a=rtpmap:111 opus/48000/2
a=fmtp:111 useinbandfec=1; minptime=20
a=rtpmap:110 telephone-event/48000
a=fmtp:110 0-16
a=sendrecv
a=rtcp:PORT
a=rtcp-mux
a=setup:actpass
a=fingerprint:sha-256 FINGERPRINT256
a=ptime:20
a=ice-ufrag:ICEUFRAG
a=ice-pwd:ICEPWD
a=candidate:ICEBASE 1 UDP 2130706431 203.0.113.1 PORT typ host generation 0 network-id 800 network-cost 999
a=candidate:ICEBASE 1 UDP 2130706175 2001:db8:4321::1 PORT typ host generation 0 network-id 800 network-cost 999
a=candidate:ICEBASE 2 UDP 2130706430 203.0.113.1 PORT typ host generation 0 network-id 800 network-cost 999
a=candidate:ICEBASE 2 UDP 2130706174 2001:db8:4321::1 PORT typ host generation 0 network-id 800 network-cost 999
SDP

# "RTP/AVP replace-session-connection rtcp-mux-demux replace-origin ICE=remove "
answer('[tf-in] unified plan compatible without mid in offer - answer', {'transport-protocol' => 'RTP/AVP', ICE => 'remove', replace => ['origin', 'session-connection'], 'rtcp-mux' => ['demux']}, <<SDP);
v=0
o=- 680859237751261969 1635404482128 IN IP4 172.30.251.188
s=-
t=0 0
a=extmap-allow-mixed
a=msid-semantic: WMS 8b80498e-b785-4d32-b16f-c3d4abb67141
a=group:BUNDLE 0 1
m=audio 34777 UDP/TLS/RTP/SAVPF 111 110
c=IN IP4 207.226.217.78
a=rtpmap:111 opus/48000/2
a=fmtp:111 minptime=20;useinbandfec=1;stereo=0;cbr=0;maxaveragebitrate=16000;usedtx=0;maxplaybackrate=16000;sprop-maxcapturerate=16000
a=rtpmap:110 telephone-event/48000
a=sendrecv
a=rtcp:9 IN IP4 0.0.0.0
a=rtcp-fb:111 transport-cc
a=extmap:1 urn:ietf:params:rtp-hdrext:ssrc-audio-level
a=extmap:2 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time
a=extmap:3 http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01
a=extmap:4 urn:ietf:params:rtp-hdrext:sdes:mid
a=extmap:5 urn:ietf:params:rtp-hdrext:sdes:rtp-stream-id
a=extmap:6 urn:ietf:params:rtp-hdrext:sdes:repaired-rtp-stream-id
a=setup:active
a=msid:8b80498e-b785-4d32-b16f-c3d4abb67141 bba2a80b-698f-4186-99a4-a174e551a93b
a=ptime:20
a=maxptime:20
a=ice-ufrag:w7up
a=ice-pwd:6gQ7fY3b2nQtTZsspwzw1ZCE
a=fingerprint:sha-256 D5:15:36:32:88:0E:A9:24:13:B1:6A:1F:FE:6B:C1:81:16:09:3A:A2:B2:A6:9D:10:DB:65:00:9A:AB:92:3A:8F
a=candidate:4261937680 1 udp 25108991 207.226.217.78 34777 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:4261937680 1 udp 25108479 207.226.217.78 13632 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:1484720548 1 udp 25108735 207.226.217.79 57923 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=candidate:1484720548 1 udp 25108223 207.226.217.79 54404 typ relay raddr 0.0.0.0 rport 0 generation 0 network-id 2
a=ice-options:trickle
a=ssrc:2503300119 cname:/XncNVyLpTGYzDGV
a=ssrc:2503300119 msid:8b80498e-b785-4d32-b16f-c3d4abb67141 bba2a80b-698f-4186-99a4-a174e551a93b
a=ssrc:2503300119 mslabel:8b80498e-b785-4d32-b16f-c3d4abb67141
a=ssrc:2503300119 label:bba2a80b-698f-4186-99a4-a174e551a93b
a=rtcp-mux
----------------------------------
v=0
o=- 680859237751261969 1635404482128 IN IP4 203.0.113.1
s=-
t=0 0
a=extmap-allow-mixed
a=msid-semantic: WMS 8b80498e-b785-4d32-b16f-c3d4abb67141
m=audio PORT RTP/AVP 111 110
c=IN IP4 203.0.113.1
a=extmap:1 urn:ietf:params:rtp-hdrext:ssrc-audio-level
a=extmap:2 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time
a=extmap:3 http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01
a=extmap:4 urn:ietf:params:rtp-hdrext:sdes:mid
a=extmap:5 urn:ietf:params:rtp-hdrext:sdes:rtp-stream-id
a=extmap:6 urn:ietf:params:rtp-hdrext:sdes:repaired-rtp-stream-id
a=msid:8b80498e-b785-4d32-b16f-c3d4abb67141 bba2a80b-698f-4186-99a4-a174e551a93b
a=maxptime:20
a=rtpmap:111 opus/48000/2
a=fmtp:111 minptime=20;useinbandfec=1;stereo=0;cbr=0;maxaveragebitrate=16000;usedtx=0;maxplaybackrate=16000;sprop-maxcapturerate=16000
a=rtcp-fb:111 transport-cc
a=rtpmap:110 telephone-event/48000
a=sendrecv
a=rtcp:PORT
a=ptime:20
SDP


done_testing();
