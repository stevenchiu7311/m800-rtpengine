#ifndef __HOMER_H__
#define __HOMER_H__

#include "socket.h"

#define PROTO_LOG   100
#define PROTO_RTCP_JSON   0x05

void homer_sender_init(const endpoint_t *, int, int);
int homer_send(GString *, const str *, const endpoint_t *, const endpoint_t *,
		const struct timeval *tv);
int homer_send_generic(GString *, const str *, const endpoint_t *, const endpoint_t *,
		const struct timeval *tv, int proto_type);
int has_homer(void);


#endif
