
/home/rtthread-smart/userapps/root/bin/timer_thread.elf:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000200000 <_start>:
  200000:	9100007f 	mov	sp, x3
  200004:	14000001 	b	200008 <_start_c>

0000000000200008 <_start_c>:
  200008:	b0000082 	adrp	x2, 211000 <__subtf3+0x7d0>
  20000c:	b0000081 	adrp	x1, 211000 <__subtf3+0x7d0>
  200010:	f81f0ffe 	str	x30, [sp, #-16]!
  200014:	f0000006 	adrp	x6, 203000 <rt_tick_from_millisecond+0xa0>
  200018:	f9446444 	ldr	x4, [x2, #2248]
  20001c:	d2800005 	mov	x5, #0x0                   	// #0
  200020:	f9446823 	ldr	x3, [x1, #2256]
  200024:	91002002 	add	x2, x0, #0x8
  200028:	b9400001 	ldr	w1, [x0]
  20002c:	9106a0c0 	add	x0, x6, #0x1a8
  200030:	94000d2a 	bl	2034d8 <__libc_start_main>
  200034:	00000000 	.inst	0x00000000 ; undefined

0000000000200038 <deregister_tm_clones>:
  200038:	b00000a0 	adrp	x0, 215000 <__data_start__>
  20003c:	91082000 	add	x0, x0, #0x208
  200040:	b00000a1 	adrp	x1, 215000 <__data_start__>
  200044:	91082021 	add	x1, x1, #0x208
  200048:	eb00003f 	cmp	x1, x0
  20004c:	540000a0 	b.eq	200060 <deregister_tm_clones+0x28>  // b.none
  200050:	b0000081 	adrp	x1, 211000 <__subtf3+0x7d0>
  200054:	f9446c21 	ldr	x1, [x1, #2264]
  200058:	b4000041 	cbz	x1, 200060 <deregister_tm_clones+0x28>
  20005c:	d61f0020 	br	x1
  200060:	d65f03c0 	ret
  200064:	d503201f 	nop

0000000000200068 <register_tm_clones>:
  200068:	b00000a0 	adrp	x0, 215000 <__data_start__>
  20006c:	91082000 	add	x0, x0, #0x208
  200070:	b00000a1 	adrp	x1, 215000 <__data_start__>
  200074:	91082021 	add	x1, x1, #0x208
  200078:	cb000021 	sub	x1, x1, x0
  20007c:	9343fc21 	asr	x1, x1, #3
  200080:	8b41fc21 	add	x1, x1, x1, lsr #63
  200084:	9341fc21 	asr	x1, x1, #1
  200088:	b40000c1 	cbz	x1, 2000a0 <register_tm_clones+0x38>
  20008c:	b0000082 	adrp	x2, 211000 <__subtf3+0x7d0>
  200090:	f9447042 	ldr	x2, [x2, #2272]
  200094:	b4000062 	cbz	x2, 2000a0 <register_tm_clones+0x38>
  200098:	d61f0040 	br	x2
  20009c:	d503201f 	nop
  2000a0:	d65f03c0 	ret
  2000a4:	d503201f 	nop

00000000002000a8 <__do_global_dtors_aux>:
  2000a8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  2000ac:	910003fd 	mov	x29, sp
  2000b0:	f9000bf3 	str	x19, [sp, #16]
  2000b4:	b00000b3 	adrp	x19, 215000 <__data_start__>
  2000b8:	39482260 	ldrb	w0, [x19, #520]
  2000bc:	35000140 	cbnz	w0, 2000e4 <__do_global_dtors_aux+0x3c>
  2000c0:	97ffffde 	bl	200038 <deregister_tm_clones>
  2000c4:	b0000080 	adrp	x0, 211000 <__subtf3+0x7d0>
  2000c8:	f9447400 	ldr	x0, [x0, #2280]
  2000cc:	b4000080 	cbz	x0, 2000dc <__do_global_dtors_aux+0x34>
  2000d0:	900000a0 	adrp	x0, 214000 <syscall_table+0x800>
  2000d4:	91231000 	add	x0, x0, #0x8c4
  2000d8:	d503201f 	nop
  2000dc:	52800020 	mov	w0, #0x1                   	// #1
  2000e0:	39082260 	strb	w0, [x19, #520]
  2000e4:	f9400bf3 	ldr	x19, [sp, #16]
  2000e8:	a8c27bfd 	ldp	x29, x30, [sp], #32
  2000ec:	d65f03c0 	ret

00000000002000f0 <frame_dummy>:
  2000f0:	b0000080 	adrp	x0, 211000 <__subtf3+0x7d0>
  2000f4:	f9447800 	ldr	x0, [x0, #2288]
  2000f8:	b4000140 	cbz	x0, 200120 <frame_dummy+0x30>
  2000fc:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  200100:	b00000a1 	adrp	x1, 215000 <__data_start__>
  200104:	900000a0 	adrp	x0, 214000 <syscall_table+0x800>
  200108:	91084021 	add	x1, x1, #0x210
  20010c:	910003fd 	mov	x29, sp
  200110:	91231000 	add	x0, x0, #0x8c4
  200114:	d503201f 	nop
  200118:	a8c17bfd 	ldp	x29, x30, [sp], #16
  20011c:	17ffffd3 	b	200068 <register_tm_clones>
  200120:	17ffffd2 	b	200068 <register_tm_clones>

0000000000200124 <rt_channel_open>:

#include <sys/rtt_syscall.h>
#include <rtthread.h>

int rt_channel_open(const char *name, int flags)
{
  200124:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  200128:	910003fd 	mov	x29, sp
  20012c:	f9000fa0 	str	x0, [x29, #24]
  200130:	b90017a1 	str	w1, [x29, #20]
    return syscall(_NRSYS_channel_open, name, flags);
  200134:	b94017a2 	ldr	w2, [x29, #20]
  200138:	f9400fa1 	ldr	x1, [x29, #24]
  20013c:	52800580 	mov	w0, #0x2c                  	// #44
  200140:	94000dd7 	bl	20389c <syscall>
}
  200144:	a8c27bfd 	ldp	x29, x30, [sp], #32
  200148:	d65f03c0 	ret

000000000020014c <rt_channel_close>:

rt_err_t rt_channel_close(int fd)
{
  20014c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  200150:	910003fd 	mov	x29, sp
  200154:	b9001fa0 	str	w0, [x29, #28]
    return syscall(_NRSYS_channel_close, fd);
  200158:	b9401fa1 	ldr	w1, [x29, #28]
  20015c:	528005a0 	mov	w0, #0x2d                  	// #45
  200160:	94000dcf 	bl	20389c <syscall>
}
  200164:	a8c27bfd 	ldp	x29, x30, [sp], #32
  200168:	d65f03c0 	ret

000000000020016c <rt_channel_send_recv>:

rt_err_t rt_channel_send_recv(int fd, rt_channel_msg_t data, rt_channel_msg_t data_ret)
{
  20016c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  200170:	910003fd 	mov	x29, sp
  200174:	b9002fa0 	str	w0, [x29, #44]
  200178:	f90013a1 	str	x1, [x29, #32]
  20017c:	f9000fa2 	str	x2, [x29, #24]
    return syscall(_NRSYS_channel_send_recv_timeout, fd, data, data_ret, RT_WAITING_FOREVER);
  200180:	12800004 	mov	w4, #0xffffffff            	// #-1
  200184:	f9400fa3 	ldr	x3, [x29, #24]
  200188:	f94013a2 	ldr	x2, [x29, #32]
  20018c:	b9402fa1 	ldr	w1, [x29, #44]
  200190:	528005e0 	mov	w0, #0x2f                  	// #47
  200194:	94000dc2 	bl	20389c <syscall>
}
  200198:	a8c37bfd 	ldp	x29, x30, [sp], #48
  20019c:	d65f03c0 	ret

00000000002001a0 <rt_channel_send_recv_timeout>:

rt_err_t rt_channel_send_recv_timeout(int fd, rt_channel_msg_t data, rt_channel_msg_t data_ret, rt_int32_t time)
{
  2001a0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  2001a4:	910003fd 	mov	x29, sp
  2001a8:	b9002fa0 	str	w0, [x29, #44]
  2001ac:	f90013a1 	str	x1, [x29, #32]
  2001b0:	f9000fa2 	str	x2, [x29, #24]
  2001b4:	b9002ba3 	str	w3, [x29, #40]
    return syscall(_NRSYS_channel_send_recv_timeout, fd, data, data_ret, time);
  2001b8:	b9402ba4 	ldr	w4, [x29, #40]
  2001bc:	f9400fa3 	ldr	x3, [x29, #24]
  2001c0:	f94013a2 	ldr	x2, [x29, #32]
  2001c4:	b9402fa1 	ldr	w1, [x29, #44]
  2001c8:	528005e0 	mov	w0, #0x2f                  	// #47
  2001cc:	94000db4 	bl	20389c <syscall>
}
  2001d0:	a8c37bfd 	ldp	x29, x30, [sp], #48
  2001d4:	d65f03c0 	ret

00000000002001d8 <rt_channel_send>:

rt_err_t rt_channel_send(int fd, rt_channel_msg_t data)
{
  2001d8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  2001dc:	910003fd 	mov	x29, sp
  2001e0:	b9001fa0 	str	w0, [x29, #28]
  2001e4:	f9000ba1 	str	x1, [x29, #16]
    return syscall(_NRSYS_channel_send, fd, data);
  2001e8:	f9400ba2 	ldr	x2, [x29, #16]
  2001ec:	b9401fa1 	ldr	w1, [x29, #28]
  2001f0:	528005c0 	mov	w0, #0x2e                  	// #46
  2001f4:	94000daa 	bl	20389c <syscall>
}
  2001f8:	a8c27bfd 	ldp	x29, x30, [sp], #32
  2001fc:	d65f03c0 	ret

0000000000200200 <rt_channel_reply>:

rt_err_t rt_channel_reply(int fd, rt_channel_msg_t data)
{
  200200:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  200204:	910003fd 	mov	x29, sp
  200208:	b9001fa0 	str	w0, [x29, #28]
  20020c:	f9000ba1 	str	x1, [x29, #16]
    return syscall(_NRSYS_channel_reply, fd, data);
  200210:	f9400ba2 	ldr	x2, [x29, #16]
  200214:	b9401fa1 	ldr	w1, [x29, #28]
  200218:	52800600 	mov	w0, #0x30                  	// #48
  20021c:	94000da0 	bl	20389c <syscall>
}
  200220:	a8c27bfd 	ldp	x29, x30, [sp], #32
  200224:	d65f03c0 	ret

0000000000200228 <rt_channel_recv>:

rt_err_t rt_channel_recv(int fd, rt_channel_msg_t data)
{
  200228:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  20022c:	910003fd 	mov	x29, sp
  200230:	b9001fa0 	str	w0, [x29, #28]
  200234:	f9000ba1 	str	x1, [x29, #16]
    return syscall(_NRSYS_channel_recv_timeout, fd, data, RT_WAITING_FOREVER);
  200238:	12800003 	mov	w3, #0xffffffff            	// #-1
  20023c:	f9400ba2 	ldr	x2, [x29, #16]
  200240:	b9401fa1 	ldr	w1, [x29, #28]
  200244:	52800620 	mov	w0, #0x31                  	// #49
  200248:	94000d95 	bl	20389c <syscall>
}
  20024c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  200250:	d65f03c0 	ret

0000000000200254 <rt_channel_recv_timeout>:

rt_err_t rt_channel_recv_timeout(int fd, rt_channel_msg_t data, rt_int32_t time)
{
  200254:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  200258:	910003fd 	mov	x29, sp
  20025c:	b9001fa0 	str	w0, [x29, #28]
  200260:	f9000ba1 	str	x1, [x29, #16]
  200264:	b9001ba2 	str	w2, [x29, #24]
    return syscall(_NRSYS_channel_recv_timeout, fd, data, time);
  200268:	b9401ba3 	ldr	w3, [x29, #24]
  20026c:	f9400ba2 	ldr	x2, [x29, #16]
  200270:	b9401fa1 	ldr	w1, [x29, #28]
  200274:	52800620 	mov	w0, #0x31                  	// #49
  200278:	94000d89 	bl	20389c <syscall>
}
  20027c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  200280:	d65f03c0 	ret

0000000000200284 <rt_channel_peek>:

rt_err_t rt_channel_peek(int fd, rt_channel_msg_t data)
{
  200284:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  200288:	910003fd 	mov	x29, sp
  20028c:	b9001fa0 	str	w0, [x29, #28]
  200290:	f9000ba1 	str	x1, [x29, #16]
    return syscall(_NRSYS_channel_recv_timeout, fd, data, 0);
  200294:	52800003 	mov	w3, #0x0                   	// #0
  200298:	f9400ba2 	ldr	x2, [x29, #16]
  20029c:	b9401fa1 	ldr	w1, [x29, #28]
  2002a0:	52800620 	mov	w0, #0x31                  	// #49
  2002a4:	94000d7e 	bl	20389c <syscall>
}
  2002a8:	a8c27bfd 	ldp	x29, x30, [sp], #32
  2002ac:	d65f03c0 	ret

00000000002002b0 <rt_completion_init>:
 * 2019-10-01     Bernard      code cleanup
 */
#include <rtdevice.h>

void rt_completion_init(struct rt_completion *completion)
{
  2002b0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  2002b4:	910003fd 	mov	x29, sp
  2002b8:	f9000fa0 	str	x0, [x29, #24]
    if (completion && completion->flag == 0)
  2002bc:	f9400fa0 	ldr	x0, [x29, #24]
  2002c0:	f100001f 	cmp	x0, #0x0
  2002c4:	540001e0 	b.eq	200300 <rt_completion_init+0x50>  // b.none
  2002c8:	f9400fa0 	ldr	x0, [x29, #24]
  2002cc:	b9400000 	ldr	w0, [x0]
  2002d0:	7100001f 	cmp	w0, #0x0
  2002d4:	54000161 	b.ne	200300 <rt_completion_init+0x50>  // b.any
    {
        completion->flag = 0x5A5A;
  2002d8:	f9400fa0 	ldr	x0, [x29, #24]
  2002dc:	528b4b41 	mov	w1, #0x5a5a                	// #23130
  2002e0:	b9000001 	str	w1, [x0]
        completion->wait_event = rt_event_create("completion", RT_IPC_FLAG_FIFO);
  2002e4:	b0000080 	adrp	x0, 211000 <__subtf3+0x7d0>
  2002e8:	9123e000 	add	x0, x0, #0x8f8
  2002ec:	52800001 	mov	w1, #0x0                   	// #0
  2002f0:	94000546 	bl	201808 <rt_event_create>
  2002f4:	aa0003e1 	mov	x1, x0
  2002f8:	f9400fa0 	ldr	x0, [x29, #24]
  2002fc:	f9000401 	str	x1, [x0, #8]
    }
}
  200300:	d503201f 	nop
  200304:	a8c27bfd 	ldp	x29, x30, [sp], #32
  200308:	d65f03c0 	ret

000000000020030c <rt_completion_wait>:

rt_err_t rt_completion_wait(struct rt_completion *completion,
    rt_int32_t timeout)
{
  20030c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  200310:	910003fd 	mov	x29, sp
  200314:	f9000fa0 	str	x0, [x29, #24]
  200318:	b90017a1 	str	w1, [x29, #20]
    rt_err_t ret;
    rt_uint32_t recv = 0;
  20031c:	b90027bf 	str	wzr, [x29, #36]

    ret = rt_event_recv(completion->wait_event, 0x01, RT_EVENT_FLAG_OR | RT_EVENT_FLAG_CLEAR, timeout, &recv);
  200320:	f9400fa0 	ldr	x0, [x29, #24]
  200324:	f9400400 	ldr	x0, [x0, #8]
  200328:	910093a1 	add	x1, x29, #0x24
  20032c:	aa0103e4 	mov	x4, x1
  200330:	b94017a3 	ldr	w3, [x29, #20]
  200334:	528000c2 	mov	w2, #0x6                   	// #6
  200338:	52800021 	mov	w1, #0x1                   	// #1
  20033c:	940005d4 	bl	201a8c <rt_event_recv>
  200340:	f90017a0 	str	x0, [x29, #40]

    return ret;
  200344:	f94017a0 	ldr	x0, [x29, #40]
}
  200348:	a8c37bfd 	ldp	x29, x30, [sp], #48
  20034c:	d65f03c0 	ret

0000000000200350 <rt_completion_done>:

void rt_completion_done(struct rt_completion *completion)
{
  200350:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  200354:	910003fd 	mov	x29, sp
  200358:	f9000fa0 	str	x0, [x29, #24]
    rt_event_send(completion->wait_event, 0x01);
  20035c:	f9400fa0 	ldr	x0, [x29, #24]
  200360:	f9400400 	ldr	x0, [x0, #8]
  200364:	52800021 	mov	w1, #0x1                   	// #1
  200368:	940005ae 	bl	201a20 <rt_event_send>
}
  20036c:	d503201f 	nop
  200370:	a8c27bfd 	ldp	x29, x30, [sp], #32
  200374:	d65f03c0 	ret

0000000000200378 <rt_device_init>:

#include <sys/rtt_syscall.h>
#include <rtthread.h>

rt_err_t rt_device_init(rt_device_t dev)
{
  200378:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  20037c:	910003fd 	mov	x29, sp
  200380:	f9000fa0 	str	x0, [x29, #24]
    return syscall(_NRSYS_rt_device_init, dev);
  200384:	f9400fa1 	ldr	x1, [x29, #24]
  200388:	52800760 	mov	w0, #0x3b                  	// #59
  20038c:	94000d44 	bl	20389c <syscall>
}
  200390:	a8c27bfd 	ldp	x29, x30, [sp], #32
  200394:	d65f03c0 	ret

0000000000200398 <rt_device_register>:

rt_err_t rt_device_register(rt_device_t dev,
        const char *name,
        rt_uint16_t flags)
{
  200398:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  20039c:	910003fd 	mov	x29, sp
  2003a0:	f90017a0 	str	x0, [x29, #40]
  2003a4:	f90013a1 	str	x1, [x29, #32]
  2003a8:	79003fa2 	strh	w2, [x29, #30]
    return syscall(_NRSYS_rt_device_register, dev, name, flags);
  2003ac:	79403fa0 	ldrh	w0, [x29, #30]
  2003b0:	2a0003e3 	mov	w3, w0
  2003b4:	f94013a2 	ldr	x2, [x29, #32]
  2003b8:	f94017a1 	ldr	x1, [x29, #40]
  2003bc:	52800780 	mov	w0, #0x3c                  	// #60
  2003c0:	94000d37 	bl	20389c <syscall>
}
  2003c4:	a8c37bfd 	ldp	x29, x30, [sp], #48
  2003c8:	d65f03c0 	ret

00000000002003cc <rt_device_control>:

rt_err_t rt_device_control(rt_device_t dev, int cmd, void *arg)
{
  2003cc:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  2003d0:	910003fd 	mov	x29, sp
  2003d4:	f90017a0 	str	x0, [x29, #40]
  2003d8:	b90027a1 	str	w1, [x29, #36]
  2003dc:	f9000fa2 	str	x2, [x29, #24]
    return syscall(_NRSYS_rt_device_control, dev, cmd, arg);
  2003e0:	f9400fa3 	ldr	x3, [x29, #24]
  2003e4:	b94027a2 	ldr	w2, [x29, #36]
  2003e8:	f94017a1 	ldr	x1, [x29, #40]
  2003ec:	528007a0 	mov	w0, #0x3d                  	// #61
  2003f0:	94000d2b 	bl	20389c <syscall>
}
  2003f4:	a8c37bfd 	ldp	x29, x30, [sp], #48
  2003f8:	d65f03c0 	ret

00000000002003fc <rt_device_find>:

rt_device_t rt_device_find(const char *name)
{
  2003fc:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  200400:	910003fd 	mov	x29, sp
  200404:	f9000fa0 	str	x0, [x29, #24]
    return (rt_device_t)syscall(_NRSYS_rt_device_find, name);
  200408:	f9400fa1 	ldr	x1, [x29, #24]
  20040c:	528007c0 	mov	w0, #0x3e                  	// #62
  200410:	94000d23 	bl	20389c <syscall>
}
  200414:	a8c27bfd 	ldp	x29, x30, [sp], #32
  200418:	d65f03c0 	ret

000000000020041c <rt_device_open>:

rt_err_t rt_device_open(rt_device_t dev, rt_uint16_t oflag)
{
  20041c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  200420:	910003fd 	mov	x29, sp
  200424:	f9000fa0 	str	x0, [x29, #24]
  200428:	79002fa1 	strh	w1, [x29, #22]
    return syscall(_NRSYS_rt_device_open, dev, oflag);
  20042c:	79402fa0 	ldrh	w0, [x29, #22]
  200430:	2a0003e2 	mov	w2, w0
  200434:	f9400fa1 	ldr	x1, [x29, #24]
  200438:	528007e0 	mov	w0, #0x3f                  	// #63
  20043c:	94000d18 	bl	20389c <syscall>
}
  200440:	a8c27bfd 	ldp	x29, x30, [sp], #32
  200444:	d65f03c0 	ret

0000000000200448 <rt_device_close>:

rt_err_t rt_device_close(rt_device_t dev)
{
  200448:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  20044c:	910003fd 	mov	x29, sp
  200450:	f9000fa0 	str	x0, [x29, #24]
    return syscall(_NRSYS_rt_device_close, dev);
  200454:	f9400fa1 	ldr	x1, [x29, #24]
  200458:	52800800 	mov	w0, #0x40                  	// #64
  20045c:	94000d10 	bl	20389c <syscall>
}
  200460:	a8c27bfd 	ldp	x29, x30, [sp], #32
  200464:	d65f03c0 	ret

0000000000200468 <rt_device_read>:

rt_size_t rt_device_read(rt_device_t dev,
        rt_off_t    pos,
        void       *buffer,
        rt_size_t   size)
{
  200468:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  20046c:	910003fd 	mov	x29, sp
  200470:	f90017a0 	str	x0, [x29, #40]
  200474:	f90013a1 	str	x1, [x29, #32]
  200478:	f9000fa2 	str	x2, [x29, #24]
  20047c:	f9000ba3 	str	x3, [x29, #16]
    return syscall(_NRSYS_rt_device_read, dev, pos, buffer, size);
  200480:	f9400ba4 	ldr	x4, [x29, #16]
  200484:	f9400fa3 	ldr	x3, [x29, #24]
  200488:	f94013a2 	ldr	x2, [x29, #32]
  20048c:	f94017a1 	ldr	x1, [x29, #40]
  200490:	52800820 	mov	w0, #0x41                  	// #65
  200494:	94000d02 	bl	20389c <syscall>
}
  200498:	a8c37bfd 	ldp	x29, x30, [sp], #48
  20049c:	d65f03c0 	ret

00000000002004a0 <rt_device_write>:

rt_size_t rt_device_write(rt_device_t dev,
        rt_off_t    pos,
        const void *buffer,
        rt_size_t   size)
{
  2004a0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  2004a4:	910003fd 	mov	x29, sp
  2004a8:	f90017a0 	str	x0, [x29, #40]
  2004ac:	f90013a1 	str	x1, [x29, #32]
  2004b0:	f9000fa2 	str	x2, [x29, #24]
  2004b4:	f9000ba3 	str	x3, [x29, #16]
    return syscall(_NRSYS_rt_device_write, dev, pos, buffer, size);;
  2004b8:	f9400ba4 	ldr	x4, [x29, #16]
  2004bc:	f9400fa3 	ldr	x3, [x29, #24]
  2004c0:	f94013a2 	ldr	x2, [x29, #32]
  2004c4:	f94017a1 	ldr	x1, [x29, #40]
  2004c8:	52800840 	mov	w0, #0x42                  	// #66
  2004cc:	94000cf4 	bl	20389c <syscall>
}
  2004d0:	a8c37bfd 	ldp	x29, x30, [sp], #48
  2004d4:	d65f03c0 	ret

00000000002004d8 <closesocket>:
#include <netinet/in.h>
#include <fcntl.h>
#include <time.h>

int closesocket(int s)
{
  2004d8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  2004dc:	910003fd 	mov	x29, sp
  2004e0:	b9001fa0 	str	w0, [x29, #28]
    return (int)syscall(_NRSYS_closesocket, s);
  2004e4:	b9401fa1 	ldr	w1, [x29, #28]
  2004e8:	52800a60 	mov	w0, #0x53                  	// #83
  2004ec:	94000cec 	bl	20389c <syscall>
}
  2004f0:	a8c27bfd 	ldp	x29, x30, [sp], #32
  2004f4:	d65f03c0 	ret

00000000002004f8 <getaddrinfo>:

int getaddrinfo(const char *restrict host, const char *restrict serv, const struct addrinfo *restrict hint, struct addrinfo **restrict res)
{
  2004f8:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  2004fc:	910003fd 	mov	x29, sp
  200500:	f90017a0 	str	x0, [x29, #40]
  200504:	f90013a1 	str	x1, [x29, #32]
  200508:	f9000fa2 	str	x2, [x29, #24]
  20050c:	f9000ba3 	str	x3, [x29, #16]
    struct addrinfo *ret = NULL;
  200510:	f9001fbf 	str	xzr, [x29, #56]

    ret = (struct addrinfo *) malloc(sizeof(struct addrinfo) + sizeof(struct sockaddr));
  200514:	d2800800 	mov	x0, #0x40                  	// #64
  200518:	94001aec 	bl	2070c8 <malloc>
  20051c:	f9001fa0 	str	x0, [x29, #56]
    if (ret)
  200520:	f9401fa0 	ldr	x0, [x29, #56]
  200524:	f100001f 	cmp	x0, #0x0
  200528:	54000240 	b.eq	200570 <getaddrinfo+0x78>  // b.none
    {
        ret->ai_addr = (struct sockaddr *)(ret + 1);
  20052c:	f9401fa0 	ldr	x0, [x29, #56]
  200530:	9100c001 	add	x1, x0, #0x30
  200534:	f9401fa0 	ldr	x0, [x29, #56]
  200538:	f9000c01 	str	x1, [x0, #24]

        /* invoke syscall */
        int result = syscall(_NRSYS_getaddrinfo, host, serv, hint, ret);
  20053c:	f9401fa4 	ldr	x4, [x29, #56]
  200540:	f9400fa3 	ldr	x3, [x29, #24]
  200544:	f94013a2 	ldr	x2, [x29, #32]
  200548:	f94017a1 	ldr	x1, [x29, #40]
  20054c:	52800a80 	mov	w0, #0x54                  	// #84
  200550:	94000cd3 	bl	20389c <syscall>
  200554:	b90037a0 	str	w0, [x29, #52]
        if (result == 0)
  200558:	b94037a0 	ldr	w0, [x29, #52]
  20055c:	7100001f 	cmp	w0, #0x0
  200560:	54000081 	b.ne	200570 <getaddrinfo+0x78>  // b.any
        {
            *res = ret;
  200564:	f9400ba0 	ldr	x0, [x29, #16]
  200568:	f9401fa1 	ldr	x1, [x29, #56]
  20056c:	f9000001 	str	x1, [x0]
        }
    }

    return 0;
  200570:	52800000 	mov	w0, #0x0                   	// #0
}
  200574:	a8c47bfd 	ldp	x29, x30, [sp], #64
  200578:	d65f03c0 	ret

000000000020057c <freeaddrinfo>:

void freeaddrinfo(struct addrinfo *p)
{
  20057c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  200580:	910003fd 	mov	x29, sp
  200584:	f9000fa0 	str	x0, [x29, #24]
    /* p->ai_canonname, p->ai_next should be NULL. */
    free(p);
  200588:	f9400fa0 	ldr	x0, [x29, #24]
  20058c:	94001c65 	bl	207720 <free>
}
  200590:	d503201f 	nop
  200594:	a8c27bfd 	ldp	x29, x30, [sp], #32
  200598:	d65f03c0 	ret

000000000020059c <gethostbyname2_r>:

int gethostbyname2_r(const char *name, int af, struct hostent *ret,
                    char *buf, size_t buflen,
                    struct hostent **result, int *err)
{
  20059c:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
  2005a0:	910003fd 	mov	x29, sp
  2005a4:	f90027a0 	str	x0, [x29, #72]
  2005a8:	b90047a1 	str	w1, [x29, #68]
  2005ac:	f9001fa2 	str	x2, [x29, #56]
  2005b0:	f9001ba3 	str	x3, [x29, #48]
  2005b4:	f90017a4 	str	x4, [x29, #40]
  2005b8:	f90013a5 	str	x5, [x29, #32]
  2005bc:	f9000fa6 	str	x6, [x29, #24]
    return syscall(_NRSYS_gethostbyname2_r, name, af, ret, buf, buflen, result, err);
  2005c0:	f9400fa7 	ldr	x7, [x29, #24]
  2005c4:	f94013a6 	ldr	x6, [x29, #32]
  2005c8:	f94017a5 	ldr	x5, [x29, #40]
  2005cc:	f9401ba4 	ldr	x4, [x29, #48]
  2005d0:	f9401fa3 	ldr	x3, [x29, #56]
  2005d4:	b94047a2 	ldr	w2, [x29, #68]
  2005d8:	f94027a1 	ldr	x1, [x29, #72]
  2005dc:	52800aa0 	mov	w0, #0x55                  	// #85
  2005e0:	94000caf 	bl	20389c <syscall>
}
  2005e4:	a8c57bfd 	ldp	x29, x30, [sp], #80
  2005e8:	d65f03c0 	ret

00000000002005ec <setnonblocking>:

/* set non-blocking */
static int setnonblocking(int fd)
{
  2005ec:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  2005f0:	910003fd 	mov	x29, sp
  2005f4:	b9001fa0 	str	w0, [x29, #28]
    int old_option = fcntl( fd, F_GETFL, 0);
  2005f8:	52800002 	mov	w2, #0x0                   	// #0
  2005fc:	52800061 	mov	w1, #0x3                   	// #3
  200600:	b9401fa0 	ldr	w0, [x29, #28]
  200604:	94000c05 	bl	203618 <fcntl>
  200608:	b9002fa0 	str	w0, [x29, #44]
    int new_option = old_option | O_NONBLOCK;
  20060c:	b9402fa0 	ldr	w0, [x29, #44]
  200610:	32150000 	orr	w0, w0, #0x800
  200614:	b9002ba0 	str	w0, [x29, #40]
    if (fcntl(fd, F_SETFL, new_option) == -1)
  200618:	b9402ba2 	ldr	w2, [x29, #40]
  20061c:	52800081 	mov	w1, #0x4                   	// #4
  200620:	b9401fa0 	ldr	w0, [x29, #28]
  200624:	94000bfd 	bl	203618 <fcntl>
  200628:	3100041f 	cmn	w0, #0x1
  20062c:	540000c1 	b.ne	200644 <setnonblocking+0x58>  // b.any
    {
        printf("Set noblocking error!\n");
  200630:	b0000080 	adrp	x0, 211000 <__subtf3+0x7d0>
  200634:	91242000 	add	x0, x0, #0x908
  200638:	94001efc 	bl	208228 <puts>
        return 1;
  20063c:	52800020 	mov	w0, #0x1                   	// #1
  200640:	14000002 	b	200648 <setnonblocking+0x5c>
    }
    return old_option;
  200644:	b9402fa0 	ldr	w0, [x29, #44]
}
  200648:	a8c37bfd 	ldp	x29, x30, [sp], #48
  20064c:	d65f03c0 	ret

0000000000200650 <socketpair>:

int socketpair(int domain, int type, int protocol, int sv[2])
{
  200650:	a9ad7bfd 	stp	x29, x30, [sp, #-304]!
  200654:	910003fd 	mov	x29, sp
  200658:	f9000bf3 	str	x19, [sp, #16]
  20065c:	b9003fa0 	str	w0, [x29, #60]
  200660:	b9003ba1 	str	w1, [x29, #56]
  200664:	b90037a2 	str	w2, [x29, #52]
  200668:	f90017a3 	str	x3, [x29, #40]
    int listenfd = -1, acceptfd = -1, clientfd = -1;
  20066c:	12800000 	mov	w0, #0xffffffff            	// #-1
  200670:	b9011fa0 	str	w0, [x29, #284]
  200674:	12800000 	mov	w0, #0xffffffff            	// #-1
  200678:	b9011ba0 	str	w0, [x29, #280]
  20067c:	12800000 	mov	w0, #0xffffffff            	// #-1
  200680:	b9012fa0 	str	w0, [x29, #300]
    /* for server, accept, client */
    struct sockaddr_in saddr, aaddr, caddr;
    socklen_t len = sizeof(struct sockaddr_in);
  200684:	52800200 	mov	w0, #0x10                  	// #16
  200688:	b900d7a0 	str	w0, [x29, #212]
    int on = 1;
  20068c:	52800020 	mov	w0, #0x1                   	// #1
  200690:	b900d3a0 	str	w0, [x29, #208]
    int fdopt;
    int rt_port;

    /* for select */
    int maxfdp = 0;
  200694:	b90117bf 	str	wzr, [x29, #276]
    int rst;
    fd_set rfd;
    struct timeval timeout = {0, 1000};
  200698:	f90023bf 	str	xzr, [x29, #64]
  20069c:	d2807d00 	mov	x0, #0x3e8                 	// #1000
  2006a0:	f90027a0 	str	x0, [x29, #72]

    /* server socket */
    if ((listenfd = socket(domain, type, protocol)) < 0)
  2006a4:	b94037a2 	ldr	w2, [x29, #52]
  2006a8:	b9403ba1 	ldr	w1, [x29, #56]
  2006ac:	b9403fa0 	ldr	w0, [x29, #60]
  2006b0:	94001dd8 	bl	207e10 <socket>
  2006b4:	b9011fa0 	str	w0, [x29, #284]
  2006b8:	b9411fa0 	ldr	w0, [x29, #284]
  2006bc:	7100001f 	cmp	w0, #0x0
  2006c0:	540001ca 	b.ge	2006f8 <socketpair+0xa8>  // b.tcont
    {
        printf("Create listenfd socket error: %s(errno: %d)\n", strerror(errno), errno);
  2006c4:	94000b97 	bl	203520 <__errno_location>
  2006c8:	b9400000 	ldr	w0, [x0]
  2006cc:	94000bb5 	bl	2035a0 <strerror>
  2006d0:	aa0003f3 	mov	x19, x0
  2006d4:	94000b93 	bl	203520 <__errno_location>
  2006d8:	b9400001 	ldr	w1, [x0]
  2006dc:	b0000080 	adrp	x0, 211000 <__subtf3+0x7d0>
  2006e0:	91248000 	add	x0, x0, #0x920
  2006e4:	2a0103e2 	mov	w2, w1
  2006e8:	aa1303e1 	mov	x1, x19
  2006ec:	94001ead 	bl	2081a0 <printf>
        return -1;
  2006f0:	12800000 	mov	w0, #0xffffffff            	// #-1
  2006f4:	140000ff 	b	200af0 <socketpair+0x4a0>
    }
    /* non-blocking */
    setnonblocking(listenfd);
  2006f8:	b9411fa0 	ldr	w0, [x29, #284]
  2006fc:	97ffffbc 	bl	2005ec <setnonblocking>

    /* get random port: 5001~65001 */
    srand((unsigned)time(NULL));
  200700:	d2800000 	mov	x0, #0x0                   	// #0
  200704:	94002fab 	bl	20c5b0 <time>
  200708:	94001e16 	bl	207f60 <srand>
    rt_port = rand() % 60000 + 5001;
  20070c:	94001e19 	bl	207f70 <rand>
  200710:	2a0003e1 	mov	w1, w0
  200714:	52964e60 	mov	w0, #0xb273                	// #45683
  200718:	72a8bce0 	movk	w0, #0x45e7, lsl #16
  20071c:	9b207c20 	smull	x0, w1, w0
  200720:	d360fc00 	lsr	x0, x0, #32
  200724:	130e7c02 	asr	w2, w0, #14
  200728:	131f7c20 	asr	w0, w1, #31
  20072c:	4b000040 	sub	w0, w2, w0
  200730:	529d4c02 	mov	w2, #0xea60                	// #60000
  200734:	1b027c00 	mul	w0, w0, w2
  200738:	4b000020 	sub	w0, w1, w0
  20073c:	52827121 	mov	w1, #0x1389                	// #5001
  200740:	0b010000 	add	w0, w0, w1
  200744:	b90113a0 	str	w0, [x29, #272]

    /* bind and listen */
    memset(&saddr, 0, sizeof(saddr));
  200748:	9103e3a0 	add	x0, x29, #0xf8
  20074c:	d2800202 	mov	x2, #0x10                  	// #16
  200750:	52800001 	mov	w1, #0x0                   	// #0
  200754:	94002995 	bl	20ada8 <memset>
    memset(&aaddr, 0, sizeof(aaddr));
  200758:	9103a3a0 	add	x0, x29, #0xe8
  20075c:	d2800202 	mov	x2, #0x10                  	// #16
  200760:	52800001 	mov	w1, #0x0                   	// #0
  200764:	94002991 	bl	20ada8 <memset>
    saddr.sin_family = domain;
  200768:	b9403fa0 	ldr	w0, [x29, #60]
  20076c:	12003c00 	and	w0, w0, #0xffff
  200770:	7901f3a0 	strh	w0, [x29, #248]
    saddr.sin_port = htons(rt_port);
  200774:	b94113a0 	ldr	w0, [x29, #272]
  200778:	12003c00 	and	w0, w0, #0xffff
  20077c:	94001d73 	bl	207d48 <htons>
  200780:	12003c00 	and	w0, w0, #0xffff
  200784:	7901f7a0 	strh	w0, [x29, #250]
    saddr.sin_addr.s_addr = htonl(INADDR_ANY);
  200788:	52800000 	mov	w0, #0x0                   	// #0
  20078c:	94001d6d 	bl	207d40 <htonl>
  200790:	b900ffa0 	str	w0, [x29, #252]

    if (setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, (const char*)&on, sizeof(int)) < 0)
  200794:	910343a0 	add	x0, x29, #0xd0
  200798:	52800084 	mov	w4, #0x4                   	// #4
  20079c:	aa0003e3 	mov	x3, x0
  2007a0:	52800042 	mov	w2, #0x2                   	// #2
  2007a4:	52800021 	mov	w1, #0x1                   	// #1
  2007a8:	b9411fa0 	ldr	w0, [x29, #284]
  2007ac:	94001d7f 	bl	207da8 <setsockopt>
  2007b0:	7100001f 	cmp	w0, #0x0
  2007b4:	540000aa 	b.ge	2007c8 <socketpair+0x178>  // b.tcont
    {
        perror("Setsockopt reuseadd failed");
  2007b8:	b0000080 	adrp	x0, 211000 <__subtf3+0x7d0>
  2007bc:	91254000 	add	x0, x0, #0x950
  2007c0:	94001e22 	bl	208048 <perror>
        goto __exit;
  2007c4:	140000c0 	b	200ac4 <socketpair+0x474>
    }

    if (bind(listenfd, (struct sockaddr*)&saddr, sizeof(saddr)) == -1)
  2007c8:	9103e3a0 	add	x0, x29, #0xf8
  2007cc:	52800202 	mov	w2, #0x10                  	// #16
  2007d0:	aa0003e1 	mov	x1, x0
  2007d4:	b9411fa0 	ldr	w0, [x29, #284]
  2007d8:	94001d38 	bl	207cb8 <bind>
  2007dc:	3100041f 	cmn	w0, #0x1
  2007e0:	540001c1 	b.ne	200818 <socketpair+0x1c8>  // b.any
    {
        printf("Bind socket error: %s(errno: %d), fd=%d\n", strerror(errno), errno, listenfd);
  2007e4:	94000b4f 	bl	203520 <__errno_location>
  2007e8:	b9400000 	ldr	w0, [x0]
  2007ec:	94000b6d 	bl	2035a0 <strerror>
  2007f0:	aa0003f3 	mov	x19, x0
  2007f4:	94000b4b 	bl	203520 <__errno_location>
  2007f8:	b9400001 	ldr	w1, [x0]
  2007fc:	b0000080 	adrp	x0, 211000 <__subtf3+0x7d0>
  200800:	9125c000 	add	x0, x0, #0x970
  200804:	b9411fa3 	ldr	w3, [x29, #284]
  200808:	2a0103e2 	mov	w2, w1
  20080c:	aa1303e1 	mov	x1, x19
  200810:	94001e64 	bl	2081a0 <printf>
        goto __exit;
  200814:	140000ac 	b	200ac4 <socketpair+0x474>
    }

    if (listen(listenfd, 10) == -1)
  200818:	52800141 	mov	w1, #0xa                   	// #10
  20081c:	b9411fa0 	ldr	w0, [x29, #284]
  200820:	94001d4c 	bl	207d50 <listen>
  200824:	3100041f 	cmn	w0, #0x1
  200828:	540001a1 	b.ne	20085c <socketpair+0x20c>  // b.any
    {
        printf("Listen socket error: %s(errno: %d)\n", strerror(errno), errno);
  20082c:	94000b3d 	bl	203520 <__errno_location>
  200830:	b9400000 	ldr	w0, [x0]
  200834:	94000b5b 	bl	2035a0 <strerror>
  200838:	aa0003f3 	mov	x19, x0
  20083c:	94000b39 	bl	203520 <__errno_location>
  200840:	b9400001 	ldr	w1, [x0]
  200844:	b0000080 	adrp	x0, 211000 <__subtf3+0x7d0>
  200848:	91268000 	add	x0, x0, #0x9a0
  20084c:	2a0103e2 	mov	w2, w1
  200850:	aa1303e1 	mov	x1, x19
  200854:	94001e53 	bl	2081a0 <printf>
        goto __exit;
  200858:	1400009b 	b	200ac4 <socketpair+0x474>
    }

    /* client socket */
    if ((clientfd = socket(domain, type, protocol)) < 0)
  20085c:	b94037a2 	ldr	w2, [x29, #52]
  200860:	b9403ba1 	ldr	w1, [x29, #56]
  200864:	b9403fa0 	ldr	w0, [x29, #60]
  200868:	94001d6a 	bl	207e10 <socket>
  20086c:	b9012fa0 	str	w0, [x29, #300]
  200870:	b9412fa0 	ldr	w0, [x29, #300]
  200874:	7100001f 	cmp	w0, #0x0
  200878:	540001aa 	b.ge	2008ac <socketpair+0x25c>  // b.tcont
    {
        printf("Create clientfd socket error: %s(errno: %d)\n", strerror(errno), errno);
  20087c:	94000b29 	bl	203520 <__errno_location>
  200880:	b9400000 	ldr	w0, [x0]
  200884:	94000b47 	bl	2035a0 <strerror>
  200888:	aa0003f3 	mov	x19, x0
  20088c:	94000b25 	bl	203520 <__errno_location>
  200890:	b9400001 	ldr	w1, [x0]
  200894:	b0000080 	adrp	x0, 211000 <__subtf3+0x7d0>
  200898:	91272000 	add	x0, x0, #0x9c8
  20089c:	2a0103e2 	mov	w2, w1
  2008a0:	aa1303e1 	mov	x1, x19
  2008a4:	94001e3f 	bl	2081a0 <printf>
        goto __exit;
  2008a8:	14000087 	b	200ac4 <socketpair+0x474>
    }

    /* non-blocking */
    fdopt = setnonblocking(clientfd);
  2008ac:	b9412fa0 	ldr	w0, [x29, #300]
  2008b0:	97ffff4f 	bl	2005ec <setnonblocking>
  2008b4:	b9010fa0 	str	w0, [x29, #268]
    /* client connect */
    memset(&caddr, 0, sizeof(caddr));
  2008b8:	910363a0 	add	x0, x29, #0xd8
  2008bc:	d2800202 	mov	x2, #0x10                  	// #16
  2008c0:	52800001 	mov	w1, #0x0                   	// #0
  2008c4:	94002939 	bl	20ada8 <memset>
    caddr.sin_family = domain;
  2008c8:	b9403fa0 	ldr	w0, [x29, #60]
  2008cc:	12003c00 	and	w0, w0, #0xffff
  2008d0:	7901b3a0 	strh	w0, [x29, #216]
    caddr.sin_port =htons(rt_port);
  2008d4:	b94113a0 	ldr	w0, [x29, #272]
  2008d8:	12003c00 	and	w0, w0, #0xffff
  2008dc:	94001d1b 	bl	207d48 <htons>
  2008e0:	12003c00 	and	w0, w0, #0xffff
  2008e4:	7901b7a0 	strh	w0, [x29, #218]
    caddr.sin_addr.s_addr=htonl(INADDR_ANY);
  2008e8:	52800000 	mov	w0, #0x0                   	// #0
  2008ec:	94001d15 	bl	207d40 <htonl>
  2008f0:	b900dfa0 	str	w0, [x29, #220]
    connect(clientfd, (struct sockaddr*)&caddr, sizeof(caddr));
  2008f4:	910363a0 	add	x0, x29, #0xd8
  2008f8:	52800202 	mov	w2, #0x10                  	// #16
  2008fc:	aa0003e1 	mov	x1, x0
  200900:	b9412fa0 	ldr	w0, [x29, #300]
  200904:	94001d03 	bl	207d10 <connect>

    /* do select */
    FD_ZERO(&rfd);
  200908:	910143a0 	add	x0, x29, #0x50
  20090c:	f90093a0 	str	x0, [x29, #288]
  200910:	52800200 	mov	w0, #0x10                  	// #16
  200914:	b9012ba0 	str	w0, [x29, #296]
  200918:	14000008 	b	200938 <socketpair+0x2e8>
  20091c:	f94093a0 	ldr	x0, [x29, #288]
  200920:	91002001 	add	x1, x0, #0x8
  200924:	f90093a1 	str	x1, [x29, #288]
  200928:	f900001f 	str	xzr, [x0]
  20092c:	b9412ba0 	ldr	w0, [x29, #296]
  200930:	51000400 	sub	w0, w0, #0x1
  200934:	b9012ba0 	str	w0, [x29, #296]
  200938:	b9412ba0 	ldr	w0, [x29, #296]
  20093c:	7100001f 	cmp	w0, #0x0
  200940:	54fffee1 	b.ne	20091c <socketpair+0x2cc>  // b.any
    FD_SET(listenfd, &rfd);
  200944:	b9811fa0 	ldrsw	x0, [x29, #284]
  200948:	d346fc00 	lsr	x0, x0, #6
  20094c:	d37df001 	lsl	x1, x0, #3
  200950:	910143a2 	add	x2, x29, #0x50
  200954:	f8616842 	ldr	x2, [x2, x1]
  200958:	b9411fa1 	ldr	w1, [x29, #284]
  20095c:	12001421 	and	w1, w1, #0x3f
  200960:	d2800023 	mov	x3, #0x1                   	// #1
  200964:	9ac12061 	lsl	x1, x3, x1
  200968:	aa010042 	orr	x2, x2, x1
  20096c:	d37df000 	lsl	x0, x0, #3
  200970:	910143a1 	add	x1, x29, #0x50
  200974:	f8206822 	str	x2, [x1, x0]
    FD_SET(clientfd, &rfd);
  200978:	b9812fa0 	ldrsw	x0, [x29, #300]
  20097c:	d346fc00 	lsr	x0, x0, #6
  200980:	d37df001 	lsl	x1, x0, #3
  200984:	910143a2 	add	x2, x29, #0x50
  200988:	f8616842 	ldr	x2, [x2, x1]
  20098c:	b9412fa1 	ldr	w1, [x29, #300]
  200990:	12001421 	and	w1, w1, #0x3f
  200994:	d2800023 	mov	x3, #0x1                   	// #1
  200998:	9ac12061 	lsl	x1, x3, x1
  20099c:	aa010042 	orr	x2, x2, x1
  2009a0:	d37df000 	lsl	x0, x0, #3
  2009a4:	910143a1 	add	x1, x29, #0x50
  2009a8:	f8206822 	str	x2, [x1, x0]
    maxfdp = listenfd > clientfd ? listenfd+1 : clientfd+1;
  2009ac:	b9411fa1 	ldr	w1, [x29, #284]
  2009b0:	b9412fa0 	ldr	w0, [x29, #300]
  2009b4:	6b00003f 	cmp	w1, w0
  2009b8:	5400008d 	b.le	2009c8 <socketpair+0x378>
  2009bc:	b9411fa0 	ldr	w0, [x29, #284]
  2009c0:	11000400 	add	w0, w0, #0x1
  2009c4:	14000003 	b	2009d0 <socketpair+0x380>
  2009c8:	b9412fa0 	ldr	w0, [x29, #300]
  2009cc:	11000400 	add	w0, w0, #0x1
  2009d0:	b90117a0 	str	w0, [x29, #276]
    rst = select(maxfdp, &rfd, NULL, NULL, &timeout);
  2009d4:	910103a1 	add	x1, x29, #0x40
  2009d8:	910143a0 	add	x0, x29, #0x50
  2009dc:	aa0103e4 	mov	x4, x1
  2009e0:	d2800003 	mov	x3, #0x0                   	// #0
  2009e4:	d2800002 	mov	x2, #0x0                   	// #0
  2009e8:	aa0003e1 	mov	x1, x0
  2009ec:	b94117a0 	ldr	w0, [x29, #276]
  2009f0:	94001d6c 	bl	207fa0 <select>
  2009f4:	b9010ba0 	str	w0, [x29, #264]
    switch(rst)
  2009f8:	b9410ba0 	ldr	w0, [x29, #264]
  2009fc:	3100041f 	cmn	w0, #0x1
  200a00:	54000080 	b.eq	200a10 <socketpair+0x3c0>  // b.none
  200a04:	7100001f 	cmp	w0, #0x0
  200a08:	540000c0 	b.eq	200a20 <socketpair+0x3d0>  // b.none
  200a0c:	14000009 	b	200a30 <socketpair+0x3e0>
    {
    case -1:
        perror("select error");
  200a10:	b0000080 	adrp	x0, 211000 <__subtf3+0x7d0>
  200a14:	9127e000 	add	x0, x0, #0x9f8
  200a18:	94001d8c 	bl	208048 <perror>
        goto __exit;
  200a1c:	1400002a 	b	200ac4 <socketpair+0x474>
        break;
    case 0:
        perror("continue");
  200a20:	b0000080 	adrp	x0, 211000 <__subtf3+0x7d0>
  200a24:	91282000 	add	x0, x0, #0xa08
  200a28:	94001d88 	bl	208048 <perror>
        break;
  200a2c:	14000026 	b	200ac4 <socketpair+0x474>
    default:
        if (FD_ISSET(listenfd, &rfd))
  200a30:	b9811fa0 	ldrsw	x0, [x29, #284]
  200a34:	d346fc00 	lsr	x0, x0, #6
  200a38:	d37df000 	lsl	x0, x0, #3
  200a3c:	910143a1 	add	x1, x29, #0x50
  200a40:	f8606821 	ldr	x1, [x1, x0]
  200a44:	b9411fa0 	ldr	w0, [x29, #284]
  200a48:	12001400 	and	w0, w0, #0x3f
  200a4c:	9ac02420 	lsr	x0, x1, x0
  200a50:	92400000 	and	x0, x0, #0x1
  200a54:	f100001f 	cmp	x0, #0x0
  200a58:	54000340 	b.eq	200ac0 <socketpair+0x470>  // b.none
        {
            if ((acceptfd = accept(listenfd, (struct sockaddr*)&caddr, &len)) > 0)
  200a5c:	910353a1 	add	x1, x29, #0xd4
  200a60:	910363a0 	add	x0, x29, #0xd8
  200a64:	aa0103e2 	mov	x2, x1
  200a68:	aa0003e1 	mov	x1, x0
  200a6c:	b9411fa0 	ldr	w0, [x29, #284]
  200a70:	94001c86 	bl	207c88 <accept>
  200a74:	b9011ba0 	str	w0, [x29, #280]
  200a78:	b9411ba0 	ldr	w0, [x29, #280]
  200a7c:	7100001f 	cmp	w0, #0x0
  200a80:	540001cd 	b.le	200ab8 <socketpair+0x468>
            {
                close(listenfd);
  200a84:	b9411fa0 	ldr	w0, [x29, #284]
  200a88:	9400300e 	bl	20cac0 <close>
                /* set old optional back */
                fcntl(clientfd, F_SETFL, fdopt);
  200a8c:	b9410fa2 	ldr	w2, [x29, #268]
  200a90:	52800081 	mov	w1, #0x4                   	// #4
  200a94:	b9412fa0 	ldr	w0, [x29, #300]
  200a98:	94000ae0 	bl	203618 <fcntl>
                sv[0] = clientfd;
  200a9c:	f94017a0 	ldr	x0, [x29, #40]
  200aa0:	b9412fa1 	ldr	w1, [x29, #300]
  200aa4:	b9000001 	str	w1, [x0]
                sv[1] = acceptfd;
  200aa8:	f94017a0 	ldr	x0, [x29, #40]
  200aac:	91001000 	add	x0, x0, #0x4
  200ab0:	b9411ba1 	ldr	w1, [x29, #280]
  200ab4:	b9000001 	str	w1, [x0]
            }

            return 0;
  200ab8:	52800000 	mov	w0, #0x0                   	// #0
  200abc:	1400000d 	b	200af0 <socketpair+0x4a0>
        }
    }

__exit:
  200ac0:	d503201f 	nop
    if (listenfd >= 0) close(listenfd);
  200ac4:	b9411fa0 	ldr	w0, [x29, #284]
  200ac8:	7100001f 	cmp	w0, #0x0
  200acc:	5400006b 	b.lt	200ad8 <socketpair+0x488>  // b.tstop
  200ad0:	b9411fa0 	ldr	w0, [x29, #284]
  200ad4:	94002ffb 	bl	20cac0 <close>
    if (clientfd >= 0) close(clientfd);
  200ad8:	b9412fa0 	ldr	w0, [x29, #300]
  200adc:	7100001f 	cmp	w0, #0x0
  200ae0:	5400006b 	b.lt	200aec <socketpair+0x49c>  // b.tstop
  200ae4:	b9412fa0 	ldr	w0, [x29, #300]
  200ae8:	94002ff6 	bl	20cac0 <close>

    return -1;
  200aec:	12800000 	mov	w0, #0xffffffff            	// #-1
}
  200af0:	f9400bf3 	ldr	x19, [sp, #16]
  200af4:	a8d37bfd 	ldp	x29, x30, [sp], #304
  200af8:	d65f03c0 	ret

0000000000200afc <rt_mutex_create>:
            return RT_EIO;\
        }\
    } while (0)

rt_mutex_t rt_mutex_create(const char *name, rt_uint8_t flag)
{
  200afc:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  200b00:	910003fd 	mov	x29, sp
  200b04:	f9000fa0 	str	x0, [x29, #24]
  200b08:	39005fa1 	strb	w1, [x29, #23]
    RT_USER_IPC_CREATE(RT_Object_Class_Mutex, _NRSYS_mutex_create, name, flag);
  200b0c:	d2800200 	mov	x0, #0x10                  	// #16
  200b10:	9400196e 	bl	2070c8 <malloc>
  200b14:	f90017a0 	str	x0, [x29, #40]
  200b18:	f94017a0 	ldr	x0, [x29, #40]
  200b1c:	f100001f 	cmp	x0, #0x0
  200b20:	54000061 	b.ne	200b2c <rt_mutex_create+0x30>  // b.any
  200b24:	d2800000 	mov	x0, #0x0                   	// #0
  200b28:	14000015 	b	200b7c <rt_mutex_create+0x80>
  200b2c:	39405fa0 	ldrb	w0, [x29, #23]
  200b30:	2a0003e2 	mov	w2, w0
  200b34:	f9400fa1 	ldr	x1, [x29, #24]
  200b38:	528002c0 	mov	w0, #0x16                  	// #22
  200b3c:	94000b58 	bl	20389c <syscall>
  200b40:	aa0003e1 	mov	x1, x0
  200b44:	f94017a0 	ldr	x0, [x29, #40]
  200b48:	f9000401 	str	x1, [x0, #8]
  200b4c:	f94017a0 	ldr	x0, [x29, #40]
  200b50:	f9400400 	ldr	x0, [x0, #8]
  200b54:	f100001f 	cmp	x0, #0x0
  200b58:	540000a0 	b.eq	200b6c <rt_mutex_create+0x70>  // b.none
  200b5c:	f94017a0 	ldr	x0, [x29, #40]
  200b60:	52800061 	mov	w1, #0x3                   	// #3
  200b64:	b9000001 	str	w1, [x0]
  200b68:	14000004 	b	200b78 <rt_mutex_create+0x7c>
  200b6c:	f94017a0 	ldr	x0, [x29, #40]
  200b70:	94001aec 	bl	207720 <free>
  200b74:	f90017bf 	str	xzr, [x29, #40]
  200b78:	f94017a0 	ldr	x0, [x29, #40]
}
  200b7c:	a8c37bfd 	ldp	x29, x30, [sp], #48
  200b80:	d65f03c0 	ret

0000000000200b84 <rt_mutex_init>:

rt_err_t rt_mutex_init(rt_mutex_t mutex, const char *name, rt_uint8_t flag)
{
  200b84:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  200b88:	910003fd 	mov	x29, sp
  200b8c:	f90017a0 	str	x0, [x29, #40]
  200b90:	f90013a1 	str	x1, [x29, #32]
  200b94:	39007fa2 	strb	w2, [x29, #31]
    RT_USER_IPC_INIT(mutex, RT_Object_Class_Mutex, _NRSYS_mutex_create, name, flag);
  200b98:	f94017a0 	ldr	x0, [x29, #40]
  200b9c:	f100001f 	cmp	x0, #0x0
  200ba0:	54000061 	b.ne	200bac <rt_mutex_init+0x28>  // b.any
  200ba4:	d2800100 	mov	x0, #0x8                   	// #8
  200ba8:	14000013 	b	200bf4 <rt_mutex_init+0x70>
  200bac:	39407fa0 	ldrb	w0, [x29, #31]
  200bb0:	2a0003e2 	mov	w2, w0
  200bb4:	f94013a1 	ldr	x1, [x29, #32]
  200bb8:	528002c0 	mov	w0, #0x16                  	// #22
  200bbc:	94000b38 	bl	20389c <syscall>
  200bc0:	aa0003e1 	mov	x1, x0
  200bc4:	f94017a0 	ldr	x0, [x29, #40]
  200bc8:	f9000401 	str	x1, [x0, #8]
  200bcc:	f94017a0 	ldr	x0, [x29, #40]
  200bd0:	f9400400 	ldr	x0, [x0, #8]
  200bd4:	f100001f 	cmp	x0, #0x0
  200bd8:	540000c0 	b.eq	200bf0 <rt_mutex_init+0x6c>  // b.none
  200bdc:	f94017a0 	ldr	x0, [x29, #40]
  200be0:	52800061 	mov	w1, #0x3                   	// #3
  200be4:	b9000001 	str	w1, [x0]
  200be8:	d2800000 	mov	x0, #0x0                   	// #0
  200bec:	14000002 	b	200bf4 <rt_mutex_init+0x70>
  200bf0:	d2800020 	mov	x0, #0x1                   	// #1
}
  200bf4:	a8c37bfd 	ldp	x29, x30, [sp], #48
  200bf8:	d65f03c0 	ret

0000000000200bfc <rt_mutex_delete>:

rt_err_t rt_mutex_delete(rt_mutex_t mutex)
{
  200bfc:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  200c00:	910003fd 	mov	x29, sp
  200c04:	f9000fa0 	str	x0, [x29, #24]
    RT_USER_IPC_DELETE(mutex, RT_Object_Class_Mutex, _NRSYS_mutex_delete);
  200c08:	f9400fa0 	ldr	x0, [x29, #24]
  200c0c:	f100001f 	cmp	x0, #0x0
  200c10:	540000a0 	b.eq	200c24 <rt_mutex_delete+0x28>  // b.none
  200c14:	f9400fa0 	ldr	x0, [x29, #24]
  200c18:	f9400400 	ldr	x0, [x0, #8]
  200c1c:	f100001f 	cmp	x0, #0x0
  200c20:	54000061 	b.ne	200c2c <rt_mutex_delete+0x30>  // b.any
  200c24:	d2800100 	mov	x0, #0x8                   	// #8
  200c28:	14000015 	b	200c7c <rt_mutex_delete+0x80>
  200c2c:	f9400fa0 	ldr	x0, [x29, #24]
  200c30:	b9400000 	ldr	w0, [x0]
  200c34:	71000c1f 	cmp	w0, #0x3
  200c38:	54000060 	b.eq	200c44 <rt_mutex_delete+0x48>  // b.none
  200c3c:	d2800100 	mov	x0, #0x8                   	// #8
  200c40:	1400000f 	b	200c7c <rt_mutex_delete+0x80>
  200c44:	f9400fa0 	ldr	x0, [x29, #24]
  200c48:	f9400400 	ldr	x0, [x0, #8]
  200c4c:	aa0003e1 	mov	x1, x0
  200c50:	528002e0 	mov	w0, #0x17                  	// #23
  200c54:	94000b12 	bl	20389c <syscall>
  200c58:	f90017a0 	str	x0, [x29, #40]
  200c5c:	f94017a0 	ldr	x0, [x29, #40]
  200c60:	f100001f 	cmp	x0, #0x0
  200c64:	54000060 	b.eq	200c70 <rt_mutex_delete+0x74>  // b.none
  200c68:	f94017a0 	ldr	x0, [x29, #40]
  200c6c:	14000004 	b	200c7c <rt_mutex_delete+0x80>
  200c70:	f9400fa0 	ldr	x0, [x29, #24]
  200c74:	94001aab 	bl	207720 <free>
  200c78:	d2800000 	mov	x0, #0x0                   	// #0
}
  200c7c:	a8c37bfd 	ldp	x29, x30, [sp], #48
  200c80:	d65f03c0 	ret

0000000000200c84 <rt_mutex_detach>:

rt_err_t rt_mutex_detach(rt_mutex_t mutex)
{
  200c84:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  200c88:	910003fd 	mov	x29, sp
  200c8c:	f9000fa0 	str	x0, [x29, #24]
    RT_USER_IPC_DETACH(mutex, RT_Object_Class_Mutex, _NRSYS_mutex_delete);
  200c90:	f9400fa0 	ldr	x0, [x29, #24]
  200c94:	f100001f 	cmp	x0, #0x0
  200c98:	540000a0 	b.eq	200cac <rt_mutex_detach+0x28>  // b.none
  200c9c:	f9400fa0 	ldr	x0, [x29, #24]
  200ca0:	f9400400 	ldr	x0, [x0, #8]
  200ca4:	f100001f 	cmp	x0, #0x0
  200ca8:	54000061 	b.ne	200cb4 <rt_mutex_detach+0x30>  // b.any
  200cac:	d2800100 	mov	x0, #0x8                   	// #8
  200cb0:	14000017 	b	200d0c <rt_mutex_detach+0x88>
  200cb4:	f9400fa0 	ldr	x0, [x29, #24]
  200cb8:	b9400000 	ldr	w0, [x0]
  200cbc:	71000c1f 	cmp	w0, #0x3
  200cc0:	54000060 	b.eq	200ccc <rt_mutex_detach+0x48>  // b.none
  200cc4:	d2800100 	mov	x0, #0x8                   	// #8
  200cc8:	14000011 	b	200d0c <rt_mutex_detach+0x88>
  200ccc:	f9400fa0 	ldr	x0, [x29, #24]
  200cd0:	f9400400 	ldr	x0, [x0, #8]
  200cd4:	aa0003e1 	mov	x1, x0
  200cd8:	528002e0 	mov	w0, #0x17                  	// #23
  200cdc:	94000af0 	bl	20389c <syscall>
  200ce0:	f90017a0 	str	x0, [x29, #40]
  200ce4:	f94017a0 	ldr	x0, [x29, #40]
  200ce8:	f100001f 	cmp	x0, #0x0
  200cec:	54000060 	b.eq	200cf8 <rt_mutex_detach+0x74>  // b.none
  200cf0:	f94017a0 	ldr	x0, [x29, #40]
  200cf4:	14000006 	b	200d0c <rt_mutex_detach+0x88>
  200cf8:	f9400fa0 	ldr	x0, [x29, #24]
  200cfc:	b900001f 	str	wzr, [x0]
  200d00:	f9400fa0 	ldr	x0, [x29, #24]
  200d04:	f900041f 	str	xzr, [x0, #8]
  200d08:	d2800000 	mov	x0, #0x0                   	// #0
}
  200d0c:	a8c37bfd 	ldp	x29, x30, [sp], #48
  200d10:	d65f03c0 	ret

0000000000200d14 <rt_mutex_take>:

rt_err_t rt_mutex_take(rt_mutex_t mutex, rt_int32_t time)
{
  200d14:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  200d18:	910003fd 	mov	x29, sp
  200d1c:	f9000fa0 	str	x0, [x29, #24]
  200d20:	b90017a1 	str	w1, [x29, #20]
    RT_USER_IPC_CHECK(mutex, RT_Object_Class_Mutex);
  200d24:	f9400fa0 	ldr	x0, [x29, #24]
  200d28:	f100001f 	cmp	x0, #0x0
  200d2c:	540000a0 	b.eq	200d40 <rt_mutex_take+0x2c>  // b.none
  200d30:	f9400fa0 	ldr	x0, [x29, #24]
  200d34:	f9400400 	ldr	x0, [x0, #8]
  200d38:	f100001f 	cmp	x0, #0x0
  200d3c:	54000061 	b.ne	200d48 <rt_mutex_take+0x34>  // b.any
  200d40:	d2800100 	mov	x0, #0x8                   	// #8
  200d44:	1400000d 	b	200d78 <rt_mutex_take+0x64>
  200d48:	f9400fa0 	ldr	x0, [x29, #24]
  200d4c:	b9400000 	ldr	w0, [x0]
  200d50:	71000c1f 	cmp	w0, #0x3
  200d54:	54000060 	b.eq	200d60 <rt_mutex_take+0x4c>  // b.none
  200d58:	d2800100 	mov	x0, #0x8                   	// #8
  200d5c:	14000007 	b	200d78 <rt_mutex_take+0x64>
    return syscall(_NRSYS_mutex_take, mutex->data, time);
  200d60:	f9400fa0 	ldr	x0, [x29, #24]
  200d64:	f9400400 	ldr	x0, [x0, #8]
  200d68:	b94017a2 	ldr	w2, [x29, #20]
  200d6c:	aa0003e1 	mov	x1, x0
  200d70:	52800300 	mov	w0, #0x18                  	// #24
  200d74:	94000aca 	bl	20389c <syscall>
}
  200d78:	a8c27bfd 	ldp	x29, x30, [sp], #32
  200d7c:	d65f03c0 	ret

0000000000200d80 <rt_mutex_release>:

rt_err_t rt_mutex_release(rt_mutex_t mutex)
{
  200d80:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  200d84:	910003fd 	mov	x29, sp
  200d88:	f9000fa0 	str	x0, [x29, #24]
    RT_USER_IPC_CHECK(mutex, RT_Object_Class_Mutex);
  200d8c:	f9400fa0 	ldr	x0, [x29, #24]
  200d90:	f100001f 	cmp	x0, #0x0
  200d94:	540000a0 	b.eq	200da8 <rt_mutex_release+0x28>  // b.none
  200d98:	f9400fa0 	ldr	x0, [x29, #24]
  200d9c:	f9400400 	ldr	x0, [x0, #8]
  200da0:	f100001f 	cmp	x0, #0x0
  200da4:	54000061 	b.ne	200db0 <rt_mutex_release+0x30>  // b.any
  200da8:	d2800100 	mov	x0, #0x8                   	// #8
  200dac:	1400000c 	b	200ddc <rt_mutex_release+0x5c>
  200db0:	f9400fa0 	ldr	x0, [x29, #24]
  200db4:	b9400000 	ldr	w0, [x0]
  200db8:	71000c1f 	cmp	w0, #0x3
  200dbc:	54000060 	b.eq	200dc8 <rt_mutex_release+0x48>  // b.none
  200dc0:	d2800100 	mov	x0, #0x8                   	// #8
  200dc4:	14000006 	b	200ddc <rt_mutex_release+0x5c>
    return syscall(_NRSYS_mutex_release, mutex->data);
  200dc8:	f9400fa0 	ldr	x0, [x29, #24]
  200dcc:	f9400400 	ldr	x0, [x0, #8]
  200dd0:	aa0003e1 	mov	x1, x0
  200dd4:	52800320 	mov	w0, #0x19                  	// #25
  200dd8:	94000ab1 	bl	20389c <syscall>
}
  200ddc:	a8c27bfd 	ldp	x29, x30, [sp], #32
  200de0:	d65f03c0 	ret

0000000000200de4 <rt_sem_create>:

rt_sem_t rt_sem_create(const char *name, rt_uint32_t value, rt_uint8_t flag)
{
  200de4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  200de8:	910003fd 	mov	x29, sp
  200dec:	f9000fa0 	str	x0, [x29, #24]
  200df0:	b90017a1 	str	w1, [x29, #20]
  200df4:	39004fa2 	strb	w2, [x29, #19]
    RT_USER_IPC_CREATE(RT_Object_Class_Semaphore, _NRSYS_sem_create, name, value, flag);
  200df8:	d2800200 	mov	x0, #0x10                  	// #16
  200dfc:	940018b3 	bl	2070c8 <malloc>
  200e00:	f90017a0 	str	x0, [x29, #40]
  200e04:	f94017a0 	ldr	x0, [x29, #40]
  200e08:	f100001f 	cmp	x0, #0x0
  200e0c:	54000061 	b.ne	200e18 <rt_sem_create+0x34>  // b.any
  200e10:	d2800000 	mov	x0, #0x0                   	// #0
  200e14:	14000016 	b	200e6c <rt_sem_create+0x88>
  200e18:	39404fa0 	ldrb	w0, [x29, #19]
  200e1c:	2a0003e3 	mov	w3, w0
  200e20:	b94017a2 	ldr	w2, [x29, #20]
  200e24:	f9400fa1 	ldr	x1, [x29, #24]
  200e28:	52800240 	mov	w0, #0x12                  	// #18
  200e2c:	94000a9c 	bl	20389c <syscall>
  200e30:	aa0003e1 	mov	x1, x0
  200e34:	f94017a0 	ldr	x0, [x29, #40]
  200e38:	f9000401 	str	x1, [x0, #8]
  200e3c:	f94017a0 	ldr	x0, [x29, #40]
  200e40:	f9400400 	ldr	x0, [x0, #8]
  200e44:	f100001f 	cmp	x0, #0x0
  200e48:	540000a0 	b.eq	200e5c <rt_sem_create+0x78>  // b.none
  200e4c:	f94017a0 	ldr	x0, [x29, #40]
  200e50:	52800041 	mov	w1, #0x2                   	// #2
  200e54:	b9000001 	str	w1, [x0]
  200e58:	14000004 	b	200e68 <rt_sem_create+0x84>
  200e5c:	f94017a0 	ldr	x0, [x29, #40]
  200e60:	94001a30 	bl	207720 <free>
  200e64:	f90017bf 	str	xzr, [x29, #40]
  200e68:	f94017a0 	ldr	x0, [x29, #40]
}
  200e6c:	a8c37bfd 	ldp	x29, x30, [sp], #48
  200e70:	d65f03c0 	ret

0000000000200e74 <rt_sem_init>:

rt_err_t rt_sem_init(rt_sem_t sem,
                     const char *name,
                     rt_uint32_t value,
                     rt_uint8_t  flag)
{
  200e74:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  200e78:	910003fd 	mov	x29, sp
  200e7c:	f90017a0 	str	x0, [x29, #40]
  200e80:	f90013a1 	str	x1, [x29, #32]
  200e84:	b9001fa2 	str	w2, [x29, #28]
  200e88:	39006fa3 	strb	w3, [x29, #27]
    RT_USER_IPC_INIT(sem, RT_Object_Class_Semaphore, _NRSYS_sem_create, name, value, flag);
  200e8c:	f94017a0 	ldr	x0, [x29, #40]
  200e90:	f100001f 	cmp	x0, #0x0
  200e94:	54000061 	b.ne	200ea0 <rt_sem_init+0x2c>  // b.any
  200e98:	d2800100 	mov	x0, #0x8                   	// #8
  200e9c:	14000014 	b	200eec <rt_sem_init+0x78>
  200ea0:	39406fa0 	ldrb	w0, [x29, #27]
  200ea4:	2a0003e3 	mov	w3, w0
  200ea8:	b9401fa2 	ldr	w2, [x29, #28]
  200eac:	f94013a1 	ldr	x1, [x29, #32]
  200eb0:	52800240 	mov	w0, #0x12                  	// #18
  200eb4:	94000a7a 	bl	20389c <syscall>
  200eb8:	aa0003e1 	mov	x1, x0
  200ebc:	f94017a0 	ldr	x0, [x29, #40]
  200ec0:	f9000401 	str	x1, [x0, #8]
  200ec4:	f94017a0 	ldr	x0, [x29, #40]
  200ec8:	f9400400 	ldr	x0, [x0, #8]
  200ecc:	f100001f 	cmp	x0, #0x0
  200ed0:	540000c0 	b.eq	200ee8 <rt_sem_init+0x74>  // b.none
  200ed4:	f94017a0 	ldr	x0, [x29, #40]
  200ed8:	52800041 	mov	w1, #0x2                   	// #2
  200edc:	b9000001 	str	w1, [x0]
  200ee0:	d2800000 	mov	x0, #0x0                   	// #0
  200ee4:	14000002 	b	200eec <rt_sem_init+0x78>
  200ee8:	d2800020 	mov	x0, #0x1                   	// #1
}
  200eec:	a8c37bfd 	ldp	x29, x30, [sp], #48
  200ef0:	d65f03c0 	ret

0000000000200ef4 <rt_sem_delete>:

rt_err_t rt_sem_delete(rt_sem_t sem)
{
  200ef4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  200ef8:	910003fd 	mov	x29, sp
  200efc:	f9000fa0 	str	x0, [x29, #24]
    RT_USER_IPC_DELETE(sem, RT_Object_Class_Semaphore, _NRSYS_sem_delete);
  200f00:	f9400fa0 	ldr	x0, [x29, #24]
  200f04:	f100001f 	cmp	x0, #0x0
  200f08:	540000a0 	b.eq	200f1c <rt_sem_delete+0x28>  // b.none
  200f0c:	f9400fa0 	ldr	x0, [x29, #24]
  200f10:	f9400400 	ldr	x0, [x0, #8]
  200f14:	f100001f 	cmp	x0, #0x0
  200f18:	54000061 	b.ne	200f24 <rt_sem_delete+0x30>  // b.any
  200f1c:	d2800100 	mov	x0, #0x8                   	// #8
  200f20:	14000015 	b	200f74 <rt_sem_delete+0x80>
  200f24:	f9400fa0 	ldr	x0, [x29, #24]
  200f28:	b9400000 	ldr	w0, [x0]
  200f2c:	7100081f 	cmp	w0, #0x2
  200f30:	54000060 	b.eq	200f3c <rt_sem_delete+0x48>  // b.none
  200f34:	d2800100 	mov	x0, #0x8                   	// #8
  200f38:	1400000f 	b	200f74 <rt_sem_delete+0x80>
  200f3c:	f9400fa0 	ldr	x0, [x29, #24]
  200f40:	f9400400 	ldr	x0, [x0, #8]
  200f44:	aa0003e1 	mov	x1, x0
  200f48:	52800260 	mov	w0, #0x13                  	// #19
  200f4c:	94000a54 	bl	20389c <syscall>
  200f50:	f90017a0 	str	x0, [x29, #40]
  200f54:	f94017a0 	ldr	x0, [x29, #40]
  200f58:	f100001f 	cmp	x0, #0x0
  200f5c:	54000060 	b.eq	200f68 <rt_sem_delete+0x74>  // b.none
  200f60:	f94017a0 	ldr	x0, [x29, #40]
  200f64:	14000004 	b	200f74 <rt_sem_delete+0x80>
  200f68:	f9400fa0 	ldr	x0, [x29, #24]
  200f6c:	940019ed 	bl	207720 <free>
  200f70:	d2800000 	mov	x0, #0x0                   	// #0
}
  200f74:	a8c37bfd 	ldp	x29, x30, [sp], #48
  200f78:	d65f03c0 	ret

0000000000200f7c <rt_sem_detach>:

rt_err_t rt_sem_detach(rt_sem_t sem)
{
  200f7c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  200f80:	910003fd 	mov	x29, sp
  200f84:	f9000fa0 	str	x0, [x29, #24]
    RT_USER_IPC_DETACH(sem, RT_Object_Class_Semaphore, _NRSYS_sem_delete);
  200f88:	f9400fa0 	ldr	x0, [x29, #24]
  200f8c:	f100001f 	cmp	x0, #0x0
  200f90:	540000a0 	b.eq	200fa4 <rt_sem_detach+0x28>  // b.none
  200f94:	f9400fa0 	ldr	x0, [x29, #24]
  200f98:	f9400400 	ldr	x0, [x0, #8]
  200f9c:	f100001f 	cmp	x0, #0x0
  200fa0:	54000061 	b.ne	200fac <rt_sem_detach+0x30>  // b.any
  200fa4:	d2800100 	mov	x0, #0x8                   	// #8
  200fa8:	14000017 	b	201004 <rt_sem_detach+0x88>
  200fac:	f9400fa0 	ldr	x0, [x29, #24]
  200fb0:	b9400000 	ldr	w0, [x0]
  200fb4:	7100081f 	cmp	w0, #0x2
  200fb8:	54000060 	b.eq	200fc4 <rt_sem_detach+0x48>  // b.none
  200fbc:	d2800100 	mov	x0, #0x8                   	// #8
  200fc0:	14000011 	b	201004 <rt_sem_detach+0x88>
  200fc4:	f9400fa0 	ldr	x0, [x29, #24]
  200fc8:	f9400400 	ldr	x0, [x0, #8]
  200fcc:	aa0003e1 	mov	x1, x0
  200fd0:	52800260 	mov	w0, #0x13                  	// #19
  200fd4:	94000a32 	bl	20389c <syscall>
  200fd8:	f90017a0 	str	x0, [x29, #40]
  200fdc:	f94017a0 	ldr	x0, [x29, #40]
  200fe0:	f100001f 	cmp	x0, #0x0
  200fe4:	54000060 	b.eq	200ff0 <rt_sem_detach+0x74>  // b.none
  200fe8:	f94017a0 	ldr	x0, [x29, #40]
  200fec:	14000006 	b	201004 <rt_sem_detach+0x88>
  200ff0:	f9400fa0 	ldr	x0, [x29, #24]
  200ff4:	b900001f 	str	wzr, [x0]
  200ff8:	f9400fa0 	ldr	x0, [x29, #24]
  200ffc:	f900041f 	str	xzr, [x0, #8]
  201000:	d2800000 	mov	x0, #0x0                   	// #0
}
  201004:	a8c37bfd 	ldp	x29, x30, [sp], #48
  201008:	d65f03c0 	ret

000000000020100c <rt_sem_release>:

rt_err_t rt_sem_release(rt_sem_t sem)
{
  20100c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201010:	910003fd 	mov	x29, sp
  201014:	f9000fa0 	str	x0, [x29, #24]
    RT_USER_IPC_CHECK(sem, RT_Object_Class_Semaphore);
  201018:	f9400fa0 	ldr	x0, [x29, #24]
  20101c:	f100001f 	cmp	x0, #0x0
  201020:	540000a0 	b.eq	201034 <rt_sem_release+0x28>  // b.none
  201024:	f9400fa0 	ldr	x0, [x29, #24]
  201028:	f9400400 	ldr	x0, [x0, #8]
  20102c:	f100001f 	cmp	x0, #0x0
  201030:	54000061 	b.ne	20103c <rt_sem_release+0x30>  // b.any
  201034:	d2800100 	mov	x0, #0x8                   	// #8
  201038:	1400000c 	b	201068 <rt_sem_release+0x5c>
  20103c:	f9400fa0 	ldr	x0, [x29, #24]
  201040:	b9400000 	ldr	w0, [x0]
  201044:	7100081f 	cmp	w0, #0x2
  201048:	54000060 	b.eq	201054 <rt_sem_release+0x48>  // b.none
  20104c:	d2800100 	mov	x0, #0x8                   	// #8
  201050:	14000006 	b	201068 <rt_sem_release+0x5c>
    return syscall(_NRSYS_sem_release, sem->data);
  201054:	f9400fa0 	ldr	x0, [x29, #24]
  201058:	f9400400 	ldr	x0, [x0, #8]
  20105c:	aa0003e1 	mov	x1, x0
  201060:	528002a0 	mov	w0, #0x15                  	// #21
  201064:	94000a0e 	bl	20389c <syscall>
}
  201068:	a8c27bfd 	ldp	x29, x30, [sp], #32
  20106c:	d65f03c0 	ret

0000000000201070 <rt_sem_take>:

rt_err_t rt_sem_take(rt_sem_t sem, rt_int32_t time)
{
  201070:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201074:	910003fd 	mov	x29, sp
  201078:	f9000fa0 	str	x0, [x29, #24]
  20107c:	b90017a1 	str	w1, [x29, #20]
    RT_USER_IPC_CHECK(sem, RT_Object_Class_Semaphore);
  201080:	f9400fa0 	ldr	x0, [x29, #24]
  201084:	f100001f 	cmp	x0, #0x0
  201088:	540000a0 	b.eq	20109c <rt_sem_take+0x2c>  // b.none
  20108c:	f9400fa0 	ldr	x0, [x29, #24]
  201090:	f9400400 	ldr	x0, [x0, #8]
  201094:	f100001f 	cmp	x0, #0x0
  201098:	54000061 	b.ne	2010a4 <rt_sem_take+0x34>  // b.any
  20109c:	d2800100 	mov	x0, #0x8                   	// #8
  2010a0:	1400000d 	b	2010d4 <rt_sem_take+0x64>
  2010a4:	f9400fa0 	ldr	x0, [x29, #24]
  2010a8:	b9400000 	ldr	w0, [x0]
  2010ac:	7100081f 	cmp	w0, #0x2
  2010b0:	54000060 	b.eq	2010bc <rt_sem_take+0x4c>  // b.none
  2010b4:	d2800100 	mov	x0, #0x8                   	// #8
  2010b8:	14000007 	b	2010d4 <rt_sem_take+0x64>
    return syscall(_NRSYS_sem_take, sem->data, time);
  2010bc:	f9400fa0 	ldr	x0, [x29, #24]
  2010c0:	f9400400 	ldr	x0, [x0, #8]
  2010c4:	b94017a2 	ldr	w2, [x29, #20]
  2010c8:	aa0003e1 	mov	x1, x0
  2010cc:	52800280 	mov	w0, #0x14                  	// #20
  2010d0:	940009f3 	bl	20389c <syscall>
}
  2010d4:	a8c27bfd 	ldp	x29, x30, [sp], #32
  2010d8:	d65f03c0 	ret

00000000002010dc <rt_mb_create>:

rt_mailbox_t rt_mb_create(const char *name, rt_size_t size, rt_uint8_t flag)
{
  2010dc:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  2010e0:	910003fd 	mov	x29, sp
  2010e4:	f90017a0 	str	x0, [x29, #40]
  2010e8:	f90013a1 	str	x1, [x29, #32]
  2010ec:	39007fa2 	strb	w2, [x29, #31]
    RT_USER_IPC_CREATE(RT_Object_Class_MailBox, _NRSYS_mb_create, name, size, flag);
  2010f0:	d2800200 	mov	x0, #0x10                  	// #16
  2010f4:	940017f5 	bl	2070c8 <malloc>
  2010f8:	f9001fa0 	str	x0, [x29, #56]
  2010fc:	f9401fa0 	ldr	x0, [x29, #56]
  201100:	f100001f 	cmp	x0, #0x0
  201104:	54000061 	b.ne	201110 <rt_mb_create+0x34>  // b.any
  201108:	d2800000 	mov	x0, #0x0                   	// #0
  20110c:	14000016 	b	201164 <rt_mb_create+0x88>
  201110:	39407fa0 	ldrb	w0, [x29, #31]
  201114:	2a0003e3 	mov	w3, w0
  201118:	f94013a2 	ldr	x2, [x29, #32]
  20111c:	f94017a1 	ldr	x1, [x29, #40]
  201120:	528003c0 	mov	w0, #0x1e                  	// #30
  201124:	940009de 	bl	20389c <syscall>
  201128:	aa0003e1 	mov	x1, x0
  20112c:	f9401fa0 	ldr	x0, [x29, #56]
  201130:	f9000401 	str	x1, [x0, #8]
  201134:	f9401fa0 	ldr	x0, [x29, #56]
  201138:	f9400400 	ldr	x0, [x0, #8]
  20113c:	f100001f 	cmp	x0, #0x0
  201140:	540000a0 	b.eq	201154 <rt_mb_create+0x78>  // b.none
  201144:	f9401fa0 	ldr	x0, [x29, #56]
  201148:	528000a1 	mov	w1, #0x5                   	// #5
  20114c:	b9000001 	str	w1, [x0]
  201150:	14000004 	b	201160 <rt_mb_create+0x84>
  201154:	f9401fa0 	ldr	x0, [x29, #56]
  201158:	94001972 	bl	207720 <free>
  20115c:	f9001fbf 	str	xzr, [x29, #56]
  201160:	f9401fa0 	ldr	x0, [x29, #56]
}
  201164:	a8c47bfd 	ldp	x29, x30, [sp], #64
  201168:	d65f03c0 	ret

000000000020116c <rt_mb_init>:
rt_err_t rt_mb_init(rt_mailbox_t mb,
                    const char  *name,
                    void        *msgpool,
                    rt_size_t    size,
                    rt_uint8_t   flag)
{
  20116c:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  201170:	910003fd 	mov	x29, sp
  201174:	f9001fa0 	str	x0, [x29, #56]
  201178:	f9001ba1 	str	x1, [x29, #48]
  20117c:	f90017a2 	str	x2, [x29, #40]
  201180:	f90013a3 	str	x3, [x29, #32]
  201184:	39007fa4 	strb	w4, [x29, #31]
    RT_USER_IPC_INIT(mb, RT_Object_Class_MailBox, _NRSYS_mb_create, name, size, flag);
  201188:	f9401fa0 	ldr	x0, [x29, #56]
  20118c:	f100001f 	cmp	x0, #0x0
  201190:	54000061 	b.ne	20119c <rt_mb_init+0x30>  // b.any
  201194:	d2800100 	mov	x0, #0x8                   	// #8
  201198:	14000014 	b	2011e8 <rt_mb_init+0x7c>
  20119c:	39407fa0 	ldrb	w0, [x29, #31]
  2011a0:	2a0003e3 	mov	w3, w0
  2011a4:	f94013a2 	ldr	x2, [x29, #32]
  2011a8:	f9401ba1 	ldr	x1, [x29, #48]
  2011ac:	528003c0 	mov	w0, #0x1e                  	// #30
  2011b0:	940009bb 	bl	20389c <syscall>
  2011b4:	aa0003e1 	mov	x1, x0
  2011b8:	f9401fa0 	ldr	x0, [x29, #56]
  2011bc:	f9000401 	str	x1, [x0, #8]
  2011c0:	f9401fa0 	ldr	x0, [x29, #56]
  2011c4:	f9400400 	ldr	x0, [x0, #8]
  2011c8:	f100001f 	cmp	x0, #0x0
  2011cc:	540000c0 	b.eq	2011e4 <rt_mb_init+0x78>  // b.none
  2011d0:	f9401fa0 	ldr	x0, [x29, #56]
  2011d4:	528000a1 	mov	w1, #0x5                   	// #5
  2011d8:	b9000001 	str	w1, [x0]
  2011dc:	d2800000 	mov	x0, #0x0                   	// #0
  2011e0:	14000002 	b	2011e8 <rt_mb_init+0x7c>
  2011e4:	d2800020 	mov	x0, #0x1                   	// #1
}
  2011e8:	a8c47bfd 	ldp	x29, x30, [sp], #64
  2011ec:	d65f03c0 	ret

00000000002011f0 <rt_mb_delete>:


rt_err_t rt_mb_delete(rt_mailbox_t mb)
{
  2011f0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  2011f4:	910003fd 	mov	x29, sp
  2011f8:	f9000fa0 	str	x0, [x29, #24]
    RT_USER_IPC_DELETE(mb, RT_Object_Class_MailBox, _NRSYS_mb_delete);
  2011fc:	f9400fa0 	ldr	x0, [x29, #24]
  201200:	f100001f 	cmp	x0, #0x0
  201204:	540000a0 	b.eq	201218 <rt_mb_delete+0x28>  // b.none
  201208:	f9400fa0 	ldr	x0, [x29, #24]
  20120c:	f9400400 	ldr	x0, [x0, #8]
  201210:	f100001f 	cmp	x0, #0x0
  201214:	54000061 	b.ne	201220 <rt_mb_delete+0x30>  // b.any
  201218:	d2800100 	mov	x0, #0x8                   	// #8
  20121c:	14000015 	b	201270 <rt_mb_delete+0x80>
  201220:	f9400fa0 	ldr	x0, [x29, #24]
  201224:	b9400000 	ldr	w0, [x0]
  201228:	7100141f 	cmp	w0, #0x5
  20122c:	54000060 	b.eq	201238 <rt_mb_delete+0x48>  // b.none
  201230:	d2800100 	mov	x0, #0x8                   	// #8
  201234:	1400000f 	b	201270 <rt_mb_delete+0x80>
  201238:	f9400fa0 	ldr	x0, [x29, #24]
  20123c:	f9400400 	ldr	x0, [x0, #8]
  201240:	aa0003e1 	mov	x1, x0
  201244:	528003e0 	mov	w0, #0x1f                  	// #31
  201248:	94000995 	bl	20389c <syscall>
  20124c:	f90017a0 	str	x0, [x29, #40]
  201250:	f94017a0 	ldr	x0, [x29, #40]
  201254:	f100001f 	cmp	x0, #0x0
  201258:	54000060 	b.eq	201264 <rt_mb_delete+0x74>  // b.none
  20125c:	f94017a0 	ldr	x0, [x29, #40]
  201260:	14000004 	b	201270 <rt_mb_delete+0x80>
  201264:	f9400fa0 	ldr	x0, [x29, #24]
  201268:	9400192e 	bl	207720 <free>
  20126c:	d2800000 	mov	x0, #0x0                   	// #0
}
  201270:	a8c37bfd 	ldp	x29, x30, [sp], #48
  201274:	d65f03c0 	ret

0000000000201278 <rt_mb_detach>:

rt_err_t rt_mb_detach(rt_mailbox_t mb)
{
  201278:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  20127c:	910003fd 	mov	x29, sp
  201280:	f9000fa0 	str	x0, [x29, #24]
    RT_USER_IPC_DETACH(mb, RT_Object_Class_MailBox, _NRSYS_mb_delete);
  201284:	f9400fa0 	ldr	x0, [x29, #24]
  201288:	f100001f 	cmp	x0, #0x0
  20128c:	540000a0 	b.eq	2012a0 <rt_mb_detach+0x28>  // b.none
  201290:	f9400fa0 	ldr	x0, [x29, #24]
  201294:	f9400400 	ldr	x0, [x0, #8]
  201298:	f100001f 	cmp	x0, #0x0
  20129c:	54000061 	b.ne	2012a8 <rt_mb_detach+0x30>  // b.any
  2012a0:	d2800100 	mov	x0, #0x8                   	// #8
  2012a4:	14000017 	b	201300 <rt_mb_detach+0x88>
  2012a8:	f9400fa0 	ldr	x0, [x29, #24]
  2012ac:	b9400000 	ldr	w0, [x0]
  2012b0:	7100141f 	cmp	w0, #0x5
  2012b4:	54000060 	b.eq	2012c0 <rt_mb_detach+0x48>  // b.none
  2012b8:	d2800100 	mov	x0, #0x8                   	// #8
  2012bc:	14000011 	b	201300 <rt_mb_detach+0x88>
  2012c0:	f9400fa0 	ldr	x0, [x29, #24]
  2012c4:	f9400400 	ldr	x0, [x0, #8]
  2012c8:	aa0003e1 	mov	x1, x0
  2012cc:	528003e0 	mov	w0, #0x1f                  	// #31
  2012d0:	94000973 	bl	20389c <syscall>
  2012d4:	f90017a0 	str	x0, [x29, #40]
  2012d8:	f94017a0 	ldr	x0, [x29, #40]
  2012dc:	f100001f 	cmp	x0, #0x0
  2012e0:	54000060 	b.eq	2012ec <rt_mb_detach+0x74>  // b.none
  2012e4:	f94017a0 	ldr	x0, [x29, #40]
  2012e8:	14000006 	b	201300 <rt_mb_detach+0x88>
  2012ec:	f9400fa0 	ldr	x0, [x29, #24]
  2012f0:	b900001f 	str	wzr, [x0]
  2012f4:	f9400fa0 	ldr	x0, [x29, #24]
  2012f8:	f900041f 	str	xzr, [x0, #8]
  2012fc:	d2800000 	mov	x0, #0x0                   	// #0
}
  201300:	a8c37bfd 	ldp	x29, x30, [sp], #48
  201304:	d65f03c0 	ret

0000000000201308 <rt_mb_send_wait>:

rt_err_t rt_mb_send_wait(rt_mailbox_t mb,
        rt_ubase_t   value,
        rt_int32_t   timeout)
{
  201308:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  20130c:	910003fd 	mov	x29, sp
  201310:	f90017a0 	str	x0, [x29, #40]
  201314:	f90013a1 	str	x1, [x29, #32]
  201318:	b9001fa2 	str	w2, [x29, #28]
    RT_USER_IPC_CHECK(mb, RT_Object_Class_MailBox);
  20131c:	f94017a0 	ldr	x0, [x29, #40]
  201320:	f100001f 	cmp	x0, #0x0
  201324:	540000a0 	b.eq	201338 <rt_mb_send_wait+0x30>  // b.none
  201328:	f94017a0 	ldr	x0, [x29, #40]
  20132c:	f9400400 	ldr	x0, [x0, #8]
  201330:	f100001f 	cmp	x0, #0x0
  201334:	54000061 	b.ne	201340 <rt_mb_send_wait+0x38>  // b.any
  201338:	d2800100 	mov	x0, #0x8                   	// #8
  20133c:	1400000e 	b	201374 <rt_mb_send_wait+0x6c>
  201340:	f94017a0 	ldr	x0, [x29, #40]
  201344:	b9400000 	ldr	w0, [x0]
  201348:	7100141f 	cmp	w0, #0x5
  20134c:	54000060 	b.eq	201358 <rt_mb_send_wait+0x50>  // b.none
  201350:	d2800100 	mov	x0, #0x8                   	// #8
  201354:	14000008 	b	201374 <rt_mb_send_wait+0x6c>
    return syscall(_NRSYS_mb_send_wait, mb->data, value, timeout);
  201358:	f94017a0 	ldr	x0, [x29, #40]
  20135c:	f9400400 	ldr	x0, [x0, #8]
  201360:	b9401fa3 	ldr	w3, [x29, #28]
  201364:	f94013a2 	ldr	x2, [x29, #32]
  201368:	aa0003e1 	mov	x1, x0
  20136c:	52800420 	mov	w0, #0x21                  	// #33
  201370:	9400094b 	bl	20389c <syscall>
}
  201374:	a8c37bfd 	ldp	x29, x30, [sp], #48
  201378:	d65f03c0 	ret

000000000020137c <rt_mb_send>:

rt_err_t rt_mb_send(rt_mailbox_t mb, rt_ubase_t value)
{
  20137c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201380:	910003fd 	mov	x29, sp
  201384:	f9000fa0 	str	x0, [x29, #24]
  201388:	f9000ba1 	str	x1, [x29, #16]
    RT_USER_IPC_CHECK(mb, RT_Object_Class_MailBox);
  20138c:	f9400fa0 	ldr	x0, [x29, #24]
  201390:	f100001f 	cmp	x0, #0x0
  201394:	540000a0 	b.eq	2013a8 <rt_mb_send+0x2c>  // b.none
  201398:	f9400fa0 	ldr	x0, [x29, #24]
  20139c:	f9400400 	ldr	x0, [x0, #8]
  2013a0:	f100001f 	cmp	x0, #0x0
  2013a4:	54000061 	b.ne	2013b0 <rt_mb_send+0x34>  // b.any
  2013a8:	d2800100 	mov	x0, #0x8                   	// #8
  2013ac:	1400000d 	b	2013e0 <rt_mb_send+0x64>
  2013b0:	f9400fa0 	ldr	x0, [x29, #24]
  2013b4:	b9400000 	ldr	w0, [x0]
  2013b8:	7100141f 	cmp	w0, #0x5
  2013bc:	54000060 	b.eq	2013c8 <rt_mb_send+0x4c>  // b.none
  2013c0:	d2800100 	mov	x0, #0x8                   	// #8
  2013c4:	14000007 	b	2013e0 <rt_mb_send+0x64>
    return syscall(_NRSYS_mb_send, mb->data, value);
  2013c8:	f9400fa0 	ldr	x0, [x29, #24]
  2013cc:	f9400400 	ldr	x0, [x0, #8]
  2013d0:	f9400ba2 	ldr	x2, [x29, #16]
  2013d4:	aa0003e1 	mov	x1, x0
  2013d8:	52800400 	mov	w0, #0x20                  	// #32
  2013dc:	94000930 	bl	20389c <syscall>
}
  2013e0:	a8c27bfd 	ldp	x29, x30, [sp], #32
  2013e4:	d65f03c0 	ret

00000000002013e8 <rt_mb_recv>:

rt_err_t rt_mb_recv(rt_mailbox_t mb, rt_ubase_t *value, rt_int32_t timeout)
{
  2013e8:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  2013ec:	910003fd 	mov	x29, sp
  2013f0:	f90017a0 	str	x0, [x29, #40]
  2013f4:	f90013a1 	str	x1, [x29, #32]
  2013f8:	b9001fa2 	str	w2, [x29, #28]
    RT_USER_IPC_CHECK(mb, RT_Object_Class_MailBox);
  2013fc:	f94017a0 	ldr	x0, [x29, #40]
  201400:	f100001f 	cmp	x0, #0x0
  201404:	540000a0 	b.eq	201418 <rt_mb_recv+0x30>  // b.none
  201408:	f94017a0 	ldr	x0, [x29, #40]
  20140c:	f9400400 	ldr	x0, [x0, #8]
  201410:	f100001f 	cmp	x0, #0x0
  201414:	54000061 	b.ne	201420 <rt_mb_recv+0x38>  // b.any
  201418:	d2800100 	mov	x0, #0x8                   	// #8
  20141c:	1400000e 	b	201454 <rt_mb_recv+0x6c>
  201420:	f94017a0 	ldr	x0, [x29, #40]
  201424:	b9400000 	ldr	w0, [x0]
  201428:	7100141f 	cmp	w0, #0x5
  20142c:	54000060 	b.eq	201438 <rt_mb_recv+0x50>  // b.none
  201430:	d2800100 	mov	x0, #0x8                   	// #8
  201434:	14000008 	b	201454 <rt_mb_recv+0x6c>
    return syscall(_NRSYS_mb_recv, mb->data, value, timeout);
  201438:	f94017a0 	ldr	x0, [x29, #40]
  20143c:	f9400400 	ldr	x0, [x0, #8]
  201440:	b9401fa3 	ldr	w3, [x29, #28]
  201444:	f94013a2 	ldr	x2, [x29, #32]
  201448:	aa0003e1 	mov	x1, x0
  20144c:	52800440 	mov	w0, #0x22                  	// #34
  201450:	94000913 	bl	20389c <syscall>
}
  201454:	a8c37bfd 	ldp	x29, x30, [sp], #48
  201458:	d65f03c0 	ret

000000000020145c <rt_mq_create>:

rt_mq_t rt_mq_create(const char *name,
                     rt_size_t   msg_size,
                     rt_size_t   max_msgs,
                     rt_uint8_t  flag)
{
  20145c:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  201460:	910003fd 	mov	x29, sp
  201464:	f90017a0 	str	x0, [x29, #40]
  201468:	f90013a1 	str	x1, [x29, #32]
  20146c:	f9000fa2 	str	x2, [x29, #24]
  201470:	39005fa3 	strb	w3, [x29, #23]
    RT_USER_IPC_CREATE(RT_Object_Class_MessageQueue, _NRSYS_mq_create, name, msg_size, max_msgs, flag);
  201474:	d2800200 	mov	x0, #0x10                  	// #16
  201478:	94001714 	bl	2070c8 <malloc>
  20147c:	f9001fa0 	str	x0, [x29, #56]
  201480:	f9401fa0 	ldr	x0, [x29, #56]
  201484:	f100001f 	cmp	x0, #0x0
  201488:	54000061 	b.ne	201494 <rt_mq_create+0x38>  // b.any
  20148c:	d2800000 	mov	x0, #0x0                   	// #0
  201490:	14000017 	b	2014ec <rt_mq_create+0x90>
  201494:	39405fa0 	ldrb	w0, [x29, #23]
  201498:	2a0003e4 	mov	w4, w0
  20149c:	f9400fa3 	ldr	x3, [x29, #24]
  2014a0:	f94013a2 	ldr	x2, [x29, #32]
  2014a4:	f94017a1 	ldr	x1, [x29, #40]
  2014a8:	52800460 	mov	w0, #0x23                  	// #35
  2014ac:	940008fc 	bl	20389c <syscall>
  2014b0:	aa0003e1 	mov	x1, x0
  2014b4:	f9401fa0 	ldr	x0, [x29, #56]
  2014b8:	f9000401 	str	x1, [x0, #8]
  2014bc:	f9401fa0 	ldr	x0, [x29, #56]
  2014c0:	f9400400 	ldr	x0, [x0, #8]
  2014c4:	f100001f 	cmp	x0, #0x0
  2014c8:	540000a0 	b.eq	2014dc <rt_mq_create+0x80>  // b.none
  2014cc:	f9401fa0 	ldr	x0, [x29, #56]
  2014d0:	528000c1 	mov	w1, #0x6                   	// #6
  2014d4:	b9000001 	str	w1, [x0]
  2014d8:	14000004 	b	2014e8 <rt_mq_create+0x8c>
  2014dc:	f9401fa0 	ldr	x0, [x29, #56]
  2014e0:	94001890 	bl	207720 <free>
  2014e4:	f9001fbf 	str	xzr, [x29, #56]
  2014e8:	f9401fa0 	ldr	x0, [x29, #56]
}
  2014ec:	a8c47bfd 	ldp	x29, x30, [sp], #64
  2014f0:	d65f03c0 	ret

00000000002014f4 <rt_mq_init>:
                    const char *name,
                    void       *msgpool,
                    rt_size_t   msg_size,
                    rt_size_t   pool_size,
                    rt_uint8_t  flag)
{
  2014f4:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  2014f8:	910003fd 	mov	x29, sp
  2014fc:	f9001fa0 	str	x0, [x29, #56]
  201500:	f9001ba1 	str	x1, [x29, #48]
  201504:	f90017a2 	str	x2, [x29, #40]
  201508:	f90013a3 	str	x3, [x29, #32]
  20150c:	f9000fa4 	str	x4, [x29, #24]
  201510:	39005fa5 	strb	w5, [x29, #23]
    RT_USER_IPC_INIT(mq, RT_Object_Class_MessageQueue, _NRSYS_mq_create, name, msg_size, pool_size/msg_size, flag);
  201514:	f9401fa0 	ldr	x0, [x29, #56]
  201518:	f100001f 	cmp	x0, #0x0
  20151c:	54000061 	b.ne	201528 <rt_mq_init+0x34>  // b.any
  201520:	d2800100 	mov	x0, #0x8                   	// #8
  201524:	14000018 	b	201584 <rt_mq_init+0x90>
  201528:	f9400fa1 	ldr	x1, [x29, #24]
  20152c:	f94013a0 	ldr	x0, [x29, #32]
  201530:	9ac00820 	udiv	x0, x1, x0
  201534:	39405fa1 	ldrb	w1, [x29, #23]
  201538:	2a0103e4 	mov	w4, w1
  20153c:	aa0003e3 	mov	x3, x0
  201540:	f94013a2 	ldr	x2, [x29, #32]
  201544:	f9401ba1 	ldr	x1, [x29, #48]
  201548:	52800460 	mov	w0, #0x23                  	// #35
  20154c:	940008d4 	bl	20389c <syscall>
  201550:	aa0003e1 	mov	x1, x0
  201554:	f9401fa0 	ldr	x0, [x29, #56]
  201558:	f9000401 	str	x1, [x0, #8]
  20155c:	f9401fa0 	ldr	x0, [x29, #56]
  201560:	f9400400 	ldr	x0, [x0, #8]
  201564:	f100001f 	cmp	x0, #0x0
  201568:	540000c0 	b.eq	201580 <rt_mq_init+0x8c>  // b.none
  20156c:	f9401fa0 	ldr	x0, [x29, #56]
  201570:	528000c1 	mov	w1, #0x6                   	// #6
  201574:	b9000001 	str	w1, [x0]
  201578:	d2800000 	mov	x0, #0x0                   	// #0
  20157c:	14000002 	b	201584 <rt_mq_init+0x90>
  201580:	d2800020 	mov	x0, #0x1                   	// #1
}
  201584:	a8c47bfd 	ldp	x29, x30, [sp], #64
  201588:	d65f03c0 	ret

000000000020158c <rt_mq_delete>:

rt_err_t rt_mq_delete(rt_mq_t mq)
{
  20158c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  201590:	910003fd 	mov	x29, sp
  201594:	f9000fa0 	str	x0, [x29, #24]
    RT_USER_IPC_DELETE(mq, RT_Object_Class_MessageQueue, _NRSYS_mq_delete);
  201598:	f9400fa0 	ldr	x0, [x29, #24]
  20159c:	f100001f 	cmp	x0, #0x0
  2015a0:	540000a0 	b.eq	2015b4 <rt_mq_delete+0x28>  // b.none
  2015a4:	f9400fa0 	ldr	x0, [x29, #24]
  2015a8:	f9400400 	ldr	x0, [x0, #8]
  2015ac:	f100001f 	cmp	x0, #0x0
  2015b0:	54000061 	b.ne	2015bc <rt_mq_delete+0x30>  // b.any
  2015b4:	d2800100 	mov	x0, #0x8                   	// #8
  2015b8:	14000015 	b	20160c <rt_mq_delete+0x80>
  2015bc:	f9400fa0 	ldr	x0, [x29, #24]
  2015c0:	b9400000 	ldr	w0, [x0]
  2015c4:	7100181f 	cmp	w0, #0x6
  2015c8:	54000060 	b.eq	2015d4 <rt_mq_delete+0x48>  // b.none
  2015cc:	d2800100 	mov	x0, #0x8                   	// #8
  2015d0:	1400000f 	b	20160c <rt_mq_delete+0x80>
  2015d4:	f9400fa0 	ldr	x0, [x29, #24]
  2015d8:	f9400400 	ldr	x0, [x0, #8]
  2015dc:	aa0003e1 	mov	x1, x0
  2015e0:	52800480 	mov	w0, #0x24                  	// #36
  2015e4:	940008ae 	bl	20389c <syscall>
  2015e8:	f90017a0 	str	x0, [x29, #40]
  2015ec:	f94017a0 	ldr	x0, [x29, #40]
  2015f0:	f100001f 	cmp	x0, #0x0
  2015f4:	54000060 	b.eq	201600 <rt_mq_delete+0x74>  // b.none
  2015f8:	f94017a0 	ldr	x0, [x29, #40]
  2015fc:	14000004 	b	20160c <rt_mq_delete+0x80>
  201600:	f9400fa0 	ldr	x0, [x29, #24]
  201604:	94001847 	bl	207720 <free>
  201608:	d2800000 	mov	x0, #0x0                   	// #0
}
  20160c:	a8c37bfd 	ldp	x29, x30, [sp], #48
  201610:	d65f03c0 	ret

0000000000201614 <rt_mq_detach>:

rt_err_t rt_mq_detach(rt_mq_t mq)
{
  201614:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  201618:	910003fd 	mov	x29, sp
  20161c:	f9000fa0 	str	x0, [x29, #24]
    RT_USER_IPC_DETACH(mq, RT_Object_Class_MessageQueue, _NRSYS_mq_delete);
  201620:	f9400fa0 	ldr	x0, [x29, #24]
  201624:	f100001f 	cmp	x0, #0x0
  201628:	540000a0 	b.eq	20163c <rt_mq_detach+0x28>  // b.none
  20162c:	f9400fa0 	ldr	x0, [x29, #24]
  201630:	f9400400 	ldr	x0, [x0, #8]
  201634:	f100001f 	cmp	x0, #0x0
  201638:	54000061 	b.ne	201644 <rt_mq_detach+0x30>  // b.any
  20163c:	d2800100 	mov	x0, #0x8                   	// #8
  201640:	14000017 	b	20169c <rt_mq_detach+0x88>
  201644:	f9400fa0 	ldr	x0, [x29, #24]
  201648:	b9400000 	ldr	w0, [x0]
  20164c:	7100181f 	cmp	w0, #0x6
  201650:	54000060 	b.eq	20165c <rt_mq_detach+0x48>  // b.none
  201654:	d2800100 	mov	x0, #0x8                   	// #8
  201658:	14000011 	b	20169c <rt_mq_detach+0x88>
  20165c:	f9400fa0 	ldr	x0, [x29, #24]
  201660:	f9400400 	ldr	x0, [x0, #8]
  201664:	aa0003e1 	mov	x1, x0
  201668:	52800480 	mov	w0, #0x24                  	// #36
  20166c:	9400088c 	bl	20389c <syscall>
  201670:	f90017a0 	str	x0, [x29, #40]
  201674:	f94017a0 	ldr	x0, [x29, #40]
  201678:	f100001f 	cmp	x0, #0x0
  20167c:	54000060 	b.eq	201688 <rt_mq_detach+0x74>  // b.none
  201680:	f94017a0 	ldr	x0, [x29, #40]
  201684:	14000006 	b	20169c <rt_mq_detach+0x88>
  201688:	f9400fa0 	ldr	x0, [x29, #24]
  20168c:	b900001f 	str	wzr, [x0]
  201690:	f9400fa0 	ldr	x0, [x29, #24]
  201694:	f900041f 	str	xzr, [x0, #8]
  201698:	d2800000 	mov	x0, #0x0                   	// #0
}
  20169c:	a8c37bfd 	ldp	x29, x30, [sp], #48
  2016a0:	d65f03c0 	ret

00000000002016a4 <rt_mq_send>:

rt_err_t rt_mq_send(rt_mq_t mq, const void *buffer, rt_size_t size)
{
  2016a4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  2016a8:	910003fd 	mov	x29, sp
  2016ac:	f90017a0 	str	x0, [x29, #40]
  2016b0:	f90013a1 	str	x1, [x29, #32]
  2016b4:	f9000fa2 	str	x2, [x29, #24]
    RT_USER_IPC_CHECK(mq, RT_Object_Class_MessageQueue);
  2016b8:	f94017a0 	ldr	x0, [x29, #40]
  2016bc:	f100001f 	cmp	x0, #0x0
  2016c0:	540000a0 	b.eq	2016d4 <rt_mq_send+0x30>  // b.none
  2016c4:	f94017a0 	ldr	x0, [x29, #40]
  2016c8:	f9400400 	ldr	x0, [x0, #8]
  2016cc:	f100001f 	cmp	x0, #0x0
  2016d0:	54000061 	b.ne	2016dc <rt_mq_send+0x38>  // b.any
  2016d4:	d2800100 	mov	x0, #0x8                   	// #8
  2016d8:	1400000e 	b	201710 <rt_mq_send+0x6c>
  2016dc:	f94017a0 	ldr	x0, [x29, #40]
  2016e0:	b9400000 	ldr	w0, [x0]
  2016e4:	7100181f 	cmp	w0, #0x6
  2016e8:	54000060 	b.eq	2016f4 <rt_mq_send+0x50>  // b.none
  2016ec:	d2800100 	mov	x0, #0x8                   	// #8
  2016f0:	14000008 	b	201710 <rt_mq_send+0x6c>
    return syscall(_NRSYS_mq_send, mq->data, buffer, size);
  2016f4:	f94017a0 	ldr	x0, [x29, #40]
  2016f8:	f9400400 	ldr	x0, [x0, #8]
  2016fc:	f9400fa3 	ldr	x3, [x29, #24]
  201700:	f94013a2 	ldr	x2, [x29, #32]
  201704:	aa0003e1 	mov	x1, x0
  201708:	528004a0 	mov	w0, #0x25                  	// #37
  20170c:	94000864 	bl	20389c <syscall>
}
  201710:	a8c37bfd 	ldp	x29, x30, [sp], #48
  201714:	d65f03c0 	ret

0000000000201718 <rt_mq_urgent>:

rt_err_t rt_mq_urgent(rt_mq_t mq, const void *buffer, rt_size_t size)
{
  201718:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  20171c:	910003fd 	mov	x29, sp
  201720:	f90017a0 	str	x0, [x29, #40]
  201724:	f90013a1 	str	x1, [x29, #32]
  201728:	f9000fa2 	str	x2, [x29, #24]
    RT_USER_IPC_CHECK(mq, RT_Object_Class_MessageQueue);
  20172c:	f94017a0 	ldr	x0, [x29, #40]
  201730:	f100001f 	cmp	x0, #0x0
  201734:	540000a0 	b.eq	201748 <rt_mq_urgent+0x30>  // b.none
  201738:	f94017a0 	ldr	x0, [x29, #40]
  20173c:	f9400400 	ldr	x0, [x0, #8]
  201740:	f100001f 	cmp	x0, #0x0
  201744:	54000061 	b.ne	201750 <rt_mq_urgent+0x38>  // b.any
  201748:	d2800100 	mov	x0, #0x8                   	// #8
  20174c:	1400000e 	b	201784 <rt_mq_urgent+0x6c>
  201750:	f94017a0 	ldr	x0, [x29, #40]
  201754:	b9400000 	ldr	w0, [x0]
  201758:	7100181f 	cmp	w0, #0x6
  20175c:	54000060 	b.eq	201768 <rt_mq_urgent+0x50>  // b.none
  201760:	d2800100 	mov	x0, #0x8                   	// #8
  201764:	14000008 	b	201784 <rt_mq_urgent+0x6c>
    return syscall(_NRSYS_mq_urgent, mq->data, buffer, size);
  201768:	f94017a0 	ldr	x0, [x29, #40]
  20176c:	f9400400 	ldr	x0, [x0, #8]
  201770:	f9400fa3 	ldr	x3, [x29, #24]
  201774:	f94013a2 	ldr	x2, [x29, #32]
  201778:	aa0003e1 	mov	x1, x0
  20177c:	528004c0 	mov	w0, #0x26                  	// #38
  201780:	94000847 	bl	20389c <syscall>
}
  201784:	a8c37bfd 	ldp	x29, x30, [sp], #48
  201788:	d65f03c0 	ret

000000000020178c <rt_mq_recv>:

rt_err_t rt_mq_recv(rt_mq_t    mq,
                    void      *buffer,
                    rt_size_t  size,
                    rt_int32_t timeout)
{
  20178c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  201790:	910003fd 	mov	x29, sp
  201794:	f90017a0 	str	x0, [x29, #40]
  201798:	f90013a1 	str	x1, [x29, #32]
  20179c:	f9000fa2 	str	x2, [x29, #24]
  2017a0:	b90017a3 	str	w3, [x29, #20]
    RT_USER_IPC_CHECK(mq, RT_Object_Class_MessageQueue);
  2017a4:	f94017a0 	ldr	x0, [x29, #40]
  2017a8:	f100001f 	cmp	x0, #0x0
  2017ac:	540000a0 	b.eq	2017c0 <rt_mq_recv+0x34>  // b.none
  2017b0:	f94017a0 	ldr	x0, [x29, #40]
  2017b4:	f9400400 	ldr	x0, [x0, #8]
  2017b8:	f100001f 	cmp	x0, #0x0
  2017bc:	54000061 	b.ne	2017c8 <rt_mq_recv+0x3c>  // b.any
  2017c0:	d2800100 	mov	x0, #0x8                   	// #8
  2017c4:	1400000f 	b	201800 <rt_mq_recv+0x74>
  2017c8:	f94017a0 	ldr	x0, [x29, #40]
  2017cc:	b9400000 	ldr	w0, [x0]
  2017d0:	7100181f 	cmp	w0, #0x6
  2017d4:	54000060 	b.eq	2017e0 <rt_mq_recv+0x54>  // b.none
  2017d8:	d2800100 	mov	x0, #0x8                   	// #8
  2017dc:	14000009 	b	201800 <rt_mq_recv+0x74>
    return syscall(_NRSYS_mq_recv, mq->data, buffer, size, timeout);
  2017e0:	f94017a0 	ldr	x0, [x29, #40]
  2017e4:	f9400400 	ldr	x0, [x0, #8]
  2017e8:	b94017a4 	ldr	w4, [x29, #20]
  2017ec:	f9400fa3 	ldr	x3, [x29, #24]
  2017f0:	f94013a2 	ldr	x2, [x29, #32]
  2017f4:	aa0003e1 	mov	x1, x0
  2017f8:	528004e0 	mov	w0, #0x27                  	// #39
  2017fc:	94000828 	bl	20389c <syscall>
}
  201800:	a8c37bfd 	ldp	x29, x30, [sp], #48
  201804:	d65f03c0 	ret

0000000000201808 <rt_event_create>:

rt_event_t rt_event_create(const char *name, rt_uint8_t flag)
{
  201808:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  20180c:	910003fd 	mov	x29, sp
  201810:	f9000fa0 	str	x0, [x29, #24]
  201814:	39005fa1 	strb	w1, [x29, #23]
    RT_USER_IPC_CREATE(RT_Object_Class_Event, _NRSYS_event_create, name, flag);
  201818:	d2800200 	mov	x0, #0x10                  	// #16
  20181c:	9400162b 	bl	2070c8 <malloc>
  201820:	f90017a0 	str	x0, [x29, #40]
  201824:	f94017a0 	ldr	x0, [x29, #40]
  201828:	f100001f 	cmp	x0, #0x0
  20182c:	54000061 	b.ne	201838 <rt_event_create+0x30>  // b.any
  201830:	d2800000 	mov	x0, #0x0                   	// #0
  201834:	14000015 	b	201888 <rt_event_create+0x80>
  201838:	39405fa0 	ldrb	w0, [x29, #23]
  20183c:	2a0003e2 	mov	w2, w0
  201840:	f9400fa1 	ldr	x1, [x29, #24]
  201844:	52800340 	mov	w0, #0x1a                  	// #26
  201848:	94000815 	bl	20389c <syscall>
  20184c:	aa0003e1 	mov	x1, x0
  201850:	f94017a0 	ldr	x0, [x29, #40]
  201854:	f9000401 	str	x1, [x0, #8]
  201858:	f94017a0 	ldr	x0, [x29, #40]
  20185c:	f9400400 	ldr	x0, [x0, #8]
  201860:	f100001f 	cmp	x0, #0x0
  201864:	540000a0 	b.eq	201878 <rt_event_create+0x70>  // b.none
  201868:	f94017a0 	ldr	x0, [x29, #40]
  20186c:	52800081 	mov	w1, #0x4                   	// #4
  201870:	b9000001 	str	w1, [x0]
  201874:	14000004 	b	201884 <rt_event_create+0x7c>
  201878:	f94017a0 	ldr	x0, [x29, #40]
  20187c:	940017a9 	bl	207720 <free>
  201880:	f90017bf 	str	xzr, [x29, #40]
  201884:	f94017a0 	ldr	x0, [x29, #40]
}
  201888:	a8c37bfd 	ldp	x29, x30, [sp], #48
  20188c:	d65f03c0 	ret

0000000000201890 <rt_event_init>:

rt_err_t rt_event_init(rt_event_t event, const char *name, rt_uint8_t flag)
{
  201890:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  201894:	910003fd 	mov	x29, sp
  201898:	f90017a0 	str	x0, [x29, #40]
  20189c:	f90013a1 	str	x1, [x29, #32]
  2018a0:	39007fa2 	strb	w2, [x29, #31]
    RT_USER_IPC_INIT(event, RT_Object_Class_Event, _NRSYS_event_create, name, flag);
  2018a4:	f94017a0 	ldr	x0, [x29, #40]
  2018a8:	f100001f 	cmp	x0, #0x0
  2018ac:	54000061 	b.ne	2018b8 <rt_event_init+0x28>  // b.any
  2018b0:	d2800100 	mov	x0, #0x8                   	// #8
  2018b4:	14000013 	b	201900 <rt_event_init+0x70>
  2018b8:	39407fa0 	ldrb	w0, [x29, #31]
  2018bc:	2a0003e2 	mov	w2, w0
  2018c0:	f94013a1 	ldr	x1, [x29, #32]
  2018c4:	52800340 	mov	w0, #0x1a                  	// #26
  2018c8:	940007f5 	bl	20389c <syscall>
  2018cc:	aa0003e1 	mov	x1, x0
  2018d0:	f94017a0 	ldr	x0, [x29, #40]
  2018d4:	f9000401 	str	x1, [x0, #8]
  2018d8:	f94017a0 	ldr	x0, [x29, #40]
  2018dc:	f9400400 	ldr	x0, [x0, #8]
  2018e0:	f100001f 	cmp	x0, #0x0
  2018e4:	540000c0 	b.eq	2018fc <rt_event_init+0x6c>  // b.none
  2018e8:	f94017a0 	ldr	x0, [x29, #40]
  2018ec:	52800081 	mov	w1, #0x4                   	// #4
  2018f0:	b9000001 	str	w1, [x0]
  2018f4:	d2800000 	mov	x0, #0x0                   	// #0
  2018f8:	14000002 	b	201900 <rt_event_init+0x70>
  2018fc:	d2800020 	mov	x0, #0x1                   	// #1
}
  201900:	a8c37bfd 	ldp	x29, x30, [sp], #48
  201904:	d65f03c0 	ret

0000000000201908 <rt_event_delete>:

rt_err_t rt_event_delete(rt_event_t event)
{
  201908:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  20190c:	910003fd 	mov	x29, sp
  201910:	f9000fa0 	str	x0, [x29, #24]
    RT_USER_IPC_DELETE(event, RT_Object_Class_Event, _NRSYS_event_delete);
  201914:	f9400fa0 	ldr	x0, [x29, #24]
  201918:	f100001f 	cmp	x0, #0x0
  20191c:	540000a0 	b.eq	201930 <rt_event_delete+0x28>  // b.none
  201920:	f9400fa0 	ldr	x0, [x29, #24]
  201924:	f9400400 	ldr	x0, [x0, #8]
  201928:	f100001f 	cmp	x0, #0x0
  20192c:	54000061 	b.ne	201938 <rt_event_delete+0x30>  // b.any
  201930:	d2800100 	mov	x0, #0x8                   	// #8
  201934:	14000015 	b	201988 <rt_event_delete+0x80>
  201938:	f9400fa0 	ldr	x0, [x29, #24]
  20193c:	b9400000 	ldr	w0, [x0]
  201940:	7100101f 	cmp	w0, #0x4
  201944:	54000060 	b.eq	201950 <rt_event_delete+0x48>  // b.none
  201948:	d2800100 	mov	x0, #0x8                   	// #8
  20194c:	1400000f 	b	201988 <rt_event_delete+0x80>
  201950:	f9400fa0 	ldr	x0, [x29, #24]
  201954:	f9400400 	ldr	x0, [x0, #8]
  201958:	aa0003e1 	mov	x1, x0
  20195c:	52800360 	mov	w0, #0x1b                  	// #27
  201960:	940007cf 	bl	20389c <syscall>
  201964:	f90017a0 	str	x0, [x29, #40]
  201968:	f94017a0 	ldr	x0, [x29, #40]
  20196c:	f100001f 	cmp	x0, #0x0
  201970:	54000060 	b.eq	20197c <rt_event_delete+0x74>  // b.none
  201974:	f94017a0 	ldr	x0, [x29, #40]
  201978:	14000004 	b	201988 <rt_event_delete+0x80>
  20197c:	f9400fa0 	ldr	x0, [x29, #24]
  201980:	94001768 	bl	207720 <free>
  201984:	d2800000 	mov	x0, #0x0                   	// #0
}
  201988:	a8c37bfd 	ldp	x29, x30, [sp], #48
  20198c:	d65f03c0 	ret

0000000000201990 <rt_event_detach>:

rt_err_t rt_event_detach(rt_event_t event)
{
  201990:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  201994:	910003fd 	mov	x29, sp
  201998:	f9000fa0 	str	x0, [x29, #24]
    RT_USER_IPC_DETACH(event, RT_Object_Class_Event, _NRSYS_event_delete);
  20199c:	f9400fa0 	ldr	x0, [x29, #24]
  2019a0:	f100001f 	cmp	x0, #0x0
  2019a4:	540000a0 	b.eq	2019b8 <rt_event_detach+0x28>  // b.none
  2019a8:	f9400fa0 	ldr	x0, [x29, #24]
  2019ac:	f9400400 	ldr	x0, [x0, #8]
  2019b0:	f100001f 	cmp	x0, #0x0
  2019b4:	54000061 	b.ne	2019c0 <rt_event_detach+0x30>  // b.any
  2019b8:	d2800100 	mov	x0, #0x8                   	// #8
  2019bc:	14000017 	b	201a18 <rt_event_detach+0x88>
  2019c0:	f9400fa0 	ldr	x0, [x29, #24]
  2019c4:	b9400000 	ldr	w0, [x0]
  2019c8:	7100101f 	cmp	w0, #0x4
  2019cc:	54000060 	b.eq	2019d8 <rt_event_detach+0x48>  // b.none
  2019d0:	d2800100 	mov	x0, #0x8                   	// #8
  2019d4:	14000011 	b	201a18 <rt_event_detach+0x88>
  2019d8:	f9400fa0 	ldr	x0, [x29, #24]
  2019dc:	f9400400 	ldr	x0, [x0, #8]
  2019e0:	aa0003e1 	mov	x1, x0
  2019e4:	52800360 	mov	w0, #0x1b                  	// #27
  2019e8:	940007ad 	bl	20389c <syscall>
  2019ec:	f90017a0 	str	x0, [x29, #40]
  2019f0:	f94017a0 	ldr	x0, [x29, #40]
  2019f4:	f100001f 	cmp	x0, #0x0
  2019f8:	54000060 	b.eq	201a04 <rt_event_detach+0x74>  // b.none
  2019fc:	f94017a0 	ldr	x0, [x29, #40]
  201a00:	14000006 	b	201a18 <rt_event_detach+0x88>
  201a04:	f9400fa0 	ldr	x0, [x29, #24]
  201a08:	b900001f 	str	wzr, [x0]
  201a0c:	f9400fa0 	ldr	x0, [x29, #24]
  201a10:	f900041f 	str	xzr, [x0, #8]
  201a14:	d2800000 	mov	x0, #0x0                   	// #0
}
  201a18:	a8c37bfd 	ldp	x29, x30, [sp], #48
  201a1c:	d65f03c0 	ret

0000000000201a20 <rt_event_send>:

rt_err_t rt_event_send(rt_event_t event, rt_uint32_t set)
{
  201a20:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201a24:	910003fd 	mov	x29, sp
  201a28:	f9000fa0 	str	x0, [x29, #24]
  201a2c:	b90017a1 	str	w1, [x29, #20]
    RT_USER_IPC_CHECK(event, RT_Object_Class_Event);
  201a30:	f9400fa0 	ldr	x0, [x29, #24]
  201a34:	f100001f 	cmp	x0, #0x0
  201a38:	540000a0 	b.eq	201a4c <rt_event_send+0x2c>  // b.none
  201a3c:	f9400fa0 	ldr	x0, [x29, #24]
  201a40:	f9400400 	ldr	x0, [x0, #8]
  201a44:	f100001f 	cmp	x0, #0x0
  201a48:	54000061 	b.ne	201a54 <rt_event_send+0x34>  // b.any
  201a4c:	d2800100 	mov	x0, #0x8                   	// #8
  201a50:	1400000d 	b	201a84 <rt_event_send+0x64>
  201a54:	f9400fa0 	ldr	x0, [x29, #24]
  201a58:	b9400000 	ldr	w0, [x0]
  201a5c:	7100101f 	cmp	w0, #0x4
  201a60:	54000060 	b.eq	201a6c <rt_event_send+0x4c>  // b.none
  201a64:	d2800100 	mov	x0, #0x8                   	// #8
  201a68:	14000007 	b	201a84 <rt_event_send+0x64>
    return syscall(_NRSYS_event_send, event->data, set);
  201a6c:	f9400fa0 	ldr	x0, [x29, #24]
  201a70:	f9400400 	ldr	x0, [x0, #8]
  201a74:	b94017a2 	ldr	w2, [x29, #20]
  201a78:	aa0003e1 	mov	x1, x0
  201a7c:	52800380 	mov	w0, #0x1c                  	// #28
  201a80:	94000787 	bl	20389c <syscall>
}
  201a84:	a8c27bfd 	ldp	x29, x30, [sp], #32
  201a88:	d65f03c0 	ret

0000000000201a8c <rt_event_recv>:
rt_err_t rt_event_recv(rt_event_t   event,
                       rt_uint32_t  set,
                       rt_uint8_t   opt,
                       rt_int32_t   timeout,
                       rt_uint32_t *recved)
{
  201a8c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  201a90:	910003fd 	mov	x29, sp
  201a94:	f90017a0 	str	x0, [x29, #40]
  201a98:	b90027a1 	str	w1, [x29, #36]
  201a9c:	39008fa2 	strb	w2, [x29, #35]
  201aa0:	b9001fa3 	str	w3, [x29, #28]
  201aa4:	f9000ba4 	str	x4, [x29, #16]
    RT_USER_IPC_CHECK(event, RT_Object_Class_Event);
  201aa8:	f94017a0 	ldr	x0, [x29, #40]
  201aac:	f100001f 	cmp	x0, #0x0
  201ab0:	540000a0 	b.eq	201ac4 <rt_event_recv+0x38>  // b.none
  201ab4:	f94017a0 	ldr	x0, [x29, #40]
  201ab8:	f9400400 	ldr	x0, [x0, #8]
  201abc:	f100001f 	cmp	x0, #0x0
  201ac0:	54000061 	b.ne	201acc <rt_event_recv+0x40>  // b.any
  201ac4:	d2800100 	mov	x0, #0x8                   	// #8
  201ac8:	14000011 	b	201b0c <rt_event_recv+0x80>
  201acc:	f94017a0 	ldr	x0, [x29, #40]
  201ad0:	b9400000 	ldr	w0, [x0]
  201ad4:	7100101f 	cmp	w0, #0x4
  201ad8:	54000060 	b.eq	201ae4 <rt_event_recv+0x58>  // b.none
  201adc:	d2800100 	mov	x0, #0x8                   	// #8
  201ae0:	1400000b 	b	201b0c <rt_event_recv+0x80>
    return syscall(_NRSYS_event_recv, event->data, set, opt, timeout, recved);
  201ae4:	f94017a0 	ldr	x0, [x29, #40]
  201ae8:	f9400400 	ldr	x0, [x0, #8]
  201aec:	39408fa1 	ldrb	w1, [x29, #35]
  201af0:	f9400ba5 	ldr	x5, [x29, #16]
  201af4:	b9401fa4 	ldr	w4, [x29, #28]
  201af8:	2a0103e3 	mov	w3, w1
  201afc:	b94027a2 	ldr	w2, [x29, #36]
  201b00:	aa0003e1 	mov	x1, x0
  201b04:	528003a0 	mov	w0, #0x1d                  	// #29
  201b08:	94000765 	bl	20389c <syscall>
}
  201b0c:	a8c37bfd 	ldp	x29, x30, [sp], #48
  201b10:	d65f03c0 	ret

0000000000201b14 <rt_tick_get>:

rt_tick_t rt_tick_get(void)
{
  201b14:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  201b18:	910003fd 	mov	x29, sp
    return (rt_tick_t)syscall(_NRSYS_rt_tick_get);
  201b1c:	52800c20 	mov	w0, #0x61                  	// #97
  201b20:	9400075f 	bl	20389c <syscall>
}
  201b24:	a8c17bfd 	ldp	x29, x30, [sp], #16
  201b28:	d65f03c0 	ret

0000000000201b2c <rt_thread_mdelay>:

rt_err_t rt_thread_mdelay(rt_int32_t ms)
{
  201b2c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201b30:	910003fd 	mov	x29, sp
  201b34:	b9001fa0 	str	w0, [x29, #28]
    return (rt_err_t)syscall(_NRSYS_rt_thread_mdelay, ms);
  201b38:	b9401fa1 	ldr	w1, [x29, #28]
  201b3c:	52800cc0 	mov	w0, #0x66                  	// #102
  201b40:	94000757 	bl	20389c <syscall>
}
  201b44:	a8c27bfd 	ldp	x29, x30, [sp], #32
  201b48:	d65f03c0 	ret

0000000000201b4c <lwp_shmget>:

int lwp_shmget(size_t key, size_t size, int create)
{
  201b4c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  201b50:	910003fd 	mov	x29, sp
  201b54:	f90017a0 	str	x0, [x29, #40]
  201b58:	f90013a1 	str	x1, [x29, #32]
  201b5c:	b9001fa2 	str	w2, [x29, #28]
    return (int)syscall(_NRSYS_shmget, key, size, create);
  201b60:	b9401fa3 	ldr	w3, [x29, #28]
  201b64:	f94013a2 	ldr	x2, [x29, #32]
  201b68:	f94017a1 	ldr	x1, [x29, #40]
  201b6c:	528006e0 	mov	w0, #0x37                  	// #55
  201b70:	9400074b 	bl	20389c <syscall>
}
  201b74:	a8c37bfd 	ldp	x29, x30, [sp], #48
  201b78:	d65f03c0 	ret

0000000000201b7c <lwp_shmrm>:

int lwp_shmrm(int id)
{
  201b7c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201b80:	910003fd 	mov	x29, sp
  201b84:	b9001fa0 	str	w0, [x29, #28]
    return (int)syscall(_NRSYS_shmrm, id);
  201b88:	b9401fa1 	ldr	w1, [x29, #28]
  201b8c:	52800700 	mov	w0, #0x38                  	// #56
  201b90:	94000743 	bl	20389c <syscall>
}
  201b94:	a8c27bfd 	ldp	x29, x30, [sp], #32
  201b98:	d65f03c0 	ret

0000000000201b9c <lwp_shmat>:

void* lwp_shmat(int id, void* shm_vaddr)
{
  201b9c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201ba0:	910003fd 	mov	x29, sp
  201ba4:	b9001fa0 	str	w0, [x29, #28]
  201ba8:	f9000ba1 	str	x1, [x29, #16]
    return (void*)syscall(_NRSYS_shmat, id, shm_vaddr);
  201bac:	f9400ba2 	ldr	x2, [x29, #16]
  201bb0:	b9401fa1 	ldr	w1, [x29, #28]
  201bb4:	52800720 	mov	w0, #0x39                  	// #57
  201bb8:	94000739 	bl	20389c <syscall>
}
  201bbc:	a8c27bfd 	ldp	x29, x30, [sp], #32
  201bc0:	d65f03c0 	ret

0000000000201bc4 <lwp_shmdt>:

int lwp_shmdt(void* shm_vaddr)
{
  201bc4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201bc8:	910003fd 	mov	x29, sp
  201bcc:	f9000fa0 	str	x0, [x29, #24]
    return (int)syscall(_NRSYS_shmdt, shm_vaddr);
  201bd0:	f9400fa1 	ldr	x1, [x29, #24]
  201bd4:	52800740 	mov	w0, #0x3a                  	// #58
  201bd8:	94000731 	bl	20389c <syscall>
}
  201bdc:	a8c27bfd 	ldp	x29, x30, [sp], #32
  201be0:	d65f03c0 	ret

0000000000201be4 <exec>:

int exec(char *filename, int argc, char **argv, char **envp)
{
  201be4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  201be8:	910003fd 	mov	x29, sp
  201bec:	f90017a0 	str	x0, [x29, #40]
  201bf0:	b90027a1 	str	w1, [x29, #36]
  201bf4:	f9000fa2 	str	x2, [x29, #24]
  201bf8:	f9000ba3 	str	x3, [x29, #16]
    return (int)syscall(_NRSYS_exec, filename, argc, argv, envp);
  201bfc:	f9400ba4 	ldr	x4, [x29, #16]
  201c00:	f9400fa3 	ldr	x3, [x29, #24]
  201c04:	b94027a2 	ldr	w2, [x29, #36]
  201c08:	f94017a1 	ldr	x1, [x29, #40]
  201c0c:	528001a0 	mov	w0, #0xd                   	// #13
  201c10:	94000723 	bl	20389c <syscall>
}
  201c14:	a8c37bfd 	ldp	x29, x30, [sp], #48
  201c18:	d65f03c0 	ret

0000000000201c1c <lwp_kill>:

int lwp_kill(pid_t pid, int sig)
{
  201c1c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201c20:	910003fd 	mov	x29, sp
  201c24:	b9001fa0 	str	w0, [x29, #28]
  201c28:	b9001ba1 	str	w1, [x29, #24]
    return (int)syscall(_NRSYS_kill, pid, sig);
  201c2c:	b9401ba2 	ldr	w2, [x29, #24]
  201c30:	b9401fa1 	ldr	w1, [x29, #28]
  201c34:	528001c0 	mov	w0, #0xe                   	// #14
  201c38:	94000719 	bl	20389c <syscall>
}
  201c3c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  201c40:	d65f03c0 	ret

0000000000201c44 <lwp_tkill>:

int lwp_tkill(int tid, int sig)
{
  201c44:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201c48:	910003fd 	mov	x29, sp
  201c4c:	b9001fa0 	str	w0, [x29, #28]
  201c50:	b9001ba1 	str	w1, [x29, #24]
    return (int)syscall(_NRSYS_tkill, tid, sig);
  201c54:	b9401ba2 	ldr	w2, [x29, #24]
  201c58:	b9401fa1 	ldr	w1, [x29, #28]
  201c5c:	52800d20 	mov	w0, #0x69                  	// #105
  201c60:	9400070f 	bl	20389c <syscall>
}
  201c64:	a8c27bfd 	ldp	x29, x30, [sp], #32
  201c68:	d65f03c0 	ret

0000000000201c6c <waitpid>:

pid_t waitpid(pid_t pid, int *status, int options)
{
  201c6c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201c70:	910003fd 	mov	x29, sp
  201c74:	b9001fa0 	str	w0, [x29, #28]
  201c78:	f9000ba1 	str	x1, [x29, #16]
  201c7c:	b9001ba2 	str	w2, [x29, #24]
    return (int)syscall(_NRSYS_waitpid, pid, status, options);
  201c80:	b9401ba3 	ldr	w3, [x29, #24]
  201c84:	f9400ba2 	ldr	x2, [x29, #16]
  201c88:	b9401fa1 	ldr	w1, [x29, #28]
  201c8c:	52800dc0 	mov	w0, #0x6e                  	// #110
  201c90:	94000703 	bl	20389c <syscall>
}
  201c94:	a8c27bfd 	ldp	x29, x30, [sp], #32
  201c98:	d65f03c0 	ret

0000000000201c9c <rt_get_errno>:

rt_err_t rt_get_errno(void)
{
  201c9c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  201ca0:	910003fd 	mov	x29, sp
    return (rt_err_t)syscall(_NRSYS_rt_get_errno);
  201ca4:	52800f40 	mov	w0, #0x7a                  	// #122
  201ca8:	940006fd 	bl	20389c <syscall>
}
  201cac:	a8c17bfd 	ldp	x29, x30, [sp], #16
  201cb0:	d65f03c0 	ret

0000000000201cb4 <rt_thread_find>:
#include <pthread.h>

void __pthread_init_run(void (*enter)(void *parameter), void *parameter);

rt_thread_t rt_thread_find(char *name)
{
  201cb4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201cb8:	910003fd 	mov	x29, sp
  201cbc:	f9000fa0 	str	x0, [x29, #24]
    return (rt_thread_t)syscall(_NRSYS_rt_thread_find, name);
  201cc0:	f9400fa1 	ldr	x1, [x29, #24]
  201cc4:	52800880 	mov	w0, #0x44                  	// #68
  201cc8:	940006f5 	bl	20389c <syscall>
}
  201ccc:	a8c27bfd 	ldp	x29, x30, [sp], #32
  201cd0:	d65f03c0 	ret

0000000000201cd4 <rt_thread_user_entry>:
    void (*entry)(void *parameter);
    void *parameter;
};

static void rt_thread_user_entry(void *arg)
{
  201cd4:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  201cd8:	910003fd 	mov	x29, sp
  201cdc:	f9000fa0 	str	x0, [x29, #24]
    struct rt_thread_startup_ucontext *ucontext;
    void (*entry)(void *parameter);
    void *parameter;

    ucontext = (struct rt_thread_startup_ucontext *)arg;
  201ce0:	f9400fa0 	ldr	x0, [x29, #24]
  201ce4:	f9001fa0 	str	x0, [x29, #56]
    entry = ucontext->entry;
  201ce8:	f9401fa0 	ldr	x0, [x29, #56]
  201cec:	f9400000 	ldr	x0, [x0]
  201cf0:	f9001ba0 	str	x0, [x29, #48]
    parameter = ucontext->parameter;
  201cf4:	f9401fa0 	ldr	x0, [x29, #56]
  201cf8:	f9400400 	ldr	x0, [x0, #8]
  201cfc:	f90017a0 	str	x0, [x29, #40]
    rt_free(ucontext);
  201d00:	f9401fa0 	ldr	x0, [x29, #56]
  201d04:	94000373 	bl	202ad0 <rt_free>

    __pthread_init_run(entry, parameter);
  201d08:	f94017a1 	ldr	x1, [x29, #40]
  201d0c:	f9401ba0 	ldr	x0, [x29, #48]
  201d10:	940029d6 	bl	20c468 <__pthread_init_run>
}
  201d14:	d503201f 	nop
  201d18:	a8c47bfd 	ldp	x29, x30, [sp], #64
  201d1c:	d65f03c0 	ret

0000000000201d20 <rt_thread_create>:
        void (*entry)(void *parameter),
        void       *parameter,
        rt_uint32_t stack_size,
        rt_uint8_t  priority,
        rt_uint32_t tick)
{
  201d20:	a9b87bfd 	stp	x29, x30, [sp, #-128]!
  201d24:	910003fd 	mov	x29, sp
  201d28:	f9001fa0 	str	x0, [x29, #56]
  201d2c:	f9001ba1 	str	x1, [x29, #48]
  201d30:	f90017a2 	str	x2, [x29, #40]
  201d34:	b90027a3 	str	w3, [x29, #36]
  201d38:	39008fa4 	strb	w4, [x29, #35]
  201d3c:	b9001fa5 	str	w5, [x29, #28]
    rt_thread_t thread;
    void * arg[] = {(void *)name, (void*)entry, (void*)parameter, (void*)(size_t)stack_size, (void*)(size_t)priority, (void*)(size_t)tick};
  201d40:	f9401fa0 	ldr	x0, [x29, #56]
  201d44:	f90023a0 	str	x0, [x29, #64]
  201d48:	f9401ba0 	ldr	x0, [x29, #48]
  201d4c:	f90027a0 	str	x0, [x29, #72]
  201d50:	f94017a0 	ldr	x0, [x29, #40]
  201d54:	f9002ba0 	str	x0, [x29, #80]
  201d58:	b94027a0 	ldr	w0, [x29, #36]
  201d5c:	f9002fa0 	str	x0, [x29, #88]
  201d60:	39408fa0 	ldrb	w0, [x29, #35]
  201d64:	f90033a0 	str	x0, [x29, #96]
  201d68:	b9401fa0 	ldr	w0, [x29, #28]
  201d6c:	f90037a0 	str	x0, [x29, #104]
    struct rt_thread_startup_ucontext *ucontext;

    ucontext = rt_malloc(sizeof *ucontext);
  201d70:	d2800200 	mov	x0, #0x10                  	// #16
  201d74:	94000350 	bl	202ab4 <rt_malloc>
  201d78:	f9003fa0 	str	x0, [x29, #120]
    if (!ucontext)
  201d7c:	f9403fa0 	ldr	x0, [x29, #120]
  201d80:	f100001f 	cmp	x0, #0x0
  201d84:	54000061 	b.ne	201d90 <rt_thread_create+0x70>  // b.any
    {
        return RT_NULL;
  201d88:	d2800000 	mov	x0, #0x0                   	// #0
  201d8c:	14000017 	b	201de8 <rt_thread_create+0xc8>
    }
    ucontext->entry = entry;
  201d90:	f9403fa0 	ldr	x0, [x29, #120]
  201d94:	f9401ba1 	ldr	x1, [x29, #48]
  201d98:	f9000001 	str	x1, [x0]
    ucontext->parameter = parameter;
  201d9c:	f9403fa0 	ldr	x0, [x29, #120]
  201da0:	f94017a1 	ldr	x1, [x29, #40]
  201da4:	f9000401 	str	x1, [x0, #8]
    arg[1] = rt_thread_user_entry;
  201da8:	90000000 	adrp	x0, 201000 <rt_sem_detach+0x84>
  201dac:	91335000 	add	x0, x0, #0xcd4
  201db0:	f90027a0 	str	x0, [x29, #72]
    arg[2] = ucontext;
  201db4:	f9403fa0 	ldr	x0, [x29, #120]
  201db8:	f9002ba0 	str	x0, [x29, #80]

    thread = (rt_thread_t)syscall(_NRSYS_thread_create, arg);
  201dbc:	910103a0 	add	x0, x29, #0x40
  201dc0:	aa0003e1 	mov	x1, x0
  201dc4:	52800500 	mov	w0, #0x28                  	// #40
  201dc8:	940006b5 	bl	20389c <syscall>
  201dcc:	f9003ba0 	str	x0, [x29, #112]
    if (!thread)
  201dd0:	f9403ba0 	ldr	x0, [x29, #112]
  201dd4:	f100001f 	cmp	x0, #0x0
  201dd8:	54000061 	b.ne	201de4 <rt_thread_create+0xc4>  // b.any
    {
        rt_free(ucontext);
  201ddc:	f9403fa0 	ldr	x0, [x29, #120]
  201de0:	9400033c 	bl	202ad0 <rt_free>
    }
    return thread;
  201de4:	f9403ba0 	ldr	x0, [x29, #112]
}
  201de8:	a8c87bfd 	ldp	x29, x30, [sp], #128
  201dec:	d65f03c0 	ret

0000000000201df0 <rt_thread_startup>:

rt_err_t rt_thread_startup(rt_thread_t thread)
{
  201df0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201df4:	910003fd 	mov	x29, sp
  201df8:	f9000fa0 	str	x0, [x29, #24]
    return syscall(_NRSYS_thread_startup, thread);
  201dfc:	f9400fa1 	ldr	x1, [x29, #24]
  201e00:	52800540 	mov	w0, #0x2a                  	// #42
  201e04:	940006a6 	bl	20389c <syscall>
}
  201e08:	a8c27bfd 	ldp	x29, x30, [sp], #32
  201e0c:	d65f03c0 	ret

0000000000201e10 <rt_thread_self>:

rt_thread_t rt_thread_self(void)
{
  201e10:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  201e14:	910003fd 	mov	x29, sp
    return (rt_thread_t)syscall(_NRSYS_thread_self);
  201e18:	52800560 	mov	w0, #0x2b                  	// #43
  201e1c:	940006a0 	bl	20389c <syscall>
}
  201e20:	a8c17bfd 	ldp	x29, x30, [sp], #16
  201e24:	d65f03c0 	ret

0000000000201e28 <rt_thread_delete>:

rt_err_t rt_thread_delete(rt_thread_t thread)
{
  201e28:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201e2c:	910003fd 	mov	x29, sp
  201e30:	f9000fa0 	str	x0, [x29, #24]
    return syscall(_NRSYS_thread_delete, thread);
  201e34:	f9400fa1 	ldr	x1, [x29, #24]
  201e38:	52800520 	mov	w0, #0x29                  	// #41
  201e3c:	94000698 	bl	20389c <syscall>
}
  201e40:	a8c27bfd 	ldp	x29, x30, [sp], #32
  201e44:	d65f03c0 	ret

0000000000201e48 <rt_enter_critical>:

void rt_enter_critical(void)
{
  201e48:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  201e4c:	910003fd 	mov	x29, sp
    syscall(_NRSYS_enter_critical);
  201e50:	52800640 	mov	w0, #0x32                  	// #50
  201e54:	94000692 	bl	20389c <syscall>
}
  201e58:	d503201f 	nop
  201e5c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  201e60:	d65f03c0 	ret

0000000000201e64 <rt_exit_critical>:

void rt_exit_critical(void)
{
  201e64:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  201e68:	910003fd 	mov	x29, sp
    syscall(_NRSYS_exit_critical);
  201e6c:	52800660 	mov	w0, #0x33                  	// #51
  201e70:	9400068b 	bl	20389c <syscall>
}
  201e74:	d503201f 	nop
  201e78:	a8c17bfd 	ldp	x29, x30, [sp], #16
  201e7c:	d65f03c0 	ret

0000000000201e80 <cacheflush>:

int cacheflush(void *addr, int size, int cache)
{
  201e80:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  201e84:	910003fd 	mov	x29, sp
  201e88:	f9000fa0 	str	x0, [x29, #24]
  201e8c:	b90017a1 	str	w1, [x29, #20]
  201e90:	b90013a2 	str	w2, [x29, #16]
    return syscall(_NRSYS_cacheflush, addr, size, cache);
  201e94:	b94013a3 	ldr	w3, [x29, #16]
  201e98:	b94017a2 	ldr	w2, [x29, #20]
  201e9c:	f9400fa1 	ldr	x1, [x29, #24]
  201ea0:	52800d60 	mov	w0, #0x6b                  	// #107
  201ea4:	9400067e 	bl	20389c <syscall>
}
  201ea8:	a8c27bfd 	ldp	x29, x30, [sp], #32
  201eac:	d65f03c0 	ret

0000000000201eb0 <rt_list_init>:
 * @brief initialize a list
 *
 * @param l list to be initialized
 */
rt_inline void rt_list_init(rt_list_t *l)
{
  201eb0:	d10043ff 	sub	sp, sp, #0x10
  201eb4:	f90007e0 	str	x0, [sp, #8]
    l->next = l->prev = l;
  201eb8:	f94007e0 	ldr	x0, [sp, #8]
  201ebc:	f94007e1 	ldr	x1, [sp, #8]
  201ec0:	f9000401 	str	x1, [x0, #8]
  201ec4:	f94007e0 	ldr	x0, [sp, #8]
  201ec8:	f9400401 	ldr	x1, [x0, #8]
  201ecc:	f94007e0 	ldr	x0, [sp, #8]
  201ed0:	f9000001 	str	x1, [x0]
}
  201ed4:	d503201f 	nop
  201ed8:	910043ff 	add	sp, sp, #0x10
  201edc:	d65f03c0 	ret

0000000000201ee0 <rt_list_insert_after>:
 *
 * @param l list to insert it
 * @param n new node to be inserted
 */
rt_inline void rt_list_insert_after(rt_list_t *l, rt_list_t *n)
{
  201ee0:	d10043ff 	sub	sp, sp, #0x10
  201ee4:	f90007e0 	str	x0, [sp, #8]
  201ee8:	f90003e1 	str	x1, [sp]
    l->next->prev = n;
  201eec:	f94007e0 	ldr	x0, [sp, #8]
  201ef0:	f9400000 	ldr	x0, [x0]
  201ef4:	f94003e1 	ldr	x1, [sp]
  201ef8:	f9000401 	str	x1, [x0, #8]
    n->next = l->next;
  201efc:	f94007e0 	ldr	x0, [sp, #8]
  201f00:	f9400001 	ldr	x1, [x0]
  201f04:	f94003e0 	ldr	x0, [sp]
  201f08:	f9000001 	str	x1, [x0]

    l->next = n;
  201f0c:	f94007e0 	ldr	x0, [sp, #8]
  201f10:	f94003e1 	ldr	x1, [sp]
  201f14:	f9000001 	str	x1, [x0]
    n->prev = l;
  201f18:	f94003e0 	ldr	x0, [sp]
  201f1c:	f94007e1 	ldr	x1, [sp, #8]
  201f20:	f9000401 	str	x1, [x0, #8]
}
  201f24:	d503201f 	nop
  201f28:	910043ff 	add	sp, sp, #0x10
  201f2c:	d65f03c0 	ret

0000000000201f30 <rt_list_remove>:
/**
 * @brief remove node from list.
 * @param n the node to remove from the list.
 */
rt_inline void rt_list_remove(rt_list_t *n)
{
  201f30:	d10043ff 	sub	sp, sp, #0x10
  201f34:	f90007e0 	str	x0, [sp, #8]
    n->next->prev = n->prev;
  201f38:	f94007e0 	ldr	x0, [sp, #8]
  201f3c:	f9400000 	ldr	x0, [x0]
  201f40:	f94007e1 	ldr	x1, [sp, #8]
  201f44:	f9400421 	ldr	x1, [x1, #8]
  201f48:	f9000401 	str	x1, [x0, #8]
    n->prev->next = n->next;
  201f4c:	f94007e0 	ldr	x0, [sp, #8]
  201f50:	f9400400 	ldr	x0, [x0, #8]
  201f54:	f94007e1 	ldr	x1, [sp, #8]
  201f58:	f9400021 	ldr	x1, [x1]
  201f5c:	f9000001 	str	x1, [x0]

    n->next = n->prev = n;
  201f60:	f94007e0 	ldr	x0, [sp, #8]
  201f64:	f94007e1 	ldr	x1, [sp, #8]
  201f68:	f9000401 	str	x1, [x0, #8]
  201f6c:	f94007e0 	ldr	x0, [sp, #8]
  201f70:	f9400401 	ldr	x1, [x0, #8]
  201f74:	f94007e0 	ldr	x0, [sp, #8]
  201f78:	f9000001 	str	x1, [x0]
}
  201f7c:	d503201f 	nop
  201f80:	910043ff 	add	sp, sp, #0x10
  201f84:	d65f03c0 	ret

0000000000201f88 <rt_list_isempty>:
/**
 * @brief tests whether a list is empty
 * @param l the list to test.
 */
rt_inline int rt_list_isempty(const rt_list_t *l)
{
  201f88:	d10043ff 	sub	sp, sp, #0x10
  201f8c:	f90007e0 	str	x0, [sp, #8]
    return l->next == l;
  201f90:	f94007e0 	ldr	x0, [sp, #8]
  201f94:	f9400000 	ldr	x0, [x0]
  201f98:	f94007e1 	ldr	x1, [sp, #8]
  201f9c:	eb00003f 	cmp	x1, x0
  201fa0:	1a9f17e0 	cset	w0, eq  // eq = none
  201fa4:	12001c00 	and	w0, w0, #0xff
}
  201fa8:	910043ff 	add	sp, sp, #0x10
  201fac:	d65f03c0 	ret

0000000000201fb0 <_rt_timer_init>:
static void _rt_timer_init(rt_timer_t timer,
                           void (*timeout)(void *parameter),
                           void      *parameter,
                           rt_tick_t  time,
                           rt_uint8_t flag)
{
  201fb0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  201fb4:	910003fd 	mov	x29, sp
  201fb8:	f90017a0 	str	x0, [x29, #40]
  201fbc:	f90013a1 	str	x1, [x29, #32]
  201fc0:	f9000fa2 	str	x2, [x29, #24]
  201fc4:	b90017a3 	str	w3, [x29, #20]
  201fc8:	39004fa4 	strb	w4, [x29, #19]
    int i;

    /* set flag */
    timer->parent.flag  = flag;
  201fcc:	f94017a0 	ldr	x0, [x29, #40]
  201fd0:	39404fa1 	ldrb	w1, [x29, #19]
  201fd4:	39002401 	strb	w1, [x0, #9]

    /* set deactivated */
    timer->parent.flag &= ~RT_TIMER_FLAG_ACTIVATED;
  201fd8:	f94017a0 	ldr	x0, [x29, #40]
  201fdc:	39402400 	ldrb	w0, [x0, #9]
  201fe0:	121f7800 	and	w0, w0, #0xfffffffe
  201fe4:	12001c01 	and	w1, w0, #0xff
  201fe8:	f94017a0 	ldr	x0, [x29, #40]
  201fec:	39002401 	strb	w1, [x0, #9]

    timer->timeout_func = timeout;
  201ff0:	f94017a0 	ldr	x0, [x29, #40]
  201ff4:	f94013a1 	ldr	x1, [x29, #32]
  201ff8:	f9001801 	str	x1, [x0, #48]
    timer->parameter    = parameter;
  201ffc:	f94017a0 	ldr	x0, [x29, #40]
  202000:	f9400fa1 	ldr	x1, [x29, #24]
  202004:	f9001c01 	str	x1, [x0, #56]

    timer->timeout_tick = 0;
  202008:	f94017a0 	ldr	x0, [x29, #40]
  20200c:	b900441f 	str	wzr, [x0, #68]
    timer->init_tick    = time;
  202010:	f94017a0 	ldr	x0, [x29, #40]
  202014:	b94017a1 	ldr	w1, [x29, #20]
  202018:	b9004001 	str	w1, [x0, #64]

    /* initialize timer list */
    for (i = 0; i < RT_TIMER_SKIP_LIST_LEVEL; i++)
  20201c:	b9003fbf 	str	wzr, [x29, #60]
  202020:	1400000a 	b	202048 <_rt_timer_init+0x98>
    {
        rt_list_init(&(timer->row[i]));
  202024:	b9803fa0 	ldrsw	x0, [x29, #60]
  202028:	91000800 	add	x0, x0, #0x2
  20202c:	d37cec00 	lsl	x0, x0, #4
  202030:	f94017a1 	ldr	x1, [x29, #40]
  202034:	8b000020 	add	x0, x1, x0
  202038:	97ffff9e 	bl	201eb0 <rt_list_init>
    for (i = 0; i < RT_TIMER_SKIP_LIST_LEVEL; i++)
  20203c:	b9403fa0 	ldr	w0, [x29, #60]
  202040:	11000400 	add	w0, w0, #0x1
  202044:	b9003fa0 	str	w0, [x29, #60]
  202048:	b9403fa0 	ldr	w0, [x29, #60]
  20204c:	7100001f 	cmp	w0, #0x0
  202050:	54fffead 	b.le	202024 <_rt_timer_init+0x74>
    }
}
  202054:	d503201f 	nop
  202058:	a8c47bfd 	ldp	x29, x30, [sp], #64
  20205c:	d65f03c0 	ret

0000000000202060 <rt_timer_list_next_timeout>:

/* the fist timer always in the last row */
static rt_tick_t rt_timer_list_next_timeout(rt_list_t timer_list[])
{
  202060:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  202064:	910003fd 	mov	x29, sp
  202068:	f9000fa0 	str	x0, [x29, #24]
    struct rt_timer *timer;

    if (rt_list_isempty(&timer_list[RT_TIMER_SKIP_LIST_LEVEL - 1]))
  20206c:	f9400fa0 	ldr	x0, [x29, #24]
  202070:	97ffffc6 	bl	201f88 <rt_list_isempty>
  202074:	7100001f 	cmp	w0, #0x0
  202078:	54000060 	b.eq	202084 <rt_timer_list_next_timeout+0x24>  // b.none
        return RT_TICK_MAX;
  20207c:	12800000 	mov	w0, #0xffffffff            	// #-1
  202080:	14000007 	b	20209c <rt_timer_list_next_timeout+0x3c>

    timer = rt_list_entry(timer_list[RT_TIMER_SKIP_LIST_LEVEL - 1].next,
  202084:	f9400fa0 	ldr	x0, [x29, #24]
  202088:	f9400000 	ldr	x0, [x0]
  20208c:	d1008000 	sub	x0, x0, #0x20
  202090:	f90017a0 	str	x0, [x29, #40]
                          struct rt_timer, row[RT_TIMER_SKIP_LIST_LEVEL - 1]);

    return timer->timeout_tick;
  202094:	f94017a0 	ldr	x0, [x29, #40]
  202098:	b9404400 	ldr	w0, [x0, #68]
}
  20209c:	a8c37bfd 	ldp	x29, x30, [sp], #48
  2020a0:	d65f03c0 	ret

00000000002020a4 <_rt_timer_remove>:

rt_inline void _rt_timer_remove(rt_timer_t timer)
{
  2020a4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  2020a8:	910003fd 	mov	x29, sp
  2020ac:	f9000fa0 	str	x0, [x29, #24]
    int i;

    for (i = 0; i < RT_TIMER_SKIP_LIST_LEVEL; i++)
  2020b0:	b9002fbf 	str	wzr, [x29, #44]
  2020b4:	1400000a 	b	2020dc <_rt_timer_remove+0x38>
    {
        rt_list_remove(&timer->row[i]);
  2020b8:	b9802fa0 	ldrsw	x0, [x29, #44]
  2020bc:	91000800 	add	x0, x0, #0x2
  2020c0:	d37cec00 	lsl	x0, x0, #4
  2020c4:	f9400fa1 	ldr	x1, [x29, #24]
  2020c8:	8b000020 	add	x0, x1, x0
  2020cc:	97ffff99 	bl	201f30 <rt_list_remove>
    for (i = 0; i < RT_TIMER_SKIP_LIST_LEVEL; i++)
  2020d0:	b9402fa0 	ldr	w0, [x29, #44]
  2020d4:	11000400 	add	w0, w0, #0x1
  2020d8:	b9002fa0 	str	w0, [x29, #44]
  2020dc:	b9402fa0 	ldr	w0, [x29, #44]
  2020e0:	7100001f 	cmp	w0, #0x0
  2020e4:	54fffead 	b.le	2020b8 <_rt_timer_remove+0x14>
    }
}
  2020e8:	d503201f 	nop
  2020ec:	a8c37bfd 	ldp	x29, x30, [sp], #48
  2020f0:	d65f03c0 	ret

00000000002020f4 <rt_timer_init>:
                   const char *name,
                   void (*timeout)(void *parameter),
                   void       *parameter,
                   rt_tick_t   time,
                   rt_uint8_t  flag)
{
  2020f4:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  2020f8:	910003fd 	mov	x29, sp
  2020fc:	f9001fa0 	str	x0, [x29, #56]
  202100:	f9001ba1 	str	x1, [x29, #48]
  202104:	f90017a2 	str	x2, [x29, #40]
  202108:	f90013a3 	str	x3, [x29, #32]
  20210c:	b9001fa4 	str	w4, [x29, #28]
  202110:	39006fa5 	strb	w5, [x29, #27]
    _rt_timer_init(timer, timeout, parameter, time, flag);
  202114:	39406fa4 	ldrb	w4, [x29, #27]
  202118:	b9401fa3 	ldr	w3, [x29, #28]
  20211c:	f94013a2 	ldr	x2, [x29, #32]
  202120:	f94017a1 	ldr	x1, [x29, #40]
  202124:	f9401fa0 	ldr	x0, [x29, #56]
  202128:	97ffffa2 	bl	201fb0 <_rt_timer_init>
}
  20212c:	d503201f 	nop
  202130:	a8c47bfd 	ldp	x29, x30, [sp], #64
  202134:	d65f03c0 	ret

0000000000202138 <rt_timer_detach>:
 * @param timer the static timer object
 *
 * @return the operation status, RT_EOK on OK; RT_ERROR on error
 */
rt_err_t rt_timer_detach(rt_timer_t timer)
{
  202138:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  20213c:	910003fd 	mov	x29, sp
  202140:	f9000fa0 	str	x0, [x29, #24]

    /* make sure take mutex */
    while(rt_mutex_take(mutex, RT_WAITING_FOREVER) != RT_EOK);
  202144:	d503201f 	nop
  202148:	f0000080 	adrp	x0, 215000 <__data_start__>
  20214c:	91092000 	add	x0, x0, #0x248
  202150:	f9400000 	ldr	x0, [x0]
  202154:	12800001 	mov	w1, #0xffffffff            	// #-1
  202158:	97fffaef 	bl	200d14 <rt_mutex_take>
  20215c:	f100001f 	cmp	x0, #0x0
  202160:	54ffff41 	b.ne	202148 <rt_timer_detach+0x10>  // b.any

    _rt_timer_remove(timer);
  202164:	f9400fa0 	ldr	x0, [x29, #24]
  202168:	97ffffcf 	bl	2020a4 <_rt_timer_remove>

    /* release mutex */
    rt_mutex_release(mutex);
  20216c:	f0000080 	adrp	x0, 215000 <__data_start__>
  202170:	91092000 	add	x0, x0, #0x248
  202174:	f9400000 	ldr	x0, [x0]
  202178:	97fffb02 	bl	200d80 <rt_mutex_release>

    return RT_EOK;
  20217c:	d2800000 	mov	x0, #0x0                   	// #0
}
  202180:	a8c27bfd 	ldp	x29, x30, [sp], #32
  202184:	d65f03c0 	ret

0000000000202188 <rt_timer_create>:
rt_timer_t rt_timer_create(const char *name,
                           void (*timeout)(void *parameter),
                           void       *parameter,
                           rt_tick_t   time,
                           rt_uint8_t  flag)
{
  202188:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  20218c:	910003fd 	mov	x29, sp
  202190:	f90017a0 	str	x0, [x29, #40]
  202194:	f90013a1 	str	x1, [x29, #32]
  202198:	f9000fa2 	str	x2, [x29, #24]
  20219c:	b90017a3 	str	w3, [x29, #20]
  2021a0:	39004fa4 	strb	w4, [x29, #19]
    struct rt_timer *timer;

    /* allocate a timer object */
    timer = (struct rt_timer *)malloc(sizeof(struct rt_timer));
  2021a4:	d2800900 	mov	x0, #0x48                  	// #72
  2021a8:	940013c8 	bl	2070c8 <malloc>
  2021ac:	f9001fa0 	str	x0, [x29, #56]
    if (timer == RT_NULL)
  2021b0:	f9401fa0 	ldr	x0, [x29, #56]
  2021b4:	f100001f 	cmp	x0, #0x0
  2021b8:	54000061 	b.ne	2021c4 <rt_timer_create+0x3c>  // b.any
    {
        return RT_NULL;
  2021bc:	d2800000 	mov	x0, #0x0                   	// #0
  2021c0:	14000008 	b	2021e0 <rt_timer_create+0x58>
    }

    _rt_timer_init(timer, timeout, parameter, time, flag);
  2021c4:	39404fa4 	ldrb	w4, [x29, #19]
  2021c8:	b94017a3 	ldr	w3, [x29, #20]
  2021cc:	f9400fa2 	ldr	x2, [x29, #24]
  2021d0:	f94013a1 	ldr	x1, [x29, #32]
  2021d4:	f9401fa0 	ldr	x0, [x29, #56]
  2021d8:	97ffff76 	bl	201fb0 <_rt_timer_init>

    return timer;
  2021dc:	f9401fa0 	ldr	x0, [x29, #56]
}
  2021e0:	a8c47bfd 	ldp	x29, x30, [sp], #64
  2021e4:	d65f03c0 	ret

00000000002021e8 <rt_timer_delete>:
 * @param timer the timer to be deleted
 *
 * @return the operation status, RT_EOK on OK; RT_ERROR on error
 */
rt_err_t rt_timer_delete(rt_timer_t timer)
{
  2021e8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  2021ec:	910003fd 	mov	x29, sp
  2021f0:	f9000fa0 	str	x0, [x29, #24]

    /* make sure take mutex */
    while(rt_mutex_take(mutex, RT_WAITING_FOREVER) != RT_EOK);
  2021f4:	d503201f 	nop
  2021f8:	f0000080 	adrp	x0, 215000 <__data_start__>
  2021fc:	91092000 	add	x0, x0, #0x248
  202200:	f9400000 	ldr	x0, [x0]
  202204:	12800001 	mov	w1, #0xffffffff            	// #-1
  202208:	97fffac3 	bl	200d14 <rt_mutex_take>
  20220c:	f100001f 	cmp	x0, #0x0
  202210:	54ffff41 	b.ne	2021f8 <rt_timer_delete+0x10>  // b.any

    _rt_timer_remove(timer);
  202214:	f9400fa0 	ldr	x0, [x29, #24]
  202218:	97ffffa3 	bl	2020a4 <_rt_timer_remove>

    /*free timer object */
    free(timer);
  20221c:	f9400fa0 	ldr	x0, [x29, #24]
  202220:	94001540 	bl	207720 <free>

    /* release mutex */
    rt_mutex_release(mutex);
  202224:	f0000080 	adrp	x0, 215000 <__data_start__>
  202228:	91092000 	add	x0, x0, #0x248
  20222c:	f9400000 	ldr	x0, [x0]
  202230:	97fffad4 	bl	200d80 <rt_mutex_release>

    return RT_EOK;
  202234:	d2800000 	mov	x0, #0x0                   	// #0
}
  202238:	a8c27bfd 	ldp	x29, x30, [sp], #32
  20223c:	d65f03c0 	ret

0000000000202240 <rt_timer_start>:
 * @param timer the timer to be started
 *
 * @return the operation status, RT_EOK on OK, -RT_ERROR on error
 */
rt_err_t rt_timer_start(rt_timer_t timer)
{
  202240:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
  202244:	910003fd 	mov	x29, sp
  202248:	f9000fa0 	str	x0, [x29, #24]
    rt_list_t *row_head[RT_TIMER_SKIP_LIST_LEVEL];
    unsigned int tst_nr;
    static unsigned int random_nr;

    /* make sure take mutex */
    while(rt_mutex_take(mutex, RT_WAITING_FOREVER) != RT_EOK);
  20224c:	d503201f 	nop
  202250:	f0000080 	adrp	x0, 215000 <__data_start__>
  202254:	91092000 	add	x0, x0, #0x248
  202258:	f9400000 	ldr	x0, [x0]
  20225c:	12800001 	mov	w1, #0xffffffff            	// #-1
  202260:	97fffaad 	bl	200d14 <rt_mutex_take>
  202264:	f100001f 	cmp	x0, #0x0
  202268:	54ffff41 	b.ne	202250 <rt_timer_start+0x10>  // b.any
    /* remove timer from list */
    _rt_timer_remove(timer);
  20226c:	f9400fa0 	ldr	x0, [x29, #24]
  202270:	97ffff8d 	bl	2020a4 <_rt_timer_remove>
    /* change status of timer */
    timer->parent.flag &= ~RT_TIMER_FLAG_ACTIVATED;
  202274:	f9400fa0 	ldr	x0, [x29, #24]
  202278:	39402400 	ldrb	w0, [x0, #9]
  20227c:	121f7800 	and	w0, w0, #0xfffffffe
  202280:	12001c01 	and	w1, w0, #0xff
  202284:	f9400fa0 	ldr	x0, [x29, #24]
  202288:	39002401 	strb	w1, [x0, #9]
    /* release mutex */
    rt_mutex_release(mutex);
  20228c:	f0000080 	adrp	x0, 215000 <__data_start__>
  202290:	91092000 	add	x0, x0, #0x248
  202294:	f9400000 	ldr	x0, [x0]
  202298:	97fffaba 	bl	200d80 <rt_mutex_release>

    /*
     * get timeout tick,
     * the max timeout tick shall not great than RT_TICK_MAX/2
     */
    timer->timeout_tick = rt_tick_get() + timer->init_tick;
  20229c:	97fffe1e 	bl	201b14 <rt_tick_get>
  2022a0:	2a0003e1 	mov	w1, w0
  2022a4:	f9400fa0 	ldr	x0, [x29, #24]
  2022a8:	b9404000 	ldr	w0, [x0, #64]
  2022ac:	0b000021 	add	w1, w1, w0
  2022b0:	f9400fa0 	ldr	x0, [x29, #24]
  2022b4:	b9004401 	str	w1, [x0, #68]

    /* make sure take mutex */
    while(rt_mutex_take(mutex, RT_WAITING_FOREVER) != RT_EOK);
  2022b8:	d503201f 	nop
  2022bc:	f0000080 	adrp	x0, 215000 <__data_start__>
  2022c0:	91092000 	add	x0, x0, #0x248
  2022c4:	f9400000 	ldr	x0, [x0]
  2022c8:	12800001 	mov	w1, #0xffffffff            	// #-1
  2022cc:	97fffa92 	bl	200d14 <rt_mutex_take>
  2022d0:	f100001f 	cmp	x0, #0x0
  2022d4:	54ffff41 	b.ne	2022bc <rt_timer_start+0x7c>  // b.any

    /* insert timer to soft timer list */
    timer_list = rt_soft_timer_list;
  2022d8:	f0000080 	adrp	x0, 215000 <__data_start__>
  2022dc:	91096000 	add	x0, x0, #0x258
  2022e0:	f90023a0 	str	x0, [x29, #64]

    row_head[0]  = &timer_list[0];
  2022e4:	f94023a0 	ldr	x0, [x29, #64]
  2022e8:	f90017a0 	str	x0, [x29, #40]
    for (row_lvl = 0; row_lvl < RT_TIMER_SKIP_LIST_LEVEL; row_lvl++)
  2022ec:	b9004fbf 	str	wzr, [x29, #76]
  2022f0:	14000045 	b	202404 <rt_timer_start+0x1c4>
    {
        for (; row_head[row_lvl] != timer_list[row_lvl].prev;
             row_head[row_lvl]  = row_head[row_lvl]->next)
        {
            struct rt_timer *t;
            rt_list_t *p = row_head[row_lvl]->next;
  2022f4:	b9404fa0 	ldr	w0, [x29, #76]
  2022f8:	d37df000 	lsl	x0, x0, #3
  2022fc:	9100a3a1 	add	x1, x29, #0x28
  202300:	f8606820 	ldr	x0, [x1, x0]
  202304:	f9400000 	ldr	x0, [x0]
  202308:	f9001fa0 	str	x0, [x29, #56]

            /* fix up the entry pointer */
            t = rt_list_entry(p, struct rt_timer, row[row_lvl]);
  20230c:	b9404fa0 	ldr	w0, [x29, #76]
  202310:	d37cec00 	lsl	x0, x0, #4
  202314:	91008000 	add	x0, x0, #0x20
  202318:	cb0003e0 	neg	x0, x0
  20231c:	f9401fa1 	ldr	x1, [x29, #56]
  202320:	8b000020 	add	x0, x1, x0
  202324:	f9001ba0 	str	x0, [x29, #48]
            /* If we have two timers that timeout at the same time, it's
             * preferred that the timer inserted early get called early.
             * So insert the new timer to the end the the some-timeout timer
             * list.
             */
            if ((t->timeout_tick - timer->timeout_tick) == 0)
  202328:	f9401ba0 	ldr	x0, [x29, #48]
  20232c:	b9404401 	ldr	w1, [x0, #68]
  202330:	f9400fa0 	ldr	x0, [x29, #24]
  202334:	b9404400 	ldr	w0, [x0, #68]
  202338:	6b00003f 	cmp	w1, w0
  20233c:	54000140 	b.eq	202364 <rt_timer_start+0x124>  // b.none
            {
                continue;
            }
            else if ((t->timeout_tick - timer->timeout_tick) < RT_TICK_MAX / 2)
  202340:	f9401ba0 	ldr	x0, [x29, #48]
  202344:	b9404401 	ldr	w1, [x0, #68]
  202348:	f9400fa0 	ldr	x0, [x29, #24]
  20234c:	b9404400 	ldr	w0, [x0, #68]
  202350:	4b000021 	sub	w1, w1, w0
  202354:	321f77e0 	mov	w0, #0x7ffffffe            	// #2147483646
  202358:	6b00003f 	cmp	w1, w0
  20235c:	54000309 	b.ls	2023bc <rt_timer_start+0x17c>  // b.plast
  202360:	14000002 	b	202368 <rt_timer_start+0x128>
                continue;
  202364:	d503201f 	nop
             row_head[row_lvl]  = row_head[row_lvl]->next)
  202368:	b9404fa0 	ldr	w0, [x29, #76]
  20236c:	d37df000 	lsl	x0, x0, #3
  202370:	9100a3a1 	add	x1, x29, #0x28
  202374:	f8606820 	ldr	x0, [x1, x0]
  202378:	f9400002 	ldr	x2, [x0]
  20237c:	b9404fa0 	ldr	w0, [x29, #76]
  202380:	d37df000 	lsl	x0, x0, #3
  202384:	9100a3a1 	add	x1, x29, #0x28
  202388:	f8206822 	str	x2, [x1, x0]
        for (; row_head[row_lvl] != timer_list[row_lvl].prev;
  20238c:	b9404fa0 	ldr	w0, [x29, #76]
  202390:	d37df000 	lsl	x0, x0, #3
  202394:	9100a3a1 	add	x1, x29, #0x28
  202398:	f8606821 	ldr	x1, [x1, x0]
  20239c:	b9404fa0 	ldr	w0, [x29, #76]
  2023a0:	d37cec00 	lsl	x0, x0, #4
  2023a4:	f94023a2 	ldr	x2, [x29, #64]
  2023a8:	8b000040 	add	x0, x2, x0
  2023ac:	f9400400 	ldr	x0, [x0, #8]
  2023b0:	eb00003f 	cmp	x1, x0
  2023b4:	54fffa01 	b.ne	2022f4 <rt_timer_start+0xb4>  // b.any
  2023b8:	14000002 	b	2023c0 <rt_timer_start+0x180>
            {
                break;
  2023bc:	d503201f 	nop
            }
        }
        if (row_lvl != RT_TIMER_SKIP_LIST_LEVEL - 1)
  2023c0:	b9404fa0 	ldr	w0, [x29, #76]
  2023c4:	7100001f 	cmp	w0, #0x0
  2023c8:	54000180 	b.eq	2023f8 <rt_timer_start+0x1b8>  // b.none
            row_head[row_lvl + 1] = row_head[row_lvl] + 1;
  2023cc:	b9404fa0 	ldr	w0, [x29, #76]
  2023d0:	d37df000 	lsl	x0, x0, #3
  2023d4:	9100a3a1 	add	x1, x29, #0x28
  2023d8:	f8606820 	ldr	x0, [x1, x0]
  2023dc:	b9404fa1 	ldr	w1, [x29, #76]
  2023e0:	11000421 	add	w1, w1, #0x1
  2023e4:	91004002 	add	x2, x0, #0x10
  2023e8:	2a0103e0 	mov	w0, w1
  2023ec:	d37df000 	lsl	x0, x0, #3
  2023f0:	9100a3a1 	add	x1, x29, #0x28
  2023f4:	f8206822 	str	x2, [x1, x0]
    for (row_lvl = 0; row_lvl < RT_TIMER_SKIP_LIST_LEVEL; row_lvl++)
  2023f8:	b9404fa0 	ldr	w0, [x29, #76]
  2023fc:	11000400 	add	w0, w0, #0x1
  202400:	b9004fa0 	str	w0, [x29, #76]
  202404:	b9404fa0 	ldr	w0, [x29, #76]
  202408:	7100001f 	cmp	w0, #0x0
  20240c:	54fffc00 	b.eq	20238c <rt_timer_start+0x14c>  // b.none

    /* Interestingly, this super simple timer insert counter works very very
     * well on distributing the list height uniformly. By means of "very very
     * well", I mean it beats the randomness of timer->timeout_tick very easily
     * (actually, the timeout_tick is not random and easy to be attacked). */
    random_nr++;
  202410:	f0000080 	adrp	x0, 215000 <__data_start__>
  202414:	9109a000 	add	x0, x0, #0x268
  202418:	b9400000 	ldr	w0, [x0]
  20241c:	11000401 	add	w1, w0, #0x1
  202420:	f0000080 	adrp	x0, 215000 <__data_start__>
  202424:	9109a000 	add	x0, x0, #0x268
  202428:	b9000001 	str	w1, [x0]
    tst_nr = random_nr;
  20242c:	f0000080 	adrp	x0, 215000 <__data_start__>
  202430:	9109a000 	add	x0, x0, #0x268
  202434:	b9400000 	ldr	w0, [x0]
  202438:	b9004ba0 	str	w0, [x29, #72]

    rt_list_insert_after(row_head[RT_TIMER_SKIP_LIST_LEVEL - 1],
  20243c:	f94017a2 	ldr	x2, [x29, #40]
  202440:	f9400fa0 	ldr	x0, [x29, #24]
  202444:	91008000 	add	x0, x0, #0x20
  202448:	aa0003e1 	mov	x1, x0
  20244c:	aa0203e0 	mov	x0, x2
  202450:	97fffea4 	bl	201ee0 <rt_list_insert_after>
                         &(timer->row[RT_TIMER_SKIP_LIST_LEVEL - 1]));
    for (row_lvl = 2; row_lvl <= RT_TIMER_SKIP_LIST_LEVEL; row_lvl++)
  202454:	52800040 	mov	w0, #0x2                   	// #2
  202458:	b9004fa0 	str	w0, [x29, #76]
  20245c:	1400001d 	b	2024d0 <rt_timer_start+0x290>
    {
        if (!(tst_nr & RT_TIMER_SKIP_LIST_MASK))
  202460:	b9404ba0 	ldr	w0, [x29, #72]
  202464:	12000400 	and	w0, w0, #0x3
  202468:	7100001f 	cmp	w0, #0x0
  20246c:	540003a1 	b.ne	2024e0 <rt_timer_start+0x2a0>  // b.any
            rt_list_insert_after(row_head[RT_TIMER_SKIP_LIST_LEVEL - row_lvl],
  202470:	52800021 	mov	w1, #0x1                   	// #1
  202474:	b9404fa0 	ldr	w0, [x29, #76]
  202478:	4b000020 	sub	w0, w1, w0
  20247c:	2a0003e0 	mov	w0, w0
  202480:	d37df000 	lsl	x0, x0, #3
  202484:	9100a3a1 	add	x1, x29, #0x28
  202488:	f8606822 	ldr	x2, [x1, x0]
                                 &(timer->row[RT_TIMER_SKIP_LIST_LEVEL - row_lvl]));
  20248c:	52800021 	mov	w1, #0x1                   	// #1
  202490:	b9404fa0 	ldr	w0, [x29, #76]
  202494:	4b000020 	sub	w0, w1, w0
            rt_list_insert_after(row_head[RT_TIMER_SKIP_LIST_LEVEL - row_lvl],
  202498:	2a0003e0 	mov	w0, w0
  20249c:	91000800 	add	x0, x0, #0x2
  2024a0:	d37cec00 	lsl	x0, x0, #4
  2024a4:	f9400fa1 	ldr	x1, [x29, #24]
  2024a8:	8b000020 	add	x0, x1, x0
  2024ac:	aa0003e1 	mov	x1, x0
  2024b0:	aa0203e0 	mov	x0, x2
  2024b4:	97fffe8b 	bl	201ee0 <rt_list_insert_after>
        else
            break;
        /* Shift over the bits we have tested. Works well with 1 bit and 2
         * bits. */
        tst_nr >>= (RT_TIMER_SKIP_LIST_MASK + 1) >> 1;
  2024b8:	b9404ba0 	ldr	w0, [x29, #72]
  2024bc:	53027c00 	lsr	w0, w0, #2
  2024c0:	b9004ba0 	str	w0, [x29, #72]
    for (row_lvl = 2; row_lvl <= RT_TIMER_SKIP_LIST_LEVEL; row_lvl++)
  2024c4:	b9404fa0 	ldr	w0, [x29, #76]
  2024c8:	11000400 	add	w0, w0, #0x1
  2024cc:	b9004fa0 	str	w0, [x29, #76]
  2024d0:	b9404fa0 	ldr	w0, [x29, #76]
  2024d4:	7100041f 	cmp	w0, #0x1
  2024d8:	54fffc49 	b.ls	202460 <rt_timer_start+0x220>  // b.plast
  2024dc:	14000002 	b	2024e4 <rt_timer_start+0x2a4>
            break;
  2024e0:	d503201f 	nop
    }

    timer->parent.flag |= RT_TIMER_FLAG_ACTIVATED;
  2024e4:	f9400fa0 	ldr	x0, [x29, #24]
  2024e8:	39402400 	ldrb	w0, [x0, #9]
  2024ec:	32000000 	orr	w0, w0, #0x1
  2024f0:	12001c01 	and	w1, w0, #0xff
  2024f4:	f9400fa0 	ldr	x0, [x29, #24]
  2024f8:	39002401 	strb	w1, [x0, #9]

    /* release mutex */
    rt_mutex_release(mutex);
  2024fc:	f0000080 	adrp	x0, 215000 <__data_start__>
  202500:	91092000 	add	x0, x0, #0x248
  202504:	f9400000 	ldr	x0, [x0]
  202508:	97fffa1e 	bl	200d80 <rt_mutex_release>

    /* update hardware timer */
    rt_hw_timer_update();
  20250c:	940000c8 	bl	20282c <rt_hw_timer_update>

    return RT_EOK;
  202510:	d2800000 	mov	x0, #0x0                   	// #0
}
  202514:	a8c57bfd 	ldp	x29, x30, [sp], #80
  202518:	d65f03c0 	ret

000000000020251c <rt_timer_stop>:
 * @param timer the timer to be stopped
 *
 * @return the operation status, RT_EOK on OK, -RT_ERROR on error
 */
rt_err_t rt_timer_stop(rt_timer_t timer)
{
  20251c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  202520:	910003fd 	mov	x29, sp
  202524:	f9000fa0 	str	x0, [x29, #24]
    if (!(timer->parent.flag & RT_TIMER_FLAG_ACTIVATED))
  202528:	f9400fa0 	ldr	x0, [x29, #24]
  20252c:	39402400 	ldrb	w0, [x0, #9]
  202530:	12000000 	and	w0, w0, #0x1
  202534:	7100001f 	cmp	w0, #0x0
  202538:	54000061 	b.ne	202544 <rt_timer_stop+0x28>  // b.any
        return -RT_ERROR;
  20253c:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
  202540:	14000016 	b	202598 <rt_timer_stop+0x7c>

    /* make sure take mutex */
    while(rt_mutex_take(mutex, RT_WAITING_FOREVER) != RT_EOK);
  202544:	d503201f 	nop
  202548:	f0000080 	adrp	x0, 215000 <__data_start__>
  20254c:	91092000 	add	x0, x0, #0x248
  202550:	f9400000 	ldr	x0, [x0]
  202554:	12800001 	mov	w1, #0xffffffff            	// #-1
  202558:	97fff9ef 	bl	200d14 <rt_mutex_take>
  20255c:	f100001f 	cmp	x0, #0x0
  202560:	54ffff41 	b.ne	202548 <rt_timer_stop+0x2c>  // b.any

    _rt_timer_remove(timer);
  202564:	f9400fa0 	ldr	x0, [x29, #24]
  202568:	97fffecf 	bl	2020a4 <_rt_timer_remove>

    /* release mutex */
    rt_mutex_release(mutex);
  20256c:	f0000080 	adrp	x0, 215000 <__data_start__>
  202570:	91092000 	add	x0, x0, #0x248
  202574:	f9400000 	ldr	x0, [x0]
  202578:	97fffa02 	bl	200d80 <rt_mutex_release>

    /* change stat */
    timer->parent.flag &= ~RT_TIMER_FLAG_ACTIVATED;
  20257c:	f9400fa0 	ldr	x0, [x29, #24]
  202580:	39402400 	ldrb	w0, [x0, #9]
  202584:	121f7800 	and	w0, w0, #0xfffffffe
  202588:	12001c01 	and	w1, w0, #0xff
  20258c:	f9400fa0 	ldr	x0, [x29, #24]
  202590:	39002401 	strb	w1, [x0, #9]

    return RT_EOK;
  202594:	d2800000 	mov	x0, #0x0                   	// #0
}
  202598:	a8c27bfd 	ldp	x29, x30, [sp], #32
  20259c:	d65f03c0 	ret

00000000002025a0 <rt_timer_control>:
 * @param arg the argument
 *
 * @return RT_EOK
 */
rt_err_t rt_timer_control(rt_timer_t timer, int cmd, void *arg)
{
  2025a0:	d10083ff 	sub	sp, sp, #0x20
  2025a4:	f9000fe0 	str	x0, [sp, #24]
  2025a8:	b90017e1 	str	w1, [sp, #20]
  2025ac:	f90007e2 	str	x2, [sp, #8]
    switch (cmd)
  2025b0:	b94017e0 	ldr	w0, [sp, #20]
  2025b4:	71000c1f 	cmp	w0, #0x3
  2025b8:	540004e0 	b.eq	202654 <rt_timer_control+0xb4>  // b.none
  2025bc:	71000c1f 	cmp	w0, #0x3
  2025c0:	5400010c 	b.gt	2025e0 <rt_timer_control+0x40>
  2025c4:	7100041f 	cmp	w0, #0x1
  2025c8:	54000240 	b.eq	202610 <rt_timer_control+0x70>  // b.none
  2025cc:	7100041f 	cmp	w0, #0x1
  2025d0:	5400034c 	b.gt	202638 <rt_timer_control+0x98>
  2025d4:	7100001f 	cmp	w0, #0x0
  2025d8:	54000260 	b.eq	202624 <rt_timer_control+0x84>  // b.none
  2025dc:	14000037 	b	2026b8 <rt_timer_control+0x118>
  2025e0:	7100181f 	cmp	w0, #0x6
  2025e4:	54000500 	b.eq	202684 <rt_timer_control+0xe4>  // b.none
  2025e8:	7100181f 	cmp	w0, #0x6
  2025ec:	5400008c 	b.gt	2025fc <rt_timer_control+0x5c>
  2025f0:	7100141f 	cmp	w0, #0x5
  2025f4:	540003e0 	b.eq	202670 <rt_timer_control+0xd0>  // b.none
  2025f8:	14000030 	b	2026b8 <rt_timer_control+0x118>
  2025fc:	71001c1f 	cmp	w0, #0x7
  202600:	540004a0 	b.eq	202694 <rt_timer_control+0xf4>  // b.none
  202604:	7100201f 	cmp	w0, #0x8
  202608:	54000500 	b.eq	2026a8 <rt_timer_control+0x108>  // b.none
  20260c:	1400002b 	b	2026b8 <rt_timer_control+0x118>
    {
    case RT_TIMER_CTRL_GET_TIME:
        *(rt_tick_t *)arg = timer->init_tick;
  202610:	f9400fe0 	ldr	x0, [sp, #24]
  202614:	b9404001 	ldr	w1, [x0, #64]
  202618:	f94007e0 	ldr	x0, [sp, #8]
  20261c:	b9000001 	str	w1, [x0]
        break;
  202620:	14000026 	b	2026b8 <rt_timer_control+0x118>

    case RT_TIMER_CTRL_SET_TIME:
        timer->init_tick = *(rt_tick_t *)arg;
  202624:	f94007e0 	ldr	x0, [sp, #8]
  202628:	b9400001 	ldr	w1, [x0]
  20262c:	f9400fe0 	ldr	x0, [sp, #24]
  202630:	b9004001 	str	w1, [x0, #64]
        break;
  202634:	14000021 	b	2026b8 <rt_timer_control+0x118>

    case RT_TIMER_CTRL_SET_ONESHOT:
        timer->parent.flag &= ~RT_TIMER_FLAG_PERIODIC;
  202638:	f9400fe0 	ldr	x0, [sp, #24]
  20263c:	39402400 	ldrb	w0, [x0, #9]
  202640:	121e7800 	and	w0, w0, #0xfffffffd
  202644:	12001c01 	and	w1, w0, #0xff
  202648:	f9400fe0 	ldr	x0, [sp, #24]
  20264c:	39002401 	strb	w1, [x0, #9]
        break;
  202650:	1400001a 	b	2026b8 <rt_timer_control+0x118>

    case RT_TIMER_CTRL_SET_PERIODIC:
        timer->parent.flag |= RT_TIMER_FLAG_PERIODIC;
  202654:	f9400fe0 	ldr	x0, [sp, #24]
  202658:	39402400 	ldrb	w0, [x0, #9]
  20265c:	321f0000 	orr	w0, w0, #0x2
  202660:	12001c01 	and	w1, w0, #0xff
  202664:	f9400fe0 	ldr	x0, [sp, #24]
  202668:	39002401 	strb	w1, [x0, #9]
        break;
  20266c:	14000013 	b	2026b8 <rt_timer_control+0x118>

    case RT_TIMER_CTRL_GET_FUNC:
        *(void **)arg = timer->timeout_func;
  202670:	f9400fe0 	ldr	x0, [sp, #24]
  202674:	f9401801 	ldr	x1, [x0, #48]
  202678:	f94007e0 	ldr	x0, [sp, #8]
  20267c:	f9000001 	str	x1, [x0]
        break;
  202680:	1400000e 	b	2026b8 <rt_timer_control+0x118>

    case RT_TIMER_CTRL_SET_FUNC:
        timer->timeout_func = (void (*)(void*))arg;
  202684:	f94007e1 	ldr	x1, [sp, #8]
  202688:	f9400fe0 	ldr	x0, [sp, #24]
  20268c:	f9001801 	str	x1, [x0, #48]
        break;
  202690:	1400000a 	b	2026b8 <rt_timer_control+0x118>

    case RT_TIMER_CTRL_GET_PARM:
        *(void **)arg = timer->parameter;
  202694:	f9400fe0 	ldr	x0, [sp, #24]
  202698:	f9401c01 	ldr	x1, [x0, #56]
  20269c:	f94007e0 	ldr	x0, [sp, #8]
  2026a0:	f9000001 	str	x1, [x0]
        break;
  2026a4:	14000005 	b	2026b8 <rt_timer_control+0x118>

    case RT_TIMER_CTRL_SET_PARM:
        timer->parameter = arg;
  2026a8:	f9400fe0 	ldr	x0, [sp, #24]
  2026ac:	f94007e1 	ldr	x1, [sp, #8]
  2026b0:	f9001c01 	str	x1, [x0, #56]
        break;
  2026b4:	d503201f 	nop
    }

    return RT_EOK;
  2026b8:	d2800000 	mov	x0, #0x0                   	// #0
}
  2026bc:	910083ff 	add	sp, sp, #0x20
  2026c0:	d65f03c0 	ret

00000000002026c4 <rt_soft_timer_check>:
/**
 * This function will check timer list, if a timeout event happens, the
 * corresponding timeout function will be invoked.
 */
void rt_soft_timer_check(void)
{
  2026c4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  2026c8:	910003fd 	mov	x29, sp
    rt_list_t *n;
    struct rt_timer *t;

    RT_DEBUG_LOG(RT_DEBUG_TIMER, ("software timer check enter\n"));

    current_tick = rt_tick_get();
  2026cc:	97fffd12 	bl	201b14 <rt_tick_get>
  2026d0:	b9002fa0 	str	w0, [x29, #44]

    /* make sure take mutex */
    while(rt_mutex_take(mutex, RT_WAITING_FOREVER) != RT_EOK);
  2026d4:	d503201f 	nop
  2026d8:	f0000080 	adrp	x0, 215000 <__data_start__>
  2026dc:	91092000 	add	x0, x0, #0x248
  2026e0:	f9400000 	ldr	x0, [x0]
  2026e4:	12800001 	mov	w1, #0xffffffff            	// #-1
  2026e8:	97fff98b 	bl	200d14 <rt_mutex_take>
  2026ec:	f100001f 	cmp	x0, #0x0
  2026f0:	54ffff41 	b.ne	2026d8 <rt_soft_timer_check+0x14>  // b.any

    for (n = rt_soft_timer_list[RT_TIMER_SKIP_LIST_LEVEL - 1].next;
  2026f4:	f0000080 	adrp	x0, 215000 <__data_start__>
  2026f8:	91096000 	add	x0, x0, #0x258
  2026fc:	f9400000 	ldr	x0, [x0]
  202700:	f90013a0 	str	x0, [x29, #32]
  202704:	1400003c 	b	2027f4 <rt_soft_timer_check+0x130>
         n != &(rt_soft_timer_list[RT_TIMER_SKIP_LIST_LEVEL - 1]);)
    {
        t = rt_list_entry(n, struct rt_timer, row[RT_TIMER_SKIP_LIST_LEVEL - 1]);
  202708:	f94013a0 	ldr	x0, [x29, #32]
  20270c:	d1008000 	sub	x0, x0, #0x20
  202710:	f9000fa0 	str	x0, [x29, #24]

        /*
         * It supposes that the new tick shall less than the half duration of
         * tick max.
         */
        if ((current_tick - t->timeout_tick) < RT_TICK_MAX / 2)
  202714:	f9400fa0 	ldr	x0, [x29, #24]
  202718:	b9404400 	ldr	w0, [x0, #68]
  20271c:	b9402fa1 	ldr	w1, [x29, #44]
  202720:	4b000021 	sub	w1, w1, w0
  202724:	321f77e0 	mov	w0, #0x7ffffffe            	// #2147483646
  202728:	6b00003f 	cmp	w1, w0
  20272c:	54000708 	b.hi	20280c <rt_soft_timer_check+0x148>  // b.pmore
        {
            /* move node to the next */
            n = n->next;
  202730:	f94013a0 	ldr	x0, [x29, #32]
  202734:	f9400000 	ldr	x0, [x0]
  202738:	f90013a0 	str	x0, [x29, #32]

            /* remove timer from timer list firstly */
            _rt_timer_remove(t);
  20273c:	f9400fa0 	ldr	x0, [x29, #24]
  202740:	97fffe59 	bl	2020a4 <_rt_timer_remove>

            /* release mutex */
            rt_mutex_release(mutex);
  202744:	f0000080 	adrp	x0, 215000 <__data_start__>
  202748:	91092000 	add	x0, x0, #0x248
  20274c:	f9400000 	ldr	x0, [x0]
  202750:	97fff98c 	bl	200d80 <rt_mutex_release>
            /* call timeout function */
            t->timeout_func(t->parameter);
  202754:	f9400fa0 	ldr	x0, [x29, #24]
  202758:	f9401801 	ldr	x1, [x0, #48]
  20275c:	f9400fa0 	ldr	x0, [x29, #24]
  202760:	f9401c00 	ldr	x0, [x0, #56]
  202764:	d63f0020 	blr	x1

            /* re-get tick */
            current_tick = rt_tick_get();
  202768:	97fffceb 	bl	201b14 <rt_tick_get>
  20276c:	b9002fa0 	str	w0, [x29, #44]

            RT_DEBUG_LOG(RT_DEBUG_TIMER, ("current tick: %d\n", current_tick));

            /* make sure take mutex */
            while(rt_mutex_take(mutex, RT_WAITING_FOREVER) != RT_EOK);
  202770:	d503201f 	nop
  202774:	f0000080 	adrp	x0, 215000 <__data_start__>
  202778:	91092000 	add	x0, x0, #0x248
  20277c:	f9400000 	ldr	x0, [x0]
  202780:	12800001 	mov	w1, #0xffffffff            	// #-1
  202784:	97fff964 	bl	200d14 <rt_mutex_take>
  202788:	f100001f 	cmp	x0, #0x0
  20278c:	54ffff41 	b.ne	202774 <rt_soft_timer_check+0xb0>  // b.any


            if ((t->parent.flag & RT_TIMER_FLAG_PERIODIC) &&
  202790:	f9400fa0 	ldr	x0, [x29, #24]
  202794:	39402400 	ldrb	w0, [x0, #9]
  202798:	121f0000 	and	w0, w0, #0x2
  20279c:	7100001f 	cmp	w0, #0x0
  2027a0:	540001e0 	b.eq	2027dc <rt_soft_timer_check+0x118>  // b.none
                    (t->parent.flag & RT_TIMER_FLAG_ACTIVATED))
  2027a4:	f9400fa0 	ldr	x0, [x29, #24]
  2027a8:	39402400 	ldrb	w0, [x0, #9]
  2027ac:	12000000 	and	w0, w0, #0x1
            if ((t->parent.flag & RT_TIMER_FLAG_PERIODIC) &&
  2027b0:	7100001f 	cmp	w0, #0x0
  2027b4:	54000140 	b.eq	2027dc <rt_soft_timer_check+0x118>  // b.none
            {
                /* start it */
                t->parent.flag &= ~RT_TIMER_FLAG_ACTIVATED;
  2027b8:	f9400fa0 	ldr	x0, [x29, #24]
  2027bc:	39402400 	ldrb	w0, [x0, #9]
  2027c0:	121f7800 	and	w0, w0, #0xfffffffe
  2027c4:	12001c01 	and	w1, w0, #0xff
  2027c8:	f9400fa0 	ldr	x0, [x29, #24]
  2027cc:	39002401 	strb	w1, [x0, #9]
                rt_timer_start(t);
  2027d0:	f9400fa0 	ldr	x0, [x29, #24]
  2027d4:	97fffe9b 	bl	202240 <rt_timer_start>
  2027d8:	14000007 	b	2027f4 <rt_soft_timer_check+0x130>
            }
            else
            {
                /* stop timer */
                t->parent.flag &= ~RT_TIMER_FLAG_ACTIVATED;
  2027dc:	f9400fa0 	ldr	x0, [x29, #24]
  2027e0:	39402400 	ldrb	w0, [x0, #9]
  2027e4:	121f7800 	and	w0, w0, #0xfffffffe
  2027e8:	12001c01 	and	w1, w0, #0xff
  2027ec:	f9400fa0 	ldr	x0, [x29, #24]
  2027f0:	39002401 	strb	w1, [x0, #9]
    for (n = rt_soft_timer_list[RT_TIMER_SKIP_LIST_LEVEL - 1].next;
  2027f4:	f94013a1 	ldr	x1, [x29, #32]
  2027f8:	f0000080 	adrp	x0, 215000 <__data_start__>
  2027fc:	91096000 	add	x0, x0, #0x258
  202800:	eb00003f 	cmp	x1, x0
  202804:	54fff821 	b.ne	202708 <rt_soft_timer_check+0x44>  // b.any
  202808:	14000002 	b	202810 <rt_soft_timer_check+0x14c>
            }
        }
        else break; /* not check anymore */
  20280c:	d503201f 	nop
    }

    /* release mutex */
    rt_mutex_release(mutex);
  202810:	f0000080 	adrp	x0, 215000 <__data_start__>
  202814:	91092000 	add	x0, x0, #0x248
  202818:	f9400000 	ldr	x0, [x0]
  20281c:	97fff959 	bl	200d80 <rt_mutex_release>

    RT_DEBUG_LOG(RT_DEBUG_TIMER, ("software timer check leave\n"));
}
  202820:	d503201f 	nop
  202824:	a8c37bfd 	ldp	x29, x30, [sp], #48
  202828:	d65f03c0 	ret

000000000020282c <rt_hw_timer_update>:

/* update hardware timer */
static void rt_hw_timer_update(void)
{
  20282c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  202830:	910003fd 	mov	x29, sp
    rt_tick_t next_timeout;
    rt_tick_t current_tick;

    /* get the next timeout tick */
    next_timeout = rt_timer_list_next_timeout(rt_soft_timer_list);
  202834:	f0000080 	adrp	x0, 215000 <__data_start__>
  202838:	91096000 	add	x0, x0, #0x258
  20283c:	97fffe09 	bl	202060 <rt_timer_list_next_timeout>
  202840:	b9001ba0 	str	w0, [x29, #24]
    if (next_timeout == RT_TICK_MAX)
  202844:	b9401ba0 	ldr	w0, [x29, #24]
  202848:	3100041f 	cmn	w0, #0x1
  20284c:	54000480 	b.eq	2028dc <rt_hw_timer_update+0xb0>  // b.none
        /* no software timer exist, return. */
        return;
    }

    /* get current tick */
    current_tick = rt_tick_get();
  202850:	97fffcb1 	bl	201b14 <rt_tick_get>
  202854:	b9001fa0 	str	w0, [x29, #28]

    if ((next_timeout - current_tick) < RT_TICK_MAX / 2)
  202858:	b9401ba1 	ldr	w1, [x29, #24]
  20285c:	b9401fa0 	ldr	w0, [x29, #28]
  202860:	4b000021 	sub	w1, w1, w0
  202864:	321f77e0 	mov	w0, #0x7ffffffe            	// #2147483646
  202868:	6b00003f 	cmp	w1, w0
  20286c:	540003c8 	b.hi	2028e4 <rt_hw_timer_update+0xb8>  // b.pmore
    {
        syscall(_NRSYS_rt_timer_stop, hw_timer);
  202870:	f0000080 	adrp	x0, 215000 <__data_start__>
  202874:	91090000 	add	x0, x0, #0x240
  202878:	f9400000 	ldr	x0, [x0]
  20287c:	aa0003e1 	mov	x1, x0
  202880:	52800e40 	mov	w0, #0x72                  	// #114
  202884:	94000406 	bl	20389c <syscall>
        /* get the delta timeout tick */
        next_timeout = next_timeout - current_tick;
  202888:	b9401ba1 	ldr	w1, [x29, #24]
  20288c:	b9401fa0 	ldr	w0, [x29, #28]
  202890:	4b000020 	sub	w0, w1, w0
  202894:	b9001ba0 	str	w0, [x29, #24]
        syscall(_NRSYS_rt_timer_control,
  202898:	f0000080 	adrp	x0, 215000 <__data_start__>
  20289c:	91090000 	add	x0, x0, #0x240
  2028a0:	f9400000 	ldr	x0, [x0]
  2028a4:	910063a1 	add	x1, x29, #0x18
  2028a8:	aa0103e3 	mov	x3, x1
  2028ac:	52800002 	mov	w2, #0x0                   	// #0
  2028b0:	aa0003e1 	mov	x1, x0
  2028b4:	52800e60 	mov	w0, #0x73                  	// #115
  2028b8:	940003f9 	bl	20389c <syscall>
                hw_timer,
                RT_TIMER_CTRL_SET_TIME,
                &next_timeout);
        syscall(_NRSYS_rt_timer_start, hw_timer);
  2028bc:	f0000080 	adrp	x0, 215000 <__data_start__>
  2028c0:	91090000 	add	x0, x0, #0x240
  2028c4:	f9400000 	ldr	x0, [x0]
  2028c8:	aa0003e1 	mov	x1, x0
  2028cc:	52800e20 	mov	w0, #0x71                  	// #113
  2028d0:	940003f3 	bl	20389c <syscall>
    }
    return;
  2028d4:	d503201f 	nop
  2028d8:	14000003 	b	2028e4 <rt_hw_timer_update+0xb8>
        return;
  2028dc:	d503201f 	nop
  2028e0:	14000002 	b	2028e8 <rt_hw_timer_update+0xbc>
    return;
  2028e4:	d503201f 	nop
}
  2028e8:	a8c27bfd 	ldp	x29, x30, [sp], #32
  2028ec:	d65f03c0 	ret

00000000002028f0 <rt_thread_timer_handler>:

/* timer signal handler */
static void rt_thread_timer_handler(void)
{
  2028f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  2028f4:	910003fd 	mov	x29, sp
    /* update hardware timer */
    rt_hw_timer_update();
  2028f8:	97ffffcd 	bl	20282c <rt_hw_timer_update>
    /* check software timer */
    rt_soft_timer_check();
  2028fc:	97ffff72 	bl	2026c4 <rt_soft_timer_check>
}
  202900:	d503201f 	nop
  202904:	a8c17bfd 	ldp	x29, x30, [sp], #16
  202908:	d65f03c0 	ret

000000000020290c <timer_thread_entry>:

static void timer_thread_entry(void* parameter)
{
  20290c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  202910:	910003fd 	mov	x29, sp
  202914:	f9000fa0 	str	x0, [x29, #24]
    while (1)
    {
        rt_err_t ret;
        ret = rt_sem_take(sem, RT_WAITING_FOREVER);
  202918:	f0000080 	adrp	x0, 215000 <__data_start__>
  20291c:	91094000 	add	x0, x0, #0x250
  202920:	f9400000 	ldr	x0, [x0]
  202924:	12800001 	mov	w1, #0xffffffff            	// #-1
  202928:	97fff9d2 	bl	201070 <rt_sem_take>
  20292c:	f90017a0 	str	x0, [x29, #40]
        if (ret != RT_EOK)
  202930:	f94017a0 	ldr	x0, [x29, #40]
  202934:	f100001f 	cmp	x0, #0x0
  202938:	54000061 	b.ne	202944 <timer_thread_entry+0x38>  // b.any
        {
            break;
        }
        rt_thread_timer_handler();
  20293c:	97ffffed 	bl	2028f0 <rt_thread_timer_handler>
    {
  202940:	17fffff6 	b	202918 <timer_thread_entry+0xc>
            break;
  202944:	d503201f 	nop
    }
}
  202948:	d503201f 	nop
  20294c:	a8c37bfd 	ldp	x29, x30, [sp], #48
  202950:	d65f03c0 	ret

0000000000202954 <rt_system_timer_init>:

void rt_system_timer_init(rt_uint32_t timer_stack_size)
{
  202954:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  202958:	910003fd 	mov	x29, sp
  20295c:	b9001fa0 	str	w0, [x29, #28]
    int i;
    rt_thread_t tid;

    if (!sem)
  202960:	f0000080 	adrp	x0, 215000 <__data_start__>
  202964:	91094000 	add	x0, x0, #0x250
  202968:	f9400000 	ldr	x0, [x0]
  20296c:	f100001f 	cmp	x0, #0x0
  202970:	54000141 	b.ne	202998 <rt_system_timer_init+0x44>  // b.any
    {
        sem = rt_sem_create("u_timer", 0, RT_IPC_FLAG_FIFO);
  202974:	f0000060 	adrp	x0, 211000 <__subtf3+0x7d0>
  202978:	91286000 	add	x0, x0, #0xa18
  20297c:	52800002 	mov	w2, #0x0                   	// #0
  202980:	52800001 	mov	w1, #0x0                   	// #0
  202984:	97fff918 	bl	200de4 <rt_sem_create>
  202988:	aa0003e1 	mov	x1, x0
  20298c:	f0000080 	adrp	x0, 215000 <__data_start__>
  202990:	91094000 	add	x0, x0, #0x250
  202994:	f9000001 	str	x1, [x0]
    }

    if (!mutex)
  202998:	f0000080 	adrp	x0, 215000 <__data_start__>
  20299c:	91092000 	add	x0, x0, #0x248
  2029a0:	f9400000 	ldr	x0, [x0]
  2029a4:	f100001f 	cmp	x0, #0x0
  2029a8:	54000121 	b.ne	2029cc <rt_system_timer_init+0x78>  // b.any
    {
        mutex = rt_mutex_create("utm_mutex", RT_IPC_FLAG_FIFO);
  2029ac:	f0000060 	adrp	x0, 211000 <__subtf3+0x7d0>
  2029b0:	91288000 	add	x0, x0, #0xa20
  2029b4:	52800001 	mov	w1, #0x0                   	// #0
  2029b8:	97fff851 	bl	200afc <rt_mutex_create>
  2029bc:	aa0003e1 	mov	x1, x0
  2029c0:	f0000080 	adrp	x0, 215000 <__data_start__>
  2029c4:	91092000 	add	x0, x0, #0x248
  2029c8:	f9000001 	str	x1, [x0]
    }

    for (i = 0;
  2029cc:	b9002fbf 	str	wzr, [x29, #44]
  2029d0:	1400000a 	b	2029f8 <rt_system_timer_init+0xa4>
         i < sizeof(rt_soft_timer_list) / sizeof(rt_soft_timer_list[0]);
         i++)
    {
        rt_list_init(rt_soft_timer_list + i);
  2029d4:	b9802fa0 	ldrsw	x0, [x29, #44]
  2029d8:	d37cec01 	lsl	x1, x0, #4
  2029dc:	f0000080 	adrp	x0, 215000 <__data_start__>
  2029e0:	91096000 	add	x0, x0, #0x258
  2029e4:	8b000020 	add	x0, x1, x0
  2029e8:	97fffd32 	bl	201eb0 <rt_list_init>
         i++)
  2029ec:	b9402fa0 	ldr	w0, [x29, #44]
  2029f0:	11000400 	add	w0, w0, #0x1
  2029f4:	b9002fa0 	str	w0, [x29, #44]
    for (i = 0;
  2029f8:	b9402fa0 	ldr	w0, [x29, #44]
  2029fc:	7100001f 	cmp	w0, #0x0
  202a00:	54fffea0 	b.eq	2029d4 <rt_system_timer_init+0x80>  // b.none
    }

    /* initial hardware timer */
    if (!hw_timer)
  202a04:	f0000080 	adrp	x0, 215000 <__data_start__>
  202a08:	91090000 	add	x0, x0, #0x240
  202a0c:	f9400000 	ldr	x0, [x0]
  202a10:	f100001f 	cmp	x0, #0x0
  202a14:	54000221 	b.ne	202a58 <rt_system_timer_init+0x104>  // b.any
    {
        hw_timer = (rt_timer_t)syscall(_NRSYS_rt_timer_create,
                "u_timer",
                sem->data, //SIG_HW_TIMER,
  202a18:	f0000080 	adrp	x0, 215000 <__data_start__>
  202a1c:	91094000 	add	x0, x0, #0x250
  202a20:	f9400000 	ldr	x0, [x0]
        hw_timer = (rt_timer_t)syscall(_NRSYS_rt_timer_create,
  202a24:	f9400401 	ldr	x1, [x0, #8]
  202a28:	f0000060 	adrp	x0, 211000 <__subtf3+0x7d0>
  202a2c:	91286000 	add	x0, x0, #0xa18
  202a30:	52800004 	mov	w4, #0x0                   	// #0
  202a34:	52800003 	mov	w3, #0x0                   	// #0
  202a38:	aa0103e2 	mov	x2, x1
  202a3c:	aa0003e1 	mov	x1, x0
  202a40:	52800de0 	mov	w0, #0x6f                  	// #111
  202a44:	94000396 	bl	20389c <syscall>
  202a48:	aa0003e1 	mov	x1, x0
  202a4c:	f0000080 	adrp	x0, 215000 <__data_start__>
  202a50:	91090000 	add	x0, x0, #0x240
  202a54:	f9000001 	str	x1, [x0]
                0,
                RT_TIMER_FLAG_ONE_SHOT|RT_TIMER_FLAG_HARD_TIMER);
    }

    if (timer_stack_size < 4096)
  202a58:	b9401fa0 	ldr	w0, [x29, #28]
  202a5c:	713ffc1f 	cmp	w0, #0xfff
  202a60:	54000068 	b.hi	202a6c <rt_system_timer_init+0x118>  // b.pmore
    {
        timer_stack_size = 4096;
  202a64:	52820000 	mov	w0, #0x1000                	// #4096
  202a68:	b9001fa0 	str	w0, [x29, #28]
    }

    tid = rt_thread_create("u_timer", timer_thread_entry, RT_NULL,
  202a6c:	90000000 	adrp	x0, 202000 <_rt_timer_init+0x50>
  202a70:	91243001 	add	x1, x0, #0x90c
  202a74:	f0000060 	adrp	x0, 211000 <__subtf3+0x7d0>
  202a78:	91286000 	add	x0, x0, #0xa18
  202a7c:	52800145 	mov	w5, #0xa                   	// #10
  202a80:	52800044 	mov	w4, #0x2                   	// #2
  202a84:	b9401fa3 	ldr	w3, [x29, #28]
  202a88:	d2800002 	mov	x2, #0x0                   	// #0
  202a8c:	97fffca5 	bl	201d20 <rt_thread_create>
  202a90:	f90013a0 	str	x0, [x29, #32]
            timer_stack_size, 2, 10);
    if (tid)
  202a94:	f94013a0 	ldr	x0, [x29, #32]
  202a98:	f100001f 	cmp	x0, #0x0
  202a9c:	54000060 	b.eq	202aa8 <rt_system_timer_init+0x154>  // b.none
    {
        rt_thread_startup(tid);
  202aa0:	f94013a0 	ldr	x0, [x29, #32]
  202aa4:	97fffcd3 	bl	201df0 <rt_thread_startup>
    }
}
  202aa8:	d503201f 	nop
  202aac:	a8c37bfd 	ldp	x29, x30, [sp], #48
  202ab0:	d65f03c0 	ret

0000000000202ab4 <rt_malloc>:
#include <stdarg.h>

#include <rtthread.h>

void *rt_malloc(rt_size_t nbytes)
{
  202ab4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  202ab8:	910003fd 	mov	x29, sp
  202abc:	f9000fa0 	str	x0, [x29, #24]
    return malloc(nbytes);
  202ac0:	f9400fa0 	ldr	x0, [x29, #24]
  202ac4:	94001181 	bl	2070c8 <malloc>
}
  202ac8:	a8c27bfd 	ldp	x29, x30, [sp], #32
  202acc:	d65f03c0 	ret

0000000000202ad0 <rt_free>:

void rt_free(void *ptr)
{
  202ad0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  202ad4:	910003fd 	mov	x29, sp
  202ad8:	f9000fa0 	str	x0, [x29, #24]
    return free(ptr);
  202adc:	f9400fa0 	ldr	x0, [x29, #24]
  202ae0:	94001310 	bl	207720 <free>
}
  202ae4:	a8c27bfd 	ldp	x29, x30, [sp], #32
  202ae8:	d65f03c0 	ret

0000000000202aec <rt_realloc>:

void *rt_realloc(void *ptr, rt_size_t nbytes)
{
  202aec:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  202af0:	910003fd 	mov	x29, sp
  202af4:	f9000fa0 	str	x0, [x29, #24]
  202af8:	f9000ba1 	str	x1, [x29, #16]
    return realloc(ptr, nbytes);
  202afc:	f9400ba1 	ldr	x1, [x29, #16]
  202b00:	f9400fa0 	ldr	x0, [x29, #24]
  202b04:	9400131b 	bl	207770 <realloc>
}
  202b08:	a8c27bfd 	ldp	x29, x30, [sp], #32
  202b0c:	d65f03c0 	ret

0000000000202b10 <rt_calloc>:

void *rt_calloc(rt_size_t count, rt_size_t size)
{
  202b10:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  202b14:	910003fd 	mov	x29, sp
  202b18:	f9000fa0 	str	x0, [x29, #24]
  202b1c:	f9000ba1 	str	x1, [x29, #16]
    return calloc(count, size);
  202b20:	f9400ba1 	ldr	x1, [x29, #16]
  202b24:	f9400fa0 	ldr	x0, [x29, #24]
  202b28:	940012c2 	bl	207630 <calloc>
}
  202b2c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  202b30:	d65f03c0 	ret

0000000000202b34 <rt_snprintf>:

rt_int32_t rt_snprintf(char *buf, rt_size_t size, const char *format, ...)
{
  202b34:	a9ad7bfd 	stp	x29, x30, [sp, #-304]!
  202b38:	910003fd 	mov	x29, sp
  202b3c:	f90027a0 	str	x0, [x29, #72]
  202b40:	f90023a1 	str	x1, [x29, #64]
  202b44:	f9001fa2 	str	x2, [x29, #56]
  202b48:	f90087a3 	str	x3, [x29, #264]
  202b4c:	f9008ba4 	str	x4, [x29, #272]
  202b50:	f9008fa5 	str	x5, [x29, #280]
  202b54:	f90093a6 	str	x6, [x29, #288]
  202b58:	f90097a7 	str	x7, [x29, #296]
  202b5c:	3d8023a0 	str	q0, [x29, #128]
  202b60:	3d8027a1 	str	q1, [x29, #144]
  202b64:	3d802ba2 	str	q2, [x29, #160]
  202b68:	3d802fa3 	str	q3, [x29, #176]
  202b6c:	3d8033a4 	str	q4, [x29, #192]
  202b70:	3d8037a5 	str	q5, [x29, #208]
  202b74:	3d803ba6 	str	q6, [x29, #224]
  202b78:	3d803fa7 	str	q7, [x29, #240]
    int ret;
    va_list ap;
    va_start(ap, format);
  202b7c:	9104c3a0 	add	x0, x29, #0x130
  202b80:	f9002fa0 	str	x0, [x29, #88]
  202b84:	9104c3a0 	add	x0, x29, #0x130
  202b88:	f90033a0 	str	x0, [x29, #96]
  202b8c:	910403a0 	add	x0, x29, #0x100
  202b90:	f90037a0 	str	x0, [x29, #104]
  202b94:	128004e0 	mov	w0, #0xffffffd8            	// #-40
  202b98:	b90073a0 	str	w0, [x29, #112]
  202b9c:	12800fe0 	mov	w0, #0xffffff80            	// #-128
  202ba0:	b90077a0 	str	w0, [x29, #116]
    ret = vsnprintf(buf, size, format, ap);
  202ba4:	910043a2 	add	x2, x29, #0x10
  202ba8:	910163a3 	add	x3, x29, #0x58
  202bac:	a9400460 	ldp	x0, x1, [x3]
  202bb0:	a9000440 	stp	x0, x1, [x2]
  202bb4:	a9410460 	ldp	x0, x1, [x3, #16]
  202bb8:	a9010440 	stp	x0, x1, [x2, #16]
  202bbc:	910043a0 	add	x0, x29, #0x10
  202bc0:	aa0003e3 	mov	x3, x0
  202bc4:	f9401fa2 	ldr	x2, [x29, #56]
  202bc8:	f94023a1 	ldr	x1, [x29, #64]
  202bcc:	f94027a0 	ldr	x0, [x29, #72]
  202bd0:	94001ebc 	bl	20a6c0 <vsnprintf>
  202bd4:	b9007fa0 	str	w0, [x29, #124]
    va_end(ap);
    return ret;
  202bd8:	b9407fa0 	ldr	w0, [x29, #124]
}
  202bdc:	a8d37bfd 	ldp	x29, x30, [sp], #304
  202be0:	d65f03c0 	ret

0000000000202be4 <rt_sprintf>:

rt_int32_t rt_sprintf(char *buf, const char *format, ...)
{
  202be4:	a9ae7bfd 	stp	x29, x30, [sp, #-288]!
  202be8:	910003fd 	mov	x29, sp
  202bec:	f9001fa0 	str	x0, [x29, #56]
  202bf0:	f9001ba1 	str	x1, [x29, #48]
  202bf4:	f9007ba2 	str	x2, [x29, #240]
  202bf8:	f9007fa3 	str	x3, [x29, #248]
  202bfc:	f90083a4 	str	x4, [x29, #256]
  202c00:	f90087a5 	str	x5, [x29, #264]
  202c04:	f9008ba6 	str	x6, [x29, #272]
  202c08:	f9008fa7 	str	x7, [x29, #280]
  202c0c:	3d801fa0 	str	q0, [x29, #112]
  202c10:	3d8023a1 	str	q1, [x29, #128]
  202c14:	3d8027a2 	str	q2, [x29, #144]
  202c18:	3d802ba3 	str	q3, [x29, #160]
  202c1c:	3d802fa4 	str	q4, [x29, #176]
  202c20:	3d8033a5 	str	q5, [x29, #192]
  202c24:	3d8037a6 	str	q6, [x29, #208]
  202c28:	3d803ba7 	str	q7, [x29, #224]
    int ret;
    va_list ap;
    va_start(ap, format);
  202c2c:	910483a0 	add	x0, x29, #0x120
  202c30:	f90027a0 	str	x0, [x29, #72]
  202c34:	910483a0 	add	x0, x29, #0x120
  202c38:	f9002ba0 	str	x0, [x29, #80]
  202c3c:	9103c3a0 	add	x0, x29, #0xf0
  202c40:	f9002fa0 	str	x0, [x29, #88]
  202c44:	128005e0 	mov	w0, #0xffffffd0            	// #-48
  202c48:	b90063a0 	str	w0, [x29, #96]
  202c4c:	12800fe0 	mov	w0, #0xffffff80            	// #-128
  202c50:	b90067a0 	str	w0, [x29, #100]
    ret = vsprintf(buf, format, ap);
  202c54:	910043a2 	add	x2, x29, #0x10
  202c58:	910123a3 	add	x3, x29, #0x48
  202c5c:	a9400460 	ldp	x0, x1, [x3]
  202c60:	a9000440 	stp	x0, x1, [x2]
  202c64:	a9410460 	ldp	x0, x1, [x3, #16]
  202c68:	a9010440 	stp	x0, x1, [x2, #16]
  202c6c:	910043a0 	add	x0, x29, #0x10
  202c70:	aa0003e2 	mov	x2, x0
  202c74:	f9401ba1 	ldr	x1, [x29, #48]
  202c78:	f9401fa0 	ldr	x0, [x29, #56]
  202c7c:	94001ed9 	bl	20a7e0 <vsprintf>
  202c80:	b9006fa0 	str	w0, [x29, #108]
    va_end(ap);
    return ret;
  202c84:	b9406fa0 	ldr	w0, [x29, #108]
}
  202c88:	a8d27bfd 	ldp	x29, x30, [sp], #288
  202c8c:	d65f03c0 	ret

0000000000202c90 <rt_vsnprintf>:

rt_int32_t rt_vsnprintf(char *buf,
    rt_size_t size,
    const char *fmt,
    va_list args)
{
  202c90:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
  202c94:	910003fd 	mov	x29, sp
  202c98:	f9000bf3 	str	x19, [sp, #16]
  202c9c:	f9002fa0 	str	x0, [x29, #88]
  202ca0:	f9002ba1 	str	x1, [x29, #80]
  202ca4:	f90027a2 	str	x2, [x29, #72]
  202ca8:	aa0303f3 	mov	x19, x3
    return (rt_int32_t)vsnprintf(buf, size, fmt, args);
  202cac:	910083a2 	add	x2, x29, #0x20
  202cb0:	aa1303e3 	mov	x3, x19
  202cb4:	a9400460 	ldp	x0, x1, [x3]
  202cb8:	a9000440 	stp	x0, x1, [x2]
  202cbc:	a9410460 	ldp	x0, x1, [x3, #16]
  202cc0:	a9010440 	stp	x0, x1, [x2, #16]
  202cc4:	910083a0 	add	x0, x29, #0x20
  202cc8:	aa0003e3 	mov	x3, x0
  202ccc:	f94027a2 	ldr	x2, [x29, #72]
  202cd0:	f9402ba1 	ldr	x1, [x29, #80]
  202cd4:	f9402fa0 	ldr	x0, [x29, #88]
  202cd8:	94001e7a 	bl	20a6c0 <vsnprintf>
}
  202cdc:	f9400bf3 	ldr	x19, [sp, #16]
  202ce0:	a8c67bfd 	ldp	x29, x30, [sp], #96
  202ce4:	d65f03c0 	ret

0000000000202ce8 <rt_kprintf>:

void rt_kprintf(const char *fmt, ...)
{
  202ce8:	a9a87bfd 	stp	x29, x30, [sp, #-384]!
  202cec:	910003fd 	mov	x29, sp
  202cf0:	f9001fa0 	str	x0, [x29, #56]
  202cf4:	f900a7a1 	str	x1, [x29, #328]
  202cf8:	f900aba2 	str	x2, [x29, #336]
  202cfc:	f900afa3 	str	x3, [x29, #344]
  202d00:	f900b3a4 	str	x4, [x29, #352]
  202d04:	f900b7a5 	str	x5, [x29, #360]
  202d08:	f900bba6 	str	x6, [x29, #368]
  202d0c:	f900bfa7 	str	x7, [x29, #376]
  202d10:	3d8033a0 	str	q0, [x29, #192]
  202d14:	3d8037a1 	str	q1, [x29, #208]
  202d18:	3d803ba2 	str	q2, [x29, #224]
  202d1c:	3d803fa3 	str	q3, [x29, #240]
  202d20:	3d8043a4 	str	q4, [x29, #256]
  202d24:	3d8047a5 	str	q5, [x29, #272]
  202d28:	3d804ba6 	str	q6, [x29, #288]
  202d2c:	3d804fa7 	str	q7, [x29, #304]
    int ret;
    va_list ap;
    char buf[81];

    va_start(ap, fmt);
  202d30:	910603a0 	add	x0, x29, #0x180
  202d34:	f9004fa0 	str	x0, [x29, #152]
  202d38:	910603a0 	add	x0, x29, #0x180
  202d3c:	f90053a0 	str	x0, [x29, #160]
  202d40:	910503a0 	add	x0, x29, #0x140
  202d44:	f90057a0 	str	x0, [x29, #168]
  202d48:	128006e0 	mov	w0, #0xffffffc8            	// #-56
  202d4c:	b900b3a0 	str	w0, [x29, #176]
  202d50:	12800fe0 	mov	w0, #0xffffff80            	// #-128
  202d54:	b900b7a0 	str	w0, [x29, #180]
    ret = vsnprintf(buf, 81, fmt, ap);
  202d58:	910043a2 	add	x2, x29, #0x10
  202d5c:	910263a3 	add	x3, x29, #0x98
  202d60:	a9400460 	ldp	x0, x1, [x3]
  202d64:	a9000440 	stp	x0, x1, [x2]
  202d68:	a9410460 	ldp	x0, x1, [x3, #16]
  202d6c:	a9010440 	stp	x0, x1, [x2, #16]
  202d70:	910043a1 	add	x1, x29, #0x10
  202d74:	910103a0 	add	x0, x29, #0x40
  202d78:	aa0103e3 	mov	x3, x1
  202d7c:	f9401fa2 	ldr	x2, [x29, #56]
  202d80:	d2800a21 	mov	x1, #0x51                  	// #81
  202d84:	94001e4f 	bl	20a6c0 <vsnprintf>
  202d88:	b900bfa0 	str	w0, [x29, #188]
    va_end(ap);
    if (ret > 0)
  202d8c:	b940bfa0 	ldr	w0, [x29, #188]
  202d90:	7100001f 	cmp	w0, #0x0
  202d94:	540000ad 	b.le	202da8 <rt_kprintf+0xc0>
        printf("%s", buf);
  202d98:	910103a1 	add	x1, x29, #0x40
  202d9c:	f0000060 	adrp	x0, 211000 <__subtf3+0x7d0>
  202da0:	9128c000 	add	x0, x0, #0xa30
  202da4:	940014ff 	bl	2081a0 <printf>
}
  202da8:	d503201f 	nop
  202dac:	a8d87bfd 	ldp	x29, x30, [sp], #384
  202db0:	d65f03c0 	ret

0000000000202db4 <rt_strdup>:

char *rt_strdup(const char* s)
{
  202db4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  202db8:	910003fd 	mov	x29, sp
  202dbc:	f9000fa0 	str	x0, [x29, #24]
    return strdup(s);
  202dc0:	f9400fa0 	ldr	x0, [x29, #24]
  202dc4:	9400206d 	bl	20af78 <strdup>
}
  202dc8:	a8c27bfd 	ldp	x29, x30, [sp], #32
  202dcc:	d65f03c0 	ret

0000000000202dd0 <rt_strstr>:

char *rt_strstr(const char *s1, const char *s2)
{
  202dd0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  202dd4:	910003fd 	mov	x29, sp
  202dd8:	f9000fa0 	str	x0, [x29, #24]
  202ddc:	f9000ba1 	str	x1, [x29, #16]
    return strstr(s1, s2);
  202de0:	f9400ba1 	ldr	x1, [x29, #16]
  202de4:	f9400fa0 	ldr	x0, [x29, #24]
  202de8:	940021a6 	bl	20b480 <strstr>
}
  202dec:	a8c27bfd 	ldp	x29, x30, [sp], #32
  202df0:	d65f03c0 	ret

0000000000202df4 <rt_strcmp>:

rt_int32_t rt_strcmp(const char *cs, const char *ct)
{
  202df4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  202df8:	910003fd 	mov	x29, sp
  202dfc:	f9000fa0 	str	x0, [x29, #24]
  202e00:	f9000ba1 	str	x1, [x29, #16]
    return (rt_int32_t)strcmp(cs, ct);
  202e04:	f9400ba1 	ldr	x1, [x29, #16]
  202e08:	f9400fa0 	ldr	x0, [x29, #24]
  202e0c:	94002047 	bl	20af28 <strcmp>
}
  202e10:	a8c27bfd 	ldp	x29, x30, [sp], #32
  202e14:	d65f03c0 	ret

0000000000202e18 <rt_strlen>:

rt_size_t rt_strlen(const char *src)
{
  202e18:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  202e1c:	910003fd 	mov	x29, sp
  202e20:	f9000fa0 	str	x0, [x29, #24]
    return strlen(src);
  202e24:	f9400fa0 	ldr	x0, [x29, #24]
  202e28:	94002066 	bl	20afc0 <strlen>
}
  202e2c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  202e30:	d65f03c0 	ret

0000000000202e34 <rt_strncmp>:

rt_int32_t rt_strncmp(const char *cs, const char *ct, rt_ubase_t count)
{
  202e34:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  202e38:	910003fd 	mov	x29, sp
  202e3c:	f90017a0 	str	x0, [x29, #40]
  202e40:	f90013a1 	str	x1, [x29, #32]
  202e44:	f9000fa2 	str	x2, [x29, #24]
    return strncmp(cs, ct, count);
  202e48:	f9400fa2 	ldr	x2, [x29, #24]
  202e4c:	f94013a1 	ldr	x1, [x29, #32]
  202e50:	f94017a0 	ldr	x0, [x29, #40]
  202e54:	9400207b 	bl	20b040 <strncmp>
}
  202e58:	a8c37bfd 	ldp	x29, x30, [sp], #48
  202e5c:	d65f03c0 	ret

0000000000202e60 <rt_strncpy>:

char *rt_strncpy(char *dest, const char *src, rt_ubase_t n)
{
  202e60:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  202e64:	910003fd 	mov	x29, sp
  202e68:	f90017a0 	str	x0, [x29, #40]
  202e6c:	f90013a1 	str	x1, [x29, #32]
  202e70:	f9000fa2 	str	x2, [x29, #24]
    return strncpy(dest, src, n);
  202e74:	f9400fa2 	ldr	x2, [x29, #24]
  202e78:	f94013a1 	ldr	x1, [x29, #32]
  202e7c:	f94017a0 	ldr	x0, [x29, #40]
  202e80:	9400208c 	bl	20b0b0 <strncpy>
}
  202e84:	a8c37bfd 	ldp	x29, x30, [sp], #48
  202e88:	d65f03c0 	ret

0000000000202e8c <rt_strcasecmp>:

rt_uint32_t rt_strcasecmp(const char *a, const char *b)
{
  202e8c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  202e90:	910003fd 	mov	x29, sp
  202e94:	f9000fa0 	str	x0, [x29, #24]
  202e98:	f9000ba1 	str	x1, [x29, #16]
    return strcasecmp(a, b);
  202e9c:	f9400ba1 	ldr	x1, [x29, #16]
  202ea0:	f9400fa0 	ldr	x0, [x29, #24]
  202ea4:	94001ff9 	bl	20ae88 <strcasecmp>
}
  202ea8:	a8c27bfd 	ldp	x29, x30, [sp], #32
  202eac:	d65f03c0 	ret

0000000000202eb0 <rt_memset>:

void *rt_memset(void *src, int c, rt_ubase_t n)
{
  202eb0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  202eb4:	910003fd 	mov	x29, sp
  202eb8:	f90017a0 	str	x0, [x29, #40]
  202ebc:	b90027a1 	str	w1, [x29, #36]
  202ec0:	f9000fa2 	str	x2, [x29, #24]
    return memset(src, c, n);
  202ec4:	f9400fa2 	ldr	x2, [x29, #24]
  202ec8:	b94027a1 	ldr	w1, [x29, #36]
  202ecc:	f94017a0 	ldr	x0, [x29, #40]
  202ed0:	94001fb6 	bl	20ada8 <memset>
}
  202ed4:	a8c37bfd 	ldp	x29, x30, [sp], #48
  202ed8:	d65f03c0 	ret

0000000000202edc <rt_memcpy>:

void *rt_memcpy(void *dest, const void *src, rt_ubase_t n)
{
  202edc:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  202ee0:	910003fd 	mov	x29, sp
  202ee4:	f90017a0 	str	x0, [x29, #40]
  202ee8:	f90013a1 	str	x1, [x29, #32]
  202eec:	f9000fa2 	str	x2, [x29, #24]
    return memcpy(dest, src, n);
  202ef0:	f9400fa2 	ldr	x2, [x29, #24]
  202ef4:	f94013a1 	ldr	x1, [x29, #32]
  202ef8:	f94017a0 	ldr	x0, [x29, #40]
  202efc:	94001e59 	bl	20a860 <memcpy>
}
  202f00:	a8c37bfd 	ldp	x29, x30, [sp], #48
  202f04:	d65f03c0 	ret

0000000000202f08 <rt_memcmp>:

rt_int32_t rt_memcmp(const void *cs, const void *ct, rt_ubase_t count)
{
  202f08:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  202f0c:	910003fd 	mov	x29, sp
  202f10:	f90017a0 	str	x0, [x29, #40]
  202f14:	f90013a1 	str	x1, [x29, #32]
  202f18:	f9000fa2 	str	x2, [x29, #24]
    return memcmp(cs, ct, count);
  202f1c:	f9400fa2 	ldr	x2, [x29, #24]
  202f20:	f94013a1 	ldr	x1, [x29, #32]
  202f24:	f94017a0 	ldr	x0, [x29, #40]
  202f28:	94001e3a 	bl	20a810 <memcmp>
}
  202f2c:	a8c37bfd 	ldp	x29, x30, [sp], #48
  202f30:	d65f03c0 	ret

0000000000202f34 <rt_memmove>:

void *rt_memmove(void *dest, const void *src, rt_ubase_t n)
{
  202f34:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  202f38:	910003fd 	mov	x29, sp
  202f3c:	f90017a0 	str	x0, [x29, #40]
  202f40:	f90013a1 	str	x1, [x29, #32]
  202f44:	f9000fa2 	str	x2, [x29, #24]
    return memmove(dest, src, n);
  202f48:	f9400fa2 	ldr	x2, [x29, #24]
  202f4c:	f94013a1 	ldr	x1, [x29, #32]
  202f50:	f94017a0 	ldr	x0, [x29, #40]
  202f54:	94001f37 	bl	20ac30 <memmove>
}
  202f58:	a8c37bfd 	ldp	x29, x30, [sp], #48
  202f5c:	d65f03c0 	ret

0000000000202f60 <rt_tick_from_millisecond>:

rt_tick_t rt_tick_from_millisecond(rt_int32_t ms)
{
  202f60:	d10083ff 	sub	sp, sp, #0x20
  202f64:	b9000fe0 	str	w0, [sp, #12]
    rt_tick_t tick;

    if (ms < 0)
  202f68:	b9400fe0 	ldr	w0, [sp, #12]
  202f6c:	7100001f 	cmp	w0, #0x0
  202f70:	5400008a 	b.ge	202f80 <rt_tick_from_millisecond+0x20>  // b.tcont
    {
        tick = (rt_tick_t)RT_WAITING_FOREVER;
  202f74:	12800000 	mov	w0, #0xffffffff            	// #-1
  202f78:	b9001fe0 	str	w0, [sp, #28]
  202f7c:	14000025 	b	203010 <rt_tick_from_millisecond+0xb0>
    }
    else
    {
        tick = RT_TICK_PER_SECOND * (ms / 1000);
  202f80:	b9400fe0 	ldr	w0, [sp, #12]
  202f84:	5289ba61 	mov	w1, #0x4dd3                	// #19923
  202f88:	72a20c41 	movk	w1, #0x1062, lsl #16
  202f8c:	9b217c01 	smull	x1, w0, w1
  202f90:	d360fc21 	lsr	x1, x1, #32
  202f94:	13067c21 	asr	w1, w1, #6
  202f98:	131f7c00 	asr	w0, w0, #31
  202f9c:	4b000021 	sub	w1, w1, w0
  202fa0:	52807d00 	mov	w0, #0x3e8                 	// #1000
  202fa4:	1b007c20 	mul	w0, w1, w0
  202fa8:	b9001fe0 	str	w0, [sp, #28]
        tick += (RT_TICK_PER_SECOND * (ms % 1000) + 999) / 1000;
  202fac:	b9400fe1 	ldr	w1, [sp, #12]
  202fb0:	5289ba60 	mov	w0, #0x4dd3                	// #19923
  202fb4:	72a20c40 	movk	w0, #0x1062, lsl #16
  202fb8:	9b207c20 	smull	x0, w1, w0
  202fbc:	d360fc00 	lsr	x0, x0, #32
  202fc0:	13067c02 	asr	w2, w0, #6
  202fc4:	131f7c20 	asr	w0, w1, #31
  202fc8:	4b000040 	sub	w0, w2, w0
  202fcc:	52807d02 	mov	w2, #0x3e8                 	// #1000
  202fd0:	1b027c00 	mul	w0, w0, w2
  202fd4:	4b000020 	sub	w0, w1, w0
  202fd8:	52807d01 	mov	w1, #0x3e8                 	// #1000
  202fdc:	1b017c00 	mul	w0, w0, w1
  202fe0:	110f9c00 	add	w0, w0, #0x3e7
  202fe4:	5289ba61 	mov	w1, #0x4dd3                	// #19923
  202fe8:	72a20c41 	movk	w1, #0x1062, lsl #16
  202fec:	9b217c01 	smull	x1, w0, w1
  202ff0:	d360fc21 	lsr	x1, x1, #32
  202ff4:	13067c21 	asr	w1, w1, #6
  202ff8:	131f7c00 	asr	w0, w0, #31
  202ffc:	4b000020 	sub	w0, w1, w0
  203000:	2a0003e1 	mov	w1, w0
  203004:	b9401fe0 	ldr	w0, [sp, #28]
  203008:	0b010000 	add	w0, w0, w1
  20300c:	b9001fe0 	str	w0, [sp, #28]
    }

    /* return the calculated tick */
    return tick;
  203010:	b9401fe0 	ldr	w0, [sp, #28]
}
  203014:	910083ff 	add	sp, sp, #0x20
  203018:	d65f03c0 	ret

000000000020301c <rt_malloc_align>:
 * @param align the alignment size
 *
 * @return the allocated memory block on successful, otherwise returns RT_NULL
 */
void *rt_malloc_align(rt_size_t size, rt_size_t align)
{
  20301c:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  203020:	910003fd 	mov	x29, sp
  203024:	f9000fa0 	str	x0, [x29, #24]
  203028:	f9000ba1 	str	x1, [x29, #16]
    void *align_ptr;
    int uintptr_size;
    rt_size_t align_size;

    /* sizeof pointer */
    uintptr_size = sizeof(void*);
  20302c:	52800100 	mov	w0, #0x8                   	// #8
  203030:	b9002fa0 	str	w0, [x29, #44]
    uintptr_size -= 1;
  203034:	b9402fa0 	ldr	w0, [x29, #44]
  203038:	51000400 	sub	w0, w0, #0x1
  20303c:	b9002fa0 	str	w0, [x29, #44]

    /* align the alignment size to uintptr size byte */
    align = ((align + uintptr_size) & ~uintptr_size);
  203040:	b9802fa1 	ldrsw	x1, [x29, #44]
  203044:	f9400ba0 	ldr	x0, [x29, #16]
  203048:	8b000021 	add	x1, x1, x0
  20304c:	b9402fa0 	ldr	w0, [x29, #44]
  203050:	2a2003e0 	mvn	w0, w0
  203054:	93407c00 	sxtw	x0, w0
  203058:	8a000020 	and	x0, x1, x0
  20305c:	f9000ba0 	str	x0, [x29, #16]

    /* get total aligned size */
    align_size = ((size + uintptr_size) & ~uintptr_size) + align;
  203060:	b9802fa1 	ldrsw	x1, [x29, #44]
  203064:	f9400fa0 	ldr	x0, [x29, #24]
  203068:	8b000021 	add	x1, x1, x0
  20306c:	b9402fa0 	ldr	w0, [x29, #44]
  203070:	2a2003e0 	mvn	w0, w0
  203074:	93407c00 	sxtw	x0, w0
  203078:	8a000020 	and	x0, x1, x0
  20307c:	f9400ba1 	ldr	x1, [x29, #16]
  203080:	8b000020 	add	x0, x1, x0
  203084:	f90013a0 	str	x0, [x29, #32]
    /* allocate memory block from heap */
    ptr = rt_malloc(align_size);
  203088:	f94013a0 	ldr	x0, [x29, #32]
  20308c:	97fffe8a 	bl	202ab4 <rt_malloc>
  203090:	f9001fa0 	str	x0, [x29, #56]
    if (ptr != RT_NULL)
  203094:	f9401fa0 	ldr	x0, [x29, #56]
  203098:	f100001f 	cmp	x0, #0x0
  20309c:	54000360 	b.eq	203108 <rt_malloc_align+0xec>  // b.none
    {
        /* the allocated memory block is aligned */
        if (((rt_ubase_t)ptr & (align - 1)) == 0)
  2030a0:	f9400ba0 	ldr	x0, [x29, #16]
  2030a4:	d1000401 	sub	x1, x0, #0x1
  2030a8:	f9401fa0 	ldr	x0, [x29, #56]
  2030ac:	8a000020 	and	x0, x1, x0
  2030b0:	f100001f 	cmp	x0, #0x0
  2030b4:	540000c1 	b.ne	2030cc <rt_malloc_align+0xb0>  // b.any
        {
            align_ptr = (void *)((rt_ubase_t)ptr + align);
  2030b8:	f9401fa1 	ldr	x1, [x29, #56]
  2030bc:	f9400ba0 	ldr	x0, [x29, #16]
  2030c0:	8b000020 	add	x0, x1, x0
  2030c4:	f9001ba0 	str	x0, [x29, #48]
  2030c8:	14000009 	b	2030ec <rt_malloc_align+0xd0>
        }
        else
        {
            align_ptr = (void *)(((rt_ubase_t)ptr + (align - 1)) & ~(align - 1));
  2030cc:	f9401fa1 	ldr	x1, [x29, #56]
  2030d0:	f9400ba0 	ldr	x0, [x29, #16]
  2030d4:	8b000020 	add	x0, x1, x0
  2030d8:	d1000401 	sub	x1, x0, #0x1
  2030dc:	f9400ba0 	ldr	x0, [x29, #16]
  2030e0:	cb0003e0 	neg	x0, x0
  2030e4:	8a000020 	and	x0, x1, x0
  2030e8:	f9001ba0 	str	x0, [x29, #48]
        }

        /* set the pointer before alignment pointer to the real pointer */
        *((rt_ubase_t *)((rt_ubase_t)align_ptr - sizeof(void *))) = (rt_ubase_t)ptr;
  2030ec:	f9401ba0 	ldr	x0, [x29, #48]
  2030f0:	d1002000 	sub	x0, x0, #0x8
  2030f4:	aa0003e1 	mov	x1, x0
  2030f8:	f9401fa0 	ldr	x0, [x29, #56]
  2030fc:	f9000020 	str	x0, [x1]

        ptr = align_ptr;
  203100:	f9401ba0 	ldr	x0, [x29, #48]
  203104:	f9001fa0 	str	x0, [x29, #56]
    }

    return ptr;
  203108:	f9401fa0 	ldr	x0, [x29, #56]
}
  20310c:	a8c47bfd 	ldp	x29, x30, [sp], #64
  203110:	d65f03c0 	ret

0000000000203114 <rt_free_align>:
 * rt_malloc_align function and address is aligned.
 *
 * @param ptr the memory block pointer
 */
void rt_free_align(void *ptr)
{
  203114:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  203118:	910003fd 	mov	x29, sp
  20311c:	f9000fa0 	str	x0, [x29, #24]
    void *real_ptr;

    real_ptr = (void *) * (rt_ubase_t *)((rt_ubase_t)ptr - sizeof(void *));
  203120:	f9400fa0 	ldr	x0, [x29, #24]
  203124:	d1002000 	sub	x0, x0, #0x8
  203128:	f9400000 	ldr	x0, [x0]
  20312c:	f90017a0 	str	x0, [x29, #40]
    rt_free(real_ptr);
  203130:	f94017a0 	ldr	x0, [x29, #40]
  203134:	97fffe67 	bl	202ad0 <rt_free>
}
  203138:	d503201f 	nop
  20313c:	a8c37bfd 	ldp	x29, x30, [sp], #48
  203140:	d65f03c0 	ret

0000000000203144 <rt_assert_handler>:

void rt_assert_handler(const char *ex_string, const char *func, rt_size_t line)
{
  203144:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  203148:	910003fd 	mov	x29, sp
  20314c:	f90017a0 	str	x0, [x29, #40]
  203150:	f90013a1 	str	x1, [x29, #32]
  203154:	f9000fa2 	str	x2, [x29, #24]
    printf("UserAPP: (%s) assertion failed at function:%s, line number:%d \n", ex_string, func, (int)line);
  203158:	f9400fa0 	ldr	x0, [x29, #24]
  20315c:	2a0003e1 	mov	w1, w0
  203160:	d0000060 	adrp	x0, 211000 <__subtf3+0x7d0>
  203164:	9128e000 	add	x0, x0, #0xa38
  203168:	2a0103e3 	mov	w3, w1
  20316c:	f94013a2 	ldr	x2, [x29, #32]
  203170:	f94017a1 	ldr	x1, [x29, #40]
  203174:	9400140b 	bl	2081a0 <printf>
    exit(-1);
  203178:	12800000 	mov	w0, #0xffffffff            	// #-1
  20317c:	9400011f 	bl	2035f8 <exit>

0000000000203180 <thread_handler>:
#include <time.h>   /* for timer_create(), `struct itimerspec`,
                     * timer_t and CLOCK_REALTIME 
                     */
#include <errno.h>

void thread_handler(union sigval sv) {
  203180:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  203184:	910003fd 	mov	x29, sp
  203188:	f9000fa0 	str	x0, [x29, #24]
        char *s = sv.sival_ptr;
  20318c:	f9400fa0 	ldr	x0, [x29, #24]
  203190:	f90017a0 	str	x0, [x29, #40]

        /* Will print "5 seconds elapsed." */
        puts(s);
  203194:	f94017a0 	ldr	x0, [x29, #40]
  203198:	94001424 	bl	208228 <puts>
}
  20319c:	d503201f 	nop
  2031a0:	a8c37bfd 	ldp	x29, x30, [sp], #48
  2031a4:	d65f03c0 	ret

00000000002031a8 <main>:

int main(void) {
  2031a8:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
  2031ac:	910003fd 	mov	x29, sp
  2031b0:	f9000bf3 	str	x19, [sp, #16]
        char info[] = "1 seconds elapsed.";
  2031b4:	d0000060 	adrp	x0, 211000 <__subtf3+0x7d0>
  2031b8:	912ae000 	add	x0, x0, #0xab8
  2031bc:	910223a2 	add	x2, x29, #0x88
  2031c0:	aa0003e3 	mov	x3, x0
  2031c4:	a9400460 	ldp	x0, x1, [x3]
  2031c8:	a9000440 	stp	x0, x1, [x2]
  2031cc:	91003c61 	add	x1, x3, #0xf
  2031d0:	91003c40 	add	x0, x2, #0xf
  2031d4:	b9400021 	ldr	w1, [x1]
  2031d8:	b9000001 	str	w1, [x0]
        timer_t timerid;
        struct sigevent sev;
        struct itimerspec trigger;

        /* Set all `sev` and `trigger` memory to 0 */
        memset(&sev, 0, sizeof(struct sigevent));
  2031dc:	910103a0 	add	x0, x29, #0x40
  2031e0:	d2800802 	mov	x2, #0x40                  	// #64
  2031e4:	52800001 	mov	w1, #0x0                   	// #0
  2031e8:	94001ef0 	bl	20ada8 <memset>
        memset(&trigger, 0, sizeof(struct itimerspec));
  2031ec:	910083a0 	add	x0, x29, #0x20
  2031f0:	d2800402 	mov	x2, #0x20                  	// #32
  2031f4:	52800001 	mov	w1, #0x0                   	// #0
  2031f8:	94001eec 	bl	20ada8 <memset>
         *
         * Upon timer expiration, `sigev_notify_function` (thread_handler()),
         * will be invoked as if it were the start function of a new thread.
         *
         */
        sev.sigev_notify = SIGEV_THREAD;
  2031fc:	52800040 	mov	w0, #0x2                   	// #2
  203200:	b9004fa0 	str	w0, [x29, #76]
        sev.sigev_notify_function = &thread_handler;
  203204:	90000000 	adrp	x0, 203000 <rt_tick_from_millisecond+0xa0>
  203208:	91060000 	add	x0, x0, #0x180
  20320c:	f9002ba0 	str	x0, [x29, #80]
        sev.sigev_value.sival_ptr = &info;
  203210:	910223a0 	add	x0, x29, #0x88
  203214:	f90023a0 	str	x0, [x29, #64]

        /* Create the timer. In this example, CLOCK_REALTIME is used as the
         * clock, meaning that we're using a system-wide real-time clock for
         * this timer.
         */
        if (timer_create(CLOCK_REALTIME, &sev, &timerid))
  203218:	910203a1 	add	x1, x29, #0x80
  20321c:	910103a0 	add	x0, x29, #0x40
  203220:	aa0103e2 	mov	x2, x1
  203224:	aa0003e1 	mov	x1, x0
  203228:	52800000 	mov	w0, #0x0                   	// #0
  20322c:	9400254f 	bl	20c768 <timer_create>
  203230:	7100001f 	cmp	w0, #0x0
  203234:	540001c0 	b.eq	20326c <main+0xc4>  // b.none
        {
            fprintf(stderr, "timer_create failed: %s\n", strerror(errno));
  203238:	b0000080 	adrp	x0, 214000 <syscall_table+0x800>
  20323c:	9113a000 	add	x0, x0, #0x4e8
  203240:	f9400013 	ldr	x19, [x0]
  203244:	940000b7 	bl	203520 <__errno_location>
  203248:	b9400000 	ldr	w0, [x0]
  20324c:	940000d5 	bl	2035a0 <strerror>
  203250:	aa0003e1 	mov	x1, x0
  203254:	d0000060 	adrp	x0, 211000 <__subtf3+0x7d0>
  203258:	9129e000 	add	x0, x0, #0xa78
  20325c:	aa0103e2 	mov	x2, x1
  203260:	aa0003e1 	mov	x1, x0
  203264:	aa1303e0 	mov	x0, x19
  203268:	9400135a 	bl	207fd0 <fprintf>
        }

        /* Timer expiration will occur withing 5 seconds after being armed
         * by timer_settime().
         */
        trigger.it_value.tv_sec = 1;
  20326c:	d2800020 	mov	x0, #0x1                   	// #1
  203270:	f9001ba0 	str	x0, [x29, #48]

        /* Arm the timer. No flags are set and no old_value will be retrieved.
         */
        if (timer_settime(timerid, 0, &trigger, NULL))
  203274:	f94043a0 	ldr	x0, [x29, #128]
  203278:	910083a1 	add	x1, x29, #0x20
  20327c:	d2800003 	mov	x3, #0x0                   	// #0
  203280:	aa0103e2 	mov	x2, x1
  203284:	52800001 	mov	w1, #0x0                   	// #0
  203288:	940025f0 	bl	20ca48 <timer_settime>
  20328c:	7100001f 	cmp	w0, #0x0
  203290:	540001c0 	b.eq	2032c8 <main+0x120>  // b.none
        {
            fprintf(stderr, "timer_settime failed: %s\n", strerror(errno));
  203294:	b0000080 	adrp	x0, 214000 <syscall_table+0x800>
  203298:	9113a000 	add	x0, x0, #0x4e8
  20329c:	f9400013 	ldr	x19, [x0]
  2032a0:	940000a0 	bl	203520 <__errno_location>
  2032a4:	b9400000 	ldr	w0, [x0]
  2032a8:	940000be 	bl	2035a0 <strerror>
  2032ac:	aa0003e1 	mov	x1, x0
  2032b0:	d0000060 	adrp	x0, 211000 <__subtf3+0x7d0>
  2032b4:	912a6000 	add	x0, x0, #0xa98
  2032b8:	aa0103e2 	mov	x2, x1
  2032bc:	aa0003e1 	mov	x1, x0
  2032c0:	aa1303e0 	mov	x0, x19
  2032c4:	94001343 	bl	207fd0 <fprintf>

        /* Wait 5 seconds under the main thread. In 1 seconds (when the
         * timer expires), a message will be printed to the standard output
         * by the newly created notification thread.
         */
        sleep(2);
  2032c8:	52800040 	mov	w0, #0x2                   	// #2
  2032cc:	9400260d 	bl	20cb00 <sleep>

        /* Delete (destroy) the timer */
        timer_delete(timerid);
  2032d0:	f94043a0 	ldr	x0, [x29, #128]
  2032d4:	940025bd 	bl	20c9c8 <timer_delete>

        return EXIT_SUCCESS;
  2032d8:	52800000 	mov	w0, #0x0                   	// #0
}
  2032dc:	f9400bf3 	ldr	x19, [sp, #16]
  2032e0:	a8ca7bfd 	ldp	x29, x30, [sp], #160
  2032e4:	d65f03c0 	ret

00000000002032e8 <dummy>:
  2032e8:	d65f03c0 	ret
  2032ec:	00000000 	.inst	0x00000000 ; undefined

00000000002032f0 <dummy1>:
  2032f0:	d65f03c0 	ret
  2032f4:	00000000 	.inst	0x00000000 ; undefined

00000000002032f8 <__init_libc>:
  2032f8:	a9ab53f3 	stp	x19, x20, [sp, #-336]!
  2032fc:	aa0003f3 	mov	x19, x0
  203300:	aa0103f4 	mov	x20, x1
  203304:	d2802602 	mov	x2, #0x130                 	// #304
  203308:	910083e3 	add	x3, sp, #0x20
  20330c:	52800001 	mov	w1, #0x0                   	// #0
  203310:	aa0303e0 	mov	x0, x3
  203314:	f9000bfe 	str	x30, [sp, #16]
  203318:	94001ea4 	bl	20ada8 <memset>
  20331c:	aa0003e3 	mov	x3, x0
  203320:	d0000081 	adrp	x1, 215000 <__data_start__>
  203324:	f9400260 	ldr	x0, [x19]
  203328:	f9068033 	str	x19, [x1, #3328]
  20332c:	b4000920 	cbz	x0, 203450 <__init_libc+0x158>
  203330:	d2800000 	mov	x0, #0x0                   	// #0
  203334:	14000002 	b	20333c <__init_libc+0x44>
  203338:	aa0103e0 	mov	x0, x1
  20333c:	91000401 	add	x1, x0, #0x1
  203340:	f8617a62 	ldr	x2, [x19, x1, lsl #3]
  203344:	b5ffffa2 	cbnz	x2, 203338 <__init_libc+0x40>
  203348:	91000800 	add	x0, x0, #0x2
  20334c:	d37df000 	lsl	x0, x0, #3
  203350:	d0000084 	adrp	x4, 215000 <__data_start__>
  203354:	913ba082 	add	x2, x4, #0xee8
  203358:	f8606a61 	ldr	x1, [x19, x0]
  20335c:	8b000260 	add	x0, x19, x0
  203360:	f9000840 	str	x0, [x2, #16]
  203364:	b40006e1 	cbz	x1, 203440 <__init_libc+0x148>
  203368:	91002000 	add	x0, x0, #0x8
  20336c:	f100943f 	cmp	x1, #0x25
  203370:	54000068 	b.hi	20337c <__init_libc+0x84>  // b.pmore
  203374:	f9400002 	ldr	x2, [x0]
  203378:	f8217862 	str	x2, [x3, x1, lsl #3]
  20337c:	91004000 	add	x0, x0, #0x10
  203380:	f85f8001 	ldur	x1, [x0, #-8]
  203384:	b5ffff41 	cbnz	x1, 20336c <__init_libc+0x74>
  203388:	f9402be5 	ldr	x5, [sp, #80]
  20338c:	f94053e1 	ldr	x1, [sp, #160]
  203390:	f94093e6 	ldr	x6, [sp, #288]
  203394:	913ba084 	add	x4, x4, #0xee8
  203398:	d0000082 	adrp	x2, 215000 <__data_start__>
  20339c:	d0000080 	adrp	x0, 215000 <__data_start__>
  2033a0:	f9077041 	str	x1, [x2, #3808]
  2033a4:	f907ac06 	str	x6, [x0, #3928]
  2033a8:	f9001c85 	str	x5, [x4, #56]
  2033ac:	b40002b4 	cbz	x20, 203400 <__init_libc+0x108>
  2033b0:	d0000080 	adrp	x0, 215000 <__data_start__>
  2033b4:	d0000082 	adrp	x2, 215000 <__data_start__>
  2033b8:	f9013c14 	str	x20, [x0, #632]
  2033bc:	f9013854 	str	x20, [x2, #624]
  2033c0:	39400280 	ldrb	w0, [x20]
  2033c4:	340000e0 	cbz	w0, 2033e0 <__init_libc+0xe8>
  2033c8:	91000681 	add	x1, x20, #0x1
  2033cc:	7100bc1f 	cmp	w0, #0x2f
  2033d0:	54000041 	b.ne	2033d8 <__init_libc+0xe0>  // b.any
  2033d4:	f9013841 	str	x1, [x2, #624]
  2033d8:	38401420 	ldrb	w0, [x1], #1
  2033dc:	35ffff80 	cbnz	w0, 2033cc <__init_libc+0xd4>
  2033e0:	aa0303e0 	mov	x0, x3
  2033e4:	94002631 	bl	20cca8 <__init_tls>
  2033e8:	f94077e0 	ldr	x0, [sp, #232]
  2033ec:	940026d1 	bl	20cf30 <__init_ssp>
  2033f0:	f9400bfe 	ldr	x30, [sp, #16]
  2033f4:	a8d553f3 	ldp	x19, x20, [sp], #336
  2033f8:	d65f03c0 	ret
  2033fc:	d503201f 	nop
  203400:	f9408fe1 	ldr	x1, [sp, #280]
  203404:	b50002a1 	cbnz	x1, 203458 <__init_libc+0x160>
  203408:	d0000082 	adrp	x2, 215000 <__data_start__>
  20340c:	d0000081 	adrp	x1, 215000 <__data_start__>
  203410:	d0000060 	adrp	x0, 211000 <__subtf3+0x7d0>
  203414:	912b8000 	add	x0, x0, #0xae0
  203418:	f9013c40 	str	x0, [x2, #632]
  20341c:	f9013820 	str	x0, [x1, #624]
  203420:	aa0303e0 	mov	x0, x3
  203424:	94002621 	bl	20cca8 <__init_tls>
  203428:	f94077e0 	ldr	x0, [sp, #232]
  20342c:	940026c1 	bl	20cf30 <__init_ssp>
  203430:	f9400bfe 	ldr	x30, [sp, #16]
  203434:	a8d553f3 	ldp	x19, x20, [sp], #336
  203438:	d65f03c0 	ret
  20343c:	d503201f 	nop
  203440:	d2800005 	mov	x5, #0x0                   	// #0
  203444:	d2800006 	mov	x6, #0x0                   	// #0
  203448:	17ffffd3 	b	203394 <__init_libc+0x9c>
  20344c:	d503201f 	nop
  203450:	d2800100 	mov	x0, #0x8                   	// #8
  203454:	17ffffbf 	b	203350 <__init_libc+0x58>
  203458:	aa0103f4 	mov	x20, x1
  20345c:	17ffffd5 	b	2033b0 <__init_libc+0xb8>

0000000000203460 <__libc_start_init>:
  203460:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  203464:	f9000bfe 	str	x30, [sp, #16]
  203468:	94003910 	bl	2118a8 <_init>
  20346c:	d0000061 	adrp	x1, 211000 <__subtf3+0x7d0>
  203470:	d0000060 	adrp	x0, 211000 <__subtf3+0x7d0>
  203474:	f9456833 	ldr	x19, [x1, #2768]
  203478:	f9456c14 	ldr	x20, [x0, #2776]
  20347c:	eb14027f 	cmp	x19, x20
  203480:	540000a2 	b.cs	203494 <__libc_start_init+0x34>  // b.hs, b.nlast
  203484:	f8408660 	ldr	x0, [x19], #8
  203488:	d63f0000 	blr	x0
  20348c:	eb14027f 	cmp	x19, x20
  203490:	54ffffa3 	b.cc	203484 <__libc_start_init+0x24>  // b.lo, b.ul, b.last
  203494:	f9400bfe 	ldr	x30, [sp, #16]
  203498:	a8c253f3 	ldp	x19, x20, [sp], #32
  20349c:	d65f03c0 	ret

00000000002034a0 <libc_start_main_stage2>:
  2034a0:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  2034a4:	8b21cc53 	add	x19, x2, w1, sxtw #3
  2034a8:	2a0103f4 	mov	w20, w1
  2034ac:	91002273 	add	x19, x19, #0x8
  2034b0:	a9015bf5 	stp	x21, x22, [sp, #16]
  2034b4:	aa0203f5 	mov	x21, x2
  2034b8:	aa0003f6 	mov	x22, x0
  2034bc:	f90013fe 	str	x30, [sp, #32]
  2034c0:	97ffffe8 	bl	203460 <__libc_start_init>
  2034c4:	aa1303e2 	mov	x2, x19
  2034c8:	aa1503e1 	mov	x1, x21
  2034cc:	2a1403e0 	mov	w0, w20
  2034d0:	d63f02c0 	blr	x22
  2034d4:	94000049 	bl	2035f8 <exit>

00000000002034d8 <__libc_start_main>:
  2034d8:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  2034dc:	2a0103f4 	mov	w20, w1
  2034e0:	8b21cc41 	add	x1, x2, w1, sxtw #3
  2034e4:	aa0203f3 	mov	x19, x2
  2034e8:	a9017bf5 	stp	x21, x30, [sp, #16]
  2034ec:	aa0003f5 	mov	x21, x0
  2034f0:	91002020 	add	x0, x1, #0x8
  2034f4:	f9400041 	ldr	x1, [x2]
  2034f8:	97ffff80 	bl	2032f8 <__init_libc>
  2034fc:	aa1303e2 	mov	x2, x19
  203500:	2a1403e1 	mov	w1, w20
  203504:	aa1503e0 	mov	x0, x21
  203508:	90000003 	adrp	x3, 203000 <rt_tick_from_millisecond+0xa0>
  20350c:	91128063 	add	x3, x3, #0x4a0
  203510:	a9417bf5 	ldp	x21, x30, [sp, #16]
  203514:	a8c253f3 	ldp	x19, x20, [sp], #32
  203518:	d61f0060 	br	x3
  20351c:	00000000 	.inst	0x00000000 ; undefined

0000000000203520 <__errno_location>:
  203520:	d53bd040 	mrs	x0, tpidr_el0
  203524:	d1029000 	sub	x0, x0, #0xa4
  203528:	d65f03c0 	ret
  20352c:	00000000 	.inst	0x00000000 ; undefined

0000000000203530 <__strerror_l>:
  203530:	7101501f 	cmp	w0, #0x54
  203534:	540002e0 	b.eq	203590 <__strerror_l+0x60>  // b.none
  203538:	d0000062 	adrp	x2, 211000 <__subtf3+0x7d0>
  20353c:	912ba042 	add	x2, x2, #0xae8
  203540:	52800023 	mov	w3, #0x1                   	// #1
  203544:	52800424 	mov	w4, #0x21                  	// #33
  203548:	91000442 	add	x2, x2, #0x1
  20354c:	6b00009f 	cmp	w4, w0
  203550:	54000080 	b.eq	203560 <__strerror_l+0x30>  // b.none
  203554:	39400444 	ldrb	w4, [x2, #1]
  203558:	11000463 	add	w3, w3, #0x1
  20355c:	35ffff64 	cbnz	w4, 203548 <__strerror_l+0x18>
  203560:	d0000062 	adrp	x2, 211000 <__subtf3+0x7d0>
  203564:	912d2042 	add	x2, x2, #0xb48
  203568:	52800924 	mov	w4, #0x49                  	// #73
  20356c:	34000064 	cbz	w4, 203578 <__strerror_l+0x48>
  203570:	38401c40 	ldrb	w0, [x2, #1]!
  203574:	35ffffe0 	cbnz	w0, 203570 <__strerror_l+0x40>
  203578:	91000440 	add	x0, x2, #0x1
  20357c:	71000463 	subs	w3, w3, #0x1
  203580:	540000c0 	b.eq	203598 <__strerror_l+0x68>  // b.none
  203584:	39400444 	ldrb	w4, [x2, #1]
  203588:	aa0003e2 	mov	x2, x0
  20358c:	17fffff8 	b	20356c <__strerror_l+0x3c>
  203590:	d0000060 	adrp	x0, 211000 <__subtf3+0x7d0>
  203594:	912d2000 	add	x0, x0, #0xb48
  203598:	f9401421 	ldr	x1, [x1, #40]
  20359c:	14000b97 	b	2063f8 <__lctrans>

00000000002035a0 <strerror>:
  2035a0:	d53bd041 	mrs	x1, tpidr_el0
  2035a4:	f85d0021 	ldur	x1, [x1, #-48]
  2035a8:	17ffffe2 	b	203530 <__strerror_l>
  2035ac:	00000000 	.inst	0x00000000 ; undefined

00000000002035b0 <__funcs_on_exit>:
  2035b0:	d65f03c0 	ret
  2035b4:	00000000 	.inst	0x00000000 ; undefined

00000000002035b8 <__libc_exit_fini>:
  2035b8:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  2035bc:	f0000061 	adrp	x1, 212000 <errmsg+0x4b8>
  2035c0:	f0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2035c4:	f9413433 	ldr	x19, [x1, #616]
  2035c8:	f9413814 	ldr	x20, [x0, #624]
  2035cc:	f9000bfe 	str	x30, [sp, #16]
  2035d0:	eb14027f 	cmp	x19, x20
  2035d4:	540000a9 	b.ls	2035e8 <__libc_exit_fini+0x30>  // b.plast
  2035d8:	f85f8e60 	ldr	x0, [x19, #-8]!
  2035dc:	d63f0000 	blr	x0
  2035e0:	eb14027f 	cmp	x19, x20
  2035e4:	54ffffa8 	b.hi	2035d8 <__libc_exit_fini+0x20>  // b.pmore
  2035e8:	f9400bfe 	ldr	x30, [sp, #16]
  2035ec:	a8c253f3 	ldp	x19, x20, [sp], #32
  2035f0:	140038b2 	b	2118b8 <_fini>
  2035f4:	00000000 	.inst	0x00000000 ; undefined

00000000002035f8 <exit>:
  2035f8:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  2035fc:	2a0003f3 	mov	w19, w0
  203600:	97ffffec 	bl	2035b0 <__funcs_on_exit>
  203604:	97ffffed 	bl	2035b8 <__libc_exit_fini>
  203608:	94002f14 	bl	20f258 <__stdio_exit>
  20360c:	2a1303e0 	mov	w0, w19
  203610:	94002662 	bl	20cf98 <_Exit>
  203614:	00000000 	.inst	0x00000000 ; undefined

0000000000203618 <fcntl>:
  203618:	a9ba53f3 	stp	x19, x20, [sp, #-96]!
  20361c:	128000e3 	mov	w3, #0xfffffff8            	// #-8
  203620:	aa0203f3 	mov	x19, x2
  203624:	93407c14 	sxtw	x20, w0
  203628:	910143e4 	add	x4, sp, #0x50
  20362c:	910183e5 	add	x5, sp, #0x60
  203630:	f9000ffe 	str	x30, [sp, #24]
  203634:	7100103f 	cmp	w1, #0x4
  203638:	a90317e5 	stp	x5, x5, [sp, #48]
  20363c:	f90023e4 	str	x4, [sp, #64]
  203640:	29097fe3 	stp	w3, wzr, [sp, #72]
  203644:	f9002fe2 	str	x2, [sp, #88]
  203648:	540002c0 	b.eq	2036a0 <fcntl+0x88>  // b.none
  20364c:	71001c3f 	cmp	w1, #0x7
  203650:	54000300 	b.eq	2036b0 <fcntl+0x98>  // b.none
  203654:	7100243f 	cmp	w1, #0x9
  203658:	54000440 	b.eq	2036e0 <fcntl+0xc8>  // b.none
  20365c:	7110183f 	cmp	w1, #0x406
  203660:	54000600 	b.eq	203720 <fcntl+0x108>  // b.none
  203664:	f9000bf5 	str	x21, [sp, #16]
  203668:	93407c35 	sxtw	x21, w1
  20366c:	d2801ba0 	mov	x0, #0xdd                  	// #221
  203670:	94000b24 	bl	206300 <get_rtt_syscall>
  203674:	aa0003e3 	mov	x3, x0
  203678:	b4000ac0 	cbz	x0, 2037d0 <fcntl+0x1b8>
  20367c:	aa1303e2 	mov	x2, x19
  203680:	aa1503e1 	mov	x1, x21
  203684:	aa1403e0 	mov	x0, x20
  203688:	d63f0060 	blr	x3
  20368c:	94000b4d 	bl	2063c0 <__syscall_ret>
  203690:	f9400bf5 	ldr	x21, [sp, #16]
  203694:	f9400ffe 	ldr	x30, [sp, #24]
  203698:	a8c653f3 	ldp	x19, x20, [sp], #96
  20369c:	d65f03c0 	ret
  2036a0:	f9000bf5 	str	x21, [sp, #16]
  2036a4:	b26f0053 	orr	x19, x2, #0x20000
  2036a8:	d2800095 	mov	x21, #0x4                   	// #4
  2036ac:	17fffff0 	b	20366c <fcntl+0x54>
  2036b0:	aa0203e3 	mov	x3, x2
  2036b4:	aa1403e1 	mov	x1, x20
  2036b8:	d2800006 	mov	x6, #0x0                   	// #0
  2036bc:	d2800005 	mov	x5, #0x0                   	// #0
  2036c0:	d2800004 	mov	x4, #0x0                   	// #0
  2036c4:	d28000e2 	mov	x2, #0x7                   	// #7
  2036c8:	d2801ba0 	mov	x0, #0xdd                  	// #221
  2036cc:	94002039 	bl	20b7b0 <__syscall_cp>
  2036d0:	94000b3c 	bl	2063c0 <__syscall_ret>
  2036d4:	f9400ffe 	ldr	x30, [sp, #24]
  2036d8:	a8c653f3 	ldp	x19, x20, [sp], #96
  2036dc:	d65f03c0 	ret
  2036e0:	d2801ba0 	mov	x0, #0xdd                  	// #221
  2036e4:	94000b07 	bl	206300 <get_rtt_syscall>
  2036e8:	aa0003e3 	mov	x3, x0
  2036ec:	b4000100 	cbz	x0, 20370c <fcntl+0xf4>
  2036f0:	9100a3e2 	add	x2, sp, #0x28
  2036f4:	d2800201 	mov	x1, #0x10                  	// #16
  2036f8:	aa1403e0 	mov	x0, x20
  2036fc:	d63f0060 	blr	x3
  203700:	3100581f 	cmn	w0, #0x16
  203704:	54000520 	b.eq	2037a8 <fcntl+0x190>  // b.none
  203708:	35000480 	cbnz	w0, 203798 <fcntl+0x180>
  20370c:	294503e1 	ldp	w1, w0, [sp, #40]
  203710:	7100083f 	cmp	w1, #0x2
  203714:	5a801400 	cneg	w0, w0, eq  // eq = none
  203718:	17ffffdf 	b	203694 <fcntl+0x7c>
  20371c:	d503201f 	nop
  203720:	d2801ba0 	mov	x0, #0xdd                  	// #221
  203724:	94000af7 	bl	206300 <get_rtt_syscall>
  203728:	aa0003e3 	mov	x3, x0
  20372c:	b40001e0 	cbz	x0, 203768 <fcntl+0x150>
  203730:	aa1303e2 	mov	x2, x19
  203734:	d28080c1 	mov	x1, #0x406                 	// #1030
  203738:	aa1403e0 	mov	x0, x20
  20373c:	d63f0060 	blr	x3
  203740:	3100581f 	cmn	w0, #0x16
  203744:	540004a0 	b.eq	2037d8 <fcntl+0x1c0>  // b.none
  203748:	93407c13 	sxtw	x19, w0
  20374c:	aa1303f4 	mov	x20, x19
  203750:	36f80100 	tbz	w0, #31, 203770 <fcntl+0x158>
  203754:	aa1303e0 	mov	x0, x19
  203758:	94000b1a 	bl	2063c0 <__syscall_ret>
  20375c:	f9400ffe 	ldr	x30, [sp, #24]
  203760:	a8c653f3 	ldp	x19, x20, [sp], #96
  203764:	d65f03c0 	ret
  203768:	d2800013 	mov	x19, #0x0                   	// #0
  20376c:	d2800014 	mov	x20, #0x0                   	// #0
  203770:	d2801ba0 	mov	x0, #0xdd                  	// #221
  203774:	94000ae3 	bl	206300 <get_rtt_syscall>
  203778:	aa0003e3 	mov	x3, x0
  20377c:	b4fffec0 	cbz	x0, 203754 <fcntl+0x13c>
  203780:	d2800022 	mov	x2, #0x1                   	// #1
  203784:	d2800041 	mov	x1, #0x2                   	// #2
  203788:	aa1403e0 	mov	x0, x20
  20378c:	d63f0060 	blr	x3
  203790:	17fffff1 	b	203754 <fcntl+0x13c>
  203794:	d503201f 	nop
  203798:	93407c00 	sxtw	x0, w0
  20379c:	94000b09 	bl	2063c0 <__syscall_ret>
  2037a0:	17ffffbd 	b	203694 <fcntl+0x7c>
  2037a4:	d503201f 	nop
  2037a8:	d2801ba0 	mov	x0, #0xdd                  	// #221
  2037ac:	94000ad5 	bl	206300 <get_rtt_syscall>
  2037b0:	aa0003e3 	mov	x3, x0
  2037b4:	b40006a0 	cbz	x0, 203888 <fcntl+0x270>
  2037b8:	aa1303e2 	mov	x2, x19
  2037bc:	d2800121 	mov	x1, #0x9                   	// #9
  2037c0:	aa1403e0 	mov	x0, x20
  2037c4:	d63f0060 	blr	x3
  2037c8:	17ffffb3 	b	203694 <fcntl+0x7c>
  2037cc:	d503201f 	nop
  2037d0:	d2800000 	mov	x0, #0x0                   	// #0
  2037d4:	17ffffae 	b	20368c <fcntl+0x74>
  2037d8:	d2801ba0 	mov	x0, #0xdd                  	// #221
  2037dc:	94000ac9 	bl	206300 <get_rtt_syscall>
  2037e0:	aa0003e3 	mov	x3, x0
  2037e4:	b4000180 	cbz	x0, 203814 <fcntl+0x1fc>
  2037e8:	d2800002 	mov	x2, #0x0                   	// #0
  2037ec:	d28080c1 	mov	x1, #0x406                 	// #1030
  2037f0:	aa1403e0 	mov	x0, x20
  2037f4:	d63f0060 	blr	x3
  2037f8:	3100581f 	cmn	w0, #0x16
  2037fc:	540001c0 	b.eq	203834 <fcntl+0x21c>  // b.none
  203800:	93407c13 	sxtw	x19, w0
  203804:	36f800a0 	tbz	w0, #31, 203818 <fcntl+0x200>
  203808:	928002a0 	mov	x0, #0xffffffffffffffea    	// #-22
  20380c:	94000aed 	bl	2063c0 <__syscall_ret>
  203810:	17ffffa1 	b	203694 <fcntl+0x7c>
  203814:	d2800013 	mov	x19, #0x0                   	// #0
  203818:	d28000c0 	mov	x0, #0x6                   	// #6
  20381c:	94000ab9 	bl	206300 <get_rtt_syscall>
  203820:	aa0003e1 	mov	x1, x0
  203824:	b4ffff20 	cbz	x0, 203808 <fcntl+0x1f0>
  203828:	aa1303e0 	mov	x0, x19
  20382c:	d63f0020 	blr	x1
  203830:	17fffff6 	b	203808 <fcntl+0x1f0>
  203834:	d2801ba0 	mov	x0, #0xdd                  	// #221
  203838:	94000ab2 	bl	206300 <get_rtt_syscall>
  20383c:	aa0003e3 	mov	x3, x0
  203840:	b4000280 	cbz	x0, 203890 <fcntl+0x278>
  203844:	aa1303e2 	mov	x2, x19
  203848:	d2800001 	mov	x1, #0x0                   	// #0
  20384c:	aa1403e0 	mov	x0, x20
  203850:	d63f0060 	blr	x3
  203854:	93407c13 	sxtw	x19, w0
  203858:	aa1303e1 	mov	x1, x19
  20385c:	37fff7c0 	tbnz	w0, #31, 203754 <fcntl+0x13c>
  203860:	93407c33 	sxtw	x19, w1
  203864:	d2801ba0 	mov	x0, #0xdd                  	// #221
  203868:	94000aa6 	bl	206300 <get_rtt_syscall>
  20386c:	aa0003e3 	mov	x3, x0
  203870:	b4fff720 	cbz	x0, 203754 <fcntl+0x13c>
  203874:	d2800022 	mov	x2, #0x1                   	// #1
  203878:	d2800041 	mov	x1, #0x2                   	// #2
  20387c:	aa1303e0 	mov	x0, x19
  203880:	d63f0060 	blr	x3
  203884:	17ffffb4 	b	203754 <fcntl+0x13c>
  203888:	52800000 	mov	w0, #0x0                   	// #0
  20388c:	17ffff82 	b	203694 <fcntl+0x7c>
  203890:	52800001 	mov	w1, #0x0                   	// #0
  203894:	17fffff3 	b	203860 <fcntl+0x248>

0000000000203898 <__syscall>:
  203898:	14000aa8 	b	206338 <___syscall>

000000000020389c <syscall>:
  20389c:	2a0003e8 	mov	w8, w0
  2038a0:	aa0103e0 	mov	x0, x1
  2038a4:	aa0203e1 	mov	x1, x2
  2038a8:	aa0303e2 	mov	x2, x3
  2038ac:	aa0403e3 	mov	x3, x4
  2038b0:	aa0503e4 	mov	x4, x5
  2038b4:	aa0603e5 	mov	x5, x6
  2038b8:	aa0703e6 	mov	x6, x7
  2038bc:	d4000001 	svc	#0x0
  2038c0:	d65f03c0 	ret
  2038c4:	00000000 	.inst	0x00000000 ; undefined

00000000002038c8 <syscall_set_thread_area>:
  2038c8:	aa0003e1 	mov	x1, x0
  2038cc:	d2800f60 	mov	x0, #0x7b                  	// #123
  2038d0:	17fffff3 	b	20389c <syscall>
  2038d4:	00000000 	.inst	0x00000000 ; undefined

00000000002038d8 <syscall_mq_close>:
  2038d8:	93407c01 	sxtw	x1, w0
  2038dc:	d2801500 	mov	x0, #0xa8                  	// #168
  2038e0:	17ffffef 	b	20389c <syscall>
  2038e4:	00000000 	.inst	0x00000000 ; undefined

00000000002038e8 <syscall_shmdt>:
  2038e8:	aa0003e1 	mov	x1, x0
  2038ec:	d2802640 	mov	x0, #0x132                 	// #306
  2038f0:	17ffffeb 	b	20389c <syscall>
  2038f4:	00000000 	.inst	0x00000000 ; undefined

00000000002038f8 <syscall_mq_unlink>:
  2038f8:	aa0003e1 	mov	x1, x0
  2038fc:	d2801460 	mov	x0, #0xa3                  	// #163
  203900:	17ffffe7 	b	20389c <syscall>
  203904:	00000000 	.inst	0x00000000 ; undefined

0000000000203908 <syscall_timer_delete>:
  203908:	aa0003e1 	mov	x1, x0
  20390c:	d28013c0 	mov	x0, #0x9e                  	// #158
  203910:	17ffffe3 	b	20389c <syscall>
  203914:	00000000 	.inst	0x00000000 ; undefined

0000000000203918 <syscall_timer_getoverrun>:
  203918:	aa0003e1 	mov	x1, x0
  20391c:	d2801420 	mov	x0, #0xa1                  	// #161
  203920:	17ffffdf 	b	20389c <syscall>
  203924:	00000000 	.inst	0x00000000 ; undefined

0000000000203928 <syscall_set_tid_address>:
  203928:	aa0003e1 	mov	x1, x0
  20392c:	d2800f80 	mov	x0, #0x7c                  	// #124
  203930:	17ffffdb 	b	20389c <syscall>
  203934:	00000000 	.inst	0x00000000 ; undefined

0000000000203938 <syscall_exit_group>:
  203938:	93407c01 	sxtw	x1, w0
  20393c:	d2800c40 	mov	x0, #0x62                  	// #98
  203940:	17ffffd7 	b	20389c <syscall>
  203944:	00000000 	.inst	0x00000000 ; undefined

0000000000203948 <syscall_sched_get_priority_min>:
  203948:	93407c01 	sxtw	x1, w0
  20394c:	d28012e0 	mov	x0, #0x97                  	// #151
  203950:	17ffffd3 	b	20389c <syscall>
  203954:	00000000 	.inst	0x00000000 ; undefined

0000000000203958 <syscall_sched_get_priority_max>:
  203958:	93407c01 	sxtw	x1, w0
  20395c:	d28012c0 	mov	x0, #0x96                  	// #150
  203960:	17ffffcf 	b	20389c <syscall>
  203964:	00000000 	.inst	0x00000000 ; undefined

0000000000203968 <syscall_fsync>:
  203968:	93407c01 	sxtw	x1, w0
  20396c:	d2801360 	mov	x0, #0x9b                  	// #155
  203970:	17ffffcb 	b	20389c <syscall>
  203974:	00000000 	.inst	0x00000000 ; undefined

0000000000203978 <syscall_brk>:
  203978:	aa0003e1 	mov	x1, x0
  20397c:	d2800680 	mov	x0, #0x34                  	// #52
  203980:	17ffffc7 	b	20389c <syscall>
  203984:	00000000 	.inst	0x00000000 ; undefined

0000000000203988 <syscall_pipe>:
  203988:	aa0003e1 	mov	x1, x0
  20398c:	d2800fc0 	mov	x0, #0x7e                  	// #126
  203990:	17ffffc3 	b	20389c <syscall>
  203994:	00000000 	.inst	0x00000000 ; undefined

0000000000203998 <syscall_dup>:
  203998:	93407c01 	sxtw	x1, w0
  20399c:	d28010a0 	mov	x0, #0x85                  	// #133
  2039a0:	17ffffbf 	b	20389c <syscall>
  2039a4:	00000000 	.inst	0x00000000 ; undefined

00000000002039a8 <syscall_rmdir>:
  2039a8:	aa0003e1 	mov	x1, x0
  2039ac:	d2800f00 	mov	x0, #0x78                  	// #120
  2039b0:	17ffffbb 	b	20389c <syscall>
  2039b4:	00000000 	.inst	0x00000000 ; undefined

00000000002039b8 <syscall_chdir>:
  2039b8:	aa0003e1 	mov	x1, x0
  2039bc:	d2800ea0 	mov	x0, #0x75                  	// #117
  2039c0:	17ffffb7 	b	20389c <syscall>
  2039c4:	00000000 	.inst	0x00000000 ; undefined

00000000002039c8 <syscall_unlink>:
  2039c8:	aa0003e1 	mov	x1, x0
  2039cc:	d2800ec0 	mov	x0, #0x76                  	// #118
  2039d0:	17ffffb3 	b	20389c <syscall>
  2039d4:	00000000 	.inst	0x00000000 ; undefined

00000000002039d8 <syscall_close>:
  2039d8:	93407c01 	sxtw	x1, w0
  2039dc:	d28000c0 	mov	x0, #0x6                   	// #6
  2039e0:	17ffffaf 	b	20389c <syscall>
  2039e4:	00000000 	.inst	0x00000000 ; undefined

00000000002039e8 <syscall_exit>:
  2039e8:	93407c01 	sxtw	x1, w0
  2039ec:	d2800020 	mov	x0, #0x1                   	// #1
  2039f0:	17ffffab 	b	20389c <syscall>
  2039f4:	00000000 	.inst	0x00000000 ; undefined

00000000002039f8 <syscall_trace>:
  2039f8:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  2039fc:	d28003a2 	mov	x2, #0x1d                  	// #29
  203a00:	aa0003f3 	mov	x19, x0
  203a04:	2a0103f4 	mov	w20, w1
  203a08:	f9000bfe 	str	x30, [sp, #16]
  203a0c:	b0000081 	adrp	x1, 214000 <syscall_table+0x800>
  203a10:	d2801fe0 	mov	x0, #0xff                  	// #255
  203a14:	91122021 	add	x1, x1, #0x488
  203a18:	97ffffa1 	bl	20389c <syscall>
  203a1c:	93407e82 	sxtw	x2, w20
  203a20:	aa1303e1 	mov	x1, x19
  203a24:	f9400bfe 	ldr	x30, [sp, #16]
  203a28:	d2801fe0 	mov	x0, #0xff                  	// #255
  203a2c:	a8c253f3 	ldp	x19, x20, [sp], #32
  203a30:	17ffff9b 	b	20389c <syscall>
  203a34:	00000000 	.inst	0x00000000 ; undefined

0000000000203a38 <syscall_io_pgetevents>:
  203a38:	f81f0ffe 	str	x30, [sp, #-16]!
  203a3c:	528002c1 	mov	w1, #0x16                  	// #22
  203a40:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203a44:	911fa000 	add	x0, x0, #0x7e8
  203a48:	97ffffec 	bl	2039f8 <syscall_trace>
  203a4c:	d2800000 	mov	x0, #0x0                   	// #0
  203a50:	f84107fe 	ldr	x30, [sp], #16
  203a54:	d65f03c0 	ret

0000000000203a58 <syscall_rseq>:
  203a58:	f81f0ffe 	str	x30, [sp, #-16]!
  203a5c:	528001a1 	mov	w1, #0xd                   	// #13
  203a60:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203a64:	911f6000 	add	x0, x0, #0x7d8
  203a68:	97ffffe4 	bl	2039f8 <syscall_trace>
  203a6c:	d2800000 	mov	x0, #0x0                   	// #0
  203a70:	f84107fe 	ldr	x30, [sp], #16
  203a74:	d65f03c0 	ret

0000000000203a78 <syscall_statx>:
  203a78:	f81f0ffe 	str	x30, [sp, #-16]!
  203a7c:	528001c1 	mov	w1, #0xe                   	// #14
  203a80:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203a84:	911f2000 	add	x0, x0, #0x7c8
  203a88:	97ffffdc 	bl	2039f8 <syscall_trace>
  203a8c:	d2800000 	mov	x0, #0x0                   	// #0
  203a90:	f84107fe 	ldr	x30, [sp], #16
  203a94:	d65f03c0 	ret

0000000000203a98 <syscall_pkey_free>:
  203a98:	f81f0ffe 	str	x30, [sp, #-16]!
  203a9c:	52800241 	mov	w1, #0x12                  	// #18
  203aa0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203aa4:	911ec000 	add	x0, x0, #0x7b0
  203aa8:	97ffffd4 	bl	2039f8 <syscall_trace>
  203aac:	d2800000 	mov	x0, #0x0                   	// #0
  203ab0:	f84107fe 	ldr	x30, [sp], #16
  203ab4:	d65f03c0 	ret

0000000000203ab8 <syscall_pkey_alloc>:
  203ab8:	f81f0ffe 	str	x30, [sp, #-16]!
  203abc:	52800261 	mov	w1, #0x13                  	// #19
  203ac0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203ac4:	911e6000 	add	x0, x0, #0x798
  203ac8:	97ffffcc 	bl	2039f8 <syscall_trace>
  203acc:	d2800000 	mov	x0, #0x0                   	// #0
  203ad0:	f84107fe 	ldr	x30, [sp], #16
  203ad4:	d65f03c0 	ret

0000000000203ad8 <syscall_pkey_mprotect>:
  203ad8:	f81f0ffe 	str	x30, [sp, #-16]!
  203adc:	528002c1 	mov	w1, #0x16                  	// #22
  203ae0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203ae4:	911e0000 	add	x0, x0, #0x780
  203ae8:	97ffffc4 	bl	2039f8 <syscall_trace>
  203aec:	d2800000 	mov	x0, #0x0                   	// #0
  203af0:	f84107fe 	ldr	x30, [sp], #16
  203af4:	d65f03c0 	ret

0000000000203af8 <syscall_pwritev2>:
  203af8:	f81f0ffe 	str	x30, [sp, #-16]!
  203afc:	52800221 	mov	w1, #0x11                  	// #17
  203b00:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203b04:	911da000 	add	x0, x0, #0x768
  203b08:	97ffffbc 	bl	2039f8 <syscall_trace>
  203b0c:	d2800000 	mov	x0, #0x0                   	// #0
  203b10:	f84107fe 	ldr	x30, [sp], #16
  203b14:	d65f03c0 	ret

0000000000203b18 <syscall_preadv2>:
  203b18:	f81f0ffe 	str	x30, [sp, #-16]!
  203b1c:	52800201 	mov	w1, #0x10                  	// #16
  203b20:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203b24:	911d6000 	add	x0, x0, #0x758
  203b28:	97ffffb4 	bl	2039f8 <syscall_trace>
  203b2c:	d2800000 	mov	x0, #0x0                   	// #0
  203b30:	f84107fe 	ldr	x30, [sp], #16
  203b34:	d65f03c0 	ret

0000000000203b38 <syscall_copy_file_range>:
  203b38:	f81f0ffe 	str	x30, [sp, #-16]!
  203b3c:	52800301 	mov	w1, #0x18                  	// #24
  203b40:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203b44:	911d0000 	add	x0, x0, #0x740
  203b48:	97ffffac 	bl	2039f8 <syscall_trace>
  203b4c:	d2800000 	mov	x0, #0x0                   	// #0
  203b50:	f84107fe 	ldr	x30, [sp], #16
  203b54:	d65f03c0 	ret

0000000000203b58 <syscall_mlock2>:
  203b58:	f81f0ffe 	str	x30, [sp, #-16]!
  203b5c:	528001e1 	mov	w1, #0xf                   	// #15
  203b60:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203b64:	911cc000 	add	x0, x0, #0x730
  203b68:	97ffffa4 	bl	2039f8 <syscall_trace>
  203b6c:	d2800000 	mov	x0, #0x0                   	// #0
  203b70:	f84107fe 	ldr	x30, [sp], #16
  203b74:	d65f03c0 	ret

0000000000203b78 <syscall_membarrier>:
  203b78:	f81f0ffe 	str	x30, [sp, #-16]!
  203b7c:	52800261 	mov	w1, #0x13                  	// #19
  203b80:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203b84:	911c6000 	add	x0, x0, #0x718
  203b88:	97ffff9c 	bl	2039f8 <syscall_trace>
  203b8c:	d2800000 	mov	x0, #0x0                   	// #0
  203b90:	f84107fe 	ldr	x30, [sp], #16
  203b94:	d65f03c0 	ret

0000000000203b98 <syscall_userfaultfd>:
  203b98:	f81f0ffe 	str	x30, [sp, #-16]!
  203b9c:	52800281 	mov	w1, #0x14                  	// #20
  203ba0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203ba4:	911c0000 	add	x0, x0, #0x700
  203ba8:	97ffff94 	bl	2039f8 <syscall_trace>
  203bac:	d2800000 	mov	x0, #0x0                   	// #0
  203bb0:	f84107fe 	ldr	x30, [sp], #16
  203bb4:	d65f03c0 	ret

0000000000203bb8 <syscall_execveat>:
  203bb8:	f81f0ffe 	str	x30, [sp, #-16]!
  203bbc:	52800221 	mov	w1, #0x11                  	// #17
  203bc0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203bc4:	911ba000 	add	x0, x0, #0x6e8
  203bc8:	97ffff8c 	bl	2039f8 <syscall_trace>
  203bcc:	d2800000 	mov	x0, #0x0                   	// #0
  203bd0:	f84107fe 	ldr	x30, [sp], #16
  203bd4:	d65f03c0 	ret

0000000000203bd8 <syscall_bpf>:
  203bd8:	f81f0ffe 	str	x30, [sp, #-16]!
  203bdc:	52800181 	mov	w1, #0xc                   	// #12
  203be0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203be4:	911b6000 	add	x0, x0, #0x6d8
  203be8:	97ffff84 	bl	2039f8 <syscall_trace>
  203bec:	d2800000 	mov	x0, #0x0                   	// #0
  203bf0:	f84107fe 	ldr	x30, [sp], #16
  203bf4:	d65f03c0 	ret

0000000000203bf8 <syscall_memfd_create>:
  203bf8:	f81f0ffe 	str	x30, [sp, #-16]!
  203bfc:	528002a1 	mov	w1, #0x15                  	// #21
  203c00:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203c04:	911b0000 	add	x0, x0, #0x6c0
  203c08:	97ffff7c 	bl	2039f8 <syscall_trace>
  203c0c:	d2800000 	mov	x0, #0x0                   	// #0
  203c10:	f84107fe 	ldr	x30, [sp], #16
  203c14:	d65f03c0 	ret

0000000000203c18 <syscall_seccomp>:
  203c18:	f81f0ffe 	str	x30, [sp, #-16]!
  203c1c:	52800201 	mov	w1, #0x10                  	// #16
  203c20:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203c24:	911ac000 	add	x0, x0, #0x6b0
  203c28:	97ffff74 	bl	2039f8 <syscall_trace>
  203c2c:	d2800000 	mov	x0, #0x0                   	// #0
  203c30:	f84107fe 	ldr	x30, [sp], #16
  203c34:	d65f03c0 	ret

0000000000203c38 <syscall_renameat2>:
  203c38:	f81f0ffe 	str	x30, [sp, #-16]!
  203c3c:	52800241 	mov	w1, #0x12                  	// #18
  203c40:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203c44:	911a6000 	add	x0, x0, #0x698
  203c48:	97ffff6c 	bl	2039f8 <syscall_trace>
  203c4c:	d2800000 	mov	x0, #0x0                   	// #0
  203c50:	f84107fe 	ldr	x30, [sp], #16
  203c54:	d65f03c0 	ret

0000000000203c58 <syscall_sched_getattr>:
  203c58:	f81f0ffe 	str	x30, [sp, #-16]!
  203c5c:	528002c1 	mov	w1, #0x16                  	// #22
  203c60:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203c64:	911a0000 	add	x0, x0, #0x680
  203c68:	97ffff64 	bl	2039f8 <syscall_trace>
  203c6c:	d2800000 	mov	x0, #0x0                   	// #0
  203c70:	f84107fe 	ldr	x30, [sp], #16
  203c74:	d65f03c0 	ret

0000000000203c78 <syscall_sched_setattr>:
  203c78:	f81f0ffe 	str	x30, [sp, #-16]!
  203c7c:	528002c1 	mov	w1, #0x16                  	// #22
  203c80:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203c84:	9119a000 	add	x0, x0, #0x668
  203c88:	97ffff5c 	bl	2039f8 <syscall_trace>
  203c8c:	d2800000 	mov	x0, #0x0                   	// #0
  203c90:	f84107fe 	ldr	x30, [sp], #16
  203c94:	d65f03c0 	ret

0000000000203c98 <syscall_finit_module>:
  203c98:	f81f0ffe 	str	x30, [sp, #-16]!
  203c9c:	528002a1 	mov	w1, #0x15                  	// #21
  203ca0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203ca4:	91194000 	add	x0, x0, #0x650
  203ca8:	97ffff54 	bl	2039f8 <syscall_trace>
  203cac:	d2800000 	mov	x0, #0x0                   	// #0
  203cb0:	f84107fe 	ldr	x30, [sp], #16
  203cb4:	d65f03c0 	ret

0000000000203cb8 <syscall_kcmp>:
  203cb8:	f81f0ffe 	str	x30, [sp, #-16]!
  203cbc:	528001a1 	mov	w1, #0xd                   	// #13
  203cc0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203cc4:	91190000 	add	x0, x0, #0x640
  203cc8:	97ffff4c 	bl	2039f8 <syscall_trace>
  203ccc:	d2800000 	mov	x0, #0x0                   	// #0
  203cd0:	f84107fe 	ldr	x30, [sp], #16
  203cd4:	d65f03c0 	ret

0000000000203cd8 <syscall_process_vm_writev>:
  203cd8:	f81f0ffe 	str	x30, [sp, #-16]!
  203cdc:	52800341 	mov	w1, #0x1a                  	// #26
  203ce0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203ce4:	91188000 	add	x0, x0, #0x620
  203ce8:	97ffff44 	bl	2039f8 <syscall_trace>
  203cec:	d2800000 	mov	x0, #0x0                   	// #0
  203cf0:	f84107fe 	ldr	x30, [sp], #16
  203cf4:	d65f03c0 	ret

0000000000203cf8 <syscall_process_vm_readv>:
  203cf8:	f81f0ffe 	str	x30, [sp, #-16]!
  203cfc:	52800321 	mov	w1, #0x19                  	// #25
  203d00:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203d04:	91180000 	add	x0, x0, #0x600
  203d08:	97ffff3c 	bl	2039f8 <syscall_trace>
  203d0c:	d2800000 	mov	x0, #0x0                   	// #0
  203d10:	f84107fe 	ldr	x30, [sp], #16
  203d14:	d65f03c0 	ret

0000000000203d18 <syscall_setns>:
  203d18:	f81f0ffe 	str	x30, [sp, #-16]!
  203d1c:	528001c1 	mov	w1, #0xe                   	// #14
  203d20:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203d24:	9117c000 	add	x0, x0, #0x5f0
  203d28:	97ffff34 	bl	2039f8 <syscall_trace>
  203d2c:	d2800000 	mov	x0, #0x0                   	// #0
  203d30:	f84107fe 	ldr	x30, [sp], #16
  203d34:	d65f03c0 	ret

0000000000203d38 <syscall_sendmmsg>:
  203d38:	f81f0ffe 	str	x30, [sp, #-16]!
  203d3c:	52800221 	mov	w1, #0x11                  	// #17
  203d40:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203d44:	91176000 	add	x0, x0, #0x5d8
  203d48:	97ffff2c 	bl	2039f8 <syscall_trace>
  203d4c:	d2800000 	mov	x0, #0x0                   	// #0
  203d50:	f84107fe 	ldr	x30, [sp], #16
  203d54:	d65f03c0 	ret

0000000000203d58 <syscall_syncfs>:
  203d58:	f81f0ffe 	str	x30, [sp, #-16]!
  203d5c:	528001e1 	mov	w1, #0xf                   	// #15
  203d60:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203d64:	91172000 	add	x0, x0, #0x5c8
  203d68:	97ffff24 	bl	2039f8 <syscall_trace>
  203d6c:	d2800000 	mov	x0, #0x0                   	// #0
  203d70:	f84107fe 	ldr	x30, [sp], #16
  203d74:	d65f03c0 	ret

0000000000203d78 <syscall_clock_adjtime>:
  203d78:	f81f0ffe 	str	x30, [sp, #-16]!
  203d7c:	528002c1 	mov	w1, #0x16                  	// #22
  203d80:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203d84:	9116c000 	add	x0, x0, #0x5b0
  203d88:	97ffff1c 	bl	2039f8 <syscall_trace>
  203d8c:	d2800000 	mov	x0, #0x0                   	// #0
  203d90:	f84107fe 	ldr	x30, [sp], #16
  203d94:	d65f03c0 	ret

0000000000203d98 <syscall_open_by_handle_at>:
  203d98:	f81f0ffe 	str	x30, [sp, #-16]!
  203d9c:	52800341 	mov	w1, #0x1a                  	// #26
  203da0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203da4:	91164000 	add	x0, x0, #0x590
  203da8:	97ffff14 	bl	2039f8 <syscall_trace>
  203dac:	d2800000 	mov	x0, #0x0                   	// #0
  203db0:	f84107fe 	ldr	x30, [sp], #16
  203db4:	d65f03c0 	ret

0000000000203db8 <syscall_name_to_handle_at>:
  203db8:	f81f0ffe 	str	x30, [sp, #-16]!
  203dbc:	52800341 	mov	w1, #0x1a                  	// #26
  203dc0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203dc4:	9115c000 	add	x0, x0, #0x570
  203dc8:	97ffff0c 	bl	2039f8 <syscall_trace>
  203dcc:	d2800000 	mov	x0, #0x0                   	// #0
  203dd0:	f84107fe 	ldr	x30, [sp], #16
  203dd4:	d65f03c0 	ret

0000000000203dd8 <syscall_fanotify_mark>:
  203dd8:	f81f0ffe 	str	x30, [sp, #-16]!
  203ddc:	528002c1 	mov	w1, #0x16                  	// #22
  203de0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203de4:	91156000 	add	x0, x0, #0x558
  203de8:	97ffff04 	bl	2039f8 <syscall_trace>
  203dec:	d2800000 	mov	x0, #0x0                   	// #0
  203df0:	f84107fe 	ldr	x30, [sp], #16
  203df4:	d65f03c0 	ret

0000000000203df8 <syscall_fanotify_init>:
  203df8:	f81f0ffe 	str	x30, [sp, #-16]!
  203dfc:	528002c1 	mov	w1, #0x16                  	// #22
  203e00:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203e04:	91150000 	add	x0, x0, #0x540
  203e08:	97fffefc 	bl	2039f8 <syscall_trace>
  203e0c:	d2800000 	mov	x0, #0x0                   	// #0
  203e10:	f84107fe 	ldr	x30, [sp], #16
  203e14:	d65f03c0 	ret

0000000000203e18 <syscall_accept4>:
  203e18:	f81f0ffe 	str	x30, [sp, #-16]!
  203e1c:	52800201 	mov	w1, #0x10                  	// #16
  203e20:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203e24:	9114c000 	add	x0, x0, #0x530
  203e28:	97fffef4 	bl	2039f8 <syscall_trace>
  203e2c:	d2800000 	mov	x0, #0x0                   	// #0
  203e30:	f84107fe 	ldr	x30, [sp], #16
  203e34:	d65f03c0 	ret

0000000000203e38 <syscall_recvmmsg>:
  203e38:	f81f0ffe 	str	x30, [sp, #-16]!
  203e3c:	52800221 	mov	w1, #0x11                  	// #17
  203e40:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203e44:	91146000 	add	x0, x0, #0x518
  203e48:	97fffeec 	bl	2039f8 <syscall_trace>
  203e4c:	d2800000 	mov	x0, #0x0                   	// #0
  203e50:	f84107fe 	ldr	x30, [sp], #16
  203e54:	d65f03c0 	ret

0000000000203e58 <syscall_perf_event_open>:
  203e58:	f81f0ffe 	str	x30, [sp, #-16]!
  203e5c:	52800301 	mov	w1, #0x18                  	// #24
  203e60:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203e64:	91140000 	add	x0, x0, #0x500
  203e68:	97fffee4 	bl	2039f8 <syscall_trace>
  203e6c:	d2800000 	mov	x0, #0x0                   	// #0
  203e70:	f84107fe 	ldr	x30, [sp], #16
  203e74:	d65f03c0 	ret

0000000000203e78 <syscall_rt_tgsigqueueinfo>:
  203e78:	f81f0ffe 	str	x30, [sp, #-16]!
  203e7c:	52800341 	mov	w1, #0x1a                  	// #26
  203e80:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203e84:	91138000 	add	x0, x0, #0x4e0
  203e88:	97fffedc 	bl	2039f8 <syscall_trace>
  203e8c:	d2800000 	mov	x0, #0x0                   	// #0
  203e90:	f84107fe 	ldr	x30, [sp], #16
  203e94:	d65f03c0 	ret

0000000000203e98 <syscall_pwritev>:
  203e98:	f81f0ffe 	str	x30, [sp, #-16]!
  203e9c:	52800201 	mov	w1, #0x10                  	// #16
  203ea0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203ea4:	91134000 	add	x0, x0, #0x4d0
  203ea8:	97fffed4 	bl	2039f8 <syscall_trace>
  203eac:	d2800000 	mov	x0, #0x0                   	// #0
  203eb0:	f84107fe 	ldr	x30, [sp], #16
  203eb4:	d65f03c0 	ret

0000000000203eb8 <syscall_preadv>:
  203eb8:	f81f0ffe 	str	x30, [sp, #-16]!
  203ebc:	528001e1 	mov	w1, #0xf                   	// #15
  203ec0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203ec4:	91130000 	add	x0, x0, #0x4c0
  203ec8:	97fffecc 	bl	2039f8 <syscall_trace>
  203ecc:	d2800000 	mov	x0, #0x0                   	// #0
  203ed0:	f84107fe 	ldr	x30, [sp], #16
  203ed4:	d65f03c0 	ret

0000000000203ed8 <syscall_inotify_init1>:
  203ed8:	f81f0ffe 	str	x30, [sp, #-16]!
  203edc:	528002c1 	mov	w1, #0x16                  	// #22
  203ee0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203ee4:	9112a000 	add	x0, x0, #0x4a8
  203ee8:	97fffec4 	bl	2039f8 <syscall_trace>
  203eec:	d2800000 	mov	x0, #0x0                   	// #0
  203ef0:	f84107fe 	ldr	x30, [sp], #16
  203ef4:	d65f03c0 	ret

0000000000203ef8 <syscall_pipe2>:
  203ef8:	f81f0ffe 	str	x30, [sp, #-16]!
  203efc:	528001c1 	mov	w1, #0xe                   	// #14
  203f00:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203f04:	91126000 	add	x0, x0, #0x498
  203f08:	97fffebc 	bl	2039f8 <syscall_trace>
  203f0c:	d2800000 	mov	x0, #0x0                   	// #0
  203f10:	f84107fe 	ldr	x30, [sp], #16
  203f14:	d65f03c0 	ret

0000000000203f18 <syscall_dup3>:
  203f18:	f81f0ffe 	str	x30, [sp, #-16]!
  203f1c:	528001a1 	mov	w1, #0xd                   	// #13
  203f20:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203f24:	91122000 	add	x0, x0, #0x488
  203f28:	97fffeb4 	bl	2039f8 <syscall_trace>
  203f2c:	d2800000 	mov	x0, #0x0                   	// #0
  203f30:	f84107fe 	ldr	x30, [sp], #16
  203f34:	d65f03c0 	ret

0000000000203f38 <syscall_epoll_create1>:
  203f38:	f81f0ffe 	str	x30, [sp, #-16]!
  203f3c:	528002c1 	mov	w1, #0x16                  	// #22
  203f40:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203f44:	9111c000 	add	x0, x0, #0x470
  203f48:	97fffeac 	bl	2039f8 <syscall_trace>
  203f4c:	928004a0 	mov	x0, #0xffffffffffffffda    	// #-38
  203f50:	f84107fe 	ldr	x30, [sp], #16
  203f54:	d65f03c0 	ret

0000000000203f58 <syscall_eventfd2>:
  203f58:	f81f0ffe 	str	x30, [sp, #-16]!
  203f5c:	52800221 	mov	w1, #0x11                  	// #17
  203f60:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203f64:	91116000 	add	x0, x0, #0x458
  203f68:	97fffea4 	bl	2039f8 <syscall_trace>
  203f6c:	d2800000 	mov	x0, #0x0                   	// #0
  203f70:	f84107fe 	ldr	x30, [sp], #16
  203f74:	d65f03c0 	ret

0000000000203f78 <syscall_signalfd4>:
  203f78:	f81f0ffe 	str	x30, [sp, #-16]!
  203f7c:	52800241 	mov	w1, #0x12                  	// #18
  203f80:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203f84:	91110000 	add	x0, x0, #0x440
  203f88:	97fffe9c 	bl	2039f8 <syscall_trace>
  203f8c:	d2800000 	mov	x0, #0x0                   	// #0
  203f90:	f84107fe 	ldr	x30, [sp], #16
  203f94:	d65f03c0 	ret

0000000000203f98 <syscall_timerfd_gettime>:
  203f98:	f81f0ffe 	str	x30, [sp, #-16]!
  203f9c:	52800301 	mov	w1, #0x18                  	// #24
  203fa0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203fa4:	9110a000 	add	x0, x0, #0x428
  203fa8:	97fffe94 	bl	2039f8 <syscall_trace>
  203fac:	d2800000 	mov	x0, #0x0                   	// #0
  203fb0:	f84107fe 	ldr	x30, [sp], #16
  203fb4:	d65f03c0 	ret

0000000000203fb8 <syscall_timerfd_settime>:
  203fb8:	f81f0ffe 	str	x30, [sp, #-16]!
  203fbc:	52800301 	mov	w1, #0x18                  	// #24
  203fc0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203fc4:	91104000 	add	x0, x0, #0x410
  203fc8:	97fffe8c 	bl	2039f8 <syscall_trace>
  203fcc:	d2800000 	mov	x0, #0x0                   	// #0
  203fd0:	f84107fe 	ldr	x30, [sp], #16
  203fd4:	d65f03c0 	ret

0000000000203fd8 <syscall_fallocate>:
  203fd8:	f81f0ffe 	str	x30, [sp, #-16]!
  203fdc:	52800241 	mov	w1, #0x12                  	// #18
  203fe0:	90000080 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  203fe4:	910fe000 	add	x0, x0, #0x3f8
  203fe8:	97fffe84 	bl	2039f8 <syscall_trace>
  203fec:	d2800000 	mov	x0, #0x0                   	// #0
  203ff0:	f84107fe 	ldr	x30, [sp], #16
  203ff4:	d65f03c0 	ret

0000000000203ff8 <syscall_eventfd>:
  203ff8:	f81f0ffe 	str	x30, [sp, #-16]!
  203ffc:	52800201 	mov	w1, #0x10                  	// #16
  204000:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204004:	910fa000 	add	x0, x0, #0x3e8
  204008:	97fffe7c 	bl	2039f8 <syscall_trace>
  20400c:	d2800000 	mov	x0, #0x0                   	// #0
  204010:	f84107fe 	ldr	x30, [sp], #16
  204014:	d65f03c0 	ret

0000000000204018 <syscall_timerfd_create>:
  204018:	f81f0ffe 	str	x30, [sp, #-16]!
  20401c:	528002e1 	mov	w1, #0x17                  	// #23
  204020:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204024:	910f4000 	add	x0, x0, #0x3d0
  204028:	97fffe74 	bl	2039f8 <syscall_trace>
  20402c:	d2800000 	mov	x0, #0x0                   	// #0
  204030:	f84107fe 	ldr	x30, [sp], #16
  204034:	d65f03c0 	ret

0000000000204038 <syscall_signalfd>:
  204038:	f81f0ffe 	str	x30, [sp, #-16]!
  20403c:	52800221 	mov	w1, #0x11                  	// #17
  204040:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204044:	910ee000 	add	x0, x0, #0x3b8
  204048:	97fffe6c 	bl	2039f8 <syscall_trace>
  20404c:	d2800000 	mov	x0, #0x0                   	// #0
  204050:	f84107fe 	ldr	x30, [sp], #16
  204054:	d65f03c0 	ret

0000000000204058 <syscall_utimensat>:
  204058:	f81f0ffe 	str	x30, [sp, #-16]!
  20405c:	52800241 	mov	w1, #0x12                  	// #18
  204060:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204064:	910e8000 	add	x0, x0, #0x3a0
  204068:	97fffe64 	bl	2039f8 <syscall_trace>
  20406c:	d2800000 	mov	x0, #0x0                   	// #0
  204070:	f84107fe 	ldr	x30, [sp], #16
  204074:	d65f03c0 	ret

0000000000204078 <syscall_kexec_load>:
  204078:	f81f0ffe 	str	x30, [sp, #-16]!
  20407c:	52800261 	mov	w1, #0x13                  	// #19
  204080:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204084:	910e2000 	add	x0, x0, #0x388
  204088:	97fffe5c 	bl	2039f8 <syscall_trace>
  20408c:	d2800000 	mov	x0, #0x0                   	// #0
  204090:	f84107fe 	ldr	x30, [sp], #16
  204094:	d65f03c0 	ret

0000000000204098 <syscall_epoll_pwait>:
  204098:	f81f0ffe 	str	x30, [sp, #-16]!
  20409c:	52800281 	mov	w1, #0x14                  	// #20
  2040a0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2040a4:	910dc000 	add	x0, x0, #0x370
  2040a8:	97fffe54 	bl	2039f8 <syscall_trace>
  2040ac:	928004a0 	mov	x0, #0xffffffffffffffda    	// #-38
  2040b0:	f84107fe 	ldr	x30, [sp], #16
  2040b4:	d65f03c0 	ret

00000000002040b8 <syscall_getcpu>:
  2040b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2040bc:	528001e1 	mov	w1, #0xf                   	// #15
  2040c0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2040c4:	910d8000 	add	x0, x0, #0x360
  2040c8:	97fffe4c 	bl	2039f8 <syscall_trace>
  2040cc:	d2800000 	mov	x0, #0x0                   	// #0
  2040d0:	f84107fe 	ldr	x30, [sp], #16
  2040d4:	d65f03c0 	ret

00000000002040d8 <syscall_move_pages>:
  2040d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2040dc:	52800261 	mov	w1, #0x13                  	// #19
  2040e0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2040e4:	910d2000 	add	x0, x0, #0x348
  2040e8:	97fffe44 	bl	2039f8 <syscall_trace>
  2040ec:	d2800000 	mov	x0, #0x0                   	// #0
  2040f0:	f84107fe 	ldr	x30, [sp], #16
  2040f4:	d65f03c0 	ret

00000000002040f8 <syscall_vmsplice>:
  2040f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2040fc:	52800221 	mov	w1, #0x11                  	// #17
  204100:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204104:	910cc000 	add	x0, x0, #0x330
  204108:	97fffe3c 	bl	2039f8 <syscall_trace>
  20410c:	d2800000 	mov	x0, #0x0                   	// #0
  204110:	f84107fe 	ldr	x30, [sp], #16
  204114:	d65f03c0 	ret

0000000000204118 <syscall_tee>:
  204118:	f81f0ffe 	str	x30, [sp, #-16]!
  20411c:	52800181 	mov	w1, #0xc                   	// #12
  204120:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204124:	910c8000 	add	x0, x0, #0x320
  204128:	97fffe34 	bl	2039f8 <syscall_trace>
  20412c:	d2800000 	mov	x0, #0x0                   	// #0
  204130:	f84107fe 	ldr	x30, [sp], #16
  204134:	d65f03c0 	ret

0000000000204138 <syscall_arm_sync_file_range>:
  204138:	f81f0ffe 	str	x30, [sp, #-16]!
  20413c:	52800381 	mov	w1, #0x1c                  	// #28
  204140:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204144:	910c0000 	add	x0, x0, #0x300
  204148:	97fffe2c 	bl	2039f8 <syscall_trace>
  20414c:	d2800000 	mov	x0, #0x0                   	// #0
  204150:	f84107fe 	ldr	x30, [sp], #16
  204154:	d65f03c0 	ret

0000000000204158 <syscall_splice>:
  204158:	f81f0ffe 	str	x30, [sp, #-16]!
  20415c:	528001e1 	mov	w1, #0xf                   	// #15
  204160:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204164:	910bc000 	add	x0, x0, #0x2f0
  204168:	97fffe24 	bl	2039f8 <syscall_trace>
  20416c:	d2800000 	mov	x0, #0x0                   	// #0
  204170:	f84107fe 	ldr	x30, [sp], #16
  204174:	d65f03c0 	ret

0000000000204178 <syscall_get_robust_list>:
  204178:	f81f0ffe 	str	x30, [sp, #-16]!
  20417c:	52800301 	mov	w1, #0x18                  	// #24
  204180:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204184:	910b6000 	add	x0, x0, #0x2d8
  204188:	97fffe1c 	bl	2039f8 <syscall_trace>
  20418c:	d2800000 	mov	x0, #0x0                   	// #0
  204190:	f84107fe 	ldr	x30, [sp], #16
  204194:	d65f03c0 	ret

0000000000204198 <syscall_set_robust_list>:
  204198:	f81f0ffe 	str	x30, [sp, #-16]!
  20419c:	52800301 	mov	w1, #0x18                  	// #24
  2041a0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2041a4:	910b0000 	add	x0, x0, #0x2c0
  2041a8:	97fffe14 	bl	2039f8 <syscall_trace>
  2041ac:	d2800000 	mov	x0, #0x0                   	// #0
  2041b0:	f84107fe 	ldr	x30, [sp], #16
  2041b4:	d65f03c0 	ret

00000000002041b8 <syscall_unshare>:
  2041b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2041bc:	52800201 	mov	w1, #0x10                  	// #16
  2041c0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2041c4:	910ac000 	add	x0, x0, #0x2b0
  2041c8:	97fffe0c 	bl	2039f8 <syscall_trace>
  2041cc:	d2800000 	mov	x0, #0x0                   	// #0
  2041d0:	f84107fe 	ldr	x30, [sp], #16
  2041d4:	d65f03c0 	ret

00000000002041d8 <syscall_ppoll>:
  2041d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2041dc:	528001c1 	mov	w1, #0xe                   	// #14
  2041e0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2041e4:	910a8000 	add	x0, x0, #0x2a0
  2041e8:	97fffe04 	bl	2039f8 <syscall_trace>
  2041ec:	d2800000 	mov	x0, #0x0                   	// #0
  2041f0:	f84107fe 	ldr	x30, [sp], #16
  2041f4:	d65f03c0 	ret

00000000002041f8 <syscall_pselect6>:
  2041f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2041fc:	52800221 	mov	w1, #0x11                  	// #17
  204200:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204204:	910a2000 	add	x0, x0, #0x288
  204208:	97fffdfc 	bl	2039f8 <syscall_trace>
  20420c:	d2800000 	mov	x0, #0x0                   	// #0
  204210:	f84107fe 	ldr	x30, [sp], #16
  204214:	d65f03c0 	ret

0000000000204218 <syscall_faccessat>:
  204218:	f81f0ffe 	str	x30, [sp, #-16]!
  20421c:	52800241 	mov	w1, #0x12                  	// #18
  204220:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204224:	9109c000 	add	x0, x0, #0x270
  204228:	97fffdf4 	bl	2039f8 <syscall_trace>
  20422c:	d2800000 	mov	x0, #0x0                   	// #0
  204230:	f84107fe 	ldr	x30, [sp], #16
  204234:	d65f03c0 	ret

0000000000204238 <syscall_fchmodat>:
  204238:	f81f0ffe 	str	x30, [sp, #-16]!
  20423c:	52800221 	mov	w1, #0x11                  	// #17
  204240:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204244:	91096000 	add	x0, x0, #0x258
  204248:	97fffdec 	bl	2039f8 <syscall_trace>
  20424c:	d2800000 	mov	x0, #0x0                   	// #0
  204250:	f84107fe 	ldr	x30, [sp], #16
  204254:	d65f03c0 	ret

0000000000204258 <syscall_readlinkat>:
  204258:	f81f0ffe 	str	x30, [sp, #-16]!
  20425c:	52800261 	mov	w1, #0x13                  	// #19
  204260:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204264:	91090000 	add	x0, x0, #0x240
  204268:	97fffde4 	bl	2039f8 <syscall_trace>
  20426c:	d2800000 	mov	x0, #0x0                   	// #0
  204270:	f84107fe 	ldr	x30, [sp], #16
  204274:	d65f03c0 	ret

0000000000204278 <syscall_symlinkat>:
  204278:	f81f0ffe 	str	x30, [sp, #-16]!
  20427c:	52800241 	mov	w1, #0x12                  	// #18
  204280:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204284:	9108a000 	add	x0, x0, #0x228
  204288:	97fffddc 	bl	2039f8 <syscall_trace>
  20428c:	d2800000 	mov	x0, #0x0                   	// #0
  204290:	f84107fe 	ldr	x30, [sp], #16
  204294:	d65f03c0 	ret

0000000000204298 <syscall_linkat>:
  204298:	f81f0ffe 	str	x30, [sp, #-16]!
  20429c:	528001e1 	mov	w1, #0xf                   	// #15
  2042a0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2042a4:	91086000 	add	x0, x0, #0x218
  2042a8:	97fffdd4 	bl	2039f8 <syscall_trace>
  2042ac:	d2800000 	mov	x0, #0x0                   	// #0
  2042b0:	f84107fe 	ldr	x30, [sp], #16
  2042b4:	d65f03c0 	ret

00000000002042b8 <syscall_renameat>:
  2042b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2042bc:	52800221 	mov	w1, #0x11                  	// #17
  2042c0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2042c4:	91080000 	add	x0, x0, #0x200
  2042c8:	97fffdcc 	bl	2039f8 <syscall_trace>
  2042cc:	d2800000 	mov	x0, #0x0                   	// #0
  2042d0:	f84107fe 	ldr	x30, [sp], #16
  2042d4:	d65f03c0 	ret

00000000002042d8 <syscall_unlinkat>:
  2042d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2042dc:	52800221 	mov	w1, #0x11                  	// #17
  2042e0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2042e4:	9107a000 	add	x0, x0, #0x1e8
  2042e8:	97fffdc4 	bl	2039f8 <syscall_trace>
  2042ec:	d2800000 	mov	x0, #0x0                   	// #0
  2042f0:	f84107fe 	ldr	x30, [sp], #16
  2042f4:	d65f03c0 	ret

00000000002042f8 <syscall_fstatat64>:
  2042f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2042fc:	52800241 	mov	w1, #0x12                  	// #18
  204300:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204304:	91074000 	add	x0, x0, #0x1d0
  204308:	97fffdbc 	bl	2039f8 <syscall_trace>
  20430c:	d2800000 	mov	x0, #0x0                   	// #0
  204310:	f84107fe 	ldr	x30, [sp], #16
  204314:	d65f03c0 	ret

0000000000204318 <syscall_futimesat>:
  204318:	f81f0ffe 	str	x30, [sp, #-16]!
  20431c:	52800241 	mov	w1, #0x12                  	// #18
  204320:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204324:	9106e000 	add	x0, x0, #0x1b8
  204328:	97fffdb4 	bl	2039f8 <syscall_trace>
  20432c:	d2800000 	mov	x0, #0x0                   	// #0
  204330:	f84107fe 	ldr	x30, [sp], #16
  204334:	d65f03c0 	ret

0000000000204338 <syscall_fchownat>:
  204338:	f81f0ffe 	str	x30, [sp, #-16]!
  20433c:	52800221 	mov	w1, #0x11                  	// #17
  204340:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204344:	91068000 	add	x0, x0, #0x1a0
  204348:	97fffdac 	bl	2039f8 <syscall_trace>
  20434c:	d2800000 	mov	x0, #0x0                   	// #0
  204350:	f84107fe 	ldr	x30, [sp], #16
  204354:	d65f03c0 	ret

0000000000204358 <syscall_mknodat>:
  204358:	f81f0ffe 	str	x30, [sp, #-16]!
  20435c:	52800201 	mov	w1, #0x10                  	// #16
  204360:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204364:	91064000 	add	x0, x0, #0x190
  204368:	97fffda4 	bl	2039f8 <syscall_trace>
  20436c:	d2800000 	mov	x0, #0x0                   	// #0
  204370:	f84107fe 	ldr	x30, [sp], #16
  204374:	d65f03c0 	ret

0000000000204378 <syscall_mkdirat>:
  204378:	f81f0ffe 	str	x30, [sp, #-16]!
  20437c:	52800201 	mov	w1, #0x10                  	// #16
  204380:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204384:	91060000 	add	x0, x0, #0x180
  204388:	97fffd9c 	bl	2039f8 <syscall_trace>
  20438c:	d2800000 	mov	x0, #0x0                   	// #0
  204390:	f84107fe 	ldr	x30, [sp], #16
  204394:	d65f03c0 	ret

0000000000204398 <syscall_openat>:
  204398:	f81f0ffe 	str	x30, [sp, #-16]!
  20439c:	528001e1 	mov	w1, #0xf                   	// #15
  2043a0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2043a4:	9105c000 	add	x0, x0, #0x170
  2043a8:	97fffd94 	bl	2039f8 <syscall_trace>
  2043ac:	d2800000 	mov	x0, #0x0                   	// #0
  2043b0:	f84107fe 	ldr	x30, [sp], #16
  2043b4:	d65f03c0 	ret

00000000002043b8 <syscall_set_mempolicy>:
  2043b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2043bc:	528002c1 	mov	w1, #0x16                  	// #22
  2043c0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2043c4:	91056000 	add	x0, x0, #0x158
  2043c8:	97fffd8c 	bl	2039f8 <syscall_trace>
  2043cc:	d2800000 	mov	x0, #0x0                   	// #0
  2043d0:	f84107fe 	ldr	x30, [sp], #16
  2043d4:	d65f03c0 	ret

00000000002043d8 <syscall_get_mempolicy>:
  2043d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2043dc:	528002c1 	mov	w1, #0x16                  	// #22
  2043e0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2043e4:	91050000 	add	x0, x0, #0x140
  2043e8:	97fffd84 	bl	2039f8 <syscall_trace>
  2043ec:	d2800000 	mov	x0, #0x0                   	// #0
  2043f0:	f84107fe 	ldr	x30, [sp], #16
  2043f4:	d65f03c0 	ret

00000000002043f8 <syscall_mbind>:
  2043f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2043fc:	528001c1 	mov	w1, #0xe                   	// #14
  204400:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204404:	9104c000 	add	x0, x0, #0x130
  204408:	97fffd7c 	bl	2039f8 <syscall_trace>
  20440c:	d2800000 	mov	x0, #0x0                   	// #0
  204410:	f84107fe 	ldr	x30, [sp], #16
  204414:	d65f03c0 	ret

0000000000204418 <syscall_inotify_rm_watch>:
  204418:	f81f0ffe 	str	x30, [sp, #-16]!
  20441c:	52800321 	mov	w1, #0x19                  	// #25
  204420:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204424:	91044000 	add	x0, x0, #0x110
  204428:	97fffd74 	bl	2039f8 <syscall_trace>
  20442c:	d2800000 	mov	x0, #0x0                   	// #0
  204430:	f84107fe 	ldr	x30, [sp], #16
  204434:	d65f03c0 	ret

0000000000204438 <syscall_inotify_add_watch>:
  204438:	f81f0ffe 	str	x30, [sp, #-16]!
  20443c:	52800341 	mov	w1, #0x1a                  	// #26
  204440:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204444:	9103c000 	add	x0, x0, #0xf0
  204448:	97fffd6c 	bl	2039f8 <syscall_trace>
  20444c:	d2800000 	mov	x0, #0x0                   	// #0
  204450:	f84107fe 	ldr	x30, [sp], #16
  204454:	d65f03c0 	ret

0000000000204458 <syscall_inotify_init>:
  204458:	f81f0ffe 	str	x30, [sp, #-16]!
  20445c:	528002a1 	mov	w1, #0x15                  	// #21
  204460:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204464:	91036000 	add	x0, x0, #0xd8
  204468:	97fffd64 	bl	2039f8 <syscall_trace>
  20446c:	d2800000 	mov	x0, #0x0                   	// #0
  204470:	f84107fe 	ldr	x30, [sp], #16
  204474:	d65f03c0 	ret

0000000000204478 <syscall_ioprio_get>:
  204478:	f81f0ffe 	str	x30, [sp, #-16]!
  20447c:	52800261 	mov	w1, #0x13                  	// #19
  204480:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204484:	91030000 	add	x0, x0, #0xc0
  204488:	97fffd5c 	bl	2039f8 <syscall_trace>
  20448c:	d2800000 	mov	x0, #0x0                   	// #0
  204490:	f84107fe 	ldr	x30, [sp], #16
  204494:	d65f03c0 	ret

0000000000204498 <syscall_ioprio_set>:
  204498:	f81f0ffe 	str	x30, [sp, #-16]!
  20449c:	52800261 	mov	w1, #0x13                  	// #19
  2044a0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2044a4:	9102a000 	add	x0, x0, #0xa8
  2044a8:	97fffd54 	bl	2039f8 <syscall_trace>
  2044ac:	d2800000 	mov	x0, #0x0                   	// #0
  2044b0:	f84107fe 	ldr	x30, [sp], #16
  2044b4:	d65f03c0 	ret

00000000002044b8 <syscall_vserver>:
  2044b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2044bc:	52800201 	mov	w1, #0x10                  	// #16
  2044c0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2044c4:	91026000 	add	x0, x0, #0x98
  2044c8:	97fffd4c 	bl	2039f8 <syscall_trace>
  2044cc:	d2800000 	mov	x0, #0x0                   	// #0
  2044d0:	f84107fe 	ldr	x30, [sp], #16
  2044d4:	d65f03c0 	ret

00000000002044d8 <syscall_semtimedop>:
  2044d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2044dc:	52800261 	mov	w1, #0x13                  	// #19
  2044e0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2044e4:	91020000 	add	x0, x0, #0x80
  2044e8:	97fffd44 	bl	2039f8 <syscall_trace>
  2044ec:	d2800000 	mov	x0, #0x0                   	// #0
  2044f0:	f84107fe 	ldr	x30, [sp], #16
  2044f4:	d65f03c0 	ret

00000000002044f8 <syscall_keyctl>:
  2044f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2044fc:	528001e1 	mov	w1, #0xf                   	// #15
  204500:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204504:	9101c000 	add	x0, x0, #0x70
  204508:	97fffd3c 	bl	2039f8 <syscall_trace>
  20450c:	d2800000 	mov	x0, #0x0                   	// #0
  204510:	f84107fe 	ldr	x30, [sp], #16
  204514:	d65f03c0 	ret

0000000000204518 <syscall_request_key>:
  204518:	f81f0ffe 	str	x30, [sp, #-16]!
  20451c:	52800281 	mov	w1, #0x14                  	// #20
  204520:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204524:	91016000 	add	x0, x0, #0x58
  204528:	97fffd34 	bl	2039f8 <syscall_trace>
  20452c:	d2800000 	mov	x0, #0x0                   	// #0
  204530:	f84107fe 	ldr	x30, [sp], #16
  204534:	d65f03c0 	ret

0000000000204538 <syscall_add_key>:
  204538:	f81f0ffe 	str	x30, [sp, #-16]!
  20453c:	52800201 	mov	w1, #0x10                  	// #16
  204540:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204544:	91012000 	add	x0, x0, #0x48
  204548:	97fffd2c 	bl	2039f8 <syscall_trace>
  20454c:	d2800000 	mov	x0, #0x0                   	// #0
  204550:	f84107fe 	ldr	x30, [sp], #16
  204554:	d65f03c0 	ret

0000000000204558 <syscall_msgctl>:
  204558:	f81f0ffe 	str	x30, [sp, #-16]!
  20455c:	528001e1 	mov	w1, #0xf                   	// #15
  204560:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204564:	9100e000 	add	x0, x0, #0x38
  204568:	97fffd24 	bl	2039f8 <syscall_trace>
  20456c:	d2800000 	mov	x0, #0x0                   	// #0
  204570:	f84107fe 	ldr	x30, [sp], #16
  204574:	d65f03c0 	ret

0000000000204578 <syscall_msgget>:
  204578:	f81f0ffe 	str	x30, [sp, #-16]!
  20457c:	528001e1 	mov	w1, #0xf                   	// #15
  204580:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  204584:	9100a000 	add	x0, x0, #0x28
  204588:	97fffd1c 	bl	2039f8 <syscall_trace>
  20458c:	d2800000 	mov	x0, #0x0                   	// #0
  204590:	f84107fe 	ldr	x30, [sp], #16
  204594:	d65f03c0 	ret

0000000000204598 <syscall_msgrcv>:
  204598:	f81f0ffe 	str	x30, [sp, #-16]!
  20459c:	528001e1 	mov	w1, #0xf                   	// #15
  2045a0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2045a4:	91006000 	add	x0, x0, #0x18
  2045a8:	97fffd14 	bl	2039f8 <syscall_trace>
  2045ac:	d2800000 	mov	x0, #0x0                   	// #0
  2045b0:	f84107fe 	ldr	x30, [sp], #16
  2045b4:	d65f03c0 	ret

00000000002045b8 <syscall_msgsnd>:
  2045b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2045bc:	528001e1 	mov	w1, #0xf                   	// #15
  2045c0:	f0000060 	adrp	x0, 213000 <__FUNCTION__.5978+0x8>
  2045c4:	91002000 	add	x0, x0, #0x8
  2045c8:	97fffd0c 	bl	2039f8 <syscall_trace>
  2045cc:	d2800000 	mov	x0, #0x0                   	// #0
  2045d0:	f84107fe 	ldr	x30, [sp], #16
  2045d4:	d65f03c0 	ret

00000000002045d8 <syscall_semctl>:
  2045d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2045dc:	528001e1 	mov	w1, #0xf                   	// #15
  2045e0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2045e4:	913fe000 	add	x0, x0, #0xff8
  2045e8:	97fffd04 	bl	2039f8 <syscall_trace>
  2045ec:	d2800000 	mov	x0, #0x0                   	// #0
  2045f0:	f84107fe 	ldr	x30, [sp], #16
  2045f4:	d65f03c0 	ret

00000000002045f8 <syscall_semget>:
  2045f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2045fc:	528001e1 	mov	w1, #0xf                   	// #15
  204600:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204604:	913fa000 	add	x0, x0, #0xfe8
  204608:	97fffcfc 	bl	2039f8 <syscall_trace>
  20460c:	d2800000 	mov	x0, #0x0                   	// #0
  204610:	f84107fe 	ldr	x30, [sp], #16
  204614:	d65f03c0 	ret

0000000000204618 <syscall_semop>:
  204618:	f81f0ffe 	str	x30, [sp, #-16]!
  20461c:	528001c1 	mov	w1, #0xe                   	// #14
  204620:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204624:	913f6000 	add	x0, x0, #0xfd8
  204628:	97fffcf4 	bl	2039f8 <syscall_trace>
  20462c:	d2800000 	mov	x0, #0x0                   	// #0
  204630:	f84107fe 	ldr	x30, [sp], #16
  204634:	d65f03c0 	ret

0000000000204638 <syscall_recvmsg>:
  204638:	f81f0ffe 	str	x30, [sp, #-16]!
  20463c:	52800201 	mov	w1, #0x10                  	// #16
  204640:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204644:	913f2000 	add	x0, x0, #0xfc8
  204648:	97fffcec 	bl	2039f8 <syscall_trace>
  20464c:	d2800000 	mov	x0, #0x0                   	// #0
  204650:	f84107fe 	ldr	x30, [sp], #16
  204654:	d65f03c0 	ret

0000000000204658 <syscall_sendmsg>:
  204658:	f81f0ffe 	str	x30, [sp, #-16]!
  20465c:	52800201 	mov	w1, #0x10                  	// #16
  204660:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204664:	913ee000 	add	x0, x0, #0xfb8
  204668:	97fffce4 	bl	2039f8 <syscall_trace>
  20466c:	d2800000 	mov	x0, #0x0                   	// #0
  204670:	f84107fe 	ldr	x30, [sp], #16
  204674:	d65f03c0 	ret

0000000000204678 <syscall_shutdown>:
  204678:	f81f0ffe 	str	x30, [sp, #-16]!
  20467c:	52800221 	mov	w1, #0x11                  	// #17
  204680:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204684:	913e8000 	add	x0, x0, #0xfa0
  204688:	97fffcdc 	bl	2039f8 <syscall_trace>
  20468c:	d2800000 	mov	x0, #0x0                   	// #0
  204690:	f84107fe 	ldr	x30, [sp], #16
  204694:	d65f03c0 	ret

0000000000204698 <syscall_socketpair>:
  204698:	f81f0ffe 	str	x30, [sp, #-16]!
  20469c:	52800261 	mov	w1, #0x13                  	// #19
  2046a0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2046a4:	913e2000 	add	x0, x0, #0xf88
  2046a8:	97fffcd4 	bl	2039f8 <syscall_trace>
  2046ac:	d2800000 	mov	x0, #0x0                   	// #0
  2046b0:	f84107fe 	ldr	x30, [sp], #16
  2046b4:	d65f03c0 	ret

00000000002046b8 <syscall_waitid>:
  2046b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2046bc:	528001e1 	mov	w1, #0xf                   	// #15
  2046c0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2046c4:	913de000 	add	x0, x0, #0xf78
  2046c8:	97fffccc 	bl	2039f8 <syscall_trace>
  2046cc:	d2800000 	mov	x0, #0x0                   	// #0
  2046d0:	f84107fe 	ldr	x30, [sp], #16
  2046d4:	d65f03c0 	ret

00000000002046d8 <syscall_pciconfig_write>:
  2046d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2046dc:	52800301 	mov	w1, #0x18                  	// #24
  2046e0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2046e4:	913d8000 	add	x0, x0, #0xf60
  2046e8:	97fffcc4 	bl	2039f8 <syscall_trace>
  2046ec:	d2800000 	mov	x0, #0x0                   	// #0
  2046f0:	f84107fe 	ldr	x30, [sp], #16
  2046f4:	d65f03c0 	ret

00000000002046f8 <syscall_pciconfig_read>:
  2046f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2046fc:	528002e1 	mov	w1, #0x17                  	// #23
  204700:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204704:	913d2000 	add	x0, x0, #0xf48
  204708:	97fffcbc 	bl	2039f8 <syscall_trace>
  20470c:	d2800000 	mov	x0, #0x0                   	// #0
  204710:	f84107fe 	ldr	x30, [sp], #16
  204714:	d65f03c0 	ret

0000000000204718 <syscall_pciconfig_iobase>:
  204718:	f81f0ffe 	str	x30, [sp, #-16]!
  20471c:	52800321 	mov	w1, #0x19                  	// #25
  204720:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204724:	913ca000 	add	x0, x0, #0xf28
  204728:	97fffcb4 	bl	2039f8 <syscall_trace>
  20472c:	d2800000 	mov	x0, #0x0                   	// #0
  204730:	f84107fe 	ldr	x30, [sp], #16
  204734:	d65f03c0 	ret

0000000000204738 <syscall_arm_fadvise64_64>:
  204738:	f81f0ffe 	str	x30, [sp, #-16]!
  20473c:	52800321 	mov	w1, #0x19                  	// #25
  204740:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204744:	913c2000 	add	x0, x0, #0xf08
  204748:	97fffcac 	bl	2039f8 <syscall_trace>
  20474c:	d2800000 	mov	x0, #0x0                   	// #0
  204750:	f84107fe 	ldr	x30, [sp], #16
  204754:	d65f03c0 	ret

0000000000204758 <syscall_utimes>:
  204758:	f81f0ffe 	str	x30, [sp, #-16]!
  20475c:	528001e1 	mov	w1, #0xf                   	// #15
  204760:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204764:	913be000 	add	x0, x0, #0xef8
  204768:	97fffca4 	bl	2039f8 <syscall_trace>
  20476c:	d2800000 	mov	x0, #0x0                   	// #0
  204770:	f84107fe 	ldr	x30, [sp], #16
  204774:	d65f03c0 	ret

0000000000204778 <syscall_tgkill>:
  204778:	f81f0ffe 	str	x30, [sp, #-16]!
  20477c:	528001e1 	mov	w1, #0xf                   	// #15
  204780:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204784:	913ba000 	add	x0, x0, #0xee8
  204788:	97fffc9c 	bl	2039f8 <syscall_trace>
  20478c:	d2800000 	mov	x0, #0x0                   	// #0
  204790:	f84107fe 	ldr	x30, [sp], #16
  204794:	d65f03c0 	ret

0000000000204798 <syscall_fstatfs64>:
  204798:	f81f0ffe 	str	x30, [sp, #-16]!
  20479c:	52800241 	mov	w1, #0x12                  	// #18
  2047a0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2047a4:	913b4000 	add	x0, x0, #0xed0
  2047a8:	97fffc94 	bl	2039f8 <syscall_trace>
  2047ac:	d2800000 	mov	x0, #0x0                   	// #0
  2047b0:	f84107fe 	ldr	x30, [sp], #16
  2047b4:	d65f03c0 	ret

00000000002047b8 <syscall_statfs64>:
  2047b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2047bc:	52800221 	mov	w1, #0x11                  	// #17
  2047c0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2047c4:	913ae000 	add	x0, x0, #0xeb8
  2047c8:	97fffc8c 	bl	2039f8 <syscall_trace>
  2047cc:	d2800000 	mov	x0, #0x0                   	// #0
  2047d0:	f84107fe 	ldr	x30, [sp], #16
  2047d4:	d65f03c0 	ret

00000000002047d8 <syscall_remap_file_pages>:
  2047d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2047dc:	52800321 	mov	w1, #0x19                  	// #25
  2047e0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2047e4:	913a6000 	add	x0, x0, #0xe98
  2047e8:	97fffc84 	bl	2039f8 <syscall_trace>
  2047ec:	d2800000 	mov	x0, #0x0                   	// #0
  2047f0:	f84107fe 	ldr	x30, [sp], #16
  2047f4:	d65f03c0 	ret

00000000002047f8 <syscall_epoll_wait>:
  2047f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2047fc:	52800261 	mov	w1, #0x13                  	// #19
  204800:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204804:	913a0000 	add	x0, x0, #0xe80
  204808:	97fffc7c 	bl	2039f8 <syscall_trace>
  20480c:	928004a0 	mov	x0, #0xffffffffffffffda    	// #-38
  204810:	f84107fe 	ldr	x30, [sp], #16
  204814:	d65f03c0 	ret

0000000000204818 <syscall_epoll_ctl>:
  204818:	f81f0ffe 	str	x30, [sp, #-16]!
  20481c:	52800241 	mov	w1, #0x12                  	// #18
  204820:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204824:	9139a000 	add	x0, x0, #0xe68
  204828:	97fffc74 	bl	2039f8 <syscall_trace>
  20482c:	928004a0 	mov	x0, #0xffffffffffffffda    	// #-38
  204830:	f84107fe 	ldr	x30, [sp], #16
  204834:	d65f03c0 	ret

0000000000204838 <syscall_epoll_create>:
  204838:	f81f0ffe 	str	x30, [sp, #-16]!
  20483c:	528002a1 	mov	w1, #0x15                  	// #21
  204840:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204844:	91394000 	add	x0, x0, #0xe50
  204848:	97fffc6c 	bl	2039f8 <syscall_trace>
  20484c:	928004a0 	mov	x0, #0xffffffffffffffda    	// #-38
  204850:	f84107fe 	ldr	x30, [sp], #16
  204854:	d65f03c0 	ret

0000000000204858 <syscall_lookup_dcookie>:
  204858:	f81f0ffe 	str	x30, [sp, #-16]!
  20485c:	528002e1 	mov	w1, #0x17                  	// #23
  204860:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204864:	9138e000 	add	x0, x0, #0xe38
  204868:	97fffc64 	bl	2039f8 <syscall_trace>
  20486c:	d2800000 	mov	x0, #0x0                   	// #0
  204870:	f84107fe 	ldr	x30, [sp], #16
  204874:	d65f03c0 	ret

0000000000204878 <syscall_io_cancel>:
  204878:	f81f0ffe 	str	x30, [sp, #-16]!
  20487c:	52800241 	mov	w1, #0x12                  	// #18
  204880:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204884:	91388000 	add	x0, x0, #0xe20
  204888:	97fffc5c 	bl	2039f8 <syscall_trace>
  20488c:	d2800000 	mov	x0, #0x0                   	// #0
  204890:	f84107fe 	ldr	x30, [sp], #16
  204894:	d65f03c0 	ret

0000000000204898 <syscall_io_submit>:
  204898:	f81f0ffe 	str	x30, [sp, #-16]!
  20489c:	52800241 	mov	w1, #0x12                  	// #18
  2048a0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2048a4:	91382000 	add	x0, x0, #0xe08
  2048a8:	97fffc54 	bl	2039f8 <syscall_trace>
  2048ac:	d2800000 	mov	x0, #0x0                   	// #0
  2048b0:	f84107fe 	ldr	x30, [sp], #16
  2048b4:	d65f03c0 	ret

00000000002048b8 <syscall_io_getevents>:
  2048b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2048bc:	528002a1 	mov	w1, #0x15                  	// #21
  2048c0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2048c4:	9137c000 	add	x0, x0, #0xdf0
  2048c8:	97fffc4c 	bl	2039f8 <syscall_trace>
  2048cc:	d2800000 	mov	x0, #0x0                   	// #0
  2048d0:	f84107fe 	ldr	x30, [sp], #16
  2048d4:	d65f03c0 	ret

00000000002048d8 <syscall_io_destroy>:
  2048d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2048dc:	52800261 	mov	w1, #0x13                  	// #19
  2048e0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2048e4:	91376000 	add	x0, x0, #0xdd8
  2048e8:	97fffc44 	bl	2039f8 <syscall_trace>
  2048ec:	d2800000 	mov	x0, #0x0                   	// #0
  2048f0:	f84107fe 	ldr	x30, [sp], #16
  2048f4:	d65f03c0 	ret

00000000002048f8 <syscall_io_setup>:
  2048f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2048fc:	52800221 	mov	w1, #0x11                  	// #17
  204900:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204904:	91370000 	add	x0, x0, #0xdc0
  204908:	97fffc3c 	bl	2039f8 <syscall_trace>
  20490c:	d2800000 	mov	x0, #0x0                   	// #0
  204910:	f84107fe 	ldr	x30, [sp], #16
  204914:	d65f03c0 	ret

0000000000204918 <syscall_sched_getaffinity>:
  204918:	f81f0ffe 	str	x30, [sp, #-16]!
  20491c:	52800341 	mov	w1, #0x1a                  	// #26
  204920:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204924:	91368000 	add	x0, x0, #0xda0
  204928:	97fffc34 	bl	2039f8 <syscall_trace>
  20492c:	d2800000 	mov	x0, #0x0                   	// #0
  204930:	f84107fe 	ldr	x30, [sp], #16
  204934:	d65f03c0 	ret

0000000000204938 <syscall_sendfile64>:
  204938:	f81f0ffe 	str	x30, [sp, #-16]!
  20493c:	52800261 	mov	w1, #0x13                  	// #19
  204940:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204944:	91362000 	add	x0, x0, #0xd88
  204948:	97fffc2c 	bl	2039f8 <syscall_trace>
  20494c:	d2800000 	mov	x0, #0x0                   	// #0
  204950:	f84107fe 	ldr	x30, [sp], #16
  204954:	d65f03c0 	ret

0000000000204958 <syscall_fremovexattr>:
  204958:	f81f0ffe 	str	x30, [sp, #-16]!
  20495c:	528002a1 	mov	w1, #0x15                  	// #21
  204960:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204964:	9135c000 	add	x0, x0, #0xd70
  204968:	97fffc24 	bl	2039f8 <syscall_trace>
  20496c:	d2800000 	mov	x0, #0x0                   	// #0
  204970:	f84107fe 	ldr	x30, [sp], #16
  204974:	d65f03c0 	ret

0000000000204978 <syscall_lremovexattr>:
  204978:	f81f0ffe 	str	x30, [sp, #-16]!
  20497c:	528002a1 	mov	w1, #0x15                  	// #21
  204980:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204984:	91356000 	add	x0, x0, #0xd58
  204988:	97fffc1c 	bl	2039f8 <syscall_trace>
  20498c:	d2800000 	mov	x0, #0x0                   	// #0
  204990:	f84107fe 	ldr	x30, [sp], #16
  204994:	d65f03c0 	ret

0000000000204998 <syscall_removexattr>:
  204998:	f81f0ffe 	str	x30, [sp, #-16]!
  20499c:	52800281 	mov	w1, #0x14                  	// #20
  2049a0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2049a4:	91350000 	add	x0, x0, #0xd40
  2049a8:	97fffc14 	bl	2039f8 <syscall_trace>
  2049ac:	d2800000 	mov	x0, #0x0                   	// #0
  2049b0:	f84107fe 	ldr	x30, [sp], #16
  2049b4:	d65f03c0 	ret

00000000002049b8 <syscall_flistxattr>:
  2049b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2049bc:	52800261 	mov	w1, #0x13                  	// #19
  2049c0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2049c4:	9134a000 	add	x0, x0, #0xd28
  2049c8:	97fffc0c 	bl	2039f8 <syscall_trace>
  2049cc:	d2800000 	mov	x0, #0x0                   	// #0
  2049d0:	f84107fe 	ldr	x30, [sp], #16
  2049d4:	d65f03c0 	ret

00000000002049d8 <syscall_llistxattr>:
  2049d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2049dc:	52800261 	mov	w1, #0x13                  	// #19
  2049e0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2049e4:	91344000 	add	x0, x0, #0xd10
  2049e8:	97fffc04 	bl	2039f8 <syscall_trace>
  2049ec:	d2800000 	mov	x0, #0x0                   	// #0
  2049f0:	f84107fe 	ldr	x30, [sp], #16
  2049f4:	d65f03c0 	ret

00000000002049f8 <syscall_listxattr>:
  2049f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2049fc:	52800241 	mov	w1, #0x12                  	// #18
  204a00:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204a04:	9133e000 	add	x0, x0, #0xcf8
  204a08:	97fffbfc 	bl	2039f8 <syscall_trace>
  204a0c:	d2800000 	mov	x0, #0x0                   	// #0
  204a10:	f84107fe 	ldr	x30, [sp], #16
  204a14:	d65f03c0 	ret

0000000000204a18 <syscall_fgetxattr>:
  204a18:	f81f0ffe 	str	x30, [sp, #-16]!
  204a1c:	52800241 	mov	w1, #0x12                  	// #18
  204a20:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204a24:	91338000 	add	x0, x0, #0xce0
  204a28:	97fffbf4 	bl	2039f8 <syscall_trace>
  204a2c:	d2800000 	mov	x0, #0x0                   	// #0
  204a30:	f84107fe 	ldr	x30, [sp], #16
  204a34:	d65f03c0 	ret

0000000000204a38 <syscall_lgetxattr>:
  204a38:	f81f0ffe 	str	x30, [sp, #-16]!
  204a3c:	52800241 	mov	w1, #0x12                  	// #18
  204a40:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204a44:	91332000 	add	x0, x0, #0xcc8
  204a48:	97fffbec 	bl	2039f8 <syscall_trace>
  204a4c:	d2800000 	mov	x0, #0x0                   	// #0
  204a50:	f84107fe 	ldr	x30, [sp], #16
  204a54:	d65f03c0 	ret

0000000000204a58 <syscall_getxattr>:
  204a58:	f81f0ffe 	str	x30, [sp, #-16]!
  204a5c:	52800221 	mov	w1, #0x11                  	// #17
  204a60:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204a64:	9132c000 	add	x0, x0, #0xcb0
  204a68:	97fffbe4 	bl	2039f8 <syscall_trace>
  204a6c:	d2800000 	mov	x0, #0x0                   	// #0
  204a70:	f84107fe 	ldr	x30, [sp], #16
  204a74:	d65f03c0 	ret

0000000000204a78 <syscall_fsetxattr>:
  204a78:	f81f0ffe 	str	x30, [sp, #-16]!
  204a7c:	52800241 	mov	w1, #0x12                  	// #18
  204a80:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204a84:	91326000 	add	x0, x0, #0xc98
  204a88:	97fffbdc 	bl	2039f8 <syscall_trace>
  204a8c:	d2800000 	mov	x0, #0x0                   	// #0
  204a90:	f84107fe 	ldr	x30, [sp], #16
  204a94:	d65f03c0 	ret

0000000000204a98 <syscall_lsetxattr>:
  204a98:	f81f0ffe 	str	x30, [sp, #-16]!
  204a9c:	52800241 	mov	w1, #0x12                  	// #18
  204aa0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204aa4:	91320000 	add	x0, x0, #0xc80
  204aa8:	97fffbd4 	bl	2039f8 <syscall_trace>
  204aac:	d2800000 	mov	x0, #0x0                   	// #0
  204ab0:	f84107fe 	ldr	x30, [sp], #16
  204ab4:	d65f03c0 	ret

0000000000204ab8 <syscall_setxattr>:
  204ab8:	f81f0ffe 	str	x30, [sp, #-16]!
  204abc:	52800221 	mov	w1, #0x11                  	// #17
  204ac0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204ac4:	9131a000 	add	x0, x0, #0xc68
  204ac8:	97fffbcc 	bl	2039f8 <syscall_trace>
  204acc:	d2800000 	mov	x0, #0x0                   	// #0
  204ad0:	f84107fe 	ldr	x30, [sp], #16
  204ad4:	d65f03c0 	ret

0000000000204ad8 <syscall_readahead>:
  204ad8:	f81f0ffe 	str	x30, [sp, #-16]!
  204adc:	52800241 	mov	w1, #0x12                  	// #18
  204ae0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204ae4:	91314000 	add	x0, x0, #0xc50
  204ae8:	97fffbc4 	bl	2039f8 <syscall_trace>
  204aec:	d2800000 	mov	x0, #0x0                   	// #0
  204af0:	f84107fe 	ldr	x30, [sp], #16
  204af4:	d65f03c0 	ret

0000000000204af8 <syscall_mincore>:
  204af8:	f81f0ffe 	str	x30, [sp, #-16]!
  204afc:	52800201 	mov	w1, #0x10                  	// #16
  204b00:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204b04:	91310000 	add	x0, x0, #0xc40
  204b08:	97fffbbc 	bl	2039f8 <syscall_trace>
  204b0c:	d2800000 	mov	x0, #0x0                   	// #0
  204b10:	f84107fe 	ldr	x30, [sp], #16
  204b14:	d65f03c0 	ret

0000000000204b18 <syscall_pivot_root>:
  204b18:	f81f0ffe 	str	x30, [sp, #-16]!
  204b1c:	52800261 	mov	w1, #0x13                  	// #19
  204b20:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204b24:	9130a000 	add	x0, x0, #0xc28
  204b28:	97fffbb4 	bl	2039f8 <syscall_trace>
  204b2c:	d2800000 	mov	x0, #0x0                   	// #0
  204b30:	f84107fe 	ldr	x30, [sp], #16
  204b34:	d65f03c0 	ret

0000000000204b38 <syscall_setfsgid32>:
  204b38:	f81f0ffe 	str	x30, [sp, #-16]!
  204b3c:	52800261 	mov	w1, #0x13                  	// #19
  204b40:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204b44:	91304000 	add	x0, x0, #0xc10
  204b48:	97fffbac 	bl	2039f8 <syscall_trace>
  204b4c:	d2800000 	mov	x0, #0x0                   	// #0
  204b50:	f84107fe 	ldr	x30, [sp], #16
  204b54:	d65f03c0 	ret

0000000000204b58 <syscall_setfsuid32>:
  204b58:	f81f0ffe 	str	x30, [sp, #-16]!
  204b5c:	52800261 	mov	w1, #0x13                  	// #19
  204b60:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204b64:	912fe000 	add	x0, x0, #0xbf8
  204b68:	97fffba4 	bl	2039f8 <syscall_trace>
  204b6c:	d2800000 	mov	x0, #0x0                   	// #0
  204b70:	f84107fe 	ldr	x30, [sp], #16
  204b74:	d65f03c0 	ret

0000000000204b78 <syscall_setgid32>:
  204b78:	f81f0ffe 	str	x30, [sp, #-16]!
  204b7c:	52800221 	mov	w1, #0x11                  	// #17
  204b80:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204b84:	912f8000 	add	x0, x0, #0xbe0
  204b88:	97fffb9c 	bl	2039f8 <syscall_trace>
  204b8c:	d2800000 	mov	x0, #0x0                   	// #0
  204b90:	f84107fe 	ldr	x30, [sp], #16
  204b94:	d65f03c0 	ret

0000000000204b98 <syscall_setuid32>:
  204b98:	f81f0ffe 	str	x30, [sp, #-16]!
  204b9c:	52800221 	mov	w1, #0x11                  	// #17
  204ba0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204ba4:	912f2000 	add	x0, x0, #0xbc8
  204ba8:	97fffb94 	bl	2039f8 <syscall_trace>
  204bac:	d2800000 	mov	x0, #0x0                   	// #0
  204bb0:	f84107fe 	ldr	x30, [sp], #16
  204bb4:	d65f03c0 	ret

0000000000204bb8 <syscall_chown32>:
  204bb8:	f81f0ffe 	str	x30, [sp, #-16]!
  204bbc:	52800201 	mov	w1, #0x10                  	// #16
  204bc0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204bc4:	912ee000 	add	x0, x0, #0xbb8
  204bc8:	97fffb8c 	bl	2039f8 <syscall_trace>
  204bcc:	d2800000 	mov	x0, #0x0                   	// #0
  204bd0:	f84107fe 	ldr	x30, [sp], #16
  204bd4:	d65f03c0 	ret

0000000000204bd8 <syscall_getresgid32>:
  204bd8:	f81f0ffe 	str	x30, [sp, #-16]!
  204bdc:	52800281 	mov	w1, #0x14                  	// #20
  204be0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204be4:	912e8000 	add	x0, x0, #0xba0
  204be8:	97fffb84 	bl	2039f8 <syscall_trace>
  204bec:	d2800000 	mov	x0, #0x0                   	// #0
  204bf0:	f84107fe 	ldr	x30, [sp], #16
  204bf4:	d65f03c0 	ret

0000000000204bf8 <syscall_setresgid32>:
  204bf8:	f81f0ffe 	str	x30, [sp, #-16]!
  204bfc:	52800281 	mov	w1, #0x14                  	// #20
  204c00:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204c04:	912e2000 	add	x0, x0, #0xb88
  204c08:	97fffb7c 	bl	2039f8 <syscall_trace>
  204c0c:	d2800000 	mov	x0, #0x0                   	// #0
  204c10:	f84107fe 	ldr	x30, [sp], #16
  204c14:	d65f03c0 	ret

0000000000204c18 <syscall_getresuid32>:
  204c18:	f81f0ffe 	str	x30, [sp, #-16]!
  204c1c:	52800281 	mov	w1, #0x14                  	// #20
  204c20:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204c24:	912dc000 	add	x0, x0, #0xb70
  204c28:	97fffb74 	bl	2039f8 <syscall_trace>
  204c2c:	d2800000 	mov	x0, #0x0                   	// #0
  204c30:	f84107fe 	ldr	x30, [sp], #16
  204c34:	d65f03c0 	ret

0000000000204c38 <syscall_setresuid32>:
  204c38:	f81f0ffe 	str	x30, [sp, #-16]!
  204c3c:	52800281 	mov	w1, #0x14                  	// #20
  204c40:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204c44:	912d6000 	add	x0, x0, #0xb58
  204c48:	97fffb6c 	bl	2039f8 <syscall_trace>
  204c4c:	d2800000 	mov	x0, #0x0                   	// #0
  204c50:	f84107fe 	ldr	x30, [sp], #16
  204c54:	d65f03c0 	ret

0000000000204c58 <syscall_fchown32>:
  204c58:	f81f0ffe 	str	x30, [sp, #-16]!
  204c5c:	52800221 	mov	w1, #0x11                  	// #17
  204c60:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204c64:	912d0000 	add	x0, x0, #0xb40
  204c68:	97fffb64 	bl	2039f8 <syscall_trace>
  204c6c:	d2800000 	mov	x0, #0x0                   	// #0
  204c70:	f84107fe 	ldr	x30, [sp], #16
  204c74:	d65f03c0 	ret

0000000000204c78 <syscall_setgroups32>:
  204c78:	f81f0ffe 	str	x30, [sp, #-16]!
  204c7c:	52800281 	mov	w1, #0x14                  	// #20
  204c80:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204c84:	912ca000 	add	x0, x0, #0xb28
  204c88:	97fffb5c 	bl	2039f8 <syscall_trace>
  204c8c:	d2800000 	mov	x0, #0x0                   	// #0
  204c90:	f84107fe 	ldr	x30, [sp], #16
  204c94:	d65f03c0 	ret

0000000000204c98 <syscall_getgroups32>:
  204c98:	f81f0ffe 	str	x30, [sp, #-16]!
  204c9c:	52800281 	mov	w1, #0x14                  	// #20
  204ca0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204ca4:	912c4000 	add	x0, x0, #0xb10
  204ca8:	97fffb54 	bl	2039f8 <syscall_trace>
  204cac:	d2800000 	mov	x0, #0x0                   	// #0
  204cb0:	f84107fe 	ldr	x30, [sp], #16
  204cb4:	d65f03c0 	ret

0000000000204cb8 <syscall_setregid32>:
  204cb8:	f81f0ffe 	str	x30, [sp, #-16]!
  204cbc:	52800261 	mov	w1, #0x13                  	// #19
  204cc0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204cc4:	912be000 	add	x0, x0, #0xaf8
  204cc8:	97fffb4c 	bl	2039f8 <syscall_trace>
  204ccc:	d2800000 	mov	x0, #0x0                   	// #0
  204cd0:	f84107fe 	ldr	x30, [sp], #16
  204cd4:	d65f03c0 	ret

0000000000204cd8 <syscall_setreuid32>:
  204cd8:	f81f0ffe 	str	x30, [sp, #-16]!
  204cdc:	52800261 	mov	w1, #0x13                  	// #19
  204ce0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204ce4:	912b8000 	add	x0, x0, #0xae0
  204ce8:	97fffb44 	bl	2039f8 <syscall_trace>
  204cec:	d2800000 	mov	x0, #0x0                   	// #0
  204cf0:	f84107fe 	ldr	x30, [sp], #16
  204cf4:	d65f03c0 	ret

0000000000204cf8 <syscall_getegid32>:
  204cf8:	f81f0ffe 	str	x30, [sp, #-16]!
  204cfc:	52800241 	mov	w1, #0x12                  	// #18
  204d00:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204d04:	912b2000 	add	x0, x0, #0xac8
  204d08:	97fffb3c 	bl	2039f8 <syscall_trace>
  204d0c:	d2800000 	mov	x0, #0x0                   	// #0
  204d10:	f84107fe 	ldr	x30, [sp], #16
  204d14:	d65f03c0 	ret

0000000000204d18 <syscall_geteuid32>:
  204d18:	f81f0ffe 	str	x30, [sp, #-16]!
  204d1c:	52800241 	mov	w1, #0x12                  	// #18
  204d20:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204d24:	912ac000 	add	x0, x0, #0xab0
  204d28:	97fffb34 	bl	2039f8 <syscall_trace>
  204d2c:	d2800000 	mov	x0, #0x0                   	// #0
  204d30:	f84107fe 	ldr	x30, [sp], #16
  204d34:	d65f03c0 	ret

0000000000204d38 <syscall_getgid32>:
  204d38:	f81f0ffe 	str	x30, [sp, #-16]!
  204d3c:	52800221 	mov	w1, #0x11                  	// #17
  204d40:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204d44:	912a6000 	add	x0, x0, #0xa98
  204d48:	97fffb2c 	bl	2039f8 <syscall_trace>
  204d4c:	d2800000 	mov	x0, #0x0                   	// #0
  204d50:	f84107fe 	ldr	x30, [sp], #16
  204d54:	d65f03c0 	ret

0000000000204d58 <syscall_getuid32>:
  204d58:	f81f0ffe 	str	x30, [sp, #-16]!
  204d5c:	52800221 	mov	w1, #0x11                  	// #17
  204d60:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204d64:	912a0000 	add	x0, x0, #0xa80
  204d68:	97fffb24 	bl	2039f8 <syscall_trace>
  204d6c:	d2800000 	mov	x0, #0x0                   	// #0
  204d70:	f84107fe 	ldr	x30, [sp], #16
  204d74:	d65f03c0 	ret

0000000000204d78 <syscall_lchown32>:
  204d78:	f81f0ffe 	str	x30, [sp, #-16]!
  204d7c:	52800221 	mov	w1, #0x11                  	// #17
  204d80:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204d84:	9129a000 	add	x0, x0, #0xa68
  204d88:	97fffb1c 	bl	2039f8 <syscall_trace>
  204d8c:	d2800000 	mov	x0, #0x0                   	// #0
  204d90:	f84107fe 	ldr	x30, [sp], #16
  204d94:	d65f03c0 	ret

0000000000204d98 <syscall_ftruncate64>:
  204d98:	f81f0ffe 	str	x30, [sp, #-16]!
  204d9c:	52800281 	mov	w1, #0x14                  	// #20
  204da0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204da4:	91294000 	add	x0, x0, #0xa50
  204da8:	97fffb14 	bl	2039f8 <syscall_trace>
  204dac:	d2800000 	mov	x0, #0x0                   	// #0
  204db0:	f84107fe 	ldr	x30, [sp], #16
  204db4:	d65f03c0 	ret

0000000000204db8 <syscall_truncate64>:
  204db8:	f81f0ffe 	str	x30, [sp, #-16]!
  204dbc:	52800261 	mov	w1, #0x13                  	// #19
  204dc0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204dc4:	9128e000 	add	x0, x0, #0xa38
  204dc8:	97fffb0c 	bl	2039f8 <syscall_trace>
  204dcc:	d2800000 	mov	x0, #0x0                   	// #0
  204dd0:	f84107fe 	ldr	x30, [sp], #16
  204dd4:	d65f03c0 	ret

0000000000204dd8 <syscall_sendfile>:
  204dd8:	f81f0ffe 	str	x30, [sp, #-16]!
  204ddc:	52800221 	mov	w1, #0x11                  	// #17
  204de0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204de4:	91288000 	add	x0, x0, #0xa20
  204de8:	97fffb04 	bl	2039f8 <syscall_trace>
  204dec:	d2800000 	mov	x0, #0x0                   	// #0
  204df0:	f84107fe 	ldr	x30, [sp], #16
  204df4:	d65f03c0 	ret

0000000000204df8 <syscall_sigaltstack>:
  204df8:	f81f0ffe 	str	x30, [sp, #-16]!
  204dfc:	52800281 	mov	w1, #0x14                  	// #20
  204e00:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204e04:	91282000 	add	x0, x0, #0xa08
  204e08:	97fffafc 	bl	2039f8 <syscall_trace>
  204e0c:	d2800000 	mov	x0, #0x0                   	// #0
  204e10:	f84107fe 	ldr	x30, [sp], #16
  204e14:	d65f03c0 	ret

0000000000204e18 <syscall_capset>:
  204e18:	f81f0ffe 	str	x30, [sp, #-16]!
  204e1c:	528001e1 	mov	w1, #0xf                   	// #15
  204e20:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204e24:	9127e000 	add	x0, x0, #0x9f8
  204e28:	97fffaf4 	bl	2039f8 <syscall_trace>
  204e2c:	d2800000 	mov	x0, #0x0                   	// #0
  204e30:	f84107fe 	ldr	x30, [sp], #16
  204e34:	d65f03c0 	ret

0000000000204e38 <syscall_capget>:
  204e38:	f81f0ffe 	str	x30, [sp, #-16]!
  204e3c:	528001e1 	mov	w1, #0xf                   	// #15
  204e40:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204e44:	9127a000 	add	x0, x0, #0x9e8
  204e48:	97fffaec 	bl	2039f8 <syscall_trace>
  204e4c:	d2800000 	mov	x0, #0x0                   	// #0
  204e50:	f84107fe 	ldr	x30, [sp], #16
  204e54:	d65f03c0 	ret

0000000000204e58 <syscall_chown>:
  204e58:	f81f0ffe 	str	x30, [sp, #-16]!
  204e5c:	528001c1 	mov	w1, #0xe                   	// #14
  204e60:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204e64:	91276000 	add	x0, x0, #0x9d8
  204e68:	97fffae4 	bl	2039f8 <syscall_trace>
  204e6c:	d2800000 	mov	x0, #0x0                   	// #0
  204e70:	f84107fe 	ldr	x30, [sp], #16
  204e74:	d65f03c0 	ret

0000000000204e78 <syscall_pwrite64>:
  204e78:	f81f0ffe 	str	x30, [sp, #-16]!
  204e7c:	52800221 	mov	w1, #0x11                  	// #17
  204e80:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204e84:	91270000 	add	x0, x0, #0x9c0
  204e88:	97fffadc 	bl	2039f8 <syscall_trace>
  204e8c:	d2800000 	mov	x0, #0x0                   	// #0
  204e90:	f84107fe 	ldr	x30, [sp], #16
  204e94:	d65f03c0 	ret

0000000000204e98 <syscall_pread64>:
  204e98:	f81f0ffe 	str	x30, [sp, #-16]!
  204e9c:	52800201 	mov	w1, #0x10                  	// #16
  204ea0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204ea4:	9126c000 	add	x0, x0, #0x9b0
  204ea8:	97fffad4 	bl	2039f8 <syscall_trace>
  204eac:	d2800000 	mov	x0, #0x0                   	// #0
  204eb0:	f84107fe 	ldr	x30, [sp], #16
  204eb4:	d65f03c0 	ret

0000000000204eb8 <syscall_rt_sigsuspend>:
  204eb8:	f81f0ffe 	str	x30, [sp, #-16]!
  204ebc:	528002c1 	mov	w1, #0x16                  	// #22
  204ec0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204ec4:	91266000 	add	x0, x0, #0x998
  204ec8:	97fffacc 	bl	2039f8 <syscall_trace>
  204ecc:	d2800000 	mov	x0, #0x0                   	// #0
  204ed0:	f84107fe 	ldr	x30, [sp], #16
  204ed4:	d65f03c0 	ret

0000000000204ed8 <syscall_rt_sigqueueinfo>:
  204ed8:	f81f0ffe 	str	x30, [sp, #-16]!
  204edc:	52800301 	mov	w1, #0x18                  	// #24
  204ee0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204ee4:	91260000 	add	x0, x0, #0x980
  204ee8:	97fffac4 	bl	2039f8 <syscall_trace>
  204eec:	d2800000 	mov	x0, #0x0                   	// #0
  204ef0:	f84107fe 	ldr	x30, [sp], #16
  204ef4:	d65f03c0 	ret

0000000000204ef8 <syscall_rt_sigtimedwait>:
  204ef8:	f81f0ffe 	str	x30, [sp, #-16]!
  204efc:	52800301 	mov	w1, #0x18                  	// #24
  204f00:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204f04:	9125a000 	add	x0, x0, #0x968
  204f08:	97fffabc 	bl	2039f8 <syscall_trace>
  204f0c:	d2800000 	mov	x0, #0x0                   	// #0
  204f10:	f84107fe 	ldr	x30, [sp], #16
  204f14:	d65f03c0 	ret

0000000000204f18 <syscall_rt_sigpending>:
  204f18:	f81f0ffe 	str	x30, [sp, #-16]!
  204f1c:	528002c1 	mov	w1, #0x16                  	// #22
  204f20:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204f24:	91254000 	add	x0, x0, #0x950
  204f28:	97fffab4 	bl	2039f8 <syscall_trace>
  204f2c:	d2800000 	mov	x0, #0x0                   	// #0
  204f30:	f84107fe 	ldr	x30, [sp], #16
  204f34:	d65f03c0 	ret

0000000000204f38 <syscall_rt_sigreturn>:
  204f38:	f81f0ffe 	str	x30, [sp, #-16]!
  204f3c:	528002a1 	mov	w1, #0x15                  	// #21
  204f40:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204f44:	9124e000 	add	x0, x0, #0x938
  204f48:	97fffaac 	bl	2039f8 <syscall_trace>
  204f4c:	d2800000 	mov	x0, #0x0                   	// #0
  204f50:	f84107fe 	ldr	x30, [sp], #16
  204f54:	d65f03c0 	ret

0000000000204f58 <syscall_prctl>:
  204f58:	f81f0ffe 	str	x30, [sp, #-16]!
  204f5c:	528001c1 	mov	w1, #0xe                   	// #14
  204f60:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204f64:	9124a000 	add	x0, x0, #0x928
  204f68:	97fffaa4 	bl	2039f8 <syscall_trace>
  204f6c:	d2800000 	mov	x0, #0x0                   	// #0
  204f70:	f84107fe 	ldr	x30, [sp], #16
  204f74:	d65f03c0 	ret

0000000000204f78 <syscall_getresgid>:
  204f78:	f81f0ffe 	str	x30, [sp, #-16]!
  204f7c:	52800241 	mov	w1, #0x12                  	// #18
  204f80:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204f84:	91244000 	add	x0, x0, #0x910
  204f88:	97fffa9c 	bl	2039f8 <syscall_trace>
  204f8c:	d2800000 	mov	x0, #0x0                   	// #0
  204f90:	f84107fe 	ldr	x30, [sp], #16
  204f94:	d65f03c0 	ret

0000000000204f98 <syscall_setresgid>:
  204f98:	f81f0ffe 	str	x30, [sp, #-16]!
  204f9c:	52800241 	mov	w1, #0x12                  	// #18
  204fa0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204fa4:	9123e000 	add	x0, x0, #0x8f8
  204fa8:	97fffa94 	bl	2039f8 <syscall_trace>
  204fac:	d2800000 	mov	x0, #0x0                   	// #0
  204fb0:	f84107fe 	ldr	x30, [sp], #16
  204fb4:	d65f03c0 	ret

0000000000204fb8 <syscall_nfsservctl>:
  204fb8:	f81f0ffe 	str	x30, [sp, #-16]!
  204fbc:	52800261 	mov	w1, #0x13                  	// #19
  204fc0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204fc4:	91238000 	add	x0, x0, #0x8e0
  204fc8:	97fffa8c 	bl	2039f8 <syscall_trace>
  204fcc:	d2800000 	mov	x0, #0x0                   	// #0
  204fd0:	f84107fe 	ldr	x30, [sp], #16
  204fd4:	d65f03c0 	ret

0000000000204fd8 <syscall_getresuid>:
  204fd8:	f81f0ffe 	str	x30, [sp, #-16]!
  204fdc:	52800241 	mov	w1, #0x12                  	// #18
  204fe0:	d0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  204fe4:	91232000 	add	x0, x0, #0x8c8
  204fe8:	97fffa84 	bl	2039f8 <syscall_trace>
  204fec:	d2800000 	mov	x0, #0x0                   	// #0
  204ff0:	f84107fe 	ldr	x30, [sp], #16
  204ff4:	d65f03c0 	ret

0000000000204ff8 <syscall_setresuid>:
  204ff8:	f81f0ffe 	str	x30, [sp, #-16]!
  204ffc:	52800241 	mov	w1, #0x12                  	// #18
  205000:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205004:	9122c000 	add	x0, x0, #0x8b0
  205008:	97fffa7c 	bl	2039f8 <syscall_trace>
  20500c:	d2800000 	mov	x0, #0x0                   	// #0
  205010:	f84107fe 	ldr	x30, [sp], #16
  205014:	d65f03c0 	ret

0000000000205018 <syscall_sched_rr_get_interval>:
  205018:	f81f0ffe 	str	x30, [sp, #-16]!
  20501c:	528003c1 	mov	w1, #0x1e                  	// #30
  205020:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205024:	91224000 	add	x0, x0, #0x890
  205028:	97fffa74 	bl	2039f8 <syscall_trace>
  20502c:	d2800000 	mov	x0, #0x0                   	// #0
  205030:	f84107fe 	ldr	x30, [sp], #16
  205034:	d65f03c0 	ret

0000000000205038 <syscall_sched_yield>:
  205038:	f81f0ffe 	str	x30, [sp, #-16]!
  20503c:	52800281 	mov	w1, #0x14                  	// #20
  205040:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205044:	9121e000 	add	x0, x0, #0x878
  205048:	97fffa6c 	bl	2039f8 <syscall_trace>
  20504c:	d2800000 	mov	x0, #0x0                   	// #0
  205050:	f84107fe 	ldr	x30, [sp], #16
  205054:	d65f03c0 	ret

0000000000205058 <syscall_munlockall>:
  205058:	f81f0ffe 	str	x30, [sp, #-16]!
  20505c:	52800261 	mov	w1, #0x13                  	// #19
  205060:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205064:	91218000 	add	x0, x0, #0x860
  205068:	97fffa64 	bl	2039f8 <syscall_trace>
  20506c:	d2800000 	mov	x0, #0x0                   	// #0
  205070:	f84107fe 	ldr	x30, [sp], #16
  205074:	d65f03c0 	ret

0000000000205078 <syscall_mlockall>:
  205078:	f81f0ffe 	str	x30, [sp, #-16]!
  20507c:	52800221 	mov	w1, #0x11                  	// #17
  205080:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205084:	91212000 	add	x0, x0, #0x848
  205088:	97fffa5c 	bl	2039f8 <syscall_trace>
  20508c:	d2800000 	mov	x0, #0x0                   	// #0
  205090:	f84107fe 	ldr	x30, [sp], #16
  205094:	d65f03c0 	ret

0000000000205098 <syscall_munlock>:
  205098:	f81f0ffe 	str	x30, [sp, #-16]!
  20509c:	52800201 	mov	w1, #0x10                  	// #16
  2050a0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2050a4:	9120e000 	add	x0, x0, #0x838
  2050a8:	97fffa54 	bl	2039f8 <syscall_trace>
  2050ac:	d2800000 	mov	x0, #0x0                   	// #0
  2050b0:	f84107fe 	ldr	x30, [sp], #16
  2050b4:	d65f03c0 	ret

00000000002050b8 <syscall_mlock>:
  2050b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2050bc:	528001c1 	mov	w1, #0xe                   	// #14
  2050c0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2050c4:	9120a000 	add	x0, x0, #0x828
  2050c8:	97fffa4c 	bl	2039f8 <syscall_trace>
  2050cc:	d2800000 	mov	x0, #0x0                   	// #0
  2050d0:	f84107fe 	ldr	x30, [sp], #16
  2050d4:	d65f03c0 	ret

00000000002050d8 <syscall__sysctl>:
  2050d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2050dc:	52800201 	mov	w1, #0x10                  	// #16
  2050e0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2050e4:	91206000 	add	x0, x0, #0x818
  2050e8:	97fffa44 	bl	2039f8 <syscall_trace>
  2050ec:	d2800000 	mov	x0, #0x0                   	// #0
  2050f0:	f84107fe 	ldr	x30, [sp], #16
  2050f4:	d65f03c0 	ret

00000000002050f8 <syscall_fdatasync>:
  2050f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2050fc:	52800241 	mov	w1, #0x12                  	// #18
  205100:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205104:	91200000 	add	x0, x0, #0x800
  205108:	97fffa3c 	bl	2039f8 <syscall_trace>
  20510c:	d2800000 	mov	x0, #0x0                   	// #0
  205110:	f84107fe 	ldr	x30, [sp], #16
  205114:	d65f03c0 	ret

0000000000205118 <syscall_getsid>:
  205118:	f81f0ffe 	str	x30, [sp, #-16]!
  20511c:	528001e1 	mov	w1, #0xf                   	// #15
  205120:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205124:	911fc000 	add	x0, x0, #0x7f0
  205128:	97fffa34 	bl	2039f8 <syscall_trace>
  20512c:	d2800000 	mov	x0, #0x0                   	// #0
  205130:	f84107fe 	ldr	x30, [sp], #16
  205134:	d65f03c0 	ret

0000000000205138 <syscall_msync>:
  205138:	f81f0ffe 	str	x30, [sp, #-16]!
  20513c:	528001c1 	mov	w1, #0xe                   	// #14
  205140:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205144:	911f8000 	add	x0, x0, #0x7e0
  205148:	97fffa2c 	bl	2039f8 <syscall_trace>
  20514c:	d2800000 	mov	x0, #0x0                   	// #0
  205150:	f84107fe 	ldr	x30, [sp], #16
  205154:	d65f03c0 	ret

0000000000205158 <syscall_flock>:
  205158:	f81f0ffe 	str	x30, [sp, #-16]!
  20515c:	528001c1 	mov	w1, #0xe                   	// #14
  205160:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205164:	911f4000 	add	x0, x0, #0x7d0
  205168:	97fffa24 	bl	2039f8 <syscall_trace>
  20516c:	d2800000 	mov	x0, #0x0                   	// #0
  205170:	f84107fe 	ldr	x30, [sp], #16
  205174:	d65f03c0 	ret

0000000000205178 <syscall_setfsgid>:
  205178:	f81f0ffe 	str	x30, [sp, #-16]!
  20517c:	52800221 	mov	w1, #0x11                  	// #17
  205180:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205184:	911ee000 	add	x0, x0, #0x7b8
  205188:	97fffa1c 	bl	2039f8 <syscall_trace>
  20518c:	d2800000 	mov	x0, #0x0                   	// #0
  205190:	f84107fe 	ldr	x30, [sp], #16
  205194:	d65f03c0 	ret

0000000000205198 <syscall_setfsuid>:
  205198:	f81f0ffe 	str	x30, [sp, #-16]!
  20519c:	52800221 	mov	w1, #0x11                  	// #17
  2051a0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2051a4:	911e8000 	add	x0, x0, #0x7a0
  2051a8:	97fffa14 	bl	2039f8 <syscall_trace>
  2051ac:	d2800000 	mov	x0, #0x0                   	// #0
  2051b0:	f84107fe 	ldr	x30, [sp], #16
  2051b4:	d65f03c0 	ret

00000000002051b8 <syscall_personality>:
  2051b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2051bc:	52800281 	mov	w1, #0x14                  	// #20
  2051c0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2051c4:	911e2000 	add	x0, x0, #0x788
  2051c8:	97fffa0c 	bl	2039f8 <syscall_trace>
  2051cc:	d2800000 	mov	x0, #0x0                   	// #0
  2051d0:	f84107fe 	ldr	x30, [sp], #16
  2051d4:	d65f03c0 	ret

00000000002051d8 <syscall_sysfs>:
  2051d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2051dc:	528001c1 	mov	w1, #0xe                   	// #14
  2051e0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2051e4:	911de000 	add	x0, x0, #0x778
  2051e8:	97fffa04 	bl	2039f8 <syscall_trace>
  2051ec:	d2800000 	mov	x0, #0x0                   	// #0
  2051f0:	f84107fe 	ldr	x30, [sp], #16
  2051f4:	d65f03c0 	ret

00000000002051f8 <syscall_bdflush>:
  2051f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2051fc:	52800201 	mov	w1, #0x10                  	// #16
  205200:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205204:	911da000 	add	x0, x0, #0x768
  205208:	97fff9fc 	bl	2039f8 <syscall_trace>
  20520c:	d2800000 	mov	x0, #0x0                   	// #0
  205210:	f84107fe 	ldr	x30, [sp], #16
  205214:	d65f03c0 	ret

0000000000205218 <syscall_fchdir>:
  205218:	f81f0ffe 	str	x30, [sp, #-16]!
  20521c:	528001e1 	mov	w1, #0xf                   	// #15
  205220:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205224:	911d6000 	add	x0, x0, #0x758
  205228:	97fff9f4 	bl	2039f8 <syscall_trace>
  20522c:	d2800000 	mov	x0, #0x0                   	// #0
  205230:	f84107fe 	ldr	x30, [sp], #16
  205234:	d65f03c0 	ret

0000000000205238 <syscall_getpgid>:
  205238:	f81f0ffe 	str	x30, [sp, #-16]!
  20523c:	52800201 	mov	w1, #0x10                  	// #16
  205240:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205244:	911d2000 	add	x0, x0, #0x748
  205248:	97fff9ec 	bl	2039f8 <syscall_trace>
  20524c:	d2800000 	mov	x0, #0x0                   	// #0
  205250:	f84107fe 	ldr	x30, [sp], #16
  205254:	d65f03c0 	ret

0000000000205258 <syscall_quotactl>:
  205258:	f81f0ffe 	str	x30, [sp, #-16]!
  20525c:	52800221 	mov	w1, #0x11                  	// #17
  205260:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205264:	911cc000 	add	x0, x0, #0x730
  205268:	97fff9e4 	bl	2039f8 <syscall_trace>
  20526c:	d2800000 	mov	x0, #0x0                   	// #0
  205270:	f84107fe 	ldr	x30, [sp], #16
  205274:	d65f03c0 	ret

0000000000205278 <syscall_delete_module>:
  205278:	f81f0ffe 	str	x30, [sp, #-16]!
  20527c:	528002c1 	mov	w1, #0x16                  	// #22
  205280:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205284:	911c6000 	add	x0, x0, #0x718
  205288:	97fff9dc 	bl	2039f8 <syscall_trace>
  20528c:	d2800000 	mov	x0, #0x0                   	// #0
  205290:	f84107fe 	ldr	x30, [sp], #16
  205294:	d65f03c0 	ret

0000000000205298 <syscall_init_module>:
  205298:	f81f0ffe 	str	x30, [sp, #-16]!
  20529c:	52800281 	mov	w1, #0x14                  	// #20
  2052a0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2052a4:	911c0000 	add	x0, x0, #0x700
  2052a8:	97fff9d4 	bl	2039f8 <syscall_trace>
  2052ac:	d2800000 	mov	x0, #0x0                   	// #0
  2052b0:	f84107fe 	ldr	x30, [sp], #16
  2052b4:	d65f03c0 	ret

00000000002052b8 <syscall_mprotect>:
  2052b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2052bc:	52800221 	mov	w1, #0x11                  	// #17
  2052c0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2052c4:	911ba000 	add	x0, x0, #0x6e8
  2052c8:	97fff9cc 	bl	2039f8 <syscall_trace>
  2052cc:	d2800000 	mov	x0, #0x0                   	// #0
  2052d0:	f84107fe 	ldr	x30, [sp], #16
  2052d4:	d65f03c0 	ret

00000000002052d8 <syscall_adjtimex>:
  2052d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2052dc:	52800221 	mov	w1, #0x11                  	// #17
  2052e0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2052e4:	911b4000 	add	x0, x0, #0x6d0
  2052e8:	97fff9c4 	bl	2039f8 <syscall_trace>
  2052ec:	d2800000 	mov	x0, #0x0                   	// #0
  2052f0:	f84107fe 	ldr	x30, [sp], #16
  2052f4:	d65f03c0 	ret

00000000002052f8 <syscall_uname>:
  2052f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2052fc:	528001c1 	mov	w1, #0xe                   	// #14
  205300:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205304:	911b0000 	add	x0, x0, #0x6c0
  205308:	97fff9bc 	bl	2039f8 <syscall_trace>
  20530c:	d2800000 	mov	x0, #0x0                   	// #0
  205310:	f84107fe 	ldr	x30, [sp], #16
  205314:	d65f03c0 	ret

0000000000205318 <syscall_setdomainname>:
  205318:	f81f0ffe 	str	x30, [sp, #-16]!
  20531c:	528002c1 	mov	w1, #0x16                  	// #22
  205320:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205324:	911aa000 	add	x0, x0, #0x6a8
  205328:	97fff9b4 	bl	2039f8 <syscall_trace>
  20532c:	d2800000 	mov	x0, #0x0                   	// #0
  205330:	f84107fe 	ldr	x30, [sp], #16
  205334:	d65f03c0 	ret

0000000000205338 <syscall_clone>:
  205338:	f81f0ffe 	str	x30, [sp, #-16]!
  20533c:	528001c1 	mov	w1, #0xe                   	// #14
  205340:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205344:	911a6000 	add	x0, x0, #0x698
  205348:	97fff9ac 	bl	2039f8 <syscall_trace>
  20534c:	d2800000 	mov	x0, #0x0                   	// #0
  205350:	f84107fe 	ldr	x30, [sp], #16
  205354:	d65f03c0 	ret

0000000000205358 <syscall_sigreturn>:
  205358:	f81f0ffe 	str	x30, [sp, #-16]!
  20535c:	52800241 	mov	w1, #0x12                  	// #18
  205360:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205364:	911a0000 	add	x0, x0, #0x680
  205368:	97fff9a4 	bl	2039f8 <syscall_trace>
  20536c:	d2800000 	mov	x0, #0x0                   	// #0
  205370:	f84107fe 	ldr	x30, [sp], #16
  205374:	d65f03c0 	ret

0000000000205378 <syscall_sysinfo>:
  205378:	f81f0ffe 	str	x30, [sp, #-16]!
  20537c:	52800201 	mov	w1, #0x10                  	// #16
  205380:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205384:	9119c000 	add	x0, x0, #0x670
  205388:	97fff99c 	bl	2039f8 <syscall_trace>
  20538c:	d2800000 	mov	x0, #0x0                   	// #0
  205390:	f84107fe 	ldr	x30, [sp], #16
  205394:	d65f03c0 	ret

0000000000205398 <syscall_swapoff>:
  205398:	f81f0ffe 	str	x30, [sp, #-16]!
  20539c:	52800201 	mov	w1, #0x10                  	// #16
  2053a0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2053a4:	91198000 	add	x0, x0, #0x660
  2053a8:	97fff994 	bl	2039f8 <syscall_trace>
  2053ac:	d2800000 	mov	x0, #0x0                   	// #0
  2053b0:	f84107fe 	ldr	x30, [sp], #16
  2053b4:	d65f03c0 	ret

00000000002053b8 <syscall_wait4>:
  2053b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2053bc:	528001c1 	mov	w1, #0xe                   	// #14
  2053c0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2053c4:	91194000 	add	x0, x0, #0x650
  2053c8:	97fff98c 	bl	2039f8 <syscall_trace>
  2053cc:	d2800000 	mov	x0, #0x0                   	// #0
  2053d0:	f84107fe 	ldr	x30, [sp], #16
  2053d4:	d65f03c0 	ret

00000000002053d8 <syscall_vhangup>:
  2053d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2053dc:	52800201 	mov	w1, #0x10                  	// #16
  2053e0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2053e4:	91190000 	add	x0, x0, #0x640
  2053e8:	97fff984 	bl	2039f8 <syscall_trace>
  2053ec:	d2800000 	mov	x0, #0x0                   	// #0
  2053f0:	f84107fe 	ldr	x30, [sp], #16
  2053f4:	d65f03c0 	ret

00000000002053f8 <syscall_fstat>:
  2053f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2053fc:	528001c1 	mov	w1, #0xe                   	// #14
  205400:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205404:	9118c000 	add	x0, x0, #0x630
  205408:	97fff97c 	bl	2039f8 <syscall_trace>
  20540c:	d2800000 	mov	x0, #0x0                   	// #0
  205410:	f84107fe 	ldr	x30, [sp], #16
  205414:	d65f03c0 	ret

0000000000205418 <syscall_getitimer>:
  205418:	f81f0ffe 	str	x30, [sp, #-16]!
  20541c:	52800241 	mov	w1, #0x12                  	// #18
  205420:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205424:	91186000 	add	x0, x0, #0x618
  205428:	97fff974 	bl	2039f8 <syscall_trace>
  20542c:	d2800000 	mov	x0, #0x0                   	// #0
  205430:	f84107fe 	ldr	x30, [sp], #16
  205434:	d65f03c0 	ret

0000000000205438 <syscall_setitimer>:
  205438:	f81f0ffe 	str	x30, [sp, #-16]!
  20543c:	52800241 	mov	w1, #0x12                  	// #18
  205440:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205444:	91180000 	add	x0, x0, #0x600
  205448:	97fff96c 	bl	2039f8 <syscall_trace>
  20544c:	d2800000 	mov	x0, #0x0                   	// #0
  205450:	f84107fe 	ldr	x30, [sp], #16
  205454:	d65f03c0 	ret

0000000000205458 <syscall_syslog>:
  205458:	f81f0ffe 	str	x30, [sp, #-16]!
  20545c:	528001e1 	mov	w1, #0xf                   	// #15
  205460:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205464:	9117c000 	add	x0, x0, #0x5f0
  205468:	97fff964 	bl	2039f8 <syscall_trace>
  20546c:	d2800000 	mov	x0, #0x0                   	// #0
  205470:	f84107fe 	ldr	x30, [sp], #16
  205474:	d65f03c0 	ret

0000000000205478 <syscall_fstatfs>:
  205478:	f81f0ffe 	str	x30, [sp, #-16]!
  20547c:	52800201 	mov	w1, #0x10                  	// #16
  205480:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205484:	91178000 	add	x0, x0, #0x5e0
  205488:	97fff95c 	bl	2039f8 <syscall_trace>
  20548c:	d2800000 	mov	x0, #0x0                   	// #0
  205490:	f84107fe 	ldr	x30, [sp], #16
  205494:	d65f03c0 	ret

0000000000205498 <syscall_statfs>:
  205498:	f81f0ffe 	str	x30, [sp, #-16]!
  20549c:	528001e1 	mov	w1, #0xf                   	// #15
  2054a0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2054a4:	91174000 	add	x0, x0, #0x5d0
  2054a8:	97fff954 	bl	2039f8 <syscall_trace>
  2054ac:	d2800000 	mov	x0, #0x0                   	// #0
  2054b0:	f84107fe 	ldr	x30, [sp], #16
  2054b4:	d65f03c0 	ret

00000000002054b8 <syscall_setpriority>:
  2054b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2054bc:	52800281 	mov	w1, #0x14                  	// #20
  2054c0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2054c4:	9116e000 	add	x0, x0, #0x5b8
  2054c8:	97fff94c 	bl	2039f8 <syscall_trace>
  2054cc:	d2800000 	mov	x0, #0x0                   	// #0
  2054d0:	f84107fe 	ldr	x30, [sp], #16
  2054d4:	d65f03c0 	ret

00000000002054d8 <syscall_getpriority>:
  2054d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2054dc:	52800281 	mov	w1, #0x14                  	// #20
  2054e0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2054e4:	91168000 	add	x0, x0, #0x5a0
  2054e8:	97fff944 	bl	2039f8 <syscall_trace>
  2054ec:	d2800000 	mov	x0, #0x0                   	// #0
  2054f0:	f84107fe 	ldr	x30, [sp], #16
  2054f4:	d65f03c0 	ret

00000000002054f8 <syscall_fchown>:
  2054f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2054fc:	528001e1 	mov	w1, #0xf                   	// #15
  205500:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205504:	91164000 	add	x0, x0, #0x590
  205508:	97fff93c 	bl	2039f8 <syscall_trace>
  20550c:	d2800000 	mov	x0, #0x0                   	// #0
  205510:	f84107fe 	ldr	x30, [sp], #16
  205514:	d65f03c0 	ret

0000000000205518 <syscall_fchmod>:
  205518:	f81f0ffe 	str	x30, [sp, #-16]!
  20551c:	528001e1 	mov	w1, #0xf                   	// #15
  205520:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205524:	91160000 	add	x0, x0, #0x580
  205528:	97fff934 	bl	2039f8 <syscall_trace>
  20552c:	d2800000 	mov	x0, #0x0                   	// #0
  205530:	f84107fe 	ldr	x30, [sp], #16
  205534:	d65f03c0 	ret

0000000000205538 <syscall_ftruncate>:
  205538:	f81f0ffe 	str	x30, [sp, #-16]!
  20553c:	52800241 	mov	w1, #0x12                  	// #18
  205540:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205544:	9115a000 	add	x0, x0, #0x568
  205548:	97fff92c 	bl	2039f8 <syscall_trace>
  20554c:	d2800000 	mov	x0, #0x0                   	// #0
  205550:	f84107fe 	ldr	x30, [sp], #16
  205554:	d65f03c0 	ret

0000000000205558 <syscall_truncate>:
  205558:	f81f0ffe 	str	x30, [sp, #-16]!
  20555c:	52800221 	mov	w1, #0x11                  	// #17
  205560:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205564:	91154000 	add	x0, x0, #0x550
  205568:	97fff924 	bl	2039f8 <syscall_trace>
  20556c:	d2800000 	mov	x0, #0x0                   	// #0
  205570:	f84107fe 	ldr	x30, [sp], #16
  205574:	d65f03c0 	ret

0000000000205578 <syscall_reboot>:
  205578:	f81f0ffe 	str	x30, [sp, #-16]!
  20557c:	528001e1 	mov	w1, #0xf                   	// #15
  205580:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205584:	91150000 	add	x0, x0, #0x540
  205588:	97fff91c 	bl	2039f8 <syscall_trace>
  20558c:	d2800000 	mov	x0, #0x0                   	// #0
  205590:	f84107fe 	ldr	x30, [sp], #16
  205594:	d65f03c0 	ret

0000000000205598 <syscall_swapon>:
  205598:	f81f0ffe 	str	x30, [sp, #-16]!
  20559c:	528001e1 	mov	w1, #0xf                   	// #15
  2055a0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2055a4:	9114c000 	add	x0, x0, #0x530
  2055a8:	97fff914 	bl	2039f8 <syscall_trace>
  2055ac:	d2800000 	mov	x0, #0x0                   	// #0
  2055b0:	f84107fe 	ldr	x30, [sp], #16
  2055b4:	d65f03c0 	ret

00000000002055b8 <syscall_uselib>:
  2055b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2055bc:	528001e1 	mov	w1, #0xf                   	// #15
  2055c0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2055c4:	91148000 	add	x0, x0, #0x520
  2055c8:	97fff90c 	bl	2039f8 <syscall_trace>
  2055cc:	d2800000 	mov	x0, #0x0                   	// #0
  2055d0:	f84107fe 	ldr	x30, [sp], #16
  2055d4:	d65f03c0 	ret

00000000002055d8 <syscall_symlink>:
  2055d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2055dc:	52800201 	mov	w1, #0x10                  	// #16
  2055e0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2055e4:	91144000 	add	x0, x0, #0x510
  2055e8:	97fff904 	bl	2039f8 <syscall_trace>
  2055ec:	d2800000 	mov	x0, #0x0                   	// #0
  2055f0:	f84107fe 	ldr	x30, [sp], #16
  2055f4:	d65f03c0 	ret

00000000002055f8 <syscall_setgroups>:
  2055f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2055fc:	52800241 	mov	w1, #0x12                  	// #18
  205600:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205604:	9113e000 	add	x0, x0, #0x4f8
  205608:	97fff8fc 	bl	2039f8 <syscall_trace>
  20560c:	d2800000 	mov	x0, #0x0                   	// #0
  205610:	f84107fe 	ldr	x30, [sp], #16
  205614:	d65f03c0 	ret

0000000000205618 <syscall_getgroups>:
  205618:	f81f0ffe 	str	x30, [sp, #-16]!
  20561c:	52800241 	mov	w1, #0x12                  	// #18
  205620:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205624:	91138000 	add	x0, x0, #0x4e0
  205628:	97fff8f4 	bl	2039f8 <syscall_trace>
  20562c:	d2800000 	mov	x0, #0x0                   	// #0
  205630:	f84107fe 	ldr	x30, [sp], #16
  205634:	d65f03c0 	ret

0000000000205638 <syscall_settimeofday>:
  205638:	f81f0ffe 	str	x30, [sp, #-16]!
  20563c:	528002a1 	mov	w1, #0x15                  	// #21
  205640:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205644:	91132000 	add	x0, x0, #0x4c8
  205648:	97fff8ec 	bl	2039f8 <syscall_trace>
  20564c:	d2800000 	mov	x0, #0x0                   	// #0
  205650:	f84107fe 	ldr	x30, [sp], #16
  205654:	d65f03c0 	ret

0000000000205658 <syscall_gettimeofday>:
  205658:	f81f0ffe 	str	x30, [sp, #-16]!
  20565c:	528002a1 	mov	w1, #0x15                  	// #21
  205660:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205664:	9112c000 	add	x0, x0, #0x4b0
  205668:	97fff8e4 	bl	2039f8 <syscall_trace>
  20566c:	d2800000 	mov	x0, #0x0                   	// #0
  205670:	f84107fe 	ldr	x30, [sp], #16
  205674:	d65f03c0 	ret

0000000000205678 <syscall_getrusage>:
  205678:	f81f0ffe 	str	x30, [sp, #-16]!
  20567c:	52800241 	mov	w1, #0x12                  	// #18
  205680:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205684:	91126000 	add	x0, x0, #0x498
  205688:	97fff8dc 	bl	2039f8 <syscall_trace>
  20568c:	d2800000 	mov	x0, #0x0                   	// #0
  205690:	f84107fe 	ldr	x30, [sp], #16
  205694:	d65f03c0 	ret

0000000000205698 <syscall_sethostname>:
  205698:	f81f0ffe 	str	x30, [sp, #-16]!
  20569c:	52800281 	mov	w1, #0x14                  	// #20
  2056a0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2056a4:	91120000 	add	x0, x0, #0x480
  2056a8:	97fff8d4 	bl	2039f8 <syscall_trace>
  2056ac:	d2800000 	mov	x0, #0x0                   	// #0
  2056b0:	f84107fe 	ldr	x30, [sp], #16
  2056b4:	d65f03c0 	ret

00000000002056b8 <syscall_sigpending>:
  2056b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2056bc:	52800261 	mov	w1, #0x13                  	// #19
  2056c0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2056c4:	9111a000 	add	x0, x0, #0x468
  2056c8:	97fff8cc 	bl	2039f8 <syscall_trace>
  2056cc:	d2800000 	mov	x0, #0x0                   	// #0
  2056d0:	f84107fe 	ldr	x30, [sp], #16
  2056d4:	d65f03c0 	ret

00000000002056d8 <syscall_sigsuspend>:
  2056d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2056dc:	52800261 	mov	w1, #0x13                  	// #19
  2056e0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2056e4:	91114000 	add	x0, x0, #0x450
  2056e8:	97fff8c4 	bl	2039f8 <syscall_trace>
  2056ec:	d2800000 	mov	x0, #0x0                   	// #0
  2056f0:	f84107fe 	ldr	x30, [sp], #16
  2056f4:	d65f03c0 	ret

00000000002056f8 <syscall_setregid>:
  2056f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2056fc:	52800221 	mov	w1, #0x11                  	// #17
  205700:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205704:	9110e000 	add	x0, x0, #0x438
  205708:	97fff8bc 	bl	2039f8 <syscall_trace>
  20570c:	d2800000 	mov	x0, #0x0                   	// #0
  205710:	f84107fe 	ldr	x30, [sp], #16
  205714:	d65f03c0 	ret

0000000000205718 <syscall_setreuid>:
  205718:	f81f0ffe 	str	x30, [sp, #-16]!
  20571c:	52800221 	mov	w1, #0x11                  	// #17
  205720:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205724:	91108000 	add	x0, x0, #0x420
  205728:	97fff8b4 	bl	2039f8 <syscall_trace>
  20572c:	d2800000 	mov	x0, #0x0                   	// #0
  205730:	f84107fe 	ldr	x30, [sp], #16
  205734:	d65f03c0 	ret

0000000000205738 <syscall_getpgrp>:
  205738:	f81f0ffe 	str	x30, [sp, #-16]!
  20573c:	52800201 	mov	w1, #0x10                  	// #16
  205740:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205744:	91104000 	add	x0, x0, #0x410
  205748:	97fff8ac 	bl	2039f8 <syscall_trace>
  20574c:	d2800000 	mov	x0, #0x0                   	// #0
  205750:	f84107fe 	ldr	x30, [sp], #16
  205754:	d65f03c0 	ret

0000000000205758 <syscall_getppid>:
  205758:	f81f0ffe 	str	x30, [sp, #-16]!
  20575c:	52800201 	mov	w1, #0x10                  	// #16
  205760:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205764:	91100000 	add	x0, x0, #0x400
  205768:	97fff8a4 	bl	2039f8 <syscall_trace>
  20576c:	d2800000 	mov	x0, #0x0                   	// #0
  205770:	f84107fe 	ldr	x30, [sp], #16
  205774:	d65f03c0 	ret

0000000000205778 <syscall_ustat>:
  205778:	f81f0ffe 	str	x30, [sp, #-16]!
  20577c:	528001c1 	mov	w1, #0xe                   	// #14
  205780:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205784:	910fc000 	add	x0, x0, #0x3f0
  205788:	97fff89c 	bl	2039f8 <syscall_trace>
  20578c:	d2800000 	mov	x0, #0x0                   	// #0
  205790:	f84107fe 	ldr	x30, [sp], #16
  205794:	d65f03c0 	ret

0000000000205798 <syscall_chroot>:
  205798:	f81f0ffe 	str	x30, [sp, #-16]!
  20579c:	528001e1 	mov	w1, #0xf                   	// #15
  2057a0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2057a4:	910f8000 	add	x0, x0, #0x3e0
  2057a8:	97fff894 	bl	2039f8 <syscall_trace>
  2057ac:	d2800000 	mov	x0, #0x0                   	// #0
  2057b0:	f84107fe 	ldr	x30, [sp], #16
  2057b4:	d65f03c0 	ret

00000000002057b8 <syscall_umask>:
  2057b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2057bc:	528001c1 	mov	w1, #0xe                   	// #14
  2057c0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2057c4:	910f4000 	add	x0, x0, #0x3d0
  2057c8:	97fff88c 	bl	2039f8 <syscall_trace>
  2057cc:	d2800000 	mov	x0, #0x0                   	// #0
  2057d0:	f84107fe 	ldr	x30, [sp], #16
  2057d4:	d65f03c0 	ret

00000000002057d8 <syscall_setpgid>:
  2057d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2057dc:	52800201 	mov	w1, #0x10                  	// #16
  2057e0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2057e4:	910f0000 	add	x0, x0, #0x3c0
  2057e8:	97fff884 	bl	2039f8 <syscall_trace>
  2057ec:	d2800000 	mov	x0, #0x0                   	// #0
  2057f0:	f84107fe 	ldr	x30, [sp], #16
  2057f4:	d65f03c0 	ret

00000000002057f8 <syscall_umount2>:
  2057f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2057fc:	52800201 	mov	w1, #0x10                  	// #16
  205800:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205804:	910ec000 	add	x0, x0, #0x3b0
  205808:	97fff87c 	bl	2039f8 <syscall_trace>
  20580c:	d2800000 	mov	x0, #0x0                   	// #0
  205810:	f84107fe 	ldr	x30, [sp], #16
  205814:	d65f03c0 	ret

0000000000205818 <syscall_acct>:
  205818:	f81f0ffe 	str	x30, [sp, #-16]!
  20581c:	528001a1 	mov	w1, #0xd                   	// #13
  205820:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205824:	910e8000 	add	x0, x0, #0x3a0
  205828:	97fff874 	bl	2039f8 <syscall_trace>
  20582c:	d2800000 	mov	x0, #0x0                   	// #0
  205830:	f84107fe 	ldr	x30, [sp], #16
  205834:	d65f03c0 	ret

0000000000205838 <syscall_getegid>:
  205838:	f81f0ffe 	str	x30, [sp, #-16]!
  20583c:	52800201 	mov	w1, #0x10                  	// #16
  205840:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205844:	910e4000 	add	x0, x0, #0x390
  205848:	97fff86c 	bl	2039f8 <syscall_trace>
  20584c:	d2800000 	mov	x0, #0x0                   	// #0
  205850:	f84107fe 	ldr	x30, [sp], #16
  205854:	d65f03c0 	ret

0000000000205858 <syscall_geteuid>:
  205858:	f81f0ffe 	str	x30, [sp, #-16]!
  20585c:	52800201 	mov	w1, #0x10                  	// #16
  205860:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205864:	910e0000 	add	x0, x0, #0x380
  205868:	97fff864 	bl	2039f8 <syscall_trace>
  20586c:	d2800000 	mov	x0, #0x0                   	// #0
  205870:	f84107fe 	ldr	x30, [sp], #16
  205874:	d65f03c0 	ret

0000000000205878 <syscall_getgid>:
  205878:	f81f0ffe 	str	x30, [sp, #-16]!
  20587c:	528001e1 	mov	w1, #0xf                   	// #15
  205880:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205884:	910dc000 	add	x0, x0, #0x370
  205888:	97fff85c 	bl	2039f8 <syscall_trace>
  20588c:	d2800000 	mov	x0, #0x0                   	// #0
  205890:	f84107fe 	ldr	x30, [sp], #16
  205894:	d65f03c0 	ret

0000000000205898 <syscall_setgid>:
  205898:	f81f0ffe 	str	x30, [sp, #-16]!
  20589c:	528001e1 	mov	w1, #0xf                   	// #15
  2058a0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2058a4:	910d8000 	add	x0, x0, #0x360
  2058a8:	97fff854 	bl	2039f8 <syscall_trace>
  2058ac:	d2800000 	mov	x0, #0x0                   	// #0
  2058b0:	f84107fe 	ldr	x30, [sp], #16
  2058b4:	d65f03c0 	ret

00000000002058b8 <syscall_times>:
  2058b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2058bc:	528001c1 	mov	w1, #0xe                   	// #14
  2058c0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2058c4:	910d4000 	add	x0, x0, #0x350
  2058c8:	97fff84c 	bl	2039f8 <syscall_trace>
  2058cc:	d2800000 	mov	x0, #0x0                   	// #0
  2058d0:	f84107fe 	ldr	x30, [sp], #16
  2058d4:	d65f03c0 	ret

00000000002058d8 <syscall_sync>:
  2058d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2058dc:	528001a1 	mov	w1, #0xd                   	// #13
  2058e0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2058e4:	910d0000 	add	x0, x0, #0x340
  2058e8:	97fff844 	bl	2039f8 <syscall_trace>
  2058ec:	d2800000 	mov	x0, #0x0                   	// #0
  2058f0:	f84107fe 	ldr	x30, [sp], #16
  2058f4:	d65f03c0 	ret

00000000002058f8 <syscall_nice>:
  2058f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2058fc:	528001a1 	mov	w1, #0xd                   	// #13
  205900:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205904:	910cc000 	add	x0, x0, #0x330
  205908:	97fff83c 	bl	2039f8 <syscall_trace>
  20590c:	d2800000 	mov	x0, #0x0                   	// #0
  205910:	f84107fe 	ldr	x30, [sp], #16
  205914:	d65f03c0 	ret

0000000000205918 <syscall_pause>:
  205918:	f81f0ffe 	str	x30, [sp, #-16]!
  20591c:	528001c1 	mov	w1, #0xe                   	// #14
  205920:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205924:	910c8000 	add	x0, x0, #0x320
  205928:	97fff834 	bl	2039f8 <syscall_trace>
  20592c:	d2800000 	mov	x0, #0x0                   	// #0
  205930:	f84107fe 	ldr	x30, [sp], #16
  205934:	d65f03c0 	ret

0000000000205938 <syscall_ptrace>:
  205938:	f81f0ffe 	str	x30, [sp, #-16]!
  20593c:	528001e1 	mov	w1, #0xf                   	// #15
  205940:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205944:	910c4000 	add	x0, x0, #0x310
  205948:	97fff82c 	bl	2039f8 <syscall_trace>
  20594c:	d2800000 	mov	x0, #0x0                   	// #0
  205950:	f84107fe 	ldr	x30, [sp], #16
  205954:	d65f03c0 	ret

0000000000205958 <syscall_getuid>:
  205958:	f81f0ffe 	str	x30, [sp, #-16]!
  20595c:	528001e1 	mov	w1, #0xf                   	// #15
  205960:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205964:	910c0000 	add	x0, x0, #0x300
  205968:	97fff824 	bl	2039f8 <syscall_trace>
  20596c:	d2800000 	mov	x0, #0x0                   	// #0
  205970:	f84107fe 	ldr	x30, [sp], #16
  205974:	d65f03c0 	ret

0000000000205978 <syscall_setuid>:
  205978:	f81f0ffe 	str	x30, [sp, #-16]!
  20597c:	528001e1 	mov	w1, #0xf                   	// #15
  205980:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205984:	910bc000 	add	x0, x0, #0x2f0
  205988:	97fff81c 	bl	2039f8 <syscall_trace>
  20598c:	d2800000 	mov	x0, #0x0                   	// #0
  205990:	f84107fe 	ldr	x30, [sp], #16
  205994:	d65f03c0 	ret

0000000000205998 <syscall_mount>:
  205998:	f81f0ffe 	str	x30, [sp, #-16]!
  20599c:	528001c1 	mov	w1, #0xe                   	// #14
  2059a0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2059a4:	910b8000 	add	x0, x0, #0x2e0
  2059a8:	97fff814 	bl	2039f8 <syscall_trace>
  2059ac:	d2800000 	mov	x0, #0x0                   	// #0
  2059b0:	f84107fe 	ldr	x30, [sp], #16
  2059b4:	d65f03c0 	ret

00000000002059b8 <syscall_lchown>:
  2059b8:	f81f0ffe 	str	x30, [sp, #-16]!
  2059bc:	528001e1 	mov	w1, #0xf                   	// #15
  2059c0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2059c4:	910b4000 	add	x0, x0, #0x2d0
  2059c8:	97fff80c 	bl	2039f8 <syscall_trace>
  2059cc:	d2800000 	mov	x0, #0x0                   	// #0
  2059d0:	f84107fe 	ldr	x30, [sp], #16
  2059d4:	d65f03c0 	ret

00000000002059d8 <syscall_chmod>:
  2059d8:	f81f0ffe 	str	x30, [sp, #-16]!
  2059dc:	528001c1 	mov	w1, #0xe                   	// #14
  2059e0:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  2059e4:	910b0000 	add	x0, x0, #0x2c0
  2059e8:	97fff804 	bl	2039f8 <syscall_trace>
  2059ec:	d2800000 	mov	x0, #0x0                   	// #0
  2059f0:	f84107fe 	ldr	x30, [sp], #16
  2059f4:	d65f03c0 	ret

00000000002059f8 <syscall_mknod>:
  2059f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2059fc:	528001c1 	mov	w1, #0xe                   	// #14
  205a00:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205a04:	910ac000 	add	x0, x0, #0x2b0
  205a08:	97fff7fc 	bl	2039f8 <syscall_trace>
  205a0c:	d2800000 	mov	x0, #0x0                   	// #0
  205a10:	f84107fe 	ldr	x30, [sp], #16
  205a14:	d65f03c0 	ret

0000000000205a18 <syscall_link>:
  205a18:	f81f0ffe 	str	x30, [sp, #-16]!
  205a1c:	528001a1 	mov	w1, #0xd                   	// #13
  205a20:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205a24:	910a8000 	add	x0, x0, #0x2a0
  205a28:	97fff7f4 	bl	2039f8 <syscall_trace>
  205a2c:	d2800000 	mov	x0, #0x0                   	// #0
  205a30:	f84107fe 	ldr	x30, [sp], #16
  205a34:	d65f03c0 	ret

0000000000205a38 <syscall_creat>:
  205a38:	f81f0ffe 	str	x30, [sp, #-16]!
  205a3c:	528001c1 	mov	w1, #0xe                   	// #14
  205a40:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205a44:	910a4000 	add	x0, x0, #0x290
  205a48:	97fff7ec 	bl	2039f8 <syscall_trace>
  205a4c:	d2800000 	mov	x0, #0x0                   	// #0
  205a50:	f84107fe 	ldr	x30, [sp], #16
  205a54:	d65f03c0 	ret

0000000000205a58 <syscall_restart_syscall>:
  205a58:	f81f0ffe 	str	x30, [sp, #-16]!
  205a5c:	52800301 	mov	w1, #0x18                  	// #24
  205a60:	b0000060 	adrp	x0, 212000 <errmsg+0x4b8>
  205a64:	9109e000 	add	x0, x0, #0x278
  205a68:	97fff7e4 	bl	2039f8 <syscall_trace>
  205a6c:	d2800000 	mov	x0, #0x0                   	// #0
  205a70:	f84107fe 	ldr	x30, [sp], #16
  205a74:	d65f03c0 	ret

0000000000205a78 <syscall_listen>:
  205a78:	93407c22 	sxtw	x2, w1
  205a7c:	93407c01 	sxtw	x1, w0
  205a80:	d28009a0 	mov	x0, #0x4d                  	// #77
  205a84:	17fff786 	b	20389c <syscall>

0000000000205a88 <syscall_mq_notify>:
  205a88:	aa0103e2 	mov	x2, x1
  205a8c:	93407c01 	sxtw	x1, w0
  205a90:	d28014c0 	mov	x0, #0xa6                  	// #166
  205a94:	17fff782 	b	20389c <syscall>

0000000000205a98 <syscall_clock_getres>:
  205a98:	aa0103e2 	mov	x2, x1
  205a9c:	93407c01 	sxtw	x1, w0
  205aa0:	d2801020 	mov	x0, #0x81                  	// #129
  205aa4:	17fff77e 	b	20389c <syscall>

0000000000205aa8 <syscall_clock_gettime>:
  205aa8:	aa0103e2 	mov	x2, x1
  205aac:	93407c01 	sxtw	x1, w0
  205ab0:	d2801000 	mov	x0, #0x80                  	// #128
  205ab4:	17fff77a 	b	20389c <syscall>

0000000000205ab8 <syscall_clock_settime>:
  205ab8:	aa0103e2 	mov	x2, x1
  205abc:	93407c01 	sxtw	x1, w0
  205ac0:	d2800fe0 	mov	x0, #0x7f                  	// #127
  205ac4:	17fff776 	b	20389c <syscall>

0000000000205ac8 <syscall_timer_gettime>:
  205ac8:	aa0103e2 	mov	x2, x1
  205acc:	aa0003e1 	mov	x1, x0
  205ad0:	d2801400 	mov	x0, #0xa0                  	// #160
  205ad4:	17fff772 	b	20389c <syscall>

0000000000205ad8 <syscall_tkill>:
  205ad8:	f81f0ffe 	str	x30, [sp, #-16]!
  205adc:	93407c22 	sxtw	x2, w1
  205ae0:	93407c01 	sxtw	x1, w0
  205ae4:	d2800d20 	mov	x0, #0x69                  	// #105
  205ae8:	97fff76d 	bl	20389c <syscall>
  205aec:	93407c00 	sxtw	x0, w0
  205af0:	f84107fe 	ldr	x30, [sp], #16
  205af4:	d65f03c0 	ret

0000000000205af8 <syscall_fstat64>:
  205af8:	aa0103e2 	mov	x2, x1
  205afc:	93407c01 	sxtw	x1, w0
  205b00:	d2800100 	mov	x0, #0x8                   	// #8
  205b04:	17fff766 	b	20389c <syscall>

0000000000205b08 <syscall_ugetrlimit>:
  205b08:	aa0103e2 	mov	x2, x1
  205b0c:	2a0003e1 	mov	w1, w0
  205b10:	d28011a0 	mov	x0, #0x8d                  	// #141
  205b14:	17fff762 	b	20389c <syscall>

0000000000205b18 <syscall_getcwd>:
  205b18:	aa0103e2 	mov	x2, x1
  205b1c:	aa0003e1 	mov	x1, x0
  205b20:	d2800e80 	mov	x0, #0x74                  	// #116
  205b24:	17fff75e 	b	20389c <syscall>

0000000000205b28 <syscall_nanosleep>:
  205b28:	aa0103e2 	mov	x2, x1
  205b2c:	aa0003e1 	mov	x1, x0
  205b30:	d2800140 	mov	x0, #0xa                   	// #10
  205b34:	17fff75a 	b	20389c <syscall>

0000000000205b38 <syscall_sched_getparam>:
  205b38:	aa0103e2 	mov	x2, x1
  205b3c:	93407c01 	sxtw	x1, w0
  205b40:	d28012a0 	mov	x0, #0x95                  	// #149
  205b44:	17fff756 	b	20389c <syscall>

0000000000205b48 <syscall_sched_setparam>:
  205b48:	aa0103e2 	mov	x2, x1
  205b4c:	93407c01 	sxtw	x1, w0
  205b50:	d2801280 	mov	x0, #0x94                  	// #148
  205b54:	17fff752 	b	20389c <syscall>

0000000000205b58 <syscall_stat>:
  205b58:	aa0103e2 	mov	x2, x1
  205b5c:	aa0003e1 	mov	x1, x0
  205b60:	d2800860 	mov	x0, #0x43                  	// #67
  205b64:	17fff74e 	b	20389c <syscall>

0000000000205b68 <syscall_lstat>:
  205b68:	17fffffc 	b	205b58 <syscall_stat>
  205b6c:	00000000 	.inst	0x00000000 ; undefined

0000000000205b70 <syscall_stat64>:
  205b70:	17fffffa 	b	205b58 <syscall_stat>
  205b74:	00000000 	.inst	0x00000000 ; undefined

0000000000205b78 <syscall_lstat64>:
  205b78:	17fffff8 	b	205b58 <syscall_stat>
  205b7c:	00000000 	.inst	0x00000000 ; undefined

0000000000205b80 <syscall_munmap>:
  205b80:	aa0103e2 	mov	x2, x1
  205b84:	aa0003e1 	mov	x1, x0
  205b88:	d28006c0 	mov	x0, #0x36                  	// #54
  205b8c:	17fff744 	b	20389c <syscall>

0000000000205b90 <syscall_setrlimit>:
  205b90:	aa0103e2 	mov	x2, x1
  205b94:	93407c01 	sxtw	x1, w0
  205b98:	d28011c0 	mov	x0, #0x8e                  	// #142
  205b9c:	17fff740 	b	20389c <syscall>

0000000000205ba0 <syscall_dup2>:
  205ba0:	93407c22 	sxtw	x2, w1
  205ba4:	93407c01 	sxtw	x1, w0
  205ba8:	d28010c0 	mov	x0, #0x86                  	// #134
  205bac:	17fff73c 	b	20389c <syscall>

0000000000205bb0 <syscall_mkdir>:
  205bb0:	2a0103e2 	mov	w2, w1
  205bb4:	aa0003e1 	mov	x1, x0
  205bb8:	d2800ee0 	mov	x0, #0x77                  	// #119
  205bbc:	17fff738 	b	20389c <syscall>

0000000000205bc0 <syscall_rename>:
  205bc0:	aa0103e2 	mov	x2, x1
  205bc4:	aa0003e1 	mov	x1, x0
  205bc8:	d28010e0 	mov	x0, #0x87                  	// #135
  205bcc:	17fff734 	b	20389c <syscall>

0000000000205bd0 <syscall_kill>:
  205bd0:	93407c22 	sxtw	x2, w1
  205bd4:	93407c01 	sxtw	x1, w0
  205bd8:	d28001c0 	mov	x0, #0xe                   	// #14
  205bdc:	17fff730 	b	20389c <syscall>

0000000000205be0 <syscall_access>:
  205be0:	93407c22 	sxtw	x2, w1
  205be4:	aa0003e1 	mov	x1, x0
  205be8:	d2800fa0 	mov	x0, #0x7d                  	// #125
  205bec:	17fff72c 	b	20389c <syscall>

0000000000205bf0 <syscall_getrandom>:
  205bf0:	2a0203e3 	mov	w3, w2
  205bf4:	aa0103e2 	mov	x2, x1
  205bf8:	aa0003e1 	mov	x1, x0
  205bfc:	d2801200 	mov	x0, #0x90                  	// #144
  205c00:	17fff727 	b	20389c <syscall>
  205c04:	00000000 	.inst	0x00000000 ; undefined

0000000000205c08 <syscall_shmctl>:
  205c08:	aa0203e3 	mov	x3, x2
  205c0c:	93407c22 	sxtw	x2, w1
  205c10:	93407c01 	sxtw	x1, w0
  205c14:	d2802680 	mov	x0, #0x134                 	// #308
  205c18:	17fff721 	b	20389c <syscall>
  205c1c:	00000000 	.inst	0x00000000 ; undefined

0000000000205c20 <syscall_shmget>:
  205c20:	93407c43 	sxtw	x3, w2
  205c24:	aa0103e2 	mov	x2, x1
  205c28:	93407c01 	sxtw	x1, w0
  205c2c:	d2802660 	mov	x0, #0x133                 	// #307
  205c30:	17fff71b 	b	20389c <syscall>
  205c34:	00000000 	.inst	0x00000000 ; undefined

0000000000205c38 <syscall_shmat>:
  205c38:	93407c43 	sxtw	x3, w2
  205c3c:	aa0103e2 	mov	x2, x1
  205c40:	93407c01 	sxtw	x1, w0
  205c44:	d2802620 	mov	x0, #0x131                 	// #305
  205c48:	17fff715 	b	20389c <syscall>
  205c4c:	00000000 	.inst	0x00000000 ; undefined

0000000000205c50 <syscall_getpeername>:
  205c50:	aa0203e3 	mov	x3, x2
  205c54:	aa0103e2 	mov	x2, x1
  205c58:	93407c01 	sxtw	x1, w0
  205c5c:	d2800900 	mov	x0, #0x48                  	// #72
  205c60:	17fff70f 	b	20389c <syscall>
  205c64:	00000000 	.inst	0x00000000 ; undefined

0000000000205c68 <syscall_getsockname>:
  205c68:	aa0203e3 	mov	x3, x2
  205c6c:	aa0103e2 	mov	x2, x1
  205c70:	93407c01 	sxtw	x1, w0
  205c74:	d2800920 	mov	x0, #0x49                  	// #73
  205c78:	17fff709 	b	20389c <syscall>
  205c7c:	00000000 	.inst	0x00000000 ; undefined

0000000000205c80 <syscall_accept>:
  205c80:	aa0203e3 	mov	x3, x2
  205c84:	aa0103e2 	mov	x2, x1
  205c88:	93407c01 	sxtw	x1, w0
  205c8c:	d28008a0 	mov	x0, #0x45                  	// #69
  205c90:	17fff703 	b	20389c <syscall>
  205c94:	00000000 	.inst	0x00000000 ; undefined

0000000000205c98 <syscall_connect>:
  205c98:	2a0203e3 	mov	w3, w2
  205c9c:	aa0103e2 	mov	x2, x1
  205ca0:	93407c01 	sxtw	x1, w0
  205ca4:	d2800980 	mov	x0, #0x4c                  	// #76
  205ca8:	17fff6fd 	b	20389c <syscall>
  205cac:	00000000 	.inst	0x00000000 ; undefined

0000000000205cb0 <syscall_bind>:
  205cb0:	2a0203e3 	mov	w3, w2
  205cb4:	aa0103e2 	mov	x2, x1
  205cb8:	93407c01 	sxtw	x1, w0
  205cbc:	d28008c0 	mov	x0, #0x46                  	// #70
  205cc0:	17fff6f7 	b	20389c <syscall>
  205cc4:	00000000 	.inst	0x00000000 ; undefined

0000000000205cc8 <syscall_socket>:
  205cc8:	93407c43 	sxtw	x3, w2
  205ccc:	93407c22 	sxtw	x2, w1
  205cd0:	93407c01 	sxtw	x1, w0
  205cd4:	d2800a40 	mov	x0, #0x52                  	// #82
  205cd8:	17fff6f1 	b	20389c <syscall>
  205cdc:	00000000 	.inst	0x00000000 ; undefined

0000000000205ce0 <syscall_mq_getsetattr>:
  205ce0:	aa0203e3 	mov	x3, x2
  205ce4:	aa0103e2 	mov	x2, x1
  205ce8:	93407c01 	sxtw	x1, w0
  205cec:	d28014e0 	mov	x0, #0xa7                  	// #167
  205cf0:	17fff6eb 	b	20389c <syscall>
  205cf4:	00000000 	.inst	0x00000000 ; undefined

0000000000205cf8 <syscall_timer_create>:
  205cf8:	aa0203e3 	mov	x3, x2
  205cfc:	aa0103e2 	mov	x2, x1
  205d00:	93407c01 	sxtw	x1, w0
  205d04:	d28013a0 	mov	x0, #0x9d                  	// #157
  205d08:	17fff6e5 	b	20389c <syscall>
  205d0c:	00000000 	.inst	0x00000000 ; undefined

0000000000205d10 <syscall_sched_setaffinity>:
  205d10:	f81f0ffe 	str	x30, [sp, #-16]!
  205d14:	aa0203e3 	mov	x3, x2
  205d18:	aa0103e2 	mov	x2, x1
  205d1c:	93407c01 	sxtw	x1, w0
  205d20:	d2801340 	mov	x0, #0x9a                  	// #154
  205d24:	97fff6de 	bl	20389c <syscall>
  205d28:	f84107fe 	ldr	x30, [sp], #16
  205d2c:	93407c00 	sxtw	x0, w0
  205d30:	d65f03c0 	ret
  205d34:	00000000 	.inst	0x00000000 ; undefined

0000000000205d38 <syscall_madvise>:
  205d38:	93407c43 	sxtw	x3, w2
  205d3c:	aa0103e2 	mov	x2, x1
  205d40:	aa0003e1 	mov	x1, x0
  205d44:	d2801260 	mov	x0, #0x93                  	// #147
  205d48:	17fff6d5 	b	20389c <syscall>
  205d4c:	00000000 	.inst	0x00000000 ; undefined

0000000000205d50 <syscall_poll>:
  205d50:	93407c43 	sxtw	x3, w2
  205d54:	aa0103e2 	mov	x2, x1
  205d58:	aa0003e1 	mov	x1, x0
  205d5c:	d2800120 	mov	x0, #0x9                   	// #9
  205d60:	17fff6cf 	b	20389c <syscall>
  205d64:	00000000 	.inst	0x00000000 ; undefined

0000000000205d68 <syscall_sched_getscheduler>:
  205d68:	aa0203e3 	mov	x3, x2
  205d6c:	aa0103e2 	mov	x2, x1
  205d70:	93407c01 	sxtw	x1, w0
  205d74:	d2801320 	mov	x0, #0x99                  	// #153
  205d78:	17fff6c9 	b	20389c <syscall>
  205d7c:	00000000 	.inst	0x00000000 ; undefined

0000000000205d80 <syscall_sched_setscheduler>:
  205d80:	aa0203e3 	mov	x3, x2
  205d84:	93407c22 	sxtw	x2, w1
  205d88:	93407c01 	sxtw	x1, w0
  205d8c:	d2801300 	mov	x0, #0x98                  	// #152
  205d90:	17fff6c3 	b	20389c <syscall>
  205d94:	00000000 	.inst	0x00000000 ; undefined

0000000000205d98 <syscall_writev>:
  205d98:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  205d9c:	a9015bf5 	stp	x21, x22, [sp, #16]
  205da0:	93407c55 	sxtw	x21, w2
  205da4:	f90017fe 	str	x30, [sp, #40]
  205da8:	f10002bf 	cmp	x21, #0x0
  205dac:	5400050d 	b.le	205e4c <syscall_writev+0xb4>
  205db0:	f90013f7 	str	x23, [sp, #32]
  205db4:	aa0103f3 	mov	x19, x1
  205db8:	d2800016 	mov	x22, #0x0                   	// #0
  205dbc:	d2800014 	mov	x20, #0x0                   	// #0
  205dc0:	93407c17 	sxtw	x23, w0
  205dc4:	14000005 	b	205dd8 <syscall_writev+0x40>
  205dc8:	91000694 	add	x20, x20, #0x1
  205dcc:	91004273 	add	x19, x19, #0x10
  205dd0:	eb15029f 	cmp	x20, x21
  205dd4:	540001e0 	b.eq	205e10 <syscall_writev+0x78>  // b.none
  205dd8:	f9400663 	ldr	x3, [x19, #8]
  205ddc:	b4ffff63 	cbz	x3, 205dc8 <syscall_writev+0x30>
  205de0:	f9400262 	ldr	x2, [x19]
  205de4:	aa1703e1 	mov	x1, x23
  205de8:	d2800060 	mov	x0, #0x3                   	// #3
  205dec:	97fff6ac 	bl	20389c <syscall>
  205df0:	93407c01 	sxtw	x1, w0
  205df4:	7100001f 	cmp	w0, #0x0
  205df8:	5400018d 	b.le	205e28 <syscall_writev+0x90>
  205dfc:	91000694 	add	x20, x20, #0x1
  205e00:	8b20c2d6 	add	x22, x22, w0, sxtw
  205e04:	91004273 	add	x19, x19, #0x10
  205e08:	eb15029f 	cmp	x20, x21
  205e0c:	54fffe61 	b.ne	205dd8 <syscall_writev+0x40>  // b.any
  205e10:	f94013f7 	ldr	x23, [sp, #32]
  205e14:	aa1603e0 	mov	x0, x22
  205e18:	f94017fe 	ldr	x30, [sp, #40]
  205e1c:	a9415bf5 	ldp	x21, x22, [sp, #16]
  205e20:	a8c353f3 	ldp	x19, x20, [sp], #48
  205e24:	d65f03c0 	ret
  205e28:	7100003f 	cmp	w1, #0x0
  205e2c:	f94013f7 	ldr	x23, [sp, #32]
  205e30:	fa401ac0 	ccmp	x22, #0x0, #0x0, ne  // ne = any
  205e34:	f94017fe 	ldr	x30, [sp, #40]
  205e38:	9a960036 	csel	x22, x1, x22, eq  // eq = none
  205e3c:	aa1603e0 	mov	x0, x22
  205e40:	a9415bf5 	ldp	x21, x22, [sp, #16]
  205e44:	a8c353f3 	ldp	x19, x20, [sp], #48
  205e48:	d65f03c0 	ret
  205e4c:	d2800016 	mov	x22, #0x0                   	// #0
  205e50:	17fffff1 	b	205e14 <syscall_writev+0x7c>
  205e54:	00000000 	.inst	0x00000000 ; undefined

0000000000205e58 <syscall_readv>:
  205e58:	7100005f 	cmp	w2, #0x0
  205e5c:	5400050d 	b.le	205efc <syscall_readv+0xa4>
  205e60:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  205e64:	51000454 	sub	w20, w2, #0x1
  205e68:	91000694 	add	x20, x20, #0x1
  205e6c:	aa0103f3 	mov	x19, x1
  205e70:	a9015bf5 	stp	x21, x22, [sp, #16]
  205e74:	8b141034 	add	x20, x1, x20, lsl #4
  205e78:	93407c16 	sxtw	x22, w0
  205e7c:	52800015 	mov	w21, #0x0                   	// #0
  205e80:	f90013fe 	str	x30, [sp, #32]
  205e84:	14000004 	b	205e94 <syscall_readv+0x3c>
  205e88:	91004273 	add	x19, x19, #0x10
  205e8c:	eb14027f 	cmp	x19, x20
  205e90:	540001a0 	b.eq	205ec4 <syscall_readv+0x6c>  // b.none
  205e94:	f9400663 	ldr	x3, [x19, #8]
  205e98:	b4ffff83 	cbz	x3, 205e88 <syscall_readv+0x30>
  205e9c:	f9400262 	ldr	x2, [x19]
  205ea0:	aa1603e1 	mov	x1, x22
  205ea4:	d2800040 	mov	x0, #0x2                   	// #2
  205ea8:	97fff67d 	bl	20389c <syscall>
  205eac:	7100001f 	cmp	w0, #0x0
  205eb0:	5400014d 	b.le	205ed8 <syscall_readv+0x80>
  205eb4:	91004273 	add	x19, x19, #0x10
  205eb8:	0b0002b5 	add	w21, w21, w0
  205ebc:	eb14027f 	cmp	x19, x20
  205ec0:	54fffea1 	b.ne	205e94 <syscall_readv+0x3c>  // b.any
  205ec4:	93407ea0 	sxtw	x0, w21
  205ec8:	f94013fe 	ldr	x30, [sp, #32]
  205ecc:	a9415bf5 	ldp	x21, x22, [sp, #16]
  205ed0:	a8c353f3 	ldp	x19, x20, [sp], #48
  205ed4:	d65f03c0 	ret
  205ed8:	34ffff60 	cbz	w0, 205ec4 <syscall_readv+0x6c>
  205edc:	93407ea2 	sxtw	x2, w21
  205ee0:	710002bf 	cmp	w21, #0x0
  205ee4:	93407c00 	sxtw	x0, w0
  205ee8:	f94013fe 	ldr	x30, [sp, #32]
  205eec:	9a820000 	csel	x0, x0, x2, eq  // eq = none
  205ef0:	a9415bf5 	ldp	x21, x22, [sp, #16]
  205ef4:	a8c353f3 	ldp	x19, x20, [sp], #48
  205ef8:	d65f03c0 	ret
  205efc:	d2800000 	mov	x0, #0x0                   	// #0
  205f00:	d65f03c0 	ret
  205f04:	00000000 	.inst	0x00000000 ; undefined

0000000000205f08 <syscall_getdents>:
  205f08:	aa0203e3 	mov	x3, x2
  205f0c:	aa0103e2 	mov	x2, x1
  205f10:	93407c01 	sxtw	x1, w0
  205f14:	d2800f20 	mov	x0, #0x79                  	// #121
  205f18:	17fff661 	b	20389c <syscall>
  205f1c:	00000000 	.inst	0x00000000 ; undefined

0000000000205f20 <syscall_getdents64>:
  205f20:	17fffffa 	b	205f08 <syscall_getdents>
  205f24:	00000000 	.inst	0x00000000 ; undefined

0000000000205f28 <syscall__llseek>:
  205f28:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  205f2c:	aa0303f3 	mov	x19, x3
  205f30:	aa018042 	orr	x2, x2, x1, lsl #32
  205f34:	2a0403e3 	mov	w3, w4
  205f38:	2a0003e1 	mov	w1, w0
  205f3c:	d2800080 	mov	x0, #0x4                   	// #4
  205f40:	97fff657 	bl	20389c <syscall>
  205f44:	f9000260 	str	x0, [x19]
  205f48:	937ffc00 	asr	x0, x0, #63
  205f4c:	a8c17bf3 	ldp	x19, x30, [sp], #16
  205f50:	d65f03c0 	ret
  205f54:	00000000 	.inst	0x00000000 ; undefined

0000000000205f58 <syscall_readlink>:
  205f58:	aa0203e3 	mov	x3, x2
  205f5c:	aa0103e2 	mov	x2, x1
  205f60:	aa0003e1 	mov	x1, x0
  205f64:	d2801220 	mov	x0, #0x91                  	// #145
  205f68:	17fff64d 	b	20389c <syscall>
  205f6c:	00000000 	.inst	0x00000000 ; undefined

0000000000205f70 <syscall_fcntl>:
  205f70:	aa0203e3 	mov	x3, x2
  205f74:	93407c22 	sxtw	x2, w1
  205f78:	93407c01 	sxtw	x1, w0
  205f7c:	d28000e0 	mov	x0, #0x7                   	// #7
  205f80:	17fff647 	b	20389c <syscall>
  205f84:	00000000 	.inst	0x00000000 ; undefined

0000000000205f88 <syscall_fcntl64>:
  205f88:	17fffffa 	b	205f70 <syscall_fcntl>
  205f8c:	00000000 	.inst	0x00000000 ; undefined

0000000000205f90 <syscall_execve>:
  205f90:	aa0203e3 	mov	x3, x2
  205f94:	aa0103e2 	mov	x2, x1
  205f98:	aa0003e1 	mov	x1, x0
  205f9c:	d2801120 	mov	x0, #0x89                  	// #137
  205fa0:	17fff63f 	b	20389c <syscall>
  205fa4:	00000000 	.inst	0x00000000 ; undefined

0000000000205fa8 <syscall_open>:
  205fa8:	2a0203e3 	mov	w3, w2
  205fac:	93407c22 	sxtw	x2, w1
  205fb0:	aa0003e1 	mov	x1, x0
  205fb4:	d28000a0 	mov	x0, #0x5                   	// #5
  205fb8:	17fff639 	b	20389c <syscall>
  205fbc:	00000000 	.inst	0x00000000 ; undefined

0000000000205fc0 <syscall_write>:
  205fc0:	93407c43 	sxtw	x3, w2
  205fc4:	aa0103e2 	mov	x2, x1
  205fc8:	93407c01 	sxtw	x1, w0
  205fcc:	d2800060 	mov	x0, #0x3                   	// #3
  205fd0:	17fff633 	b	20389c <syscall>
  205fd4:	00000000 	.inst	0x00000000 ; undefined

0000000000205fd8 <syscall_read>:
  205fd8:	93407c43 	sxtw	x3, w2
  205fdc:	aa0103e2 	mov	x2, x1
  205fe0:	93407c01 	sxtw	x1, w0
  205fe4:	d2800040 	mov	x0, #0x2                   	// #2
  205fe8:	17fff62d 	b	20389c <syscall>
  205fec:	00000000 	.inst	0x00000000 ; undefined

0000000000205ff0 <syscall_prlimit64>:
  205ff0:	aa0303e4 	mov	x4, x3
  205ff4:	aa0203e3 	mov	x3, x2
  205ff8:	2a0103e2 	mov	w2, w1
  205ffc:	93407c01 	sxtw	x1, w0
  206000:	d2801180 	mov	x0, #0x8c                  	// #140
  206004:	17fff626 	b	20389c <syscall>

0000000000206008 <syscall_recv>:
  206008:	93407c64 	sxtw	x4, w3
  20600c:	aa0203e3 	mov	x3, x2
  206010:	aa0103e2 	mov	x2, x1
  206014:	93407c01 	sxtw	x1, w0
  206018:	d28009c0 	mov	x0, #0x4e                  	// #78
  20601c:	17fff620 	b	20389c <syscall>

0000000000206020 <syscall_send>:
  206020:	93407c64 	sxtw	x4, w3
  206024:	aa0203e3 	mov	x3, x2
  206028:	aa0103e2 	mov	x2, x1
  20602c:	93407c01 	sxtw	x1, w0
  206030:	d2800a00 	mov	x0, #0x50                  	// #80
  206034:	17fff61a 	b	20389c <syscall>

0000000000206038 <syscall_mq_open>:
  206038:	aa0303e4 	mov	x4, x3
  20603c:	2a0203e3 	mov	w3, w2
  206040:	93407c22 	sxtw	x2, w1
  206044:	aa0003e1 	mov	x1, x0
  206048:	d2801440 	mov	x0, #0xa2                  	// #162
  20604c:	17fff614 	b	20389c <syscall>

0000000000206050 <syscall_clock_nanosleep>:
  206050:	aa0303e4 	mov	x4, x3
  206054:	aa0203e3 	mov	x3, x2
  206058:	93407c22 	sxtw	x2, w1
  20605c:	93407c01 	sxtw	x1, w0
  206060:	d2801380 	mov	x0, #0x9c                  	// #156
  206064:	17fff60e 	b	20389c <syscall>

0000000000206068 <syscall_timer_settime>:
  206068:	aa0303e4 	mov	x4, x3
  20606c:	aa0203e3 	mov	x3, x2
  206070:	93407c22 	sxtw	x2, w1
  206074:	aa0003e1 	mov	x1, x0
  206078:	d28013e0 	mov	x0, #0x9f                  	// #159
  20607c:	17fff608 	b	20389c <syscall>

0000000000206080 <syscall_rt_sigprocmask>:
  206080:	f81f0ffe 	str	x30, [sp, #-16]!
  206084:	aa0303e4 	mov	x4, x3
  206088:	aa0203e3 	mov	x3, x2
  20608c:	aa0103e2 	mov	x2, x1
  206090:	93407c01 	sxtw	x1, w0
  206094:	d2800d00 	mov	x0, #0x68                  	// #104
  206098:	97fff601 	bl	20389c <syscall>
  20609c:	93407c00 	sxtw	x0, w0
  2060a0:	f84107fe 	ldr	x30, [sp], #16
  2060a4:	d65f03c0 	ret

00000000002060a8 <syscall_rt_sigaction>:
  2060a8:	f81f0ffe 	str	x30, [sp, #-16]!
  2060ac:	aa0303e4 	mov	x4, x3
  2060b0:	aa0203e3 	mov	x3, x2
  2060b4:	aa0103e2 	mov	x2, x1
  2060b8:	93407c01 	sxtw	x1, w0
  2060bc:	d2800ce0 	mov	x0, #0x67                  	// #103
  2060c0:	97fff5f7 	bl	20389c <syscall>
  2060c4:	93407c00 	sxtw	x0, w0
  2060c8:	f84107fe 	ldr	x30, [sp], #16
  2060cc:	d65f03c0 	ret

00000000002060d0 <syscall_sigprocmask>:
  2060d0:	f81f0ffe 	str	x30, [sp, #-16]!
  2060d4:	aa0203e3 	mov	x3, x2
  2060d8:	d2801004 	mov	x4, #0x80                  	// #128
  2060dc:	aa0103e2 	mov	x2, x1
  2060e0:	93407c01 	sxtw	x1, w0
  2060e4:	d2800d00 	mov	x0, #0x68                  	// #104
  2060e8:	97fff5ed 	bl	20389c <syscall>
  2060ec:	93407c00 	sxtw	x0, w0
  2060f0:	f84107fe 	ldr	x30, [sp], #16
  2060f4:	d65f03c0 	ret

00000000002060f8 <syscall_sigaction>:
  2060f8:	f81f0ffe 	str	x30, [sp, #-16]!
  2060fc:	aa0203e3 	mov	x3, x2
  206100:	d2801004 	mov	x4, #0x80                  	// #128
  206104:	aa0103e2 	mov	x2, x1
  206108:	93407c01 	sxtw	x1, w0
  20610c:	d2800ce0 	mov	x0, #0x67                  	// #103
  206110:	97fff5e3 	bl	20389c <syscall>
  206114:	93407c00 	sxtw	x0, w0
  206118:	f84107fe 	ldr	x30, [sp], #16
  20611c:	d65f03c0 	ret

0000000000206120 <syscall_getsockopt>:
  206120:	aa0403e5 	mov	x5, x4
  206124:	aa0303e4 	mov	x4, x3
  206128:	93407c43 	sxtw	x3, w2
  20612c:	93407c22 	sxtw	x2, w1
  206130:	93407c01 	sxtw	x1, w0
  206134:	d2800940 	mov	x0, #0x4a                  	// #74
  206138:	17fff5d9 	b	20389c <syscall>
  20613c:	00000000 	.inst	0x00000000 ; undefined

0000000000206140 <syscall_setsockopt>:
  206140:	2a0403e5 	mov	w5, w4
  206144:	aa0303e4 	mov	x4, x3
  206148:	93407c43 	sxtw	x3, w2
  20614c:	93407c22 	sxtw	x2, w1
  206150:	93407c01 	sxtw	x1, w0
  206154:	d2800960 	mov	x0, #0x4b                  	// #75
  206158:	17fff5d1 	b	20389c <syscall>
  20615c:	00000000 	.inst	0x00000000 ; undefined

0000000000206160 <syscall_mq_timedreceive>:
  206160:	aa0403e5 	mov	x5, x4
  206164:	aa0303e4 	mov	x4, x3
  206168:	aa0203e3 	mov	x3, x2
  20616c:	aa0103e2 	mov	x2, x1
  206170:	93407c01 	sxtw	x1, w0
  206174:	d28014a0 	mov	x0, #0xa5                  	// #165
  206178:	17fff5c9 	b	20389c <syscall>
  20617c:	00000000 	.inst	0x00000000 ; undefined

0000000000206180 <syscall_mq_timedsend>:
  206180:	aa0403e5 	mov	x5, x4
  206184:	2a0303e4 	mov	w4, w3
  206188:	aa0203e3 	mov	x3, x2
  20618c:	aa0103e2 	mov	x2, x1
  206190:	93407c01 	sxtw	x1, w0
  206194:	d2801480 	mov	x0, #0xa4                  	// #164
  206198:	17fff5c1 	b	20389c <syscall>
  20619c:	00000000 	.inst	0x00000000 ; undefined

00000000002061a0 <syscall_mremap>:
  2061a0:	aa0403e5 	mov	x5, x4
  2061a4:	93407c64 	sxtw	x4, w3
  2061a8:	aa0203e3 	mov	x3, x2
  2061ac:	aa0103e2 	mov	x2, x1
  2061b0:	aa0003e1 	mov	x1, x0
  2061b4:	d2801240 	mov	x0, #0x92                  	// #146
  2061b8:	17fff5b9 	b	20389c <syscall>
  2061bc:	00000000 	.inst	0x00000000 ; undefined

00000000002061c0 <syscall__newselect>:
  2061c0:	aa0403e5 	mov	x5, x4
  2061c4:	aa0303e4 	mov	x4, x3
  2061c8:	aa0203e3 	mov	x3, x2
  2061cc:	aa0103e2 	mov	x2, x1
  2061d0:	93407c01 	sxtw	x1, w0
  2061d4:	d2800bc0 	mov	x0, #0x5e                  	// #94
  2061d8:	17fff5b1 	b	20389c <syscall>
  2061dc:	00000000 	.inst	0x00000000 ; undefined

00000000002061e0 <syscall_recvfrom>:
  2061e0:	aa0503e6 	mov	x6, x5
  2061e4:	aa0403e5 	mov	x5, x4
  2061e8:	93407c64 	sxtw	x4, w3
  2061ec:	aa0203e3 	mov	x3, x2
  2061f0:	aa0103e2 	mov	x2, x1
  2061f4:	93407c01 	sxtw	x1, w0
  2061f8:	d28009e0 	mov	x0, #0x4f                  	// #79
  2061fc:	17fff5a8 	b	20389c <syscall>

0000000000206200 <syscall_sendto>:
  206200:	2a0503e6 	mov	w6, w5
  206204:	aa0403e5 	mov	x5, x4
  206208:	93407c64 	sxtw	x4, w3
  20620c:	aa0203e3 	mov	x3, x2
  206210:	aa0103e2 	mov	x2, x1
  206214:	93407c01 	sxtw	x1, w0
  206218:	d2800a20 	mov	x0, #0x51                  	// #81
  20621c:	17fff5a0 	b	20389c <syscall>

0000000000206220 <syscall_futex>:
  206220:	f81f0ffe 	str	x30, [sp, #-16]!
  206224:	93407ca6 	sxtw	x6, w5
  206228:	aa0403e5 	mov	x5, x4
  20622c:	aa0303e4 	mov	x4, x3
  206230:	93407c43 	sxtw	x3, w2
  206234:	93407c22 	sxtw	x2, w1
  206238:	aa0003e1 	mov	x1, x0
  20623c:	d2801060 	mov	x0, #0x83                  	// #131
  206240:	97fff597 	bl	20389c <syscall>
  206244:	93407c00 	sxtw	x0, w0
  206248:	f84107fe 	ldr	x30, [sp], #16
  20624c:	d65f03c0 	ret

0000000000206250 <syscall_mmap2>:
  206250:	aa0503e6 	mov	x6, x5
  206254:	93407c85 	sxtw	x5, w4
  206258:	93407c64 	sxtw	x4, w3
  20625c:	93407c43 	sxtw	x3, w2
  206260:	aa0103e2 	mov	x2, x1
  206264:	aa0003e1 	mov	x1, x0
  206268:	d28006a0 	mov	x0, #0x35                  	// #53
  20626c:	17fff58c 	b	20389c <syscall>

0000000000206270 <syscall_gettid>:
  206270:	d2801160 	mov	x0, #0x8b                  	// #139
  206274:	17fff58a 	b	20389c <syscall>

0000000000206278 <syscall_vfork>:
  206278:	d2801140 	mov	x0, #0x8a                  	// #138
  20627c:	17fff588 	b	20389c <syscall>

0000000000206280 <syscall_setsid>:
  206280:	d28011e0 	mov	x0, #0x8f                  	// #143
  206284:	17fff586 	b	20389c <syscall>

0000000000206288 <syscall_getpid>:
  206288:	d28001e0 	mov	x0, #0xf                   	// #15
  20628c:	17fff584 	b	20389c <syscall>

0000000000206290 <syscall_fork>:
  206290:	d2801100 	mov	x0, #0x88                  	// #136
  206294:	17fff582 	b	20389c <syscall>

0000000000206298 <syscall_ioctl>:
  206298:	7100041f 	cmp	w0, #0x1
  20629c:	540000e0 	b.eq	2062b8 <syscall_ioctl+0x20>  // b.none
  2062a0:	aa0203e3 	mov	x3, x2
  2062a4:	93407c22 	sxtw	x2, w1
  2062a8:	93407c01 	sxtw	x1, w0
  2062ac:	d28000e0 	mov	x0, #0x7                   	// #7
  2062b0:	17fff57b 	b	20389c <syscall>
  2062b4:	d503201f 	nop
  2062b8:	d2800000 	mov	x0, #0x0                   	// #0
  2062bc:	d65f03c0 	ret

00000000002062c0 <syscall_lseek>:
  2062c0:	93407c00 	sxtw	x0, w0
  2062c4:	93407c23 	sxtw	x3, w1
  2062c8:	93407c45 	sxtw	x5, w2
  2062cc:	37f800e1 	tbnz	w1, #31, 2062e8 <syscall_lseek+0x28>
  2062d0:	aa0003e1 	mov	x1, x0
  2062d4:	d2800004 	mov	x4, #0x0                   	// #0
  2062d8:	d2800002 	mov	x2, #0x0                   	// #0
  2062dc:	d2800080 	mov	x0, #0x4                   	// #4
  2062e0:	17fff56f 	b	20389c <syscall>
  2062e4:	d503201f 	nop
  2062e8:	aa0003e1 	mov	x1, x0
  2062ec:	92800004 	mov	x4, #0xffffffffffffffff    	// #-1
  2062f0:	d2800002 	mov	x2, #0x0                   	// #0
  2062f4:	d2800080 	mov	x0, #0x4                   	// #4
  2062f8:	17fff569 	b	20389c <syscall>
  2062fc:	00000000 	.inst	0x00000000 ; undefined

0000000000206300 <get_rtt_syscall>:
  206300:	f106401f 	cmp	x0, #0x190
  206304:	54000129 	b.ls	206328 <get_rtt_syscall+0x28>  // b.plast
  206308:	d28000a2 	mov	x2, #0x5                   	// #5
  20630c:	b0ffffe1 	adrp	x1, 203000 <rt_tick_from_millisecond+0xa0>
  206310:	f2a001e2 	movk	x2, #0xf, lsl #16
  206314:	eb02001f 	cmp	x0, x2
  206318:	91232020 	add	x0, x1, #0x8c8
  20631c:	9a9f0000 	csel	x0, x0, xzr, eq  // eq = none
  206320:	d65f03c0 	ret
  206324:	d503201f 	nop
  206328:	b0000061 	adrp	x1, 213000 <__FUNCTION__.5978+0x8>
  20632c:	91200021 	add	x1, x1, #0x800
  206330:	f8607820 	ldr	x0, [x1, x0, lsl #3]
  206334:	d65f03c0 	ret

0000000000206338 <___syscall>:
  206338:	aa0103e9 	mov	x9, x1
  20633c:	f106401f 	cmp	x0, #0x190
  206340:	aa0203e1 	mov	x1, x2
  206344:	aa0303e2 	mov	x2, x3
  206348:	aa0403e3 	mov	x3, x4
  20634c:	aa0503e4 	mov	x4, x5
  206350:	aa0603e5 	mov	x5, x6
  206354:	540001a8 	b.hi	206388 <___syscall+0x50>  // b.pmore
  206358:	b0000066 	adrp	x6, 213000 <__FUNCTION__.5978+0x8>
  20635c:	912000c6 	add	x6, x6, #0x800
  206360:	f86078c8 	ldr	x8, [x6, x0, lsl #3]
  206364:	b40002a8 	cbz	x8, 2063b8 <___syscall+0x80>
  206368:	f81f0ffe 	str	x30, [sp, #-16]!
  20636c:	aa0703e6 	mov	x6, x7
  206370:	aa0903e0 	mov	x0, x9
  206374:	d63f0100 	blr	x8
  206378:	93407c00 	sxtw	x0, w0
  20637c:	f84107fe 	ldr	x30, [sp], #16
  206380:	d65f03c0 	ret
  206384:	d503201f 	nop
  206388:	d143c008 	sub	x8, x0, #0xf0, lsl #12
  20638c:	f1001508 	subs	x8, x8, #0x5
  206390:	54000141 	b.ne	2063b8 <___syscall+0x80>  // b.any
  206394:	f81f0ffe 	str	x30, [sp, #-16]!
  206398:	aa0703e6 	mov	x6, x7
  20639c:	aa0903e0 	mov	x0, x9
  2063a0:	b0ffffe8 	adrp	x8, 203000 <rt_tick_from_millisecond+0xa0>
  2063a4:	91232108 	add	x8, x8, #0x8c8
  2063a8:	d63f0100 	blr	x8
  2063ac:	f84107fe 	ldr	x30, [sp], #16
  2063b0:	93407c00 	sxtw	x0, w0
  2063b4:	d65f03c0 	ret
  2063b8:	d2800000 	mov	x0, #0x0                   	// #0
  2063bc:	d65f03c0 	ret

00000000002063c0 <__syscall_ret>:
  2063c0:	b140041f 	cmn	x0, #0x1, lsl #12
  2063c4:	54000048 	b.hi	2063cc <__syscall_ret+0xc>  // b.pmore
  2063c8:	d65f03c0 	ret
  2063cc:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  2063d0:	aa0003f3 	mov	x19, x0
  2063d4:	4b1303f3 	neg	w19, w19
  2063d8:	97fff452 	bl	203520 <__errno_location>
  2063dc:	b9000013 	str	w19, [x0]
  2063e0:	92800001 	mov	x1, #0xffffffffffffffff    	// #-1
  2063e4:	aa0103e0 	mov	x0, x1
  2063e8:	a8c17bf3 	ldp	x19, x30, [sp], #16
  2063ec:	d65f03c0 	ret

00000000002063f0 <__lctrans_impl>:
  2063f0:	d65f03c0 	ret
  2063f4:	00000000 	.inst	0x00000000 ; undefined

00000000002063f8 <__lctrans>:
  2063f8:	17fffffe 	b	2063f0 <__lctrans_impl>
  2063fc:	00000000 	.inst	0x00000000 ; undefined

0000000000206400 <__lctrans_cur>:
  206400:	d53bd041 	mrs	x1, tpidr_el0
  206404:	f85d0021 	ldur	x1, [x1, #-48]
  206408:	f9401421 	ldr	x1, [x1, #40]
  20640c:	17fffff9 	b	2063f0 <__lctrans_impl>

0000000000206410 <__simple_malloc>:
  206410:	a9bc53f3 	stp	x19, x20, [sp, #-64]!
  206414:	aa0003f4 	mov	x20, x0
  206418:	a9015bf5 	stp	x21, x22, [sp, #16]
  20641c:	a9027bf7 	stp	x23, x30, [sp, #32]
  206420:	b40002c0 	cbz	x0, 206478 <__simple_malloc+0x68>
  206424:	f100041f 	cmp	x0, #0x1
  206428:	540007a9 	b.ls	20651c <__simple_malloc+0x10c>  // b.plast
  20642c:	d2800020 	mov	x0, #0x1                   	// #1
  206430:	d37ff800 	lsl	x0, x0, #1
  206434:	eb00029f 	cmp	x20, x0
  206438:	fa4f8802 	ccmp	x0, #0xf, #0x2, hi  // hi = pmore
  20643c:	54ffffa9 	b.ls	206430 <__simple_malloc+0x20>  // b.plast
  206440:	d1000413 	sub	x19, x0, #0x1
  206444:	f0000076 	adrp	x22, 215000 <__data_start__>
  206448:	f0000075 	adrp	x21, 215000 <__data_start__>
  20644c:	910a42a0 	add	x0, x21, #0x290
  206450:	9400145a 	bl	20b5b8 <__lock>
  206454:	f94142c1 	ldr	x1, [x22, #640]
  206458:	b24113e0 	mov	x0, #0x800000000000000f    	// #-9223372036854775793
  20645c:	eb00029f 	cmp	x20, x0
  206460:	cb0103e0 	neg	x0, x1
  206464:	8a130013 	and	x19, x0, x19
  206468:	54000188 	b.hi	206498 <__simple_malloc+0x88>  // b.pmore
  20646c:	8b130280 	add	x0, x20, x19
  206470:	aa1303f4 	mov	x20, x19
  206474:	14000007 	b	206490 <__simple_malloc+0x80>
  206478:	f0000076 	adrp	x22, 215000 <__data_start__>
  20647c:	f0000075 	adrp	x21, 215000 <__data_start__>
  206480:	910a42a0 	add	x0, x21, #0x290
  206484:	9400144d 	bl	20b5b8 <__lock>
  206488:	f94142c1 	ldr	x1, [x22, #640]
  20648c:	d2800020 	mov	x0, #0x1                   	// #1
  206490:	aa1403f3 	mov	x19, x20
  206494:	aa0003f4 	mov	x20, x0
  206498:	f0000077 	adrp	x23, 215000 <__data_start__>
  20649c:	f94146e0 	ldr	x0, [x23, #648]
  2064a0:	cb010000 	sub	x0, x0, x1
  2064a4:	eb14001f 	cmp	x0, x20
  2064a8:	54000183 	b.cc	2064d8 <__simple_malloc+0xc8>  // b.lo, b.ul, b.last
  2064ac:	8b130033 	add	x19, x1, x19
  2064b0:	8b140034 	add	x20, x1, x20
  2064b4:	910a42a0 	add	x0, x21, #0x290
  2064b8:	f90142d4 	str	x20, [x22, #640]
  2064bc:	94001497 	bl	20b718 <__unlock>
  2064c0:	aa1303e0 	mov	x0, x19
  2064c4:	a9415bf5 	ldp	x21, x22, [sp, #16]
  2064c8:	a9427bf7 	ldp	x23, x30, [sp, #32]
  2064cc:	a8c453f3 	ldp	x19, x20, [sp], #64
  2064d0:	d65f03c0 	ret
  2064d4:	d503201f 	nop
  2064d8:	910103e0 	add	x0, sp, #0x40
  2064dc:	f81f8c14 	str	x20, [x0, #-8]!
  2064e0:	94001abc 	bl	20cfd0 <__expand_heap>
  2064e4:	b4000200 	cbz	x0, 206524 <__simple_malloc+0x114>
  2064e8:	f94146e1 	ldr	x1, [x23, #648]
  2064ec:	eb00003f 	cmp	x1, x0
  2064f0:	54000100 	b.eq	206510 <__simple_malloc+0x100>  // b.none
  2064f4:	cb130294 	sub	x20, x20, x19
  2064f8:	aa0003e1 	mov	x1, x0
  2064fc:	aa0003f3 	mov	x19, x0
  206500:	f9401fe2 	ldr	x2, [sp, #56]
  206504:	8b020000 	add	x0, x0, x2
  206508:	f90146e0 	str	x0, [x23, #648]
  20650c:	17ffffe9 	b	2064b0 <__simple_malloc+0xa0>
  206510:	f94142c1 	ldr	x1, [x22, #640]
  206514:	8b130033 	add	x19, x1, x19
  206518:	17fffffa 	b	206500 <__simple_malloc+0xf0>
  20651c:	d2800013 	mov	x19, #0x0                   	// #0
  206520:	17ffffc9 	b	206444 <__simple_malloc+0x34>
  206524:	910a42a0 	add	x0, x21, #0x290
  206528:	d2800013 	mov	x19, #0x0                   	// #0
  20652c:	9400147b 	bl	20b718 <__unlock>
  206530:	17ffffe4 	b	2064c0 <__simple_malloc+0xb0>
  206534:	00000000 	.inst	0x00000000 ; undefined

0000000000206538 <__simple_calloc>:
  206538:	b4000061 	cbz	x1, 206544 <__simple_calloc+0xc>
  20653c:	9bc17c02 	umulh	x2, x0, x1
  206540:	b5000062 	cbnz	x2, 20654c <__simple_calloc+0x14>
  206544:	9b007c20 	mul	x0, x1, x0
  206548:	17ffffb2 	b	206410 <__simple_malloc>
  20654c:	f81f0ffe 	str	x30, [sp, #-16]!
  206550:	97fff3f4 	bl	203520 <__errno_location>
  206554:	52800181 	mov	w1, #0xc                   	// #12
  206558:	b9000001 	str	w1, [x0]
  20655c:	d2800000 	mov	x0, #0x0                   	// #0
  206560:	f84107fe 	ldr	x30, [sp], #16
  206564:	d65f03c0 	ret

0000000000206568 <unbin>:
  206568:	a9410804 	ldp	x4, x2, [x0, #16]
  20656c:	eb04005f 	cmp	x2, x4
  206570:	54000180 	b.eq	2065a0 <unbin+0x38>  // b.none
  206574:	f9400401 	ldr	x1, [x0, #8]
  206578:	f9000844 	str	x4, [x2, #16]
  20657c:	927ff824 	and	x4, x1, #0xfffffffffffffffe
  206580:	b2400021 	orr	x1, x1, #0x1
  206584:	f9400805 	ldr	x5, [x0, #16]
  206588:	f8646803 	ldr	x3, [x0, x4]
  20658c:	f9000ca2 	str	x2, [x5, #24]
  206590:	f9000401 	str	x1, [x0, #8]
  206594:	b2400061 	orr	x1, x3, #0x1
  206598:	f8246801 	str	x1, [x0, x4]
  20659c:	d65f03c0 	ret
  2065a0:	d2800023 	mov	x3, #0x1                   	// #1
  2065a4:	9ac12063 	lsl	x3, x3, x1
  2065a8:	aa2303e3 	mvn	x3, x3
  2065ac:	3100047f 	cmn	w3, #0x1
  2065b0:	54000120 	b.eq	2065d4 <unbin+0x6c>  // b.none
  2065b4:	2a0303e5 	mov	w5, w3
  2065b8:	f0000062 	adrp	x2, 215000 <__data_start__>
  2065bc:	910aa041 	add	x1, x2, #0x2a8
  2065c0:	885ffc21 	ldaxr	w1, [x1]
  2065c4:	0a0100a1 	and	w1, w5, w1
  2065c8:	910aa046 	add	x6, x2, #0x2a8
  2065cc:	8804fcc1 	stlxr	w4, w1, [x6]
  2065d0:	35ffff64 	cbnz	w4, 2065bc <unbin+0x54>
  2065d4:	d360fc63 	lsr	x3, x3, #32
  2065d8:	3100047f 	cmn	w3, #0x1
  2065dc:	54000120 	b.eq	206600 <unbin+0x98>  // b.none
  2065e0:	f0000062 	adrp	x2, 215000 <__data_start__>
  2065e4:	910aa042 	add	x2, x2, #0x2a8
  2065e8:	91001041 	add	x1, x2, #0x4
  2065ec:	885ffc21 	ldaxr	w1, [x1]
  2065f0:	0a010061 	and	w1, w3, w1
  2065f4:	91001045 	add	x5, x2, #0x4
  2065f8:	8804fca1 	stlxr	w4, w1, [x5]
  2065fc:	35ffff64 	cbnz	w4, 2065e8 <unbin+0x80>
  206600:	a9410804 	ldp	x4, x2, [x0, #16]
  206604:	17ffffdc 	b	206574 <unbin+0xc>

0000000000206608 <adjust_size>:
  206608:	f0000061 	adrp	x1, 215000 <__data_start__>
  20660c:	92800402 	mov	x2, #0xffffffffffffffdf    	// #-33
  206610:	f2efffe2 	movk	x2, #0x7fff, lsl #48
  206614:	f9479023 	ldr	x3, [x1, #3872]
  206618:	f9400001 	ldr	x1, [x0]
  20661c:	cb030042 	sub	x2, x2, x3
  206620:	d1000423 	sub	x3, x1, #0x1
  206624:	eb02007f 	cmp	x3, x2
  206628:	54000109 	b.ls	206648 <adjust_size+0x40>  // b.plast
  20662c:	b50001a1 	cbnz	x1, 206660 <adjust_size+0x58>
  206630:	d2800401 	mov	x1, #0x20                  	// #32
  206634:	52800002 	mov	w2, #0x0                   	// #0
  206638:	f9000001 	str	x1, [x0]
  20663c:	2a0203e0 	mov	w0, w2
  206640:	d65f03c0 	ret
  206644:	d503201f 	nop
  206648:	9100bc21 	add	x1, x1, #0x2f
  20664c:	52800002 	mov	w2, #0x0                   	// #0
  206650:	927be821 	and	x1, x1, #0xffffffffffffffe0
  206654:	f9000001 	str	x1, [x0]
  206658:	2a0203e0 	mov	w0, w2
  20665c:	d65f03c0 	ret
  206660:	f81f0ffe 	str	x30, [sp, #-16]!
  206664:	97fff3af 	bl	203520 <__errno_location>
  206668:	52800181 	mov	w1, #0xc                   	// #12
  20666c:	b9000001 	str	w1, [x0]
  206670:	12800002 	mov	w2, #0xffffffff            	// #-1
  206674:	2a0203e0 	mov	w0, w2
  206678:	f84107fe 	ldr	x30, [sp], #16
  20667c:	d65f03c0 	ret

0000000000206680 <alloc_fwd>:
  206680:	a9ba53f3 	stp	x19, x20, [sp, #-96]!
  206684:	a9036bf9 	stp	x25, x26, [sp, #48]
  206688:	aa0003f9 	mov	x25, x0
  20668c:	a90473fb 	stp	x27, x28, [sp, #64]
  206690:	d000007b 	adrp	x27, 214000 <syscall_table+0x800>
  206694:	9112a37b 	add	x27, x27, #0x4a8
  206698:	a9015bf5 	stp	x21, x22, [sp, #16]
  20669c:	a90263f7 	stp	x23, x24, [sp, #32]
  2066a0:	f9002bfe 	str	x30, [sp, #80]
  2066a4:	f0000060 	adrp	x0, 215000 <__data_start__>
  2066a8:	910aa017 	add	x23, x0, #0x2a8
  2066ac:	f940073c 	ldr	x28, [x25, #8]
  2066b0:	d283801a 	mov	x26, #0x1c00                	// #7168
  2066b4:	370009bc 	tbnz	w28, #0, 2067e8 <alloc_fwd+0x168>
  2066b8:	d345ff95 	lsr	x21, x28, #5
  2066bc:	d10006b5 	sub	x21, x21, #0x1
  2066c0:	f10082bf 	cmp	x21, #0x20
  2066c4:	540007e8 	b.hi	2067c0 <alloc_fwd+0x140>  // b.pmore
  2066c8:	8b1506b6 	add	x22, x21, x21, lsl #1
  2066cc:	d37df2d6 	lsl	x22, x22, #3
  2066d0:	910022d3 	add	x19, x22, #0x8
  2066d4:	f0000060 	adrp	x0, 215000 <__data_start__>
  2066d8:	913ba000 	add	x0, x0, #0xee8
  2066dc:	8b1302f3 	add	x19, x23, x19
  2066e0:	52800034 	mov	w20, #0x1                   	// #1
  2066e4:	91001278 	add	x24, x19, #0x4
  2066e8:	b9400c00 	ldr	w0, [x0, #12]
  2066ec:	350005a0 	cbnz	w0, 2067a0 <alloc_fwd+0x120>
  2066f0:	93407ea0 	sxtw	x0, w21
  2066f4:	8b000401 	add	x1, x0, x0, lsl #1
  2066f8:	8b010ee1 	add	x1, x23, x1, lsl #3
  2066fc:	f9400821 	ldr	x1, [x1, #16]
  206700:	b5000ae1 	cbnz	x1, 20685c <alloc_fwd+0x1dc>
  206704:	aa1c03e1 	mov	x1, x28
  206708:	8b000400 	add	x0, x0, x0, lsl #1
  20670c:	8b1602f6 	add	x22, x23, x22
  206710:	8b000ee0 	add	x0, x23, x0, lsl #3
  206714:	a9015816 	stp	x22, x22, [x0, #16]
  206718:	eb01039f 	cmp	x28, x1
  20671c:	54000a00 	b.eq	20685c <alloc_fwd+0x1dc>  // b.none
  206720:	b9400260 	ldr	w0, [x19]
  206724:	340005e0 	cbz	w0, 2067e0 <alloc_fwd+0x160>
  206728:	d5033bbf 	dmb	ish
  20672c:	b900027f 	str	wzr, [x19]
  206730:	d5033bbf 	dmb	ish
  206734:	b9400660 	ldr	w0, [x19, #4]
  206738:	34fffba0 	cbz	w0, 2066ac <alloc_fwd+0x2c>
  20673c:	d2801e00 	mov	x0, #0xf0                  	// #240
  206740:	97fffef0 	bl	206300 <get_rtt_syscall>
  206744:	aa0003e3 	mov	x3, x0
  206748:	b4fffae0 	cbz	x0, 2066a4 <alloc_fwd+0x24>
  20674c:	d2800022 	mov	x2, #0x1                   	// #1
  206750:	d2801021 	mov	x1, #0x81                  	// #129
  206754:	aa1303e0 	mov	x0, x19
  206758:	d63f0060 	blr	x3
  20675c:	b100981f 	cmn	x0, #0x26
  206760:	54fffa21 	b.ne	2066a4 <alloc_fwd+0x24>  // b.any
  206764:	d2801e00 	mov	x0, #0xf0                  	// #240
  206768:	97fffee6 	bl	206300 <get_rtt_syscall>
  20676c:	aa0003e3 	mov	x3, x0
  206770:	b4fff9a0 	cbz	x0, 2066a4 <alloc_fwd+0x24>
  206774:	d2800022 	mov	x2, #0x1                   	// #1
  206778:	aa1303e0 	mov	x0, x19
  20677c:	aa0203e1 	mov	x1, x2
  206780:	d63f0060 	blr	x3
  206784:	17ffffc8 	b	2066a4 <alloc_fwd+0x24>
  206788:	34000401 	cbz	w1, 206808 <alloc_fwd+0x188>
  20678c:	52800023 	mov	w3, #0x1                   	// #1
  206790:	aa1803e1 	mov	x1, x24
  206794:	2a0303e2 	mov	w2, w3
  206798:	aa1303e0 	mov	x0, x19
  20679c:	94001407 	bl	20b7b8 <__wait>
  2067a0:	885ffe61 	ldaxr	w1, [x19]
  2067a4:	8800fe74 	stlxr	w0, w20, [x19]
  2067a8:	34ffff00 	cbz	w0, 206788 <alloc_fwd+0x108>
  2067ac:	885ffe61 	ldaxr	w1, [x19]
  2067b0:	8800fe74 	stlxr	w0, w20, [x19]
  2067b4:	35ffff60 	cbnz	w0, 2067a0 <alloc_fwd+0x120>
  2067b8:	17fffff4 	b	206788 <alloc_fwd+0x108>
  2067bc:	d503201f 	nop
  2067c0:	f107febf 	cmp	x21, #0x1ff
  2067c4:	54000328 	b.hi	206828 <alloc_fwd+0x1a8>  // b.pmore
  2067c8:	8b550f75 	add	x21, x27, x21, lsr #3
  2067cc:	52800316 	mov	w22, #0x18                  	// #24
  2067d0:	385fc2b5 	ldurb	w21, [x21, #-4]
  2067d4:	9bb67eb6 	umull	x22, w21, w22
  2067d8:	910022d3 	add	x19, x22, #0x8
  2067dc:	17ffffbe 	b	2066d4 <alloc_fwd+0x54>
  2067e0:	aa0103fc 	mov	x28, x1
  2067e4:	3607f6bc 	tbz	w28, #0, 2066b8 <alloc_fwd+0x38>
  2067e8:	52800000 	mov	w0, #0x0                   	// #0
  2067ec:	f9402bfe 	ldr	x30, [sp, #80]
  2067f0:	a9415bf5 	ldp	x21, x22, [sp, #16]
  2067f4:	a94263f7 	ldp	x23, x24, [sp, #32]
  2067f8:	a9436bf9 	ldp	x25, x26, [sp, #48]
  2067fc:	a94473fb 	ldp	x27, x28, [sp, #64]
  206800:	a8c653f3 	ldp	x19, x20, [sp], #96
  206804:	d65f03c0 	ret
  206808:	93407ea0 	sxtw	x0, w21
  20680c:	f9400721 	ldr	x1, [x25, #8]
  206810:	8b000402 	add	x2, x0, x0, lsl #1
  206814:	8b020ee2 	add	x2, x23, x2, lsl #3
  206818:	f9400842 	ldr	x2, [x2, #16]
  20681c:	b5fff7e2 	cbnz	x2, 206718 <alloc_fwd+0x98>
  206820:	17ffffba 	b	206708 <alloc_fwd+0x88>
  206824:	d503201f 	nop
  206828:	eb1a02bf 	cmp	x21, x26
  20682c:	54000108 	b.hi	20684c <alloc_fwd+0x1cc>  // b.pmore
  206830:	8b551f75 	add	x21, x27, x21, lsr #7
  206834:	52800316 	mov	w22, #0x18                  	// #24
  206838:	385fc2b5 	ldurb	w21, [x21, #-4]
  20683c:	110042b5 	add	w21, w21, #0x10
  206840:	9b367eb6 	smull	x22, w21, w22
  206844:	910022d3 	add	x19, x22, #0x8
  206848:	17ffffa3 	b	2066d4 <alloc_fwd+0x54>
  20684c:	d280bd16 	mov	x22, #0x5e8                 	// #1512
  206850:	d280be13 	mov	x19, #0x5f0                 	// #1520
  206854:	528007f5 	mov	w21, #0x3f                  	// #63
  206858:	17ffff9f 	b	2066d4 <alloc_fwd+0x54>
  20685c:	aa1903e0 	mov	x0, x25
  206860:	2a1503e1 	mov	w1, w21
  206864:	97ffff41 	bl	206568 <unbin>
  206868:	b9400260 	ldr	w0, [x19]
  20686c:	340000c0 	cbz	w0, 206884 <alloc_fwd+0x204>
  206870:	d5033bbf 	dmb	ish
  206874:	b900027f 	str	wzr, [x19]
  206878:	d5033bbf 	dmb	ish
  20687c:	b9400660 	ldr	w0, [x19, #4]
  206880:	35000120 	cbnz	w0, 2068a4 <alloc_fwd+0x224>
  206884:	52800020 	mov	w0, #0x1                   	// #1
  206888:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20688c:	a94263f7 	ldp	x23, x24, [sp, #32]
  206890:	a9436bf9 	ldp	x25, x26, [sp, #48]
  206894:	a94473fb 	ldp	x27, x28, [sp, #64]
  206898:	f9402bfe 	ldr	x30, [sp, #80]
  20689c:	a8c653f3 	ldp	x19, x20, [sp], #96
  2068a0:	d65f03c0 	ret
  2068a4:	d2801e00 	mov	x0, #0xf0                  	// #240
  2068a8:	97fffe96 	bl	206300 <get_rtt_syscall>
  2068ac:	aa0003e3 	mov	x3, x0
  2068b0:	b4fffea0 	cbz	x0, 206884 <alloc_fwd+0x204>
  2068b4:	d2800022 	mov	x2, #0x1                   	// #1
  2068b8:	d2801021 	mov	x1, #0x81                  	// #129
  2068bc:	aa1303e0 	mov	x0, x19
  2068c0:	d63f0060 	blr	x3
  2068c4:	b100981f 	cmn	x0, #0x26
  2068c8:	54fffde1 	b.ne	206884 <alloc_fwd+0x204>  // b.any
  2068cc:	d2801e00 	mov	x0, #0xf0                  	// #240
  2068d0:	97fffe8c 	bl	206300 <get_rtt_syscall>
  2068d4:	aa0003e3 	mov	x3, x0
  2068d8:	b4fffd60 	cbz	x0, 206884 <alloc_fwd+0x204>
  2068dc:	d2800022 	mov	x2, #0x1                   	// #1
  2068e0:	aa1303e0 	mov	x0, x19
  2068e4:	aa0203e1 	mov	x1, x2
  2068e8:	d63f0060 	blr	x3
  2068ec:	52800020 	mov	w0, #0x1                   	// #1
  2068f0:	17ffffe6 	b	206888 <alloc_fwd+0x208>
  2068f4:	00000000 	.inst	0x00000000 ; undefined

00000000002068f8 <alloc_rev>:
  2068f8:	a9ba53f3 	stp	x19, x20, [sp, #-96]!
  2068fc:	a9036bf9 	stp	x25, x26, [sp, #48]
  206900:	aa0003f9 	mov	x25, x0
  206904:	a90473fb 	stp	x27, x28, [sp, #64]
  206908:	d000007b 	adrp	x27, 214000 <syscall_table+0x800>
  20690c:	9112a37b 	add	x27, x27, #0x4a8
  206910:	a9015bf5 	stp	x21, x22, [sp, #16]
  206914:	a90263f7 	stp	x23, x24, [sp, #32]
  206918:	f9002bfe 	str	x30, [sp, #80]
  20691c:	f0000060 	adrp	x0, 215000 <__data_start__>
  206920:	910aa017 	add	x23, x0, #0x2a8
  206924:	f940033c 	ldr	x28, [x25]
  206928:	d283801a 	mov	x26, #0x1c00                	// #7168
  20692c:	370009bc 	tbnz	w28, #0, 206a60 <alloc_rev+0x168>
  206930:	d345ff95 	lsr	x21, x28, #5
  206934:	d10006b5 	sub	x21, x21, #0x1
  206938:	f10082bf 	cmp	x21, #0x20
  20693c:	540007e8 	b.hi	206a38 <alloc_rev+0x140>  // b.pmore
  206940:	8b1506b6 	add	x22, x21, x21, lsl #1
  206944:	d37df2d6 	lsl	x22, x22, #3
  206948:	910022d3 	add	x19, x22, #0x8
  20694c:	f0000060 	adrp	x0, 215000 <__data_start__>
  206950:	913ba000 	add	x0, x0, #0xee8
  206954:	8b1302f3 	add	x19, x23, x19
  206958:	52800034 	mov	w20, #0x1                   	// #1
  20695c:	91001278 	add	x24, x19, #0x4
  206960:	b9400c00 	ldr	w0, [x0, #12]
  206964:	350005a0 	cbnz	w0, 206a18 <alloc_rev+0x120>
  206968:	93407ea0 	sxtw	x0, w21
  20696c:	8b000401 	add	x1, x0, x0, lsl #1
  206970:	8b010ee1 	add	x1, x23, x1, lsl #3
  206974:	f9400821 	ldr	x1, [x1, #16]
  206978:	b5000ae1 	cbnz	x1, 206ad4 <alloc_rev+0x1dc>
  20697c:	aa1c03e1 	mov	x1, x28
  206980:	8b000400 	add	x0, x0, x0, lsl #1
  206984:	8b1602f6 	add	x22, x23, x22
  206988:	8b000ee0 	add	x0, x23, x0, lsl #3
  20698c:	a9015816 	stp	x22, x22, [x0, #16]
  206990:	eb01039f 	cmp	x28, x1
  206994:	54000a00 	b.eq	206ad4 <alloc_rev+0x1dc>  // b.none
  206998:	b9400260 	ldr	w0, [x19]
  20699c:	340005e0 	cbz	w0, 206a58 <alloc_rev+0x160>
  2069a0:	d5033bbf 	dmb	ish
  2069a4:	b900027f 	str	wzr, [x19]
  2069a8:	d5033bbf 	dmb	ish
  2069ac:	b9400660 	ldr	w0, [x19, #4]
  2069b0:	34fffba0 	cbz	w0, 206924 <alloc_rev+0x2c>
  2069b4:	d2801e00 	mov	x0, #0xf0                  	// #240
  2069b8:	97fffe52 	bl	206300 <get_rtt_syscall>
  2069bc:	aa0003e3 	mov	x3, x0
  2069c0:	b4fffae0 	cbz	x0, 20691c <alloc_rev+0x24>
  2069c4:	d2800022 	mov	x2, #0x1                   	// #1
  2069c8:	d2801021 	mov	x1, #0x81                  	// #129
  2069cc:	aa1303e0 	mov	x0, x19
  2069d0:	d63f0060 	blr	x3
  2069d4:	b100981f 	cmn	x0, #0x26
  2069d8:	54fffa21 	b.ne	20691c <alloc_rev+0x24>  // b.any
  2069dc:	d2801e00 	mov	x0, #0xf0                  	// #240
  2069e0:	97fffe48 	bl	206300 <get_rtt_syscall>
  2069e4:	aa0003e3 	mov	x3, x0
  2069e8:	b4fff9a0 	cbz	x0, 20691c <alloc_rev+0x24>
  2069ec:	d2800022 	mov	x2, #0x1                   	// #1
  2069f0:	aa1303e0 	mov	x0, x19
  2069f4:	aa0203e1 	mov	x1, x2
  2069f8:	d63f0060 	blr	x3
  2069fc:	17ffffc8 	b	20691c <alloc_rev+0x24>
  206a00:	34000401 	cbz	w1, 206a80 <alloc_rev+0x188>
  206a04:	52800023 	mov	w3, #0x1                   	// #1
  206a08:	aa1803e1 	mov	x1, x24
  206a0c:	2a0303e2 	mov	w2, w3
  206a10:	aa1303e0 	mov	x0, x19
  206a14:	94001369 	bl	20b7b8 <__wait>
  206a18:	885ffe61 	ldaxr	w1, [x19]
  206a1c:	8800fe74 	stlxr	w0, w20, [x19]
  206a20:	34ffff00 	cbz	w0, 206a00 <alloc_rev+0x108>
  206a24:	885ffe61 	ldaxr	w1, [x19]
  206a28:	8800fe74 	stlxr	w0, w20, [x19]
  206a2c:	35ffff60 	cbnz	w0, 206a18 <alloc_rev+0x120>
  206a30:	17fffff4 	b	206a00 <alloc_rev+0x108>
  206a34:	d503201f 	nop
  206a38:	f107febf 	cmp	x21, #0x1ff
  206a3c:	54000328 	b.hi	206aa0 <alloc_rev+0x1a8>  // b.pmore
  206a40:	8b550f75 	add	x21, x27, x21, lsr #3
  206a44:	52800316 	mov	w22, #0x18                  	// #24
  206a48:	385fc2b5 	ldurb	w21, [x21, #-4]
  206a4c:	9bb67eb6 	umull	x22, w21, w22
  206a50:	910022d3 	add	x19, x22, #0x8
  206a54:	17ffffbe 	b	20694c <alloc_rev+0x54>
  206a58:	aa0103fc 	mov	x28, x1
  206a5c:	3607f6bc 	tbz	w28, #0, 206930 <alloc_rev+0x38>
  206a60:	52800000 	mov	w0, #0x0                   	// #0
  206a64:	f9402bfe 	ldr	x30, [sp, #80]
  206a68:	a9415bf5 	ldp	x21, x22, [sp, #16]
  206a6c:	a94263f7 	ldp	x23, x24, [sp, #32]
  206a70:	a9436bf9 	ldp	x25, x26, [sp, #48]
  206a74:	a94473fb 	ldp	x27, x28, [sp, #64]
  206a78:	a8c653f3 	ldp	x19, x20, [sp], #96
  206a7c:	d65f03c0 	ret
  206a80:	93407ea0 	sxtw	x0, w21
  206a84:	f9400321 	ldr	x1, [x25]
  206a88:	8b000402 	add	x2, x0, x0, lsl #1
  206a8c:	8b020ee2 	add	x2, x23, x2, lsl #3
  206a90:	f9400842 	ldr	x2, [x2, #16]
  206a94:	b5fff7e2 	cbnz	x2, 206990 <alloc_rev+0x98>
  206a98:	17ffffba 	b	206980 <alloc_rev+0x88>
  206a9c:	d503201f 	nop
  206aa0:	eb1a02bf 	cmp	x21, x26
  206aa4:	54000108 	b.hi	206ac4 <alloc_rev+0x1cc>  // b.pmore
  206aa8:	8b551f75 	add	x21, x27, x21, lsr #7
  206aac:	52800316 	mov	w22, #0x18                  	// #24
  206ab0:	385fc2b5 	ldurb	w21, [x21, #-4]
  206ab4:	110042b5 	add	w21, w21, #0x10
  206ab8:	9b367eb6 	smull	x22, w21, w22
  206abc:	910022d3 	add	x19, x22, #0x8
  206ac0:	17ffffa3 	b	20694c <alloc_rev+0x54>
  206ac4:	d280bd16 	mov	x22, #0x5e8                 	// #1512
  206ac8:	d280be13 	mov	x19, #0x5f0                 	// #1520
  206acc:	528007f5 	mov	w21, #0x3f                  	// #63
  206ad0:	17ffff9f 	b	20694c <alloc_rev+0x54>
  206ad4:	927ffb80 	and	x0, x28, #0xfffffffffffffffe
  206ad8:	2a1503e1 	mov	w1, w21
  206adc:	cb000320 	sub	x0, x25, x0
  206ae0:	97fffea2 	bl	206568 <unbin>
  206ae4:	b9400260 	ldr	w0, [x19]
  206ae8:	340000c0 	cbz	w0, 206b00 <alloc_rev+0x208>
  206aec:	d5033bbf 	dmb	ish
  206af0:	b900027f 	str	wzr, [x19]
  206af4:	d5033bbf 	dmb	ish
  206af8:	b9400660 	ldr	w0, [x19, #4]
  206afc:	35000120 	cbnz	w0, 206b20 <alloc_rev+0x228>
  206b00:	52800020 	mov	w0, #0x1                   	// #1
  206b04:	a9415bf5 	ldp	x21, x22, [sp, #16]
  206b08:	a94263f7 	ldp	x23, x24, [sp, #32]
  206b0c:	a9436bf9 	ldp	x25, x26, [sp, #48]
  206b10:	a94473fb 	ldp	x27, x28, [sp, #64]
  206b14:	f9402bfe 	ldr	x30, [sp, #80]
  206b18:	a8c653f3 	ldp	x19, x20, [sp], #96
  206b1c:	d65f03c0 	ret
  206b20:	d2801e00 	mov	x0, #0xf0                  	// #240
  206b24:	97fffdf7 	bl	206300 <get_rtt_syscall>
  206b28:	aa0003e3 	mov	x3, x0
  206b2c:	b4fffea0 	cbz	x0, 206b00 <alloc_rev+0x208>
  206b30:	d2800022 	mov	x2, #0x1                   	// #1
  206b34:	d2801021 	mov	x1, #0x81                  	// #129
  206b38:	aa1303e0 	mov	x0, x19
  206b3c:	d63f0060 	blr	x3
  206b40:	b100981f 	cmn	x0, #0x26
  206b44:	54fffde1 	b.ne	206b00 <alloc_rev+0x208>  // b.any
  206b48:	d2801e00 	mov	x0, #0xf0                  	// #240
  206b4c:	97fffded 	bl	206300 <get_rtt_syscall>
  206b50:	aa0003e3 	mov	x3, x0
  206b54:	b4fffd60 	cbz	x0, 206b00 <alloc_rev+0x208>
  206b58:	d2800022 	mov	x2, #0x1                   	// #1
  206b5c:	aa1303e0 	mov	x0, x19
  206b60:	aa0203e1 	mov	x1, x2
  206b64:	d63f0060 	blr	x3
  206b68:	52800020 	mov	w0, #0x1                   	// #1
  206b6c:	17ffffe6 	b	206b04 <alloc_rev+0x20c>

0000000000206b70 <__bin_chunk>:
  206b70:	a9b853f3 	stp	x19, x20, [sp, #-128]!
  206b74:	aa0003f4 	mov	x20, x0
  206b78:	a9015bf5 	stp	x21, x22, [sp, #16]
  206b7c:	a90263f7 	stp	x23, x24, [sp, #32]
  206b80:	a9036bf9 	stp	x25, x26, [sp, #48]
  206b84:	a90473fb 	stp	x27, x28, [sp, #64]
  206b88:	f9002bfe 	str	x30, [sp, #80]
  206b8c:	f9400400 	ldr	x0, [x0, #8]
  206b90:	927ff801 	and	x1, x0, #0xfffffffffffffffe
  206b94:	f9003be1 	str	x1, [sp, #112]
  206b98:	8b010295 	add	x21, x20, x1
  206b9c:	f8616a81 	ldr	x1, [x20, x1]
  206ba0:	eb01001f 	cmp	x0, x1
  206ba4:	54000080 	b.eq	206bb4 <__bin_chunk+0x44>  // b.none
  206ba8:	d2800000 	mov	x0, #0x0                   	// #0
  206bac:	3900001f 	strb	wzr, [x0]
  206bb0:	d4207d00 	brk	#0x3e8
  206bb4:	f0000060 	adrp	x0, 215000 <__data_start__>
  206bb8:	f9403bf6 	ldr	x22, [sp, #112]
  206bbc:	910aa01c 	add	x28, x0, #0x2a8
  206bc0:	f0000079 	adrp	x25, 215000 <__data_start__>
  206bc4:	91183380 	add	x0, x28, #0x60c
  206bc8:	b9007fff 	str	wzr, [sp, #124]
  206bcc:	f90037e0 	str	x0, [sp, #104]
  206bd0:	91182380 	add	x0, x28, #0x608
  206bd4:	f90033e0 	str	x0, [sp, #96]
  206bd8:	f9400280 	ldr	x0, [x20]
  206bdc:	f94006a1 	ldr	x1, [x21, #8]
  206be0:	8a010000 	and	x0, x0, x1
  206be4:	360005c0 	tbz	w0, #0, 206c9c <__bin_chunk+0x12c>
  206be8:	b24002c0 	orr	x0, x22, #0x1
  206bec:	f9000680 	str	x0, [x20, #8]
  206bf0:	d345fed3 	lsr	x19, x22, #5
  206bf4:	f90002a0 	str	x0, [x21]
  206bf8:	d1000673 	sub	x19, x19, #0x1
  206bfc:	f100827f 	cmp	x19, #0x20
  206c00:	54000d08 	b.hi	206da0 <__bin_chunk+0x230>  // b.pmore
  206c04:	8b130677 	add	x23, x19, x19, lsl #1
  206c08:	d37df2f7 	lsl	x23, x23, #3
  206c0c:	910022e4 	add	x4, x23, #0x8
  206c10:	913ba320 	add	x0, x25, #0xee8
  206c14:	8b04039b 	add	x27, x28, x4
  206c18:	5280003a 	mov	w26, #0x1                   	// #1
  206c1c:	91001378 	add	x24, x27, #0x4
  206c20:	b9400c00 	ldr	w0, [x0, #12]
  206c24:	350008e0 	cbnz	w0, 206d40 <__bin_chunk+0x1d0>
  206c28:	93407e78 	sxtw	x24, w19
  206c2c:	8b180700 	add	x0, x24, x24, lsl #1
  206c30:	8b000f80 	add	x0, x28, x0, lsl #3
  206c34:	f9400801 	ldr	x1, [x0, #16]
  206c38:	b5000061 	cbnz	x1, 206c44 <__bin_chunk+0xd4>
  206c3c:	8b170381 	add	x1, x28, x23
  206c40:	a9010401 	stp	x1, x1, [x0, #16]
  206c44:	913ba320 	add	x0, x25, #0xee8
  206c48:	5280003a 	mov	w26, #0x1                   	// #1
  206c4c:	b9400c00 	ldr	w0, [x0, #12]
  206c50:	35000920 	cbnz	w0, 206d74 <__bin_chunk+0x204>
  206c54:	f9400280 	ldr	x0, [x20]
  206c58:	f94006a1 	ldr	x1, [x21, #8]
  206c5c:	8a010000 	and	x0, x0, x1
  206c60:	370011c0 	tbnz	w0, #0, 206e98 <__bin_chunk+0x328>
  206c64:	b9460b80 	ldr	w0, [x28, #1544]
  206c68:	340000c0 	cbz	w0, 206c80 <__bin_chunk+0x110>
  206c6c:	d5033bbf 	dmb	ish
  206c70:	b9060b9f 	str	wzr, [x28, #1544]
  206c74:	d5033bbf 	dmb	ish
  206c78:	b9460f80 	ldr	w0, [x28, #1548]
  206c7c:	35000e60 	cbnz	w0, 206e48 <__bin_chunk+0x2d8>
  206c80:	b9400360 	ldr	w0, [x27]
  206c84:	340000c0 	cbz	w0, 206c9c <__bin_chunk+0x12c>
  206c88:	d5033bbf 	dmb	ish
  206c8c:	b900037f 	str	wzr, [x27]
  206c90:	d5033bbf 	dmb	ish
  206c94:	b9400760 	ldr	w0, [x27, #4]
  206c98:	35000b00 	cbnz	w0, 206df8 <__bin_chunk+0x288>
  206c9c:	aa1403e0 	mov	x0, x20
  206ca0:	97ffff16 	bl	2068f8 <alloc_rev>
  206ca4:	34000200 	cbz	w0, 206ce4 <__bin_chunk+0x174>
  206ca8:	f9400280 	ldr	x0, [x20]
  206cac:	f9403be1 	ldr	x1, [sp, #112]
  206cb0:	927ff800 	and	x0, x0, #0xfffffffffffffffe
  206cb4:	cb000294 	sub	x20, x20, x0
  206cb8:	f9400680 	ldr	x0, [x20, #8]
  206cbc:	927ff800 	and	x0, x0, #0xfffffffffffffffe
  206cc0:	8b000021 	add	x1, x1, x0
  206cc4:	8b0002d6 	add	x22, x22, x0
  206cc8:	f140a03f 	cmp	x1, #0x28, lsl #12
  206ccc:	540000c9 	b.ls	206ce4 <__bin_chunk+0x174>  // b.plast
  206cd0:	ca000021 	eor	x1, x1, x0
  206cd4:	eb00003f 	cmp	x1, x0
  206cd8:	b9407fe0 	ldr	w0, [sp, #124]
  206cdc:	1a9f9400 	csinc	w0, w0, wzr, ls  // ls = plast
  206ce0:	b9007fe0 	str	w0, [sp, #124]
  206ce4:	aa1503e0 	mov	x0, x21
  206ce8:	97fffe66 	bl	206680 <alloc_fwd>
  206cec:	34fff760 	cbz	w0, 206bd8 <__bin_chunk+0x68>
  206cf0:	f94006a0 	ldr	x0, [x21, #8]
  206cf4:	f9403be1 	ldr	x1, [sp, #112]
  206cf8:	927ff800 	and	x0, x0, #0xfffffffffffffffe
  206cfc:	8b000021 	add	x1, x1, x0
  206d00:	8b0002d6 	add	x22, x22, x0
  206d04:	f140a03f 	cmp	x1, #0x28, lsl #12
  206d08:	540000c9 	b.ls	206d20 <__bin_chunk+0x1b0>  // b.plast
  206d0c:	ca000021 	eor	x1, x1, x0
  206d10:	eb00003f 	cmp	x1, x0
  206d14:	b9407fe1 	ldr	w1, [sp, #124]
  206d18:	1a9f9421 	csinc	w1, w1, wzr, ls  // ls = plast
  206d1c:	b9007fe1 	str	w1, [sp, #124]
  206d20:	8b0002b5 	add	x21, x21, x0
  206d24:	17ffffad 	b	206bd8 <__bin_chunk+0x68>
  206d28:	34fff801 	cbz	w1, 206c28 <__bin_chunk+0xb8>
  206d2c:	52800023 	mov	w3, #0x1                   	// #1
  206d30:	aa1803e1 	mov	x1, x24
  206d34:	2a0303e2 	mov	w2, w3
  206d38:	aa1b03e0 	mov	x0, x27
  206d3c:	9400129f 	bl	20b7b8 <__wait>
  206d40:	885fff61 	ldaxr	w1, [x27]
  206d44:	8800ff7a 	stlxr	w0, w26, [x27]
  206d48:	34ffff00 	cbz	w0, 206d28 <__bin_chunk+0x1b8>
  206d4c:	885fff61 	ldaxr	w1, [x27]
  206d50:	8800ff7a 	stlxr	w0, w26, [x27]
  206d54:	35ffff60 	cbnz	w0, 206d40 <__bin_chunk+0x1d0>
  206d58:	17fffff4 	b	206d28 <__bin_chunk+0x1b8>
  206d5c:	d503201f 	nop
  206d60:	34fff7a1 	cbz	w1, 206c54 <__bin_chunk+0xe4>
  206d64:	a94607e0 	ldp	x0, x1, [sp, #96]
  206d68:	52800023 	mov	w3, #0x1                   	// #1
  206d6c:	2a0303e2 	mov	w2, w3
  206d70:	94001292 	bl	20b7b8 <__wait>
  206d74:	91182380 	add	x0, x28, #0x608
  206d78:	885ffc01 	ldaxr	w1, [x0]
  206d7c:	aa0003e2 	mov	x2, x0
  206d80:	8800fc5a 	stlxr	w0, w26, [x2]
  206d84:	34fffee0 	cbz	w0, 206d60 <__bin_chunk+0x1f0>
  206d88:	91182380 	add	x0, x28, #0x608
  206d8c:	885ffc01 	ldaxr	w1, [x0]
  206d90:	aa0003e2 	mov	x2, x0
  206d94:	8800fc5a 	stlxr	w0, w26, [x2]
  206d98:	35fffee0 	cbnz	w0, 206d74 <__bin_chunk+0x204>
  206d9c:	17fffff1 	b	206d60 <__bin_chunk+0x1f0>
  206da0:	f107fe7f 	cmp	x19, #0x1ff
  206da4:	54000128 	b.hi	206dc8 <__bin_chunk+0x258>  // b.pmore
  206da8:	d0000060 	adrp	x0, 214000 <syscall_table+0x800>
  206dac:	9112a000 	add	x0, x0, #0x4a8
  206db0:	8b530c13 	add	x19, x0, x19, lsr #3
  206db4:	52800317 	mov	w23, #0x18                  	// #24
  206db8:	385fc273 	ldurb	w19, [x19, #-4]
  206dbc:	9bb77e77 	umull	x23, w19, w23
  206dc0:	910022e4 	add	x4, x23, #0x8
  206dc4:	17ffff93 	b	206c10 <__bin_chunk+0xa0>
  206dc8:	d2838000 	mov	x0, #0x1c00                	// #7168
  206dcc:	eb00027f 	cmp	x19, x0
  206dd0:	54000f88 	b.hi	206fc0 <__bin_chunk+0x450>  // b.pmore
  206dd4:	d0000060 	adrp	x0, 214000 <syscall_table+0x800>
  206dd8:	9112a000 	add	x0, x0, #0x4a8
  206ddc:	8b531c13 	add	x19, x0, x19, lsr #7
  206de0:	52800317 	mov	w23, #0x18                  	// #24
  206de4:	385fc273 	ldurb	w19, [x19, #-4]
  206de8:	11004273 	add	w19, w19, #0x10
  206dec:	9b377e77 	smull	x23, w19, w23
  206df0:	910022e4 	add	x4, x23, #0x8
  206df4:	17ffff87 	b	206c10 <__bin_chunk+0xa0>
  206df8:	d2801e00 	mov	x0, #0xf0                  	// #240
  206dfc:	97fffd41 	bl	206300 <get_rtt_syscall>
  206e00:	aa0003e3 	mov	x3, x0
  206e04:	b4fff4c0 	cbz	x0, 206c9c <__bin_chunk+0x12c>
  206e08:	d2800022 	mov	x2, #0x1                   	// #1
  206e0c:	d2801021 	mov	x1, #0x81                  	// #129
  206e10:	aa1b03e0 	mov	x0, x27
  206e14:	d63f0060 	blr	x3
  206e18:	b100981f 	cmn	x0, #0x26
  206e1c:	54fff401 	b.ne	206c9c <__bin_chunk+0x12c>  // b.any
  206e20:	d2801e00 	mov	x0, #0xf0                  	// #240
  206e24:	97fffd37 	bl	206300 <get_rtt_syscall>
  206e28:	aa0003e3 	mov	x3, x0
  206e2c:	b4fff380 	cbz	x0, 206c9c <__bin_chunk+0x12c>
  206e30:	d2800022 	mov	x2, #0x1                   	// #1
  206e34:	aa1b03e0 	mov	x0, x27
  206e38:	aa0203e1 	mov	x1, x2
  206e3c:	d63f0060 	blr	x3
  206e40:	17ffff97 	b	206c9c <__bin_chunk+0x12c>
  206e44:	d503201f 	nop
  206e48:	d2801e00 	mov	x0, #0xf0                  	// #240
  206e4c:	97fffd2d 	bl	206300 <get_rtt_syscall>
  206e50:	aa0003e3 	mov	x3, x0
  206e54:	b4fff160 	cbz	x0, 206c80 <__bin_chunk+0x110>
  206e58:	f94033e0 	ldr	x0, [sp, #96]
  206e5c:	d2800022 	mov	x2, #0x1                   	// #1
  206e60:	d2801021 	mov	x1, #0x81                  	// #129
  206e64:	d63f0060 	blr	x3
  206e68:	b100981f 	cmn	x0, #0x26
  206e6c:	54fff0a1 	b.ne	206c80 <__bin_chunk+0x110>  // b.any
  206e70:	d2801e00 	mov	x0, #0xf0                  	// #240
  206e74:	97fffd23 	bl	206300 <get_rtt_syscall>
  206e78:	aa0003e3 	mov	x3, x0
  206e7c:	b4fff020 	cbz	x0, 206c80 <__bin_chunk+0x110>
  206e80:	f94033e0 	ldr	x0, [sp, #96]
  206e84:	d2800022 	mov	x2, #0x1                   	// #1
  206e88:	aa0203e1 	mov	x1, x2
  206e8c:	d63f0060 	blr	x3
  206e90:	17ffff7c 	b	206c80 <__bin_chunk+0x110>
  206e94:	d503201f 	nop
  206e98:	f0000060 	adrp	x0, 215000 <__data_start__>
  206e9c:	f9415400 	ldr	x0, [x0, #680]
  206ea0:	9ad32400 	lsr	x0, x0, x19
  206ea4:	370002e0 	tbnz	w0, #0, 206f00 <__bin_chunk+0x390>
  206ea8:	d2800020 	mov	x0, #0x1                   	// #1
  206eac:	9ad32013 	lsl	x19, x0, x19
  206eb0:	34000153 	cbz	w19, 206ed8 <__bin_chunk+0x368>
  206eb4:	2a1303e2 	mov	w2, w19
  206eb8:	f0000060 	adrp	x0, 215000 <__data_start__>
  206ebc:	910aa000 	add	x0, x0, #0x2a8
  206ec0:	885ffc00 	ldaxr	w0, [x0]
  206ec4:	f0000061 	adrp	x1, 215000 <__data_start__>
  206ec8:	2a000040 	orr	w0, w2, w0
  206ecc:	910aa023 	add	x3, x1, #0x2a8
  206ed0:	8801fc60 	stlxr	w1, w0, [x3]
  206ed4:	35ffff21 	cbnz	w1, 206eb8 <__bin_chunk+0x348>
  206ed8:	d360fe61 	lsr	x1, x19, #32
  206edc:	b4000121 	cbz	x1, 206f00 <__bin_chunk+0x390>
  206ee0:	f0000060 	adrp	x0, 215000 <__data_start__>
  206ee4:	910aa002 	add	x2, x0, #0x2a8
  206ee8:	91001040 	add	x0, x2, #0x4
  206eec:	885ffc00 	ldaxr	w0, [x0]
  206ef0:	2a000020 	orr	w0, w1, w0
  206ef4:	91001044 	add	x4, x2, #0x4
  206ef8:	8803fc80 	stlxr	w3, w0, [x4]
  206efc:	35ffff63 	cbnz	w3, 206ee8 <__bin_chunk+0x378>
  206f00:	f0000060 	adrp	x0, 215000 <__data_start__>
  206f04:	910aa000 	add	x0, x0, #0x2a8
  206f08:	b9460801 	ldr	w1, [x0, #1544]
  206f0c:	f9000696 	str	x22, [x20, #8]
  206f10:	f90002b6 	str	x22, [x21]
  206f14:	340000c1 	cbz	w1, 206f2c <__bin_chunk+0x3bc>
  206f18:	d5033bbf 	dmb	ish
  206f1c:	b906081f 	str	wzr, [x0, #1544]
  206f20:	d5033bbf 	dmb	ish
  206f24:	b9460c01 	ldr	w1, [x0, #1548]
  206f28:	35000841 	cbnz	w1, 207030 <__bin_chunk+0x4c0>
  206f2c:	f0000060 	adrp	x0, 215000 <__data_start__>
  206f30:	8b180718 	add	x24, x24, x24, lsl #1
  206f34:	910aa001 	add	x1, x0, #0x2a8
  206f38:	8b180c20 	add	x0, x1, x24, lsl #3
  206f3c:	8b170037 	add	x23, x1, x23
  206f40:	f9400c00 	ldr	x0, [x0, #24]
  206f44:	a9010297 	stp	x23, x0, [x20, #16]
  206f48:	f9000ef4 	str	x20, [x23, #24]
  206f4c:	f9400e80 	ldr	x0, [x20, #24]
  206f50:	f9000814 	str	x20, [x0, #16]
  206f54:	b9407fe0 	ldr	w0, [sp, #124]
  206f58:	34000180 	cbz	w0, 206f88 <__bin_chunk+0x418>
  206f5c:	913ba339 	add	x25, x25, #0xee8
  206f60:	d10082a1 	sub	x1, x21, #0x20
  206f64:	52800082 	mov	w2, #0x4                   	// #4
  206f68:	f9401f20 	ldr	x0, [x25, #56]
  206f6c:	cb0003e3 	neg	x3, x0
  206f70:	91007c05 	add	x5, x0, #0x1f
  206f74:	8b050280 	add	x0, x20, x5
  206f78:	8a030021 	and	x1, x1, x3
  206f7c:	8a030000 	and	x0, x0, x3
  206f80:	cb000021 	sub	x1, x1, x0
  206f84:	940002a3 	bl	207a10 <__madvise>
  206f88:	b9400360 	ldr	w0, [x27]
  206f8c:	340000c0 	cbz	w0, 206fa4 <__bin_chunk+0x434>
  206f90:	d5033bbf 	dmb	ish
  206f94:	b900037f 	str	wzr, [x27]
  206f98:	d5033bbf 	dmb	ish
  206f9c:	b9400760 	ldr	w0, [x27, #4]
  206fa0:	35000180 	cbnz	w0, 206fd0 <__bin_chunk+0x460>
  206fa4:	a9415bf5 	ldp	x21, x22, [sp, #16]
  206fa8:	a94263f7 	ldp	x23, x24, [sp, #32]
  206fac:	a9436bf9 	ldp	x25, x26, [sp, #48]
  206fb0:	a94473fb 	ldp	x27, x28, [sp, #64]
  206fb4:	f9402bfe 	ldr	x30, [sp, #80]
  206fb8:	a8c853f3 	ldp	x19, x20, [sp], #128
  206fbc:	d65f03c0 	ret
  206fc0:	d280bd17 	mov	x23, #0x5e8                 	// #1512
  206fc4:	d280be04 	mov	x4, #0x5f0                 	// #1520
  206fc8:	528007f3 	mov	w19, #0x3f                  	// #63
  206fcc:	17ffff11 	b	206c10 <__bin_chunk+0xa0>
  206fd0:	d2801e00 	mov	x0, #0xf0                  	// #240
  206fd4:	97fffccb 	bl	206300 <get_rtt_syscall>
  206fd8:	aa0003e3 	mov	x3, x0
  206fdc:	b4fffe40 	cbz	x0, 206fa4 <__bin_chunk+0x434>
  206fe0:	d2800022 	mov	x2, #0x1                   	// #1
  206fe4:	d2801021 	mov	x1, #0x81                  	// #129
  206fe8:	aa1b03e0 	mov	x0, x27
  206fec:	d63f0060 	blr	x3
  206ff0:	b100981f 	cmn	x0, #0x26
  206ff4:	54fffd81 	b.ne	206fa4 <__bin_chunk+0x434>  // b.any
  206ff8:	d2801e00 	mov	x0, #0xf0                  	// #240
  206ffc:	97fffcc1 	bl	206300 <get_rtt_syscall>
  207000:	aa0003e3 	mov	x3, x0
  207004:	b4fffd00 	cbz	x0, 206fa4 <__bin_chunk+0x434>
  207008:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20700c:	aa1b03e0 	mov	x0, x27
  207010:	a94263f7 	ldp	x23, x24, [sp, #32]
  207014:	d2800022 	mov	x2, #0x1                   	// #1
  207018:	a9436bf9 	ldp	x25, x26, [sp, #48]
  20701c:	aa0203e1 	mov	x1, x2
  207020:	a94473fb 	ldp	x27, x28, [sp, #64]
  207024:	f9402bfe 	ldr	x30, [sp, #80]
  207028:	a8c853f3 	ldp	x19, x20, [sp], #128
  20702c:	d61f0060 	br	x3
  207030:	91182013 	add	x19, x0, #0x608
  207034:	d2801e00 	mov	x0, #0xf0                  	// #240
  207038:	97fffcb2 	bl	206300 <get_rtt_syscall>
  20703c:	aa0003e3 	mov	x3, x0
  207040:	b4fff760 	cbz	x0, 206f2c <__bin_chunk+0x3bc>
  207044:	d2800022 	mov	x2, #0x1                   	// #1
  207048:	d2801021 	mov	x1, #0x81                  	// #129
  20704c:	aa1303e0 	mov	x0, x19
  207050:	d63f0060 	blr	x3
  207054:	b100981f 	cmn	x0, #0x26
  207058:	54fff6a1 	b.ne	206f2c <__bin_chunk+0x3bc>  // b.any
  20705c:	d2801e00 	mov	x0, #0xf0                  	// #240
  207060:	97fffca8 	bl	206300 <get_rtt_syscall>
  207064:	aa0003e3 	mov	x3, x0
  207068:	b4fff620 	cbz	x0, 206f2c <__bin_chunk+0x3bc>
  20706c:	d2800022 	mov	x2, #0x1                   	// #1
  207070:	aa1303e0 	mov	x0, x19
  207074:	aa0203e1 	mov	x1, x2
  207078:	d63f0060 	blr	x3
  20707c:	17ffffac 	b	206f2c <__bin_chunk+0x3bc>

0000000000207080 <trim>:
  207080:	f9400402 	ldr	x2, [x0, #8]
  207084:	aa0003e3 	mov	x3, x0
  207088:	927ff842 	and	x2, x2, #0xfffffffffffffffe
  20708c:	d1004040 	sub	x0, x2, #0x10
  207090:	eb01001f 	cmp	x0, x1
  207094:	54000068 	b.hi	2070a0 <trim+0x20>  // b.pmore
  207098:	d65f03c0 	ret
  20709c:	d503201f 	nop
  2070a0:	8b010065 	add	x5, x3, x1
  2070a4:	b2400024 	orr	x4, x1, #0x1
  2070a8:	cb010040 	sub	x0, x2, x1
  2070ac:	f8216864 	str	x4, [x3, x1]
  2070b0:	b2400001 	orr	x1, x0, #0x1
  2070b4:	aa0503e0 	mov	x0, x5
  2070b8:	f90004a1 	str	x1, [x5, #8]
  2070bc:	f8226861 	str	x1, [x3, x2]
  2070c0:	f9000464 	str	x4, [x3, #8]
  2070c4:	17fffeab 	b	206b70 <__bin_chunk>

00000000002070c8 <malloc>:
  2070c8:	a9b853f3 	stp	x19, x20, [sp, #-128]!
  2070cc:	910203e1 	add	x1, sp, #0x80
  2070d0:	f9002bfe 	str	x30, [sp, #80]
  2070d4:	f81e8c20 	str	x0, [x1, #-24]!
  2070d8:	aa0103e0 	mov	x0, x1
  2070dc:	97fffd4b 	bl	206608 <adjust_size>
  2070e0:	37f81fc0 	tbnz	w0, #31, 2074d8 <malloc+0x410>
  2070e4:	f94037e1 	ldr	x1, [sp, #104]
  2070e8:	f140e03f 	cmp	x1, #0x38, lsl #12
  2070ec:	54001348 	b.hi	207354 <malloc+0x28c>  // b.pmore
  2070f0:	a90473fb 	stp	x27, x28, [sp, #64]
  2070f4:	d345fc21 	lsr	x1, x1, #5
  2070f8:	a9015bf5 	stp	x21, x22, [sp, #16]
  2070fc:	d100043b 	sub	x27, x1, #0x1
  207100:	a90263f7 	stp	x23, x24, [sp, #32]
  207104:	f100837f 	cmp	x27, #0x20
  207108:	a9036bf9 	stp	x25, x26, [sp, #48]
  20710c:	54000728 	b.hi	2071f0 <malloc+0x128>  // b.pmore
  207110:	b90067fb 	str	w27, [sp, #100]
  207114:	d0000060 	adrp	x0, 215000 <__data_start__>
  207118:	913ba01a 	add	x26, x0, #0xee8
  20711c:	394193e0 	ldrb	w0, [sp, #100]
  207120:	92800016 	mov	x22, #0xffffffffffffffff    	// #-1
  207124:	d0000066 	adrp	x6, 215000 <__data_start__>
  207128:	910aa0db 	add	x27, x6, #0x2a8
  20712c:	52800319 	mov	w25, #0x18                  	// #24
  207130:	9ac022d6 	lsl	x22, x22, x0
  207134:	5280003c 	mov	w28, #0x1                   	// #1
  207138:	f9400365 	ldr	x5, [x27]
  20713c:	ea1600a5 	ands	x5, x5, x22
  207140:	540008c0 	b.eq	207258 <malloc+0x190>  // b.none
  207144:	dac000b8 	rbit	x24, x5
  207148:	dac01318 	clz	x24, x24
  20714c:	b9400f40 	ldr	w0, [x26, #12]
  207150:	9b397f14 	smull	x20, w24, w25
  207154:	b90063f8 	str	w24, [sp, #96]
  207158:	91002295 	add	x21, x20, #0x8
  20715c:	8b150373 	add	x19, x27, x21
  207160:	91001277 	add	x23, x19, #0x4
  207164:	35000660 	cbnz	w0, 207230 <malloc+0x168>
  207168:	93407f05 	sxtw	x5, w24
  20716c:	8b140374 	add	x20, x27, x20
  207170:	8b0504a5 	add	x5, x5, x5, lsl #1
  207174:	8b050f65 	add	x5, x27, x5, lsl #3
  207178:	f94008b7 	ldr	x23, [x5, #16]
  20717c:	b40006b7 	cbz	x23, 207250 <malloc+0x188>
  207180:	eb17029f 	cmp	x20, x23
  207184:	54001161 	b.ne	2073b0 <malloc+0x2e8>  // b.any
  207188:	b8756b60 	ldr	w0, [x27, x21]
  20718c:	34fffd60 	cbz	w0, 207138 <malloc+0x70>
  207190:	d5033bbf 	dmb	ish
  207194:	b900027f 	str	wzr, [x19]
  207198:	d5033bbf 	dmb	ish
  20719c:	b9400660 	ldr	w0, [x19, #4]
  2071a0:	34fffca0 	cbz	w0, 207134 <malloc+0x6c>
  2071a4:	d2801e00 	mov	x0, #0xf0                  	// #240
  2071a8:	97fffc56 	bl	206300 <get_rtt_syscall>
  2071ac:	aa0003e3 	mov	x3, x0
  2071b0:	b4fffc20 	cbz	x0, 207134 <malloc+0x6c>
  2071b4:	d2800022 	mov	x2, #0x1                   	// #1
  2071b8:	d2801021 	mov	x1, #0x81                  	// #129
  2071bc:	aa1303e0 	mov	x0, x19
  2071c0:	d63f0060 	blr	x3
  2071c4:	b100981f 	cmn	x0, #0x26
  2071c8:	54fffb61 	b.ne	207134 <malloc+0x6c>  // b.any
  2071cc:	d2801e00 	mov	x0, #0xf0                  	// #240
  2071d0:	97fffc4c 	bl	206300 <get_rtt_syscall>
  2071d4:	aa0003e3 	mov	x3, x0
  2071d8:	b4fffae0 	cbz	x0, 207134 <malloc+0x6c>
  2071dc:	d2800022 	mov	x2, #0x1                   	// #1
  2071e0:	aa1303e0 	mov	x0, x19
  2071e4:	aa0203e1 	mov	x1, x2
  2071e8:	d63f0060 	blr	x3
  2071ec:	17ffffd2 	b	207134 <malloc+0x6c>
  2071f0:	d1000821 	sub	x1, x1, #0x2
  2071f4:	b0000060 	adrp	x0, 214000 <syscall_table+0x800>
  2071f8:	f107fc3f 	cmp	x1, #0x1ff
  2071fc:	9112a000 	add	x0, x0, #0x4a8
  207200:	54001288 	b.hi	207450 <malloc+0x388>  // b.pmore
  207204:	8b410c01 	add	x1, x0, x1, lsr #3
  207208:	385fc03b 	ldurb	w27, [x1, #-4]
  20720c:	11000760 	add	w0, w27, #0x1
  207210:	b90067e0 	str	w0, [sp, #100]
  207214:	17ffffc0 	b	207114 <malloc+0x4c>
  207218:	34fffa81 	cbz	w1, 207168 <malloc+0xa0>
  20721c:	52800023 	mov	w3, #0x1                   	// #1
  207220:	aa1703e1 	mov	x1, x23
  207224:	2a0303e2 	mov	w2, w3
  207228:	aa1303e0 	mov	x0, x19
  20722c:	94001163 	bl	20b7b8 <__wait>
  207230:	885ffe61 	ldaxr	w1, [x19]
  207234:	8800fe7c 	stlxr	w0, w28, [x19]
  207238:	34ffff00 	cbz	w0, 207218 <malloc+0x150>
  20723c:	885ffe61 	ldaxr	w1, [x19]
  207240:	8800fe7c 	stlxr	w0, w28, [x19]
  207244:	35ffff60 	cbnz	w0, 207230 <malloc+0x168>
  207248:	17fffff4 	b	207218 <malloc+0x150>
  20724c:	d503201f 	nop
  207250:	a90150b4 	stp	x20, x20, [x5, #16]
  207254:	17ffffcd 	b	207188 <malloc+0xc0>
  207258:	d0000060 	adrp	x0, 215000 <__data_start__>
  20725c:	913ba01c 	add	x28, x0, #0xee8
  207260:	f94037e0 	ldr	x0, [sp, #104]
  207264:	d0000075 	adrp	x21, 215000 <__data_start__>
  207268:	91008000 	add	x0, x0, #0x20
  20726c:	f9003fe0 	str	x0, [sp, #120]
  207270:	b9400f80 	ldr	w0, [x28, #12]
  207274:	35001100 	cbnz	w0, 207494 <malloc+0x3cc>
  207278:	9101e3e0 	add	x0, sp, #0x78
  20727c:	94001755 	bl	20cfd0 <__expand_heap>
  207280:	aa0003f3 	mov	x19, x0
  207284:	b4001980 	cbz	x0, 2075b4 <malloc+0x4ec>
  207288:	d0000062 	adrp	x2, 215000 <__data_start__>
  20728c:	f9414c54 	ldr	x20, [x2, #664]
  207290:	eb14001f 	cmp	x0, x20
  207294:	f9403fe0 	ldr	x0, [sp, #120]
  207298:	540000c0 	b.eq	2072b0 <malloc+0x1e8>  // b.none
  20729c:	91008274 	add	x20, x19, #0x20
  2072a0:	d1008000 	sub	x0, x0, #0x20
  2072a4:	d2800021 	mov	x1, #0x1                   	// #1
  2072a8:	f9003fe0 	str	x0, [sp, #120]
  2072ac:	f9000a61 	str	x1, [x19, #16]
  2072b0:	8b000281 	add	x1, x20, x0
  2072b4:	b942a2a3 	ldr	w3, [x21, #672]
  2072b8:	b2400000 	orr	x0, x0, #0x1
  2072bc:	d2800033 	mov	x19, #0x1                   	// #1
  2072c0:	f9014c41 	str	x1, [x2, #664]
  2072c4:	d1004297 	sub	x23, x20, #0x10
  2072c8:	a93f4c20 	stp	x0, x19, [x1, #-16]
  2072cc:	910a82b6 	add	x22, x21, #0x2a0
  2072d0:	f81f8280 	stur	x0, [x20, #-8]
  2072d4:	34000203 	cbz	w3, 207314 <malloc+0x24c>
  2072d8:	d5033bbf 	dmb	ish
  2072dc:	b902a2bf 	str	wzr, [x21, #672]
  2072e0:	d5033bbf 	dmb	ish
  2072e4:	b94006c0 	ldr	w0, [x22, #4]
  2072e8:	34000160 	cbz	w0, 207314 <malloc+0x24c>
  2072ec:	d2801e00 	mov	x0, #0xf0                  	// #240
  2072f0:	97fffc04 	bl	206300 <get_rtt_syscall>
  2072f4:	aa0003e3 	mov	x3, x0
  2072f8:	b40000e0 	cbz	x0, 207314 <malloc+0x24c>
  2072fc:	aa1303e2 	mov	x2, x19
  207300:	d2801021 	mov	x1, #0x81                  	// #129
  207304:	aa1603e0 	mov	x0, x22
  207308:	d63f0060 	blr	x3
  20730c:	b100981f 	cmn	x0, #0x26
  207310:	54001340 	b.eq	207578 <malloc+0x4b0>  // b.none
  207314:	b4000db7 	cbz	x23, 2074c8 <malloc+0x400>
  207318:	aa1703e0 	mov	x0, x23
  20731c:	97fffd77 	bl	2068f8 <alloc_rev>
  207320:	35000a20 	cbnz	w0, 207464 <malloc+0x39c>
  207324:	f94037e1 	ldr	x1, [sp, #104]
  207328:	aa1703e0 	mov	x0, x23
  20732c:	910042f3 	add	x19, x23, #0x10
  207330:	97ffff54 	bl	207080 <trim>
  207334:	a9415bf5 	ldp	x21, x22, [sp, #16]
  207338:	a94263f7 	ldp	x23, x24, [sp, #32]
  20733c:	a9436bf9 	ldp	x25, x26, [sp, #48]
  207340:	a94473fb 	ldp	x27, x28, [sp, #64]
  207344:	aa1303e0 	mov	x0, x19
  207348:	f9402bfe 	ldr	x30, [sp, #80]
  20734c:	a8c853f3 	ldp	x19, x20, [sp], #128
  207350:	d65f03c0 	ret
  207354:	d0000060 	adrp	x0, 215000 <__data_start__>
  207358:	d2800005 	mov	x5, #0x0                   	// #0
  20735c:	12800004 	mov	w4, #0xffffffff            	// #-1
  207360:	52800443 	mov	w3, #0x22                  	// #34
  207364:	f9479006 	ldr	x6, [x0, #3872]
  207368:	52800062 	mov	w2, #0x3                   	// #3
  20736c:	d2800000 	mov	x0, #0x0                   	// #0
  207370:	8b060033 	add	x19, x1, x6
  207374:	cb0603e6 	neg	x6, x6
  207378:	91003e73 	add	x19, x19, #0xf
  20737c:	8a060273 	and	x19, x19, x6
  207380:	aa1303e1 	mov	x1, x19
  207384:	940001b9 	bl	207a68 <__mmap>
  207388:	b100041f 	cmn	x0, #0x1
  20738c:	54000a60 	b.eq	2074d8 <malloc+0x410>  // b.none
  207390:	d1004273 	sub	x19, x19, #0x10
  207394:	d2800201 	mov	x1, #0x10                  	// #16
  207398:	a9014c01 	stp	x1, x19, [x0, #16]
  20739c:	91008013 	add	x19, x0, #0x20
  2073a0:	aa1303e0 	mov	x0, x19
  2073a4:	f9402bfe 	ldr	x30, [sp, #80]
  2073a8:	a8c853f3 	ldp	x19, x20, [sp], #128
  2073ac:	d65f03c0 	ret
  2073b0:	b94063e0 	ldr	w0, [sp, #96]
  2073b4:	71009c1f 	cmp	w0, #0x27
  2073b8:	5400010d 	b.le	2073d8 <malloc+0x310>
  2073bc:	b94067e1 	ldr	w1, [sp, #100]
  2073c0:	f94037e2 	ldr	x2, [sp, #104]
  2073c4:	1100083b 	add	w27, w1, #0x2
  2073c8:	6b1b001f 	cmp	w0, w27
  2073cc:	540008ac 	b.gt	2074e0 <malloc+0x418>
  2073d0:	7100fc1f 	cmp	w0, #0x3f
  2073d4:	54000e40 	b.eq	20759c <malloc+0x4d4>  // b.none
  2073d8:	b94063e1 	ldr	w1, [sp, #96]
  2073dc:	aa1703e0 	mov	x0, x23
  2073e0:	97fffc62 	bl	206568 <unbin>
  2073e4:	b9400260 	ldr	w0, [x19]
  2073e8:	34fff9e0 	cbz	w0, 207324 <malloc+0x25c>
  2073ec:	d5033bbf 	dmb	ish
  2073f0:	b900027f 	str	wzr, [x19]
  2073f4:	d5033bbf 	dmb	ish
  2073f8:	b9400660 	ldr	w0, [x19, #4]
  2073fc:	34fff940 	cbz	w0, 207324 <malloc+0x25c>
  207400:	d2801e00 	mov	x0, #0xf0                  	// #240
  207404:	97fffbbf 	bl	206300 <get_rtt_syscall>
  207408:	aa0003e3 	mov	x3, x0
  20740c:	b4fff8c0 	cbz	x0, 207324 <malloc+0x25c>
  207410:	d2800022 	mov	x2, #0x1                   	// #1
  207414:	d2801021 	mov	x1, #0x81                  	// #129
  207418:	aa1303e0 	mov	x0, x19
  20741c:	d63f0060 	blr	x3
  207420:	b100981f 	cmn	x0, #0x26
  207424:	54fff801 	b.ne	207324 <malloc+0x25c>  // b.any
  207428:	d2801e00 	mov	x0, #0xf0                  	// #240
  20742c:	97fffbb5 	bl	206300 <get_rtt_syscall>
  207430:	aa0003e3 	mov	x3, x0
  207434:	b4fff780 	cbz	x0, 207324 <malloc+0x25c>
  207438:	d2800022 	mov	x2, #0x1                   	// #1
  20743c:	aa1303e0 	mov	x0, x19
  207440:	aa0203e1 	mov	x1, x2
  207444:	d63f0060 	blr	x3
  207448:	17ffffb7 	b	207324 <malloc+0x25c>
  20744c:	d503201f 	nop
  207450:	8b411c01 	add	x1, x0, x1, lsr #7
  207454:	385fc03b 	ldurb	w27, [x1, #-4]
  207458:	11004760 	add	w0, w27, #0x11
  20745c:	b90067e0 	str	w0, [sp, #100]
  207460:	17ffff2d 	b	207114 <malloc+0x4c>
  207464:	a97f0a80 	ldp	x0, x2, [x20, #-16]
  207468:	927ff800 	and	x0, x0, #0xfffffffffffffffe
  20746c:	cb0002e0 	sub	x0, x23, x0
  207470:	f9400401 	ldr	x1, [x0, #8]
  207474:	927ff821 	and	x1, x1, #0xfffffffffffffffe
  207478:	8b020021 	add	x1, x1, x2
  20747c:	f9000401 	str	x1, [x0, #8]
  207480:	f85f8282 	ldur	x2, [x20, #-8]
  207484:	927ff842 	and	x2, x2, #0xfffffffffffffffe
  207488:	f8226ae1 	str	x1, [x23, x2]
  20748c:	aa0003f7 	mov	x23, x0
  207490:	17ffffa5 	b	207324 <malloc+0x25c>
  207494:	910a82b3 	add	x19, x21, #0x2a0
  207498:	52800034 	mov	w20, #0x1                   	// #1
  20749c:	91001276 	add	x22, x19, #0x4
  2074a0:	885ffe61 	ldaxr	w1, [x19]
  2074a4:	8800fe74 	stlxr	w0, w20, [x19]
  2074a8:	35ffffc0 	cbnz	w0, 2074a0 <malloc+0x3d8>
  2074ac:	34ffee61 	cbz	w1, 207278 <malloc+0x1b0>
  2074b0:	52800023 	mov	w3, #0x1                   	// #1
  2074b4:	aa1603e1 	mov	x1, x22
  2074b8:	2a0303e2 	mov	w2, w3
  2074bc:	aa1303e0 	mov	x0, x19
  2074c0:	940010be 	bl	20b7b8 <__wait>
  2074c4:	17fffff7 	b	2074a0 <malloc+0x3d8>
  2074c8:	a9415bf5 	ldp	x21, x22, [sp, #16]
  2074cc:	a94263f7 	ldp	x23, x24, [sp, #32]
  2074d0:	a9436bf9 	ldp	x25, x26, [sp, #48]
  2074d4:	a94473fb 	ldp	x27, x28, [sp, #64]
  2074d8:	d2800013 	mov	x19, #0x0                   	// #0
  2074dc:	17ffff9a 	b	207344 <malloc+0x27c>
  2074e0:	f94006e1 	ldr	x1, [x23, #8]
  2074e4:	927ff821 	and	x1, x1, #0xfffffffffffffffe
  2074e8:	cb020023 	sub	x3, x1, x2
  2074ec:	d345fc60 	lsr	x0, x3, #5
  2074f0:	d1000400 	sub	x0, x0, #0x1
  2074f4:	f100801f 	cmp	x0, #0x20
  2074f8:	54fff709 	b.ls	2073d8 <malloc+0x310>  // b.plast
  2074fc:	f107fc1f 	cmp	x0, #0x1ff
  207500:	54000329 	b.ls	207564 <malloc+0x49c>  // b.plast
  207504:	d2838005 	mov	x5, #0x1c00                	// #7168
  207508:	528007e4 	mov	w4, #0x3f                  	// #63
  20750c:	eb05001f 	cmp	x0, x5
  207510:	540000c8 	b.hi	207528 <malloc+0x460>  // b.pmore
  207514:	b0000064 	adrp	x4, 214000 <syscall_table+0x800>
  207518:	9112a084 	add	x4, x4, #0x4a8
  20751c:	8b401c80 	add	x0, x4, x0, lsr #7
  207520:	385fc004 	ldurb	w4, [x0, #-4]
  207524:	11004084 	add	w4, w4, #0x10
  207528:	b94063e0 	ldr	w0, [sp, #96]
  20752c:	6b04001f 	cmp	w0, w4
  207530:	54fff541 	b.ne	2073d8 <malloc+0x310>  // b.any
  207534:	a94116e6 	ldp	x6, x5, [x23, #16]
  207538:	8b0202e0 	add	x0, x23, x2
  20753c:	b2400044 	orr	x4, x2, #0x1
  207540:	a9011406 	stp	x6, x5, [x0, #16]
  207544:	f90008a0 	str	x0, [x5, #16]
  207548:	f9400805 	ldr	x5, [x0, #16]
  20754c:	f9000ca0 	str	x0, [x5, #24]
  207550:	f8226ae4 	str	x4, [x23, x2]
  207554:	f9000403 	str	x3, [x0, #8]
  207558:	f8216ae3 	str	x3, [x23, x1]
  20755c:	f90006e4 	str	x4, [x23, #8]
  207560:	17ffffa1 	b	2073e4 <malloc+0x31c>
  207564:	b0000064 	adrp	x4, 214000 <syscall_table+0x800>
  207568:	9112a084 	add	x4, x4, #0x4a8
  20756c:	8b400c80 	add	x0, x4, x0, lsr #3
  207570:	385fc004 	ldurb	w4, [x0, #-4]
  207574:	17ffffed 	b	207528 <malloc+0x460>
  207578:	d2801e00 	mov	x0, #0xf0                  	// #240
  20757c:	97fffb61 	bl	206300 <get_rtt_syscall>
  207580:	aa0003e3 	mov	x3, x0
  207584:	b4ffec80 	cbz	x0, 207314 <malloc+0x24c>
  207588:	aa1303e2 	mov	x2, x19
  20758c:	aa1303e1 	mov	x1, x19
  207590:	aa1603e0 	mov	x0, x22
  207594:	d63f0060 	blr	x3
  207598:	17ffff5f 	b	207314 <malloc+0x24c>
  20759c:	f94006e1 	ldr	x1, [x23, #8]
  2075a0:	927ff821 	and	x1, x1, #0xfffffffffffffffe
  2075a4:	cb020023 	sub	x3, x1, x2
  2075a8:	f140e07f 	cmp	x3, #0x38, lsl #12
  2075ac:	54fffa08 	b.hi	2074ec <malloc+0x424>  // b.pmore
  2075b0:	17ffff8a 	b	2073d8 <malloc+0x310>
  2075b4:	b942a2a0 	ldr	w0, [x21, #672]
  2075b8:	910a82b4 	add	x20, x21, #0x2a0
  2075bc:	34fff860 	cbz	w0, 2074c8 <malloc+0x400>
  2075c0:	d5033bbf 	dmb	ish
  2075c4:	b902a2bf 	str	wzr, [x21, #672]
  2075c8:	d5033bbf 	dmb	ish
  2075cc:	b9400680 	ldr	w0, [x20, #4]
  2075d0:	34fff7c0 	cbz	w0, 2074c8 <malloc+0x400>
  2075d4:	d2801e00 	mov	x0, #0xf0                  	// #240
  2075d8:	97fffb4a 	bl	206300 <get_rtt_syscall>
  2075dc:	aa0003e3 	mov	x3, x0
  2075e0:	b4fff740 	cbz	x0, 2074c8 <malloc+0x400>
  2075e4:	d2800022 	mov	x2, #0x1                   	// #1
  2075e8:	d2801021 	mov	x1, #0x81                  	// #129
  2075ec:	aa1403e0 	mov	x0, x20
  2075f0:	d63f0060 	blr	x3
  2075f4:	b100981f 	cmn	x0, #0x26
  2075f8:	54fff681 	b.ne	2074c8 <malloc+0x400>  // b.any
  2075fc:	d2801e00 	mov	x0, #0xf0                  	// #240
  207600:	97fffb40 	bl	206300 <get_rtt_syscall>
  207604:	aa0003e3 	mov	x3, x0
  207608:	b4fff600 	cbz	x0, 2074c8 <malloc+0x400>
  20760c:	d2800022 	mov	x2, #0x1                   	// #1
  207610:	aa1403e0 	mov	x0, x20
  207614:	aa0203e1 	mov	x1, x2
  207618:	d63f0060 	blr	x3
  20761c:	a9415bf5 	ldp	x21, x22, [sp, #16]
  207620:	a94263f7 	ldp	x23, x24, [sp, #32]
  207624:	a9436bf9 	ldp	x25, x26, [sp, #48]
  207628:	a94473fb 	ldp	x27, x28, [sp, #64]
  20762c:	17ffff46 	b	207344 <malloc+0x27c>

0000000000207630 <calloc>:
  207630:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  207634:	f9000ffe 	str	x30, [sp, #24]
  207638:	b4000061 	cbz	x1, 207644 <calloc+0x14>
  20763c:	9bc17c02 	umulh	x2, x0, x1
  207640:	b50002e2 	cbnz	x2, 20769c <calloc+0x6c>
  207644:	9b007c33 	mul	x19, x1, x0
  207648:	aa1303e0 	mov	x0, x19
  20764c:	97fffe9f 	bl	2070c8 <malloc>
  207650:	aa0003f4 	mov	x20, x0
  207654:	b40002c0 	cbz	x0, 2076ac <calloc+0x7c>
  207658:	d0000060 	adrp	x0, 215000 <__data_start__>
  20765c:	b94f6000 	ldr	w0, [x0, #3936]
  207660:	35000120 	cbnz	w0, 207684 <calloc+0x54>
  207664:	f85f8280 	ldur	x0, [x20, #-8]
  207668:	36000220 	tbz	w0, #0, 2076ac <calloc+0x7c>
  20766c:	d0000060 	adrp	x0, 215000 <__data_start__>
  207670:	f9000bf5 	str	x21, [sp, #16]
  207674:	f9479015 	ldr	x21, [x0, #3872]
  207678:	eb1302bf 	cmp	x21, x19
  20767c:	54000229 	b.ls	2076c0 <calloc+0x90>  // b.plast
  207680:	f9400bf5 	ldr	x21, [sp, #16]
  207684:	aa1303e2 	mov	x2, x19
  207688:	aa1403e0 	mov	x0, x20
  20768c:	f9400ffe 	ldr	x30, [sp, #24]
  207690:	52800001 	mov	w1, #0x0                   	// #0
  207694:	a8c253f3 	ldp	x19, x20, [sp], #32
  207698:	14000dc4 	b	20ada8 <memset>
  20769c:	97ffefa1 	bl	203520 <__errno_location>
  2076a0:	d2800014 	mov	x20, #0x0                   	// #0
  2076a4:	52800181 	mov	w1, #0xc                   	// #12
  2076a8:	b9000001 	str	w1, [x0]
  2076ac:	aa1403e0 	mov	x0, x20
  2076b0:	f9400ffe 	ldr	x30, [sp, #24]
  2076b4:	a8c253f3 	ldp	x19, x20, [sp], #32
  2076b8:	d65f03c0 	ret
  2076bc:	d503201f 	nop
  2076c0:	8b130280 	add	x0, x20, x19
  2076c4:	d10006a2 	sub	x2, x21, #0x1
  2076c8:	8a020002 	and	x2, x0, x2
  2076cc:	52800001 	mov	w1, #0x0                   	// #0
  2076d0:	cb020000 	sub	x0, x0, x2
  2076d4:	94000db5 	bl	20ada8 <memset>
  2076d8:	cb140013 	sub	x19, x0, x20
  2076dc:	eb1302bf 	cmp	x21, x19
  2076e0:	54fffd08 	b.hi	207680 <calloc+0x50>  // b.pmore
  2076e4:	b40001b5 	cbz	x21, 207718 <calloc+0xe8>
  2076e8:	a97f0801 	ldp	x1, x2, [x0, #-16]
  2076ec:	aa020021 	orr	x1, x1, x2
  2076f0:	aa1503e2 	mov	x2, x21
  2076f4:	b5fffec1 	cbnz	x1, 2076cc <calloc+0x9c>
  2076f8:	d1004000 	sub	x0, x0, #0x10
  2076fc:	f1004042 	subs	x2, x2, #0x10
  207700:	54fffe60 	b.eq	2076cc <calloc+0x9c>  // b.none
  207704:	a97f0403 	ldp	x3, x1, [x0, #-16]
  207708:	aa030021 	orr	x1, x1, x3
  20770c:	b4ffff61 	cbz	x1, 2076f8 <calloc+0xc8>
  207710:	17ffffef 	b	2076cc <calloc+0x9c>
  207714:	d503201f 	nop
  207718:	d2800002 	mov	x2, #0x0                   	// #0
  20771c:	17ffffec 	b	2076cc <calloc+0x9c>

0000000000207720 <free>:
  207720:	b4000240 	cbz	x0, 207768 <free+0x48>
  207724:	f85f8001 	ldur	x1, [x0, #-8]
  207728:	d1004002 	sub	x2, x0, #0x10
  20772c:	92400024 	and	x4, x1, #0x1
  207730:	36000081 	tbz	w1, #0, 207740 <free+0x20>
  207734:	aa0203e0 	mov	x0, x2
  207738:	17fffd0e 	b	206b70 <__bin_chunk>
  20773c:	d503201f 	nop
  207740:	f85f0003 	ldur	x3, [x0, #-16]
  207744:	927ff821 	and	x1, x1, #0xfffffffffffffffe
  207748:	cb030040 	sub	x0, x2, x3
  20774c:	8b030021 	add	x1, x1, x3
  207750:	36000083 	tbz	w3, #0, 207760 <free+0x40>
  207754:	3900009f 	strb	wzr, [x4]
  207758:	d4207d00 	brk	#0x3e8
  20775c:	d503201f 	nop
  207760:	14000138 	b	207c40 <__munmap>
  207764:	d503201f 	nop
  207768:	d65f03c0 	ret
  20776c:	00000000 	.inst	0x00000000 ; undefined

0000000000207770 <realloc>:
  207770:	a9ba53f3 	stp	x19, x20, [sp, #-96]!
  207774:	f9000bf5 	str	x21, [sp, #16]
  207778:	f90023fe 	str	x30, [sp, #64]
  20777c:	f9002fe1 	str	x1, [sp, #88]
  207780:	b4000940 	cbz	x0, 2078a8 <realloc+0x138>
  207784:	aa0003f3 	mov	x19, x0
  207788:	910163e0 	add	x0, sp, #0x58
  20778c:	97fffb9f 	bl	206608 <adjust_size>
  207790:	37f80f60 	tbnz	w0, #31, 20797c <realloc+0x20c>
  207794:	f85f8260 	ldur	x0, [x19, #-8]
  207798:	f90017f8 	str	x24, [sp, #40]
  20779c:	d1004278 	sub	x24, x19, #0x10
  2077a0:	927ff814 	and	x20, x0, #0xfffffffffffffffe
  2077a4:	92400002 	and	x2, x0, #0x1
  2077a8:	36000140 	tbz	w0, #0, 2077d0 <realloc+0x60>
  2077ac:	f8746b01 	ldr	x1, [x24, x20]
  2077b0:	8b140315 	add	x21, x24, x20
  2077b4:	eb01001f 	cmp	x0, x1
  2077b8:	54000580 	b.eq	207868 <realloc+0xf8>  // b.none
  2077bc:	d2800000 	mov	x0, #0x0                   	// #0
  2077c0:	a901dff6 	stp	x22, x23, [sp, #24]
  2077c4:	a9036bf9 	stp	x25, x26, [sp, #48]
  2077c8:	3900001f 	strb	wzr, [x0]
  2077cc:	d4207d00 	brk	#0x3e8
  2077d0:	a901dff6 	stp	x22, x23, [sp, #24]
  2077d4:	f85f0277 	ldur	x23, [x19, #-16]
  2077d8:	a9036bf9 	stp	x25, x26, [sp, #48]
  2077dc:	f9402fe0 	ldr	x0, [sp, #88]
  2077e0:	8b17029a 	add	x26, x20, x23
  2077e4:	8b170016 	add	x22, x0, x23
  2077e8:	37000717 	tbnz	w23, #0, 2078c8 <realloc+0x158>
  2077ec:	d0000079 	adrp	x25, 215000 <__data_start__>
  2077f0:	913ba339 	add	x25, x25, #0xee8
  2077f4:	f9401f22 	ldr	x2, [x25, #56]
  2077f8:	eb16005f 	cmp	x2, x22
  2077fc:	540007a8 	b.hi	2078f0 <realloc+0x180>  // b.pmore
  207800:	d10006d6 	sub	x22, x22, #0x1
  207804:	cb0203e0 	neg	x0, x2
  207808:	8b0202d6 	add	x22, x22, x2
  20780c:	aa1303f5 	mov	x21, x19
  207810:	8a160016 	and	x22, x0, x22
  207814:	eb16035f 	cmp	x26, x22
  207818:	540005c0 	b.eq	2078d0 <realloc+0x160>  // b.none
  20781c:	52800023 	mov	w3, #0x1                   	// #1
  207820:	aa1603e2 	mov	x2, x22
  207824:	aa1a03e1 	mov	x1, x26
  207828:	cb170300 	sub	x0, x24, x23
  20782c:	940000cf 	bl	207b68 <__mremap>
  207830:	b100041f 	cmn	x0, #0x1
  207834:	54000b60 	b.eq	2079a0 <realloc+0x230>  // b.none
  207838:	8b170000 	add	x0, x0, x23
  20783c:	cb1702d6 	sub	x22, x22, x23
  207840:	a942e7f8 	ldp	x24, x25, [sp, #40]
  207844:	91004015 	add	x21, x0, #0x10
  207848:	f9401ffa 	ldr	x26, [sp, #56]
  20784c:	f9000416 	str	x22, [x0, #8]
  207850:	a941dff6 	ldp	x22, x23, [sp, #24]
  207854:	aa1503e0 	mov	x0, x21
  207858:	f9400bf5 	ldr	x21, [sp, #16]
  20785c:	f94023fe 	ldr	x30, [sp, #64]
  207860:	a8c653f3 	ldp	x19, x20, [sp], #96
  207864:	d65f03c0 	ret
  207868:	f9402fe1 	ldr	x1, [sp, #88]
  20786c:	eb14003f 	cmp	x1, x20
  207870:	54000688 	b.hi	207940 <realloc+0x1d0>  // b.pmore
  207874:	b2400294 	orr	x20, x20, #0x1
  207878:	f81f8274 	stur	x20, [x19, #-8]
  20787c:	f90002b4 	str	x20, [x21]
  207880:	aa1803e0 	mov	x0, x24
  207884:	aa1303f5 	mov	x21, x19
  207888:	97fffdfe 	bl	207080 <trim>
  20788c:	f94017f8 	ldr	x24, [sp, #40]
  207890:	aa1503e0 	mov	x0, x21
  207894:	f94023fe 	ldr	x30, [sp, #64]
  207898:	f9400bf5 	ldr	x21, [sp, #16]
  20789c:	a8c653f3 	ldp	x19, x20, [sp], #96
  2078a0:	d65f03c0 	ret
  2078a4:	d503201f 	nop
  2078a8:	aa0103e0 	mov	x0, x1
  2078ac:	97fffe07 	bl	2070c8 <malloc>
  2078b0:	aa0003f5 	mov	x21, x0
  2078b4:	f94023fe 	ldr	x30, [sp, #64]
  2078b8:	aa1503e0 	mov	x0, x21
  2078bc:	f9400bf5 	ldr	x21, [sp, #16]
  2078c0:	a8c653f3 	ldp	x19, x20, [sp], #96
  2078c4:	d65f03c0 	ret
  2078c8:	3900005f 	strb	wzr, [x2]
  2078cc:	d4207d00 	brk	#0x3e8
  2078d0:	a941dff6 	ldp	x22, x23, [sp, #24]
  2078d4:	aa1503e0 	mov	x0, x21
  2078d8:	a942e7f8 	ldp	x24, x25, [sp, #40]
  2078dc:	f9401ffa 	ldr	x26, [sp, #56]
  2078e0:	f9400bf5 	ldr	x21, [sp, #16]
  2078e4:	f94023fe 	ldr	x30, [sp, #64]
  2078e8:	a8c653f3 	ldp	x19, x20, [sp], #96
  2078ec:	d65f03c0 	ret
  2078f0:	d1004000 	sub	x0, x0, #0x10
  2078f4:	97fffdf5 	bl	2070c8 <malloc>
  2078f8:	aa0003f5 	mov	x21, x0
  2078fc:	b40005a0 	cbz	x0, 2079b0 <realloc+0x240>
  207900:	a941dff6 	ldp	x22, x23, [sp, #24]
  207904:	a9436bf9 	ldp	x25, x26, [sp, #48]
  207908:	f9402ff4 	ldr	x20, [sp, #88]
  20790c:	d1004282 	sub	x2, x20, #0x10
  207910:	aa1303e1 	mov	x1, x19
  207914:	aa1503e0 	mov	x0, x21
  207918:	94000bd2 	bl	20a860 <memcpy>
  20791c:	aa1303e0 	mov	x0, x19
  207920:	97ffff80 	bl	207720 <free>
  207924:	f94017f8 	ldr	x24, [sp, #40]
  207928:	aa1503e0 	mov	x0, x21
  20792c:	f94023fe 	ldr	x30, [sp, #64]
  207930:	f9400bf5 	ldr	x21, [sp, #16]
  207934:	a8c653f3 	ldp	x19, x20, [sp], #96
  207938:	d65f03c0 	ret
  20793c:	d503201f 	nop
  207940:	aa1503e0 	mov	x0, x21
  207944:	97fffb4f 	bl	206680 <alloc_fwd>
  207948:	35000200 	cbnz	w0, 207988 <realloc+0x218>
  20794c:	f9402fe1 	ldr	x1, [sp, #88]
  207950:	aa1403e0 	mov	x0, x20
  207954:	b2400002 	orr	x2, x0, #0x1
  207958:	f81f8262 	stur	x2, [x19, #-8]
  20795c:	f90002a2 	str	x2, [x21]
  207960:	eb01001f 	cmp	x0, x1
  207964:	54fff8e2 	b.cs	207880 <realloc+0x110>  // b.hs, b.nlast
  207968:	d1004020 	sub	x0, x1, #0x10
  20796c:	97fffdd7 	bl	2070c8 <malloc>
  207970:	aa0003f5 	mov	x21, x0
  207974:	b5fffcc0 	cbnz	x0, 20790c <realloc+0x19c>
  207978:	f94017f8 	ldr	x24, [sp, #40]
  20797c:	d2800015 	mov	x21, #0x0                   	// #0
  207980:	17ffffb5 	b	207854 <realloc+0xe4>
  207984:	d503201f 	nop
  207988:	f94006a2 	ldr	x2, [x21, #8]
  20798c:	f9402fe1 	ldr	x1, [sp, #88]
  207990:	927ff842 	and	x2, x2, #0xfffffffffffffffe
  207994:	8b140040 	add	x0, x2, x20
  207998:	8b0202b5 	add	x21, x21, x2
  20799c:	17ffffee 	b	207954 <realloc+0x1e4>
  2079a0:	a941dff6 	ldp	x22, x23, [sp, #24]
  2079a4:	a9436bf9 	ldp	x25, x26, [sp, #48]
  2079a8:	f9402fe1 	ldr	x1, [sp, #88]
  2079ac:	17ffffef 	b	207968 <realloc+0x1f8>
  2079b0:	f9401f22 	ldr	x2, [x25, #56]
  2079b4:	17ffff93 	b	207800 <realloc+0x90>

00000000002079b8 <__malloc_donate>:
  2079b8:	928001e2 	mov	x2, #0xfffffffffffffff0    	// #-16
  2079bc:	92401023 	and	x3, x1, #0x1f
  2079c0:	cb000042 	sub	x2, x2, x0
  2079c4:	91004063 	add	x3, x3, #0x10
  2079c8:	92401042 	and	x2, x2, #0x1f
  2079cc:	cb000024 	sub	x4, x1, x0
  2079d0:	8b020063 	add	x3, x3, x2
  2079d4:	eb03009f 	cmp	x4, x3
  2079d8:	54000048 	b.hi	2079e0 <__malloc_donate+0x28>  // b.pmore
  2079dc:	d65f03c0 	ret
  2079e0:	927be821 	and	x1, x1, #0xffffffffffffffe0
  2079e4:	91004043 	add	x3, x2, #0x10
  2079e8:	8b030003 	add	x3, x0, x3
  2079ec:	d2800025 	mov	x5, #0x1                   	// #1
  2079f0:	cb030024 	sub	x4, x1, x3
  2079f4:	8b020000 	add	x0, x0, x2
  2079f8:	f81f8025 	stur	x5, [x1, #-8]
  2079fc:	aa050082 	orr	x2, x4, x5
  207a00:	f81f0065 	stur	x5, [x3, #-16]
  207a04:	f81f0022 	stur	x2, [x1, #-16]
  207a08:	f81f8062 	stur	x2, [x3, #-8]
  207a0c:	17fffc59 	b	206b70 <__bin_chunk>

0000000000207a10 <__madvise>:
  207a10:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  207a14:	aa0003f3 	mov	x19, x0
  207a18:	aa0103f4 	mov	x20, x1
  207a1c:	d2801b80 	mov	x0, #0xdc                  	// #220
  207a20:	a9017bf5 	stp	x21, x30, [sp, #16]
  207a24:	93407c55 	sxtw	x21, w2
  207a28:	97fffa36 	bl	206300 <get_rtt_syscall>
  207a2c:	b4000160 	cbz	x0, 207a58 <__madvise+0x48>
  207a30:	aa0003e3 	mov	x3, x0
  207a34:	aa1503e2 	mov	x2, x21
  207a38:	aa1403e1 	mov	x1, x20
  207a3c:	aa1303e0 	mov	x0, x19
  207a40:	d63f0060 	blr	x3
  207a44:	97fffa5f 	bl	2063c0 <__syscall_ret>
  207a48:	a9417bf5 	ldp	x21, x30, [sp, #16]
  207a4c:	a8c253f3 	ldp	x19, x20, [sp], #32
  207a50:	d65f03c0 	ret
  207a54:	d503201f 	nop
  207a58:	d2800000 	mov	x0, #0x0                   	// #0
  207a5c:	17fffffa 	b	207a44 <__madvise+0x34>

0000000000207a60 <dummy>:
  207a60:	d65f03c0 	ret
  207a64:	00000000 	.inst	0x00000000 ; undefined

0000000000207a68 <__mmap>:
  207a68:	a9bb53f3 	stp	x19, x20, [sp, #-80]!
  207a6c:	f2402cbf 	tst	x5, #0xfff
  207a70:	f9001bfe 	str	x30, [sp, #48]
  207a74:	540005a1 	b.ne	207b28 <__mmap+0xc0>  // b.any
  207a78:	a90263f7 	stp	x23, x24, [sp, #32]
  207a7c:	aa0003f8 	mov	x24, x0
  207a80:	aa0103f7 	mov	x23, x1
  207a84:	b27ff7e0 	mov	x0, #0x7ffffffffffffffe    	// #9223372036854775806
  207a88:	eb00003f 	cmp	x1, x0
  207a8c:	540003e8 	b.hi	207b08 <__mmap+0xa0>  // b.pmore
  207a90:	a9015bf5 	stp	x21, x22, [sp, #16]
  207a94:	aa0503f3 	mov	x19, x5
  207a98:	2a0303f4 	mov	w20, w3
  207a9c:	2a0403f6 	mov	w22, w4
  207aa0:	37200554 	tbnz	w20, #4, 207b48 <__mmap+0xe0>
  207aa4:	d2801800 	mov	x0, #0xc0                  	// #192
  207aa8:	93407c55 	sxtw	x21, w2
  207aac:	97fffa15 	bl	206300 <get_rtt_syscall>
  207ab0:	aa0003e6 	mov	x6, x0
  207ab4:	93407e83 	sxtw	x3, w20
  207ab8:	93407ec4 	sxtw	x4, w22
  207abc:	d34cfe65 	lsr	x5, x19, #12
  207ac0:	b40004c0 	cbz	x0, 207b58 <__mmap+0xf0>
  207ac4:	aa1503e2 	mov	x2, x21
  207ac8:	aa1703e1 	mov	x1, x23
  207acc:	aa1803e0 	mov	x0, x24
  207ad0:	d63f00c0 	blr	x6
  207ad4:	f100031f 	cmp	x24, #0x0
  207ad8:	ba410800 	ccmn	x0, #0x1, #0x0, eq  // eq = none
  207adc:	540000a1 	b.ne	207af0 <__mmap+0x88>  // b.any
  207ae0:	121c0694 	and	w20, w20, #0x30
  207ae4:	92800160 	mov	x0, #0xfffffffffffffff4    	// #-12
  207ae8:	7100829f 	cmp	w20, #0x20
  207aec:	da9f0000 	csinv	x0, x0, xzr, eq  // eq = none
  207af0:	a9415bf5 	ldp	x21, x22, [sp, #16]
  207af4:	a94263f7 	ldp	x23, x24, [sp, #32]
  207af8:	f9401bfe 	ldr	x30, [sp, #48]
  207afc:	a8c553f3 	ldp	x19, x20, [sp], #80
  207b00:	17fffa30 	b	2063c0 <__syscall_ret>
  207b04:	d503201f 	nop
  207b08:	97ffee86 	bl	203520 <__errno_location>
  207b0c:	52800181 	mov	w1, #0xc                   	// #12
  207b10:	a94263f7 	ldp	x23, x24, [sp, #32]
  207b14:	b9000001 	str	w1, [x0]
  207b18:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
  207b1c:	f9401bfe 	ldr	x30, [sp, #48]
  207b20:	a8c553f3 	ldp	x19, x20, [sp], #80
  207b24:	d65f03c0 	ret
  207b28:	97ffee7e 	bl	203520 <__errno_location>
  207b2c:	528002c1 	mov	w1, #0x16                  	// #22
  207b30:	b9000001 	str	w1, [x0]
  207b34:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
  207b38:	f9401bfe 	ldr	x30, [sp, #48]
  207b3c:	a8c553f3 	ldp	x19, x20, [sp], #80
  207b40:	d65f03c0 	ret
  207b44:	d503201f 	nop
  207b48:	b9004fe2 	str	w2, [sp, #76]
  207b4c:	9400125f 	bl	20c4c8 <__vm_wait>
  207b50:	b9404fe2 	ldr	w2, [sp, #76]
  207b54:	17ffffd4 	b	207aa4 <__mmap+0x3c>
  207b58:	d2800000 	mov	x0, #0x0                   	// #0
  207b5c:	17ffffe5 	b	207af0 <__mmap+0x88>

0000000000207b60 <dummy>:
  207b60:	d65f03c0 	ret
  207b64:	00000000 	.inst	0x00000000 ; undefined

0000000000207b68 <__mremap>:
  207b68:	a9b953f3 	stp	x19, x20, [sp, #-112]!
  207b6c:	aa0203f4 	mov	x20, x2
  207b70:	b27ff7e2 	mov	x2, #0x7ffffffffffffffe    	// #9223372036854775806
  207b74:	eb02029f 	cmp	x20, x2
  207b78:	f90017fe 	str	x30, [sp, #40]
  207b7c:	f90037e4 	str	x4, [sp, #104]
  207b80:	54000488 	b.hi	207c10 <__mremap+0xa8>  // b.pmore
  207b84:	a9015bf5 	stp	x21, x22, [sp, #16]
  207b88:	aa0003f5 	mov	x21, x0
  207b8c:	f90013f7 	str	x23, [sp, #32]
  207b90:	aa0103f6 	mov	x22, x1
  207b94:	d2800017 	mov	x23, #0x0                   	// #0
  207b98:	37080283 	tbnz	w3, #1, 207be8 <__mremap+0x80>
  207b9c:	d2801460 	mov	x0, #0xa3                  	// #163
  207ba0:	93407c73 	sxtw	x19, w3
  207ba4:	97fff9d7 	bl	206300 <get_rtt_syscall>
  207ba8:	aa0003e5 	mov	x5, x0
  207bac:	b4000420 	cbz	x0, 207c30 <__mremap+0xc8>
  207bb0:	aa1703e4 	mov	x4, x23
  207bb4:	aa1303e3 	mov	x3, x19
  207bb8:	aa1403e2 	mov	x2, x20
  207bbc:	aa1603e1 	mov	x1, x22
  207bc0:	aa1503e0 	mov	x0, x21
  207bc4:	d63f00a0 	blr	x5
  207bc8:	97fff9fe 	bl	2063c0 <__syscall_ret>
  207bcc:	aa0003e1 	mov	x1, x0
  207bd0:	a9415bf5 	ldp	x21, x22, [sp, #16]
  207bd4:	aa0103e0 	mov	x0, x1
  207bd8:	f94013f7 	ldr	x23, [sp, #32]
  207bdc:	f94017fe 	ldr	x30, [sp, #40]
  207be0:	a8c753f3 	ldp	x19, x20, [sp], #112
  207be4:	d65f03c0 	ret
  207be8:	b9003fe3 	str	w3, [sp, #60]
  207bec:	94001237 	bl	20c4c8 <__vm_wait>
  207bf0:	910183e0 	add	x0, sp, #0x60
  207bf4:	9101c3e1 	add	x1, sp, #0x70
  207bf8:	b9403fe3 	ldr	w3, [sp, #60]
  207bfc:	f94037f7 	ldr	x23, [sp, #104]
  207c00:	a90407e1 	stp	x1, x1, [sp, #64]
  207c04:	f9002be0 	str	x0, [sp, #80]
  207c08:	290b7fff 	stp	wzr, wzr, [sp, #88]
  207c0c:	17ffffe4 	b	207b9c <__mremap+0x34>
  207c10:	97ffee44 	bl	203520 <__errno_location>
  207c14:	52800182 	mov	w2, #0xc                   	// #12
  207c18:	b9000002 	str	w2, [x0]
  207c1c:	92800001 	mov	x1, #0xffffffffffffffff    	// #-1
  207c20:	aa0103e0 	mov	x0, x1
  207c24:	f94017fe 	ldr	x30, [sp, #40]
  207c28:	a8c753f3 	ldp	x19, x20, [sp], #112
  207c2c:	d65f03c0 	ret
  207c30:	d2800000 	mov	x0, #0x0                   	// #0
  207c34:	17ffffe5 	b	207bc8 <__mremap+0x60>

0000000000207c38 <dummy>:
  207c38:	d65f03c0 	ret
  207c3c:	00000000 	.inst	0x00000000 ; undefined

0000000000207c40 <__munmap>:
  207c40:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  207c44:	aa0003f3 	mov	x19, x0
  207c48:	aa0103f4 	mov	x20, x1
  207c4c:	f9000bfe 	str	x30, [sp, #16]
  207c50:	9400121e 	bl	20c4c8 <__vm_wait>
  207c54:	d2800b60 	mov	x0, #0x5b                  	// #91
  207c58:	97fff9aa 	bl	206300 <get_rtt_syscall>
  207c5c:	b4000120 	cbz	x0, 207c80 <__munmap+0x40>
  207c60:	aa0003e2 	mov	x2, x0
  207c64:	aa1403e1 	mov	x1, x20
  207c68:	aa1303e0 	mov	x0, x19
  207c6c:	d63f0040 	blr	x2
  207c70:	97fff9d4 	bl	2063c0 <__syscall_ret>
  207c74:	f9400bfe 	ldr	x30, [sp, #16]
  207c78:	a8c253f3 	ldp	x19, x20, [sp], #32
  207c7c:	d65f03c0 	ret
  207c80:	d2800000 	mov	x0, #0x0                   	// #0
  207c84:	17fffffb 	b	207c70 <__munmap+0x30>

0000000000207c88 <accept>:
  207c88:	aa0203e3 	mov	x3, x2
  207c8c:	aa0103e2 	mov	x2, x1
  207c90:	93407c01 	sxtw	x1, w0
  207c94:	f81f0ffe 	str	x30, [sp, #-16]!
  207c98:	d2800006 	mov	x6, #0x0                   	// #0
  207c9c:	d2800005 	mov	x5, #0x0                   	// #0
  207ca0:	d2800004 	mov	x4, #0x0                   	// #0
  207ca4:	d28023a0 	mov	x0, #0x11d                 	// #285
  207ca8:	94000ec2 	bl	20b7b0 <__syscall_cp>
  207cac:	97fff9c5 	bl	2063c0 <__syscall_ret>
  207cb0:	f84107fe 	ldr	x30, [sp], #16
  207cb4:	d65f03c0 	ret

0000000000207cb8 <bind>:
  207cb8:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  207cbc:	93407c13 	sxtw	x19, w0
  207cc0:	aa0103f4 	mov	x20, x1
  207cc4:	d2802340 	mov	x0, #0x11a                 	// #282
  207cc8:	a9017bf5 	stp	x21, x30, [sp, #16]
  207ccc:	2a0203f5 	mov	w21, w2
  207cd0:	97fff98c 	bl	206300 <get_rtt_syscall>
  207cd4:	b40001a0 	cbz	x0, 207d08 <bind+0x50>
  207cd8:	aa0003e6 	mov	x6, x0
  207cdc:	d2800005 	mov	x5, #0x0                   	// #0
  207ce0:	d2800004 	mov	x4, #0x0                   	// #0
  207ce4:	d2800003 	mov	x3, #0x0                   	// #0
  207ce8:	aa1503e2 	mov	x2, x21
  207cec:	aa1403e1 	mov	x1, x20
  207cf0:	aa1303e0 	mov	x0, x19
  207cf4:	d63f00c0 	blr	x6
  207cf8:	97fff9b2 	bl	2063c0 <__syscall_ret>
  207cfc:	a9417bf5 	ldp	x21, x30, [sp, #16]
  207d00:	a8c253f3 	ldp	x19, x20, [sp], #32
  207d04:	d65f03c0 	ret
  207d08:	d2800000 	mov	x0, #0x0                   	// #0
  207d0c:	17fffffb 	b	207cf8 <bind+0x40>

0000000000207d10 <connect>:
  207d10:	2a0203e3 	mov	w3, w2
  207d14:	aa0103e2 	mov	x2, x1
  207d18:	93407c01 	sxtw	x1, w0
  207d1c:	f81f0ffe 	str	x30, [sp, #-16]!
  207d20:	d2800006 	mov	x6, #0x0                   	// #0
  207d24:	d2800005 	mov	x5, #0x0                   	// #0
  207d28:	d2800004 	mov	x4, #0x0                   	// #0
  207d2c:	d2802360 	mov	x0, #0x11b                 	// #283
  207d30:	94000ea0 	bl	20b7b0 <__syscall_cp>
  207d34:	97fff9a3 	bl	2063c0 <__syscall_ret>
  207d38:	f84107fe 	ldr	x30, [sp], #16
  207d3c:	d65f03c0 	ret

0000000000207d40 <htonl>:
  207d40:	5ac00800 	rev	w0, w0
  207d44:	d65f03c0 	ret

0000000000207d48 <htons>:
  207d48:	5ac00400 	rev16	w0, w0
  207d4c:	d65f03c0 	ret

0000000000207d50 <listen>:
  207d50:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  207d54:	93407c13 	sxtw	x19, w0
  207d58:	93407c34 	sxtw	x20, w1
  207d5c:	d2802380 	mov	x0, #0x11c                 	// #284
  207d60:	f9000bfe 	str	x30, [sp, #16]
  207d64:	97fff967 	bl	206300 <get_rtt_syscall>
  207d68:	b40001c0 	cbz	x0, 207da0 <listen+0x50>
  207d6c:	aa0003e6 	mov	x6, x0
  207d70:	d2800005 	mov	x5, #0x0                   	// #0
  207d74:	d2800004 	mov	x4, #0x0                   	// #0
  207d78:	d2800003 	mov	x3, #0x0                   	// #0
  207d7c:	d2800002 	mov	x2, #0x0                   	// #0
  207d80:	aa1403e1 	mov	x1, x20
  207d84:	aa1303e0 	mov	x0, x19
  207d88:	d63f00c0 	blr	x6
  207d8c:	97fff98d 	bl	2063c0 <__syscall_ret>
  207d90:	f9400bfe 	ldr	x30, [sp, #16]
  207d94:	a8c253f3 	ldp	x19, x20, [sp], #32
  207d98:	d65f03c0 	ret
  207d9c:	d503201f 	nop
  207da0:	d2800000 	mov	x0, #0x0                   	// #0
  207da4:	17fffffa 	b	207d8c <listen+0x3c>

0000000000207da8 <setsockopt>:
  207da8:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  207dac:	93407c13 	sxtw	x19, w0
  207db0:	93407c34 	sxtw	x20, w1
  207db4:	d28024c0 	mov	x0, #0x126                 	// #294
  207db8:	a9015bf5 	stp	x21, x22, [sp, #16]
  207dbc:	aa0303f6 	mov	x22, x3
  207dc0:	a9027bf7 	stp	x23, x30, [sp, #32]
  207dc4:	93407c55 	sxtw	x21, w2
  207dc8:	2a0403f7 	mov	w23, w4
  207dcc:	97fff94d 	bl	206300 <get_rtt_syscall>
  207dd0:	b40001c0 	cbz	x0, 207e08 <setsockopt+0x60>
  207dd4:	aa0003e6 	mov	x6, x0
  207dd8:	d2800005 	mov	x5, #0x0                   	// #0
  207ddc:	aa1703e4 	mov	x4, x23
  207de0:	aa1603e3 	mov	x3, x22
  207de4:	aa1503e2 	mov	x2, x21
  207de8:	aa1403e1 	mov	x1, x20
  207dec:	aa1303e0 	mov	x0, x19
  207df0:	d63f00c0 	blr	x6
  207df4:	97fff973 	bl	2063c0 <__syscall_ret>
  207df8:	a9415bf5 	ldp	x21, x22, [sp, #16]
  207dfc:	a9427bf7 	ldp	x23, x30, [sp, #32]
  207e00:	a8c353f3 	ldp	x19, x20, [sp], #48
  207e04:	d65f03c0 	ret
  207e08:	d2800000 	mov	x0, #0x0                   	// #0
  207e0c:	17fffffa 	b	207df4 <setsockopt+0x4c>

0000000000207e10 <socket>:
  207e10:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  207e14:	93407c34 	sxtw	x20, w1
  207e18:	aa1403f3 	mov	x19, x20
  207e1c:	a9015bf5 	stp	x21, x22, [sp, #16]
  207e20:	93407c15 	sxtw	x21, w0
  207e24:	f90013fe 	str	x30, [sp, #32]
  207e28:	93407c56 	sxtw	x22, w2
  207e2c:	d2802320 	mov	x0, #0x119                 	// #281
  207e30:	97fff934 	bl	206300 <get_rtt_syscall>
  207e34:	b40007a0 	cbz	x0, 207f28 <socket+0x118>
  207e38:	aa0003e6 	mov	x6, x0
  207e3c:	d2800005 	mov	x5, #0x0                   	// #0
  207e40:	d2800004 	mov	x4, #0x0                   	// #0
  207e44:	d2800003 	mov	x3, #0x0                   	// #0
  207e48:	aa1603e2 	mov	x2, x22
  207e4c:	aa1403e1 	mov	x1, x20
  207e50:	aa1503e0 	mov	x0, x21
  207e54:	d63f00c0 	blr	x6
  207e58:	97fff95a 	bl	2063c0 <__syscall_ret>
  207e5c:	2a0003f4 	mov	w20, w0
  207e60:	37f800c0 	tbnz	w0, #31, 207e78 <socket+0x68>
  207e64:	2a1403e0 	mov	w0, w20
  207e68:	f94013fe 	ldr	x30, [sp, #32]
  207e6c:	a9415bf5 	ldp	x21, x22, [sp, #16]
  207e70:	a8c353f3 	ldp	x19, x20, [sp], #48
  207e74:	d65f03c0 	ret
  207e78:	97ffedaa 	bl	203520 <__errno_location>
  207e7c:	b9400000 	ldr	w0, [x0]
  207e80:	7100581f 	cmp	w0, #0x16
  207e84:	54000461 	b.ne	207f10 <socket+0x100>  // b.any
  207e88:	12152260 	and	w0, w19, #0xff800
  207e8c:	120d6000 	and	w0, w0, #0xfff80fff
  207e90:	34fffea0 	cbz	w0, 207e64 <socket+0x54>
  207e94:	529effe1 	mov	w1, #0xf7ff                	// #63487
  207e98:	d2802320 	mov	x0, #0x119                 	// #281
  207e9c:	72bffee1 	movk	w1, #0xfff7, lsl #16
  207ea0:	0a010261 	and	w1, w19, w1
  207ea4:	93407c34 	sxtw	x20, w1
  207ea8:	97fff916 	bl	206300 <get_rtt_syscall>
  207eac:	aa0003e6 	mov	x6, x0
  207eb0:	b4000540 	cbz	x0, 207f58 <socket+0x148>
  207eb4:	d2800005 	mov	x5, #0x0                   	// #0
  207eb8:	d2800004 	mov	x4, #0x0                   	// #0
  207ebc:	d2800003 	mov	x3, #0x0                   	// #0
  207ec0:	aa1603e2 	mov	x2, x22
  207ec4:	aa1403e1 	mov	x1, x20
  207ec8:	aa1503e0 	mov	x0, x21
  207ecc:	d63f00c0 	blr	x6
  207ed0:	97fff93c 	bl	2063c0 <__syscall_ret>
  207ed4:	aa0003f5 	mov	x21, x0
  207ed8:	2a0003f4 	mov	w20, w0
  207edc:	37fffc40 	tbnz	w0, #31, 207e64 <socket+0x54>
  207ee0:	37980293 	tbnz	w19, #19, 207f30 <socket+0x120>
  207ee4:	365ffc13 	tbz	w19, #11, 207e64 <socket+0x54>
  207ee8:	d2801ba0 	mov	x0, #0xdd                  	// #221
  207eec:	93407eb5 	sxtw	x21, w21
  207ef0:	97fff904 	bl	206300 <get_rtt_syscall>
  207ef4:	aa0003e3 	mov	x3, x0
  207ef8:	b4fffb60 	cbz	x0, 207e64 <socket+0x54>
  207efc:	d2810002 	mov	x2, #0x800                 	// #2048
  207f00:	d2800081 	mov	x1, #0x4                   	// #4
  207f04:	aa1503e0 	mov	x0, x21
  207f08:	d63f0060 	blr	x3
  207f0c:	17ffffd6 	b	207e64 <socket+0x54>
  207f10:	97ffed84 	bl	203520 <__errno_location>
  207f14:	b9400000 	ldr	w0, [x0]
  207f18:	7101741f 	cmp	w0, #0x5d
  207f1c:	54fffa41 	b.ne	207e64 <socket+0x54>  // b.any
  207f20:	17ffffda 	b	207e88 <socket+0x78>
  207f24:	d503201f 	nop
  207f28:	d2800000 	mov	x0, #0x0                   	// #0
  207f2c:	17ffffcb 	b	207e58 <socket+0x48>
  207f30:	d2801ba0 	mov	x0, #0xdd                  	// #221
  207f34:	93407eb6 	sxtw	x22, w21
  207f38:	97fff8f2 	bl	206300 <get_rtt_syscall>
  207f3c:	aa0003e3 	mov	x3, x0
  207f40:	b4fffd20 	cbz	x0, 207ee4 <socket+0xd4>
  207f44:	d2800022 	mov	x2, #0x1                   	// #1
  207f48:	d2800041 	mov	x1, #0x2                   	// #2
  207f4c:	aa1603e0 	mov	x0, x22
  207f50:	d63f0060 	blr	x3
  207f54:	17ffffe4 	b	207ee4 <socket+0xd4>
  207f58:	d2800000 	mov	x0, #0x0                   	// #0
  207f5c:	17ffffdd 	b	207ed0 <socket+0xc0>

0000000000207f60 <srand>:
  207f60:	d0000061 	adrp	x1, 215000 <__data_start__>
  207f64:	51000400 	sub	w0, w0, #0x1
  207f68:	f9045c20 	str	x0, [x1, #2232]
  207f6c:	d65f03c0 	ret

0000000000207f70 <rand>:
  207f70:	d0000061 	adrp	x1, 215000 <__data_start__>
  207f74:	d28fe5a2 	mov	x2, #0x7f2d                	// #32557
  207f78:	f2a992a2 	movk	x2, #0x4c95, lsl #16
  207f7c:	f9445c20 	ldr	x0, [x1, #2232]
  207f80:	f2de85a2 	movk	x2, #0xf42d, lsl #32
  207f84:	f2eb0a22 	movk	x2, #0x5851, lsl #48
  207f88:	9b027c00 	mul	x0, x0, x2
  207f8c:	91000400 	add	x0, x0, #0x1
  207f90:	f9045c20 	str	x0, [x1, #2232]
  207f94:	d361fc00 	lsr	x0, x0, #33
  207f98:	d65f03c0 	ret
  207f9c:	00000000 	.inst	0x00000000 ; undefined

0000000000207fa0 <select>:
  207fa0:	aa0403e5 	mov	x5, x4
  207fa4:	aa0303e4 	mov	x4, x3
  207fa8:	aa0203e3 	mov	x3, x2
  207fac:	aa0103e2 	mov	x2, x1
  207fb0:	93407c01 	sxtw	x1, w0
  207fb4:	f81f0ffe 	str	x30, [sp, #-16]!
  207fb8:	d2800006 	mov	x6, #0x0                   	// #0
  207fbc:	d28011c0 	mov	x0, #0x8e                  	// #142
  207fc0:	94000dfc 	bl	20b7b0 <__syscall_cp>
  207fc4:	97fff8ff 	bl	2063c0 <__syscall_ret>
  207fc8:	f84107fe 	ldr	x30, [sp], #16
  207fcc:	d65f03c0 	ret

0000000000207fd0 <fprintf>:
  207fd0:	d10403ff 	sub	sp, sp, #0x100
  207fd4:	910403e8 	add	x8, sp, #0x100
  207fd8:	910343e9 	add	x9, sp, #0xd0
  207fdc:	a90323e8 	stp	x8, x8, [sp, #48]
  207fe0:	128005e8 	mov	w8, #0xffffffd0            	// #-48
  207fe4:	f90023e9 	str	x9, [sp, #64]
  207fe8:	b9004be8 	str	w8, [sp, #72]
  207fec:	12800fe8 	mov	w8, #0xffffff80            	// #-128
  207ff0:	b9004fe8 	str	w8, [sp, #76]
  207ff4:	a9432fea 	ldp	x10, x11, [sp, #48]
  207ff8:	f90003fe 	str	x30, [sp]
  207ffc:	a94427e8 	ldp	x8, x9, [sp, #64]
  208000:	a90d0fe2 	stp	x2, x3, [sp, #208]
  208004:	3d8017e0 	str	q0, [sp, #80]
  208008:	910043e2 	add	x2, sp, #0x10
  20800c:	3d801be1 	str	q1, [sp, #96]
  208010:	3d801fe2 	str	q2, [sp, #112]
  208014:	3d8023e3 	str	q3, [sp, #128]
  208018:	3d8027e4 	str	q4, [sp, #144]
  20801c:	3d802be5 	str	q5, [sp, #160]
  208020:	3d802fe6 	str	q6, [sp, #176]
  208024:	3d8033e7 	str	q7, [sp, #192]
  208028:	a90e17e4 	stp	x4, x5, [sp, #224]
  20802c:	a90f1fe6 	stp	x6, x7, [sp, #240]
  208030:	a9012fea 	stp	x10, x11, [sp, #16]
  208034:	a90227e8 	stp	x8, x9, [sp, #32]
  208038:	94000918 	bl	20a498 <vfprintf>
  20803c:	f94003fe 	ldr	x30, [sp]
  208040:	910403ff 	add	sp, sp, #0x100
  208044:	d65f03c0 	ret

0000000000208048 <perror>:
  208048:	a9bc53f3 	stp	x19, x20, [sp, #-64]!
  20804c:	b0000074 	adrp	x20, 215000 <__data_start__>
  208050:	91002293 	add	x19, x20, #0x8
  208054:	a9015bf5 	stp	x21, x22, [sp, #16]
  208058:	aa0003f5 	mov	x21, x0
  20805c:	a9037bf9 	stp	x25, x30, [sp, #48]
  208060:	a90263f7 	stp	x23, x24, [sp, #32]
  208064:	97ffed2f 	bl	203520 <__errno_location>
  208068:	b9400000 	ldr	w0, [x0]
  20806c:	97ffed4d 	bl	2035a0 <strerror>
  208070:	aa0003f6 	mov	x22, x0
  208074:	b9408e61 	ldr	w1, [x19, #140]
  208078:	36f80601 	tbz	w1, #31, 208138 <perror+0xf0>
  20807c:	52800019 	mov	w25, #0x0                   	// #0
  208080:	b9408a78 	ldr	w24, [x19, #136]
  208084:	f9407277 	ldr	x23, [x19, #224]
  208088:	b40006d5 	cbz	x21, 208160 <perror+0x118>
  20808c:	394002a0 	ldrb	w0, [x21]
  208090:	35000340 	cbnz	w0, 2080f8 <perror+0xb0>
  208094:	91002294 	add	x20, x20, #0x8
  208098:	aa1603e0 	mov	x0, x22
  20809c:	94000bc9 	bl	20afc0 <strlen>
  2080a0:	aa0003e1 	mov	x1, x0
  2080a4:	aa1403e3 	mov	x3, x20
  2080a8:	d2800022 	mov	x2, #0x1                   	// #1
  2080ac:	aa1603e0 	mov	x0, x22
  2080b0:	9400178c 	bl	20dee0 <fwrite>
  2080b4:	aa1403e1 	mov	x1, x20
  2080b8:	52800140 	mov	w0, #0xa                   	// #10
  2080bc:	94001719 	bl	20dd20 <fputc>
  2080c0:	b9008a98 	str	w24, [x20, #136]
  2080c4:	f9007297 	str	x23, [x20, #224]
  2080c8:	350000d9 	cbnz	w25, 2080e0 <perror+0x98>
  2080cc:	a9415bf5 	ldp	x21, x22, [sp, #16]
  2080d0:	a94263f7 	ldp	x23, x24, [sp, #32]
  2080d4:	a9437bf9 	ldp	x25, x30, [sp, #48]
  2080d8:	a8c453f3 	ldp	x19, x20, [sp], #64
  2080dc:	d65f03c0 	ret
  2080e0:	aa1403e0 	mov	x0, x20
  2080e4:	a9415bf5 	ldp	x21, x22, [sp, #16]
  2080e8:	a94263f7 	ldp	x23, x24, [sp, #32]
  2080ec:	a9437bf9 	ldp	x25, x30, [sp, #48]
  2080f0:	a8c453f3 	ldp	x19, x20, [sp], #64
  2080f4:	140015d1 	b	20d838 <__unlockfile>
  2080f8:	91002293 	add	x19, x20, #0x8
  2080fc:	aa1503e0 	mov	x0, x21
  208100:	94000bb0 	bl	20afc0 <strlen>
  208104:	aa0003e1 	mov	x1, x0
  208108:	aa1303e3 	mov	x3, x19
  20810c:	d2800022 	mov	x2, #0x1                   	// #1
  208110:	aa1503e0 	mov	x0, x21
  208114:	94001773 	bl	20dee0 <fwrite>
  208118:	aa1303e1 	mov	x1, x19
  20811c:	52800740 	mov	w0, #0x3a                  	// #58
  208120:	94001700 	bl	20dd20 <fputc>
  208124:	aa1303e1 	mov	x1, x19
  208128:	52800400 	mov	w0, #0x20                  	// #32
  20812c:	940016fd 	bl	20dd20 <fputc>
  208130:	17ffffd9 	b	208094 <perror+0x4c>
  208134:	d503201f 	nop
  208138:	aa1303e0 	mov	x0, x19
  20813c:	9400157d 	bl	20d730 <__lockfile>
  208140:	b9408a78 	ldr	w24, [x19, #136]
  208144:	2a0003f9 	mov	w25, w0
  208148:	f9407277 	ldr	x23, [x19, #224]
  20814c:	b4fffa55 	cbz	x21, 208094 <perror+0x4c>
  208150:	394002a0 	ldrb	w0, [x21]
  208154:	34fffa00 	cbz	w0, 208094 <perror+0x4c>
  208158:	17ffffe8 	b	2080f8 <perror+0xb0>
  20815c:	d503201f 	nop
  208160:	94000b98 	bl	20afc0 <strlen>
  208164:	aa0003e1 	mov	x1, x0
  208168:	aa1303e3 	mov	x3, x19
  20816c:	d2800022 	mov	x2, #0x1                   	// #1
  208170:	aa1603e0 	mov	x0, x22
  208174:	9400175b 	bl	20dee0 <fwrite>
  208178:	aa1303e1 	mov	x1, x19
  20817c:	52800140 	mov	w0, #0xa                   	// #10
  208180:	940016e8 	bl	20dd20 <fputc>
  208184:	b9008a78 	str	w24, [x19, #136]
  208188:	f9007277 	str	x23, [x19, #224]
  20818c:	a9415bf5 	ldp	x21, x22, [sp, #16]
  208190:	a94263f7 	ldp	x23, x24, [sp, #32]
  208194:	a9437bf9 	ldp	x25, x30, [sp, #48]
  208198:	a8c453f3 	ldp	x19, x20, [sp], #64
  20819c:	d65f03c0 	ret

00000000002081a0 <printf>:
  2081a0:	d10443ff 	sub	sp, sp, #0x110
  2081a4:	910443e8 	add	x8, sp, #0x110
  2081a8:	910343e9 	add	x9, sp, #0xd0
  2081ac:	a90323e8 	stp	x8, x8, [sp, #48]
  2081b0:	128006e8 	mov	w8, #0xffffffc8            	// #-56
  2081b4:	f90023e9 	str	x9, [sp, #64]
  2081b8:	b9004be8 	str	w8, [sp, #72]
  2081bc:	12800fe8 	mov	w8, #0xffffff80            	// #-128
  2081c0:	b9004fe8 	str	w8, [sp, #76]
  2081c4:	b0000068 	adrp	x8, 215000 <__data_start__>
  2081c8:	a94337ec 	ldp	x12, x13, [sp, #48]
  2081cc:	f90003fe 	str	x30, [sp]
  2081d0:	a9442fea 	ldp	x10, x11, [sp, #64]
  2081d4:	a90d8be1 	stp	x1, x2, [sp, #216]
  2081d8:	3d8017e0 	str	q0, [sp, #80]
  2081dc:	aa0003e1 	mov	x1, x0
  2081e0:	3d801be1 	str	q1, [sp, #96]
  2081e4:	910043e2 	add	x2, sp, #0x10
  2081e8:	3d801fe2 	str	q2, [sp, #112]
  2081ec:	9103e100 	add	x0, x8, #0xf8
  2081f0:	3d8023e3 	str	q3, [sp, #128]
  2081f4:	3d8027e4 	str	q4, [sp, #144]
  2081f8:	3d802be5 	str	q5, [sp, #160]
  2081fc:	3d802fe6 	str	q6, [sp, #176]
  208200:	3d8033e7 	str	q7, [sp, #192]
  208204:	a90e93e3 	stp	x3, x4, [sp, #232]
  208208:	a90f9be5 	stp	x5, x6, [sp, #248]
  20820c:	f90087e7 	str	x7, [sp, #264]
  208210:	a90137ec 	stp	x12, x13, [sp, #16]
  208214:	a9022fea 	stp	x10, x11, [sp, #32]
  208218:	940008a0 	bl	20a498 <vfprintf>
  20821c:	f94003fe 	ldr	x30, [sp]
  208220:	910443ff 	add	sp, sp, #0x110
  208224:	d65f03c0 	ret

0000000000208228 <puts>:
  208228:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  20822c:	b0000074 	adrp	x20, 215000 <__data_start__>
  208230:	9103e293 	add	x19, x20, #0xf8
  208234:	a9015bf5 	stp	x21, x22, [sp, #16]
  208238:	f90017fe 	str	x30, [sp, #40]
  20823c:	b9408e61 	ldr	w1, [x19, #140]
  208240:	36f80401 	tbz	w1, #31, 2082c0 <puts+0x98>
  208244:	aa1303e1 	mov	x1, x19
  208248:	12800015 	mov	w21, #0xffffffff            	// #-1
  20824c:	940016cf 	bl	20dd88 <fputs>
  208250:	52800016 	mov	w22, #0x0                   	// #0
  208254:	37f80200 	tbnz	w0, #31, 208294 <puts+0x6c>
  208258:	9103e280 	add	x0, x20, #0xf8
  20825c:	b9409001 	ldr	w1, [x0, #144]
  208260:	7100283f 	cmp	w1, #0xa
  208264:	54000220 	b.eq	2082a8 <puts+0x80>  // b.none
  208268:	a9420402 	ldp	x2, x1, [x0, #32]
  20826c:	eb02003f 	cmp	x1, x2
  208270:	540001c0 	b.eq	2082a8 <puts+0x80>  // b.none
  208274:	91000422 	add	x2, x1, #0x1
  208278:	f9001402 	str	x2, [x0, #40]
  20827c:	52800015 	mov	w21, #0x0                   	// #0
  208280:	52800140 	mov	w0, #0xa                   	// #10
  208284:	39000020 	strb	w0, [x1]
  208288:	34000076 	cbz	w22, 208294 <puts+0x6c>
  20828c:	9103e280 	add	x0, x20, #0xf8
  208290:	9400156a 	bl	20d838 <__unlockfile>
  208294:	2a1503e0 	mov	w0, w21
  208298:	f94017fe 	ldr	x30, [sp, #40]
  20829c:	a9415bf5 	ldp	x21, x22, [sp, #16]
  2082a0:	a8c353f3 	ldp	x19, x20, [sp], #48
  2082a4:	d65f03c0 	ret
  2082a8:	52800141 	mov	w1, #0xa                   	// #10
  2082ac:	9103e280 	add	x0, x20, #0xf8
  2082b0:	94001580 	bl	20d8b0 <__overflow>
  2082b4:	131f7c15 	asr	w21, w0, #31
  2082b8:	17fffff4 	b	208288 <puts+0x60>
  2082bc:	d503201f 	nop
  2082c0:	f90013f7 	str	x23, [sp, #32]
  2082c4:	aa0003f7 	mov	x23, x0
  2082c8:	aa1303e0 	mov	x0, x19
  2082cc:	94001519 	bl	20d730 <__lockfile>
  2082d0:	aa1303e1 	mov	x1, x19
  2082d4:	2a0003f6 	mov	w22, w0
  2082d8:	12800015 	mov	w21, #0xffffffff            	// #-1
  2082dc:	aa1703e0 	mov	x0, x23
  2082e0:	940016aa 	bl	20dd88 <fputs>
  2082e4:	f94013f7 	ldr	x23, [sp, #32]
  2082e8:	36fffb80 	tbz	w0, #31, 208258 <puts+0x30>
  2082ec:	17ffffe7 	b	208288 <puts+0x60>

00000000002082f0 <pop_arg>:
  2082f0:	51002421 	sub	w1, w1, #0x9
  2082f4:	7100443f 	cmp	w1, #0x11
  2082f8:	54000108 	b.hi	208318 <pop_arg+0x28>  // b.pmore
  2082fc:	90000063 	adrp	x3, 214000 <syscall_table+0x800>
  208300:	9113e063 	add	x3, x3, #0x4f8
  208304:	38614861 	ldrb	w1, [x3, w1, uxtw]
  208308:	10000063 	adr	x3, 208314 <pop_arg+0x24>
  20830c:	8b218861 	add	x1, x3, w1, sxtb #2
  208310:	d61f0020 	br	x1
  208314:	d503201f 	nop
  208318:	d65f03c0 	ret
  20831c:	b9401843 	ldr	w3, [x2, #24]
  208320:	f9400041 	ldr	x1, [x2]
  208324:	37f80a83 	tbnz	w3, #31, 208474 <pop_arg+0x184>
  208328:	91003c23 	add	x3, x1, #0xf
  20832c:	927df063 	and	x3, x3, #0xfffffffffffffff8
  208330:	f9000043 	str	x3, [x2]
  208334:	f9400021 	ldr	x1, [x1]
  208338:	f9000001 	str	x1, [x0]
  20833c:	d65f03c0 	ret
  208340:	b9401843 	ldr	w3, [x2, #24]
  208344:	f9400041 	ldr	x1, [x2]
  208348:	37f80a43 	tbnz	w3, #31, 208490 <pop_arg+0x1a0>
  20834c:	91002c23 	add	x3, x1, #0xb
  208350:	927df063 	and	x3, x3, #0xfffffffffffffff8
  208354:	f9000043 	str	x3, [x2]
  208358:	b9400021 	ldr	w1, [x1]
  20835c:	f9000001 	str	x1, [x0]
  208360:	d65f03c0 	ret
  208364:	b9401843 	ldr	w3, [x2, #24]
  208368:	f9400041 	ldr	x1, [x2]
  20836c:	37f80ca3 	tbnz	w3, #31, 208500 <pop_arg+0x210>
  208370:	91002c23 	add	x3, x1, #0xb
  208374:	927df063 	and	x3, x3, #0xfffffffffffffff8
  208378:	f9000043 	str	x3, [x2]
  20837c:	79400021 	ldrh	w1, [x1]
  208380:	f9000001 	str	x1, [x0]
  208384:	d65f03c0 	ret
  208388:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20838c:	b9401c43 	ldr	w3, [x2, #28]
  208390:	f9400041 	ldr	x1, [x2]
  208394:	37f809a3 	tbnz	w3, #31, 2084c8 <pop_arg+0x1d8>
  208398:	91003c23 	add	x3, x1, #0xf
  20839c:	927df063 	and	x3, x3, #0xfffffffffffffff8
  2083a0:	f9000043 	str	x3, [x2]
  2083a4:	fd400020 	ldr	d0, [x1]
  2083a8:	aa0003f3 	mov	x19, x0
  2083ac:	940024db 	bl	211718 <__extenddftf2>
  2083b0:	3d800260 	str	q0, [x19]
  2083b4:	a8c17bf3 	ldp	x19, x30, [sp], #16
  2083b8:	d65f03c0 	ret
  2083bc:	b9401843 	ldr	w3, [x2, #24]
  2083c0:	f9400041 	ldr	x1, [x2]
  2083c4:	37f80ba3 	tbnz	w3, #31, 208538 <pop_arg+0x248>
  2083c8:	91002c23 	add	x3, x1, #0xb
  2083cc:	927df063 	and	x3, x3, #0xfffffffffffffff8
  2083d0:	f9000043 	str	x3, [x2]
  2083d4:	39800021 	ldrsb	x1, [x1]
  2083d8:	f9000001 	str	x1, [x0]
  2083dc:	d65f03c0 	ret
  2083e0:	b9401843 	ldr	w3, [x2, #24]
  2083e4:	f9400041 	ldr	x1, [x2]
  2083e8:	37f80623 	tbnz	w3, #31, 2084ac <pop_arg+0x1bc>
  2083ec:	91002c23 	add	x3, x1, #0xb
  2083f0:	927df063 	and	x3, x3, #0xfffffffffffffff8
  2083f4:	f9000043 	str	x3, [x2]
  2083f8:	b9800021 	ldrsw	x1, [x1]
  2083fc:	f9000001 	str	x1, [x0]
  208400:	d65f03c0 	ret
  208404:	b9401843 	ldr	w3, [x2, #24]
  208408:	f9400041 	ldr	x1, [x2]
  20840c:	37f80883 	tbnz	w3, #31, 20851c <pop_arg+0x22c>
  208410:	91002c23 	add	x3, x1, #0xb
  208414:	927df063 	and	x3, x3, #0xfffffffffffffff8
  208418:	f9000043 	str	x3, [x2]
  20841c:	79800021 	ldrsh	x1, [x1]
  208420:	f9000001 	str	x1, [x0]
  208424:	d65f03c0 	ret
  208428:	b9401c41 	ldr	w1, [x2, #28]
  20842c:	f9400043 	ldr	x3, [x2]
  208430:	37f805a1 	tbnz	w1, #31, 2084e4 <pop_arg+0x1f4>
  208434:	91003c61 	add	x1, x3, #0xf
  208438:	927cec21 	and	x1, x1, #0xfffffffffffffff0
  20843c:	91004023 	add	x3, x1, #0x10
  208440:	f9000043 	str	x3, [x2]
  208444:	3dc00020 	ldr	q0, [x1]
  208448:	3d800000 	str	q0, [x0]
  20844c:	d65f03c0 	ret
  208450:	b9401843 	ldr	w3, [x2, #24]
  208454:	f9400041 	ldr	x1, [x2]
  208458:	37f807e3 	tbnz	w3, #31, 208554 <pop_arg+0x264>
  20845c:	91002c23 	add	x3, x1, #0xb
  208460:	927df063 	and	x3, x3, #0xfffffffffffffff8
  208464:	f9000043 	str	x3, [x2]
  208468:	39400021 	ldrb	w1, [x1]
  20846c:	f9000001 	str	x1, [x0]
  208470:	d65f03c0 	ret
  208474:	11002064 	add	w4, w3, #0x8
  208478:	b9001844 	str	w4, [x2, #24]
  20847c:	7100009f 	cmp	w4, #0x0
  208480:	54fff54c 	b.gt	208328 <pop_arg+0x38>
  208484:	f9400441 	ldr	x1, [x2, #8]
  208488:	8b23c021 	add	x1, x1, w3, sxtw
  20848c:	17ffffaa 	b	208334 <pop_arg+0x44>
  208490:	11002064 	add	w4, w3, #0x8
  208494:	b9001844 	str	w4, [x2, #24]
  208498:	7100009f 	cmp	w4, #0x0
  20849c:	54fff58c 	b.gt	20834c <pop_arg+0x5c>
  2084a0:	f9400441 	ldr	x1, [x2, #8]
  2084a4:	8b23c021 	add	x1, x1, w3, sxtw
  2084a8:	17ffffac 	b	208358 <pop_arg+0x68>
  2084ac:	11002064 	add	w4, w3, #0x8
  2084b0:	b9001844 	str	w4, [x2, #24]
  2084b4:	7100009f 	cmp	w4, #0x0
  2084b8:	54fff9ac 	b.gt	2083ec <pop_arg+0xfc>
  2084bc:	f9400441 	ldr	x1, [x2, #8]
  2084c0:	8b23c021 	add	x1, x1, w3, sxtw
  2084c4:	17ffffcd 	b	2083f8 <pop_arg+0x108>
  2084c8:	11004064 	add	w4, w3, #0x10
  2084cc:	b9001c44 	str	w4, [x2, #28]
  2084d0:	7100009f 	cmp	w4, #0x0
  2084d4:	54fff62c 	b.gt	208398 <pop_arg+0xa8>
  2084d8:	f9400841 	ldr	x1, [x2, #16]
  2084dc:	8b23c021 	add	x1, x1, w3, sxtw
  2084e0:	17ffffb1 	b	2083a4 <pop_arg+0xb4>
  2084e4:	11004024 	add	w4, w1, #0x10
  2084e8:	b9001c44 	str	w4, [x2, #28]
  2084ec:	7100009f 	cmp	w4, #0x0
  2084f0:	54fffa2c 	b.gt	208434 <pop_arg+0x144>
  2084f4:	f9400842 	ldr	x2, [x2, #16]
  2084f8:	8b21c041 	add	x1, x2, w1, sxtw
  2084fc:	17ffffd2 	b	208444 <pop_arg+0x154>
  208500:	11002064 	add	w4, w3, #0x8
  208504:	b9001844 	str	w4, [x2, #24]
  208508:	7100009f 	cmp	w4, #0x0
  20850c:	54fff32c 	b.gt	208370 <pop_arg+0x80>
  208510:	f9400441 	ldr	x1, [x2, #8]
  208514:	8b23c021 	add	x1, x1, w3, sxtw
  208518:	17ffff99 	b	20837c <pop_arg+0x8c>
  20851c:	11002064 	add	w4, w3, #0x8
  208520:	b9001844 	str	w4, [x2, #24]
  208524:	7100009f 	cmp	w4, #0x0
  208528:	54fff74c 	b.gt	208410 <pop_arg+0x120>
  20852c:	f9400441 	ldr	x1, [x2, #8]
  208530:	8b23c021 	add	x1, x1, w3, sxtw
  208534:	17ffffba 	b	20841c <pop_arg+0x12c>
  208538:	11002064 	add	w4, w3, #0x8
  20853c:	b9001844 	str	w4, [x2, #24]
  208540:	7100009f 	cmp	w4, #0x0
  208544:	54fff42c 	b.gt	2083c8 <pop_arg+0xd8>
  208548:	f9400441 	ldr	x1, [x2, #8]
  20854c:	8b23c021 	add	x1, x1, w3, sxtw
  208550:	17ffffa1 	b	2083d4 <pop_arg+0xe4>
  208554:	11002064 	add	w4, w3, #0x8
  208558:	b9001844 	str	w4, [x2, #24]
  20855c:	7100009f 	cmp	w4, #0x0
  208560:	54fff7ec 	b.gt	20845c <pop_arg+0x16c>
  208564:	f9400441 	ldr	x1, [x2, #8]
  208568:	8b23c021 	add	x1, x1, w3, sxtw
  20856c:	17ffffbf 	b	208468 <pop_arg+0x178>

0000000000208570 <pad.part.0>:
  208570:	a9ae53f3 	stp	x19, x20, [sp, #-288]!
  208574:	4b030054 	sub	w20, w2, w3
  208578:	7104029f 	cmp	w20, #0x100
  20857c:	52802002 	mov	w2, #0x100                 	// #256
  208580:	a9017bf5 	stp	x21, x30, [sp, #16]
  208584:	1a829282 	csel	w2, w20, w2, ls  // ls = plast
  208588:	aa0003f5 	mov	x21, x0
  20858c:	12001c21 	and	w1, w1, #0xff
  208590:	910083e0 	add	x0, sp, #0x20
  208594:	94000a05 	bl	20ada8 <memset>
  208598:	7103fe9f 	cmp	w20, #0xff
  20859c:	54000369 	b.ls	208608 <pad.part.0+0x98>  // b.plast
  2085a0:	b94002a0 	ldr	w0, [x21]
  2085a4:	2a1403f3 	mov	w19, w20
  2085a8:	121b0000 	and	w0, w0, #0x20
  2085ac:	14000003 	b	2085b8 <pad.part.0+0x48>
  2085b0:	7103fe7f 	cmp	w19, #0xff
  2085b4:	540001a9 	b.ls	2085e8 <pad.part.0+0x78>  // b.plast
  2085b8:	51040273 	sub	w19, w19, #0x100
  2085bc:	2a0003e2 	mov	w2, w0
  2085c0:	35ffff80 	cbnz	w0, 2085b0 <pad.part.0+0x40>
  2085c4:	aa1503e2 	mov	x2, x21
  2085c8:	d2802001 	mov	x1, #0x100                 	// #256
  2085cc:	910083e0 	add	x0, sp, #0x20
  2085d0:	940015fe 	bl	20ddc8 <__fwritex>
  2085d4:	b94002a0 	ldr	w0, [x21]
  2085d8:	7103fe7f 	cmp	w19, #0xff
  2085dc:	121b0000 	and	w0, w0, #0x20
  2085e0:	2a0003e2 	mov	w2, w0
  2085e4:	54fffea8 	b.hi	2085b8 <pad.part.0+0x48>  // b.pmore
  2085e8:	92401e81 	and	x1, x20, #0xff
  2085ec:	35000082 	cbnz	w2, 2085fc <pad.part.0+0x8c>
  2085f0:	aa1503e2 	mov	x2, x21
  2085f4:	910083e0 	add	x0, sp, #0x20
  2085f8:	940015f4 	bl	20ddc8 <__fwritex>
  2085fc:	a9417bf5 	ldp	x21, x30, [sp, #16]
  208600:	a8d253f3 	ldp	x19, x20, [sp], #288
  208604:	d65f03c0 	ret
  208608:	b94002a2 	ldr	w2, [x21]
  20860c:	93407e81 	sxtw	x1, w20
  208610:	121b0042 	and	w2, w2, #0x20
  208614:	17fffff6 	b	2085ec <pad.part.0+0x7c>

0000000000208618 <fmt_fp>:
  208618:	9e660006 	fmov	x6, d0
  20861c:	9eae0007 	fmov	x7, v0.d[1]
  208620:	d283b810 	mov	x16, #0x1dc0                	// #7616
  208624:	cb3063ff 	sub	sp, sp, x16
  208628:	9e6700c0 	fmov	d0, x6
  20862c:	a90053f3 	stp	x19, x20, [sp]
  208630:	a9015bf5 	stp	x21, x22, [sp, #16]
  208634:	aa0603f4 	mov	x20, x6
  208638:	9eaf00e0 	fmov	v0.d[1], x7
  20863c:	f90013f7 	str	x23, [sp, #32]
  208640:	a903effa 	stp	x26, x27, [sp, #56]
  208644:	aa0703f3 	mov	x19, x7
  208648:	f9002bfe 	str	x30, [sp, #80]
  20864c:	2a0203f5 	mov	w21, w2
  208650:	b9006be3 	str	w3, [sp, #104]
  208654:	aa0003f7 	mov	x23, x0
  208658:	290e93e1 	stp	w1, w4, [sp, #116]
  20865c:	b900bfff 	str	wzr, [sp, #188]
  208660:	940012e4 	bl	20d1f0 <__signbitl>
  208664:	34000760 	cbz	w0, 208750 <fmt_fp+0x138>
  208668:	d2410273 	eor	x19, x19, #0x8000000000000000
  20866c:	90000060 	adrp	x0, 214000 <syscall_table+0x800>
  208670:	5280003b 	mov	w27, #0x1                   	// #1
  208674:	91180000 	add	x0, x0, #0x600
  208678:	f9004be0 	str	x0, [sp, #144]
  20867c:	9e670280 	fmov	d0, x20
  208680:	9eaf0260 	fmov	v0.d[1], x19
  208684:	940012c7 	bl	20d1a0 <__fpclassifyl>
  208688:	7100041f 	cmp	w0, #0x1
  20868c:	540007ac 	b.gt	208780 <fmt_fp+0x168>
  208690:	b9407be0 	ldr	w0, [sp, #120]
  208694:	aa1403e2 	mov	x2, x20
  208698:	9e670281 	fmov	d1, x20
  20869c:	9e670040 	fmov	d0, x2
  2086a0:	90000064 	adrp	x4, 214000 <syscall_table+0x800>
  2086a4:	721b001a 	ands	w26, w0, #0x20
  2086a8:	91186084 	add	x4, x4, #0x618
  2086ac:	9eaf0261 	fmov	v1.d[1], x19
  2086b0:	9eaf0260 	fmov	v0.d[1], x19
  2086b4:	90000074 	adrp	x20, 214000 <syscall_table+0x800>
  2086b8:	91188294 	add	x20, x20, #0x620
  2086bc:	9a840294 	csel	x20, x20, x4, eq  // eq = none
  2086c0:	94001e12 	bl	20ff08 <__eqtf2>
  2086c4:	340000e0 	cbz	w0, 2086e0 <fmt_fp+0xc8>
  2086c8:	90000060 	adrp	x0, 214000 <syscall_table+0x800>
  2086cc:	90000074 	adrp	x20, 214000 <syscall_table+0x800>
  2086d0:	9118c000 	add	x0, x0, #0x630
  2086d4:	9118a294 	add	x20, x20, #0x628
  2086d8:	7100035f 	cmp	w26, #0x0
  2086dc:	9a800294 	csel	x20, x20, x0, eq  // eq = none
  2086e0:	b94077e1 	ldr	w1, [sp, #116]
  2086e4:	11000f73 	add	w19, w27, #0x3
  2086e8:	f94037e0 	ldr	x0, [sp, #104]
  2086ec:	6b01027f 	cmp	w19, w1
  2086f0:	1a9fb7f5 	cset	w21, ge  // ge = tcont
  2086f4:	d34d3400 	ubfx	x0, x0, #13, #1
  2086f8:	2a0002a0 	orr	w0, w21, w0
  2086fc:	34004f20 	cbz	w0, 2090e0 <fmt_fp+0xac8>
  208700:	b94002e0 	ldr	w0, [x23]
  208704:	36284ae0 	tbz	w0, #5, 209060 <fmt_fp+0xa48>
  208708:	b9406be0 	ldr	w0, [sp, #104]
  20870c:	12130c16 	and	w22, w0, #0x1e000
  208710:	121076d6 	and	w22, w22, #0xffff3fff
  208714:	71400adf 	cmp	w22, #0x2, lsl #12
  208718:	1a9f06b5 	csinc	w21, w21, wzr, eq  // eq = none
  20871c:	34004d75 	cbz	w21, 2090c8 <fmt_fp+0xab0>
  208720:	b94077e0 	ldr	w0, [sp, #116]
  208724:	6b00027f 	cmp	w19, w0
  208728:	1a80a260 	csel	w0, w19, w0, ge  // ge = tcont
  20872c:	a94053f3 	ldp	x19, x20, [sp]
  208730:	d283b810 	mov	x16, #0x1dc0                	// #7616
  208734:	a9415bf5 	ldp	x21, x22, [sp, #16]
  208738:	a943effa 	ldp	x26, x27, [sp, #56]
  20873c:	f94013f7 	ldr	x23, [sp, #32]
  208740:	f9402bfe 	ldr	x30, [sp, #80]
  208744:	8b3063ff 	add	sp, sp, x16
  208748:	d65f03c0 	ret
  20874c:	d503201f 	nop
  208750:	2a0003fb 	mov	w27, w0
  208754:	b9406be0 	ldr	w0, [sp, #104]
  208758:	36583580 	tbz	w0, #11, 208e08 <fmt_fp+0x7f0>
  20875c:	9e670280 	fmov	d0, x20
  208760:	90000060 	adrp	x0, 214000 <syscall_table+0x800>
  208764:	91180c00 	add	x0, x0, #0x603
  208768:	5280003b 	mov	w27, #0x1                   	// #1
  20876c:	9eaf0260 	fmov	v0.d[1], x19
  208770:	f9004be0 	str	x0, [sp, #144]
  208774:	9400128b 	bl	20d1a0 <__fpclassifyl>
  208778:	7100041f 	cmp	w0, #0x1
  20877c:	54fff8ad 	b.le	208690 <fmt_fp+0x78>
  208780:	9e670280 	fmov	d0, x20
  208784:	9102f3e0 	add	x0, sp, #0xbc
  208788:	a902e7f8 	stp	x24, x25, [sp, #40]
  20878c:	9eaf0260 	fmov	v0.d[1], x19
  208790:	f90027fc 	str	x28, [sp, #72]
  208794:	9400129b 	bl	20d200 <frexpl>
  208798:	4ea01c01 	mov	v1.16b, v0.16b
  20879c:	94001ac1 	bl	20f2a0 <__addtf3>
  2087a0:	9e660000 	fmov	x0, d0
  2087a4:	9eae0001 	fmov	x1, v0.d[1]
  2087a8:	6f00e401 	movi	v1.2d, #0x0
  2087ac:	9e670000 	fmov	d0, x0
  2087b0:	aa0003f4 	mov	x20, x0
  2087b4:	aa0103f3 	mov	x19, x1
  2087b8:	9eaf0020 	fmov	v0.d[1], x1
  2087bc:	94001dd3 	bl	20ff08 <__eqtf2>
  2087c0:	35003300 	cbnz	w0, 208e20 <fmt_fp+0x808>
  2087c4:	b9407be0 	ldr	w0, [sp, #120]
  2087c8:	b940bffa 	ldr	w26, [sp, #188]
  2087cc:	321b001c 	orr	w28, w0, #0x20
  2087d0:	7101879f 	cmp	w28, #0x61
  2087d4:	54003340 	b.eq	208e3c <fmt_fp+0x824>  // b.none
  2087d8:	710002bf 	cmp	w21, #0x0
  2087dc:	540046eb 	b.lt	2090b8 <fmt_fp+0xaa0>  // b.tstop
  2087e0:	1a9f07f8 	cset	w24, ne  // ne = any
  2087e4:	6f00e401 	movi	v1.2d, #0x0
  2087e8:	9e670280 	fmov	d0, x20
  2087ec:	9eaf0260 	fmov	v0.d[1], x19
  2087f0:	94001dc6 	bl	20ff08 <__eqtf2>
  2087f4:	340001a0 	cbz	w0, 208828 <fmt_fp+0x210>
  2087f8:	90000062 	adrp	x2, 214000 <syscall_table+0x800>
  2087fc:	9115c042 	add	x2, x2, #0x570
  208800:	9e670280 	fmov	d0, x20
  208804:	5100735a 	sub	w26, w26, #0x1c
  208808:	3dc00041 	ldr	q1, [x2]
  20880c:	9eaf0260 	fmov	v0.d[1], x19
  208810:	94001e02 	bl	210018 <__multf3>
  208814:	9e660000 	fmov	x0, d0
  208818:	9eae0001 	fmov	x1, v0.d[1]
  20881c:	b900bffa 	str	w26, [sp, #188]
  208820:	aa0003f4 	mov	x20, x0
  208824:	aa0103f3 	mov	x19, x1
  208828:	90000060 	adrp	x0, 214000 <syscall_table+0x800>
  20882c:	91160000 	add	x0, x0, #0x580
  208830:	9103e3f9 	add	x25, sp, #0xf8
  208834:	7100035f 	cmp	w26, #0x0
  208838:	d2837f03 	mov	x3, #0x1bf8                	// #7160
  20883c:	8b2363e1 	add	x1, sp, x3
  208840:	9a81b339 	csel	x25, x25, x1, lt  // lt = tstop
  208844:	3dc00000 	ldr	q0, [x0]
  208848:	aa1903f6 	mov	x22, x25
  20884c:	3d8023e0 	str	q0, [sp, #128]
  208850:	9e670280 	fmov	d0, x20
  208854:	9eaf0260 	fmov	v0.d[1], x19
  208858:	94002346 	bl	211570 <__fixunstfsi>
  20885c:	b80046c0 	str	w0, [x22], #4
  208860:	94002396 	bl	2116b8 <__floatunsitf>
  208864:	4ea01c01 	mov	v1.16b, v0.16b
  208868:	9e670280 	fmov	d0, x20
  20886c:	9eaf0260 	fmov	v0.d[1], x19
  208870:	94001ff0 	bl	210830 <__subtf3>
  208874:	3dc023e1 	ldr	q1, [sp, #128]
  208878:	94001de8 	bl	210018 <__multf3>
  20887c:	9e660000 	fmov	x0, d0
  208880:	9eae0001 	fmov	x1, v0.d[1]
  208884:	6f00e401 	movi	v1.2d, #0x0
  208888:	9e670000 	fmov	d0, x0
  20888c:	aa0003f4 	mov	x20, x0
  208890:	aa0103f3 	mov	x19, x1
  208894:	9eaf0020 	fmov	v0.d[1], x1
  208898:	94001d9c 	bl	20ff08 <__eqtf2>
  20889c:	35fffda0 	cbnz	w0, 208850 <fmt_fp+0x238>
  2088a0:	aa1903e5 	mov	x5, x25
  2088a4:	7100035f 	cmp	w26, #0x0
  2088a8:	5400058d 	b.le	208958 <fmt_fp+0x340>
  2088ac:	d28b4a6a 	mov	x10, #0x5a53                	// #23123
  2088b0:	d2994009 	mov	x9, #0xca00                	// #51712
  2088b4:	f2b4136a 	movk	x10, #0xa09b, lsl #16
  2088b8:	528003ab 	mov	w11, #0x1d                  	// #29
  2088bc:	f2d705ea 	movk	x10, #0xb82f, lsl #32
  2088c0:	f2a77349 	movk	x9, #0x3b9a, lsl #16
  2088c4:	f2e0088a 	movk	x10, #0x44, lsl #48
  2088c8:	7100775f 	cmp	w26, #0x1d
  2088cc:	d10012c2 	sub	x2, x22, #0x4
  2088d0:	1a8bd348 	csel	w8, w26, w11, le
  2088d4:	aa0203e3 	mov	x3, x2
  2088d8:	eb05005f 	cmp	x2, x5
  2088dc:	54000203 	b.cc	20891c <fmt_fp+0x304>  // b.lo, b.ul, b.last
  2088e0:	52800007 	mov	w7, #0x0                   	// #0
  2088e4:	b9400060 	ldr	w0, [x3]
  2088e8:	9ac82000 	lsl	x0, x0, x8
  2088ec:	8b274000 	add	x0, x0, w7, uxtw
  2088f0:	d349fc01 	lsr	x1, x0, #9
  2088f4:	9bca7c21 	umulh	x1, x1, x10
  2088f8:	d34bfc21 	lsr	x1, x1, #11
  2088fc:	2a0103e7 	mov	w7, w1
  208900:	9b098020 	msub	x0, x1, x9, x0
  208904:	b81fc460 	str	w0, [x3], #-4
  208908:	eb05007f 	cmp	x3, x5
  20890c:	54fffec2 	b.cs	2088e4 <fmt_fp+0x2cc>  // b.hs, b.nlast
  208910:	34000061 	cbz	w1, 20891c <fmt_fp+0x304>
  208914:	b81fc0a1 	stur	w1, [x5, #-4]
  208918:	d10010a5 	sub	x5, x5, #0x4
  20891c:	eb1600bf 	cmp	x5, x22
  208920:	54000142 	b.cs	208948 <fmt_fp+0x330>  // b.hs, b.nlast
  208924:	b85fc2c0 	ldur	w0, [x22, #-4]
  208928:	340000a0 	cbz	w0, 20893c <fmt_fp+0x324>
  20892c:	14000007 	b	208948 <fmt_fp+0x330>
  208930:	b85fc040 	ldur	w0, [x2, #-4]
  208934:	d1001042 	sub	x2, x2, #0x4
  208938:	35000080 	cbnz	w0, 208948 <fmt_fp+0x330>
  20893c:	aa0203f6 	mov	x22, x2
  208940:	eb05005f 	cmp	x2, x5
  208944:	54ffff68 	b.hi	208930 <fmt_fp+0x318>  // b.pmore
  208948:	4b08035a 	sub	w26, w26, w8
  20894c:	7100035f 	cmp	w26, #0x0
  208950:	54fffbcc 	b.gt	2088c8 <fmt_fp+0x2b0>
  208954:	b900bffa 	str	w26, [sp, #188]
  208958:	340005fa 	cbz	w26, 208a14 <fmt_fp+0x3fc>
  20895c:	1100b6aa 	add	w10, w21, #0x2d
  208960:	5291c720 	mov	w0, #0x8e39                	// #36409
  208964:	72a71c60 	movk	w0, #0x38e3, lsl #16
  208968:	5299400c 	mov	w12, #0xca00                	// #51712
  20896c:	5280002d 	mov	w13, #0x1                   	// #1
  208970:	72a7734c 	movk	w12, #0x3b9a, lsl #16
  208974:	9ba07d4a 	umull	x10, w10, w0
  208978:	d361fd4a 	lsr	x10, x10, #33
  20897c:	9100054a 	add	x10, x10, #0x1
  208980:	d37ef54b 	lsl	x11, x10, #2
  208984:	3100275f 	cmn	w26, #0x9
  208988:	5400440a 	b.ge	209208 <fmt_fp+0xbf0>  // b.tcont
  20898c:	1100275a 	add	w26, w26, #0x9
  208990:	52800128 	mov	w8, #0x9                   	// #9
  208994:	eb0502df 	cmp	x22, x5
  208998:	b94000a0 	ldr	w0, [x5]
  20899c:	54004409 	b.ls	20921c <fmt_fp+0xc04>  // b.plast
  2089a0:	1ac821a7 	lsl	w7, w13, w8
  2089a4:	aa0503e1 	mov	x1, x5
  2089a8:	510004e7 	sub	w7, w7, #0x1
  2089ac:	1ac82989 	asr	w9, w12, w8
  2089b0:	52800002 	mov	w2, #0x0                   	// #0
  2089b4:	14000002 	b	2089bc <fmt_fp+0x3a4>
  2089b8:	b9400020 	ldr	w0, [x1]
  2089bc:	0a0000e3 	and	w3, w7, w0
  2089c0:	1ac82400 	lsr	w0, w0, w8
  2089c4:	0b020000 	add	w0, w0, w2
  2089c8:	b8004420 	str	w0, [x1], #4
  2089cc:	1b097c62 	mul	w2, w3, w9
  2089d0:	eb16003f 	cmp	x1, x22
  2089d4:	54ffff23 	b.cc	2089b8 <fmt_fp+0x3a0>  // b.lo, b.ul, b.last
  2089d8:	aa0503e0 	mov	x0, x5
  2089dc:	b8404401 	ldr	w1, [x0], #4
  2089e0:	7100003f 	cmp	w1, #0x0
  2089e4:	9a850005 	csel	x5, x0, x5, eq  // eq = none
  2089e8:	34000062 	cbz	w2, 2089f4 <fmt_fp+0x3dc>
  2089ec:	b90002c2 	str	w2, [x22]
  2089f0:	910012d6 	add	x22, x22, #0x4
  2089f4:	71019b9f 	cmp	w28, #0x66
  2089f8:	9a850320 	csel	x0, x25, x5, eq  // eq = none
  2089fc:	cb0002c1 	sub	x1, x22, x0
  208a00:	8b0b0000 	add	x0, x0, x11
  208a04:	eb81095f 	cmp	x10, x1, asr #2
  208a08:	9a96b016 	csel	x22, x0, x22, lt  // lt = tstop
  208a0c:	35fffbda 	cbnz	w26, 208984 <fmt_fp+0x36c>
  208a10:	b900bfff 	str	wzr, [sp, #188]
  208a14:	eb0502df 	cmp	x22, x5
  208a18:	54004789 	b.ls	209308 <fmt_fp+0xcf0>  // b.plast
  208a1c:	cb050334 	sub	x20, x25, x5
  208a20:	b94000a2 	ldr	w2, [x5]
  208a24:	71019b9f 	cmp	w28, #0x66
  208a28:	9342fe94 	asr	x20, x20, #2
  208a2c:	1a9f07e0 	cset	w0, ne  // ne = any
  208a30:	0b140e94 	add	w20, w20, w20, lsl #3
  208a34:	52800141 	mov	w1, #0xa                   	// #10
  208a38:	7100245f 	cmp	w2, #0x9
  208a3c:	540000c9 	b.ls	208a54 <fmt_fp+0x43c>  // b.plast
  208a40:	0b010821 	add	w1, w1, w1, lsl #2
  208a44:	11000694 	add	w20, w20, #0x1
  208a48:	531f7821 	lsl	w1, w1, #1
  208a4c:	6b02003f 	cmp	w1, w2
  208a50:	54ffff89 	b.ls	208a40 <fmt_fp+0x428>  // b.plast
  208a54:	1b00d680 	msub	w0, w20, w0, w21
  208a58:	cb1902c1 	sub	x1, x22, x25
  208a5c:	71019f9f 	cmp	w28, #0x67
  208a60:	9342fc21 	asr	x1, x1, #2
  208a64:	1a9f0302 	csel	w2, w24, wzr, eq  // eq = none
  208a68:	d1000421 	sub	x1, x1, #0x1
  208a6c:	4b020000 	sub	w0, w0, w2
  208a70:	8b010c21 	add	x1, x1, x1, lsl #3
  208a74:	eb20c03f 	cmp	x1, w0, sxtw
  208a78:	540008ed 	b.le	208b94 <fmt_fp+0x57c>
  208a7c:	11409000 	add	w0, w0, #0x24, lsl #12
  208a80:	5291c721 	mov	w1, #0x8e39                	// #36409
  208a84:	72a71c61 	movk	w1, #0x38e3, lsl #16
  208a88:	9b217c01 	smull	x1, w0, w1
  208a8c:	9361fc21 	asr	x1, x1, #33
  208a90:	4b807c21 	sub	w1, w1, w0, asr #31
  208a94:	0b010c22 	add	w2, w1, w1, lsl #3
  208a98:	8b21cb21 	add	x1, x25, w1, sxtw #2
  208a9c:	4b020000 	sub	w0, w0, w2
  208aa0:	929fff62 	mov	x2, #0xffffffffffff0004    	// #-65532
  208aa4:	11000400 	add	w0, w0, #0x1
  208aa8:	8b020033 	add	x19, x1, x2
  208aac:	7100241f 	cmp	w0, #0x9
  208ab0:	540067a0 	b.eq	2097a4 <fmt_fp+0x118c>  // b.none
  208ab4:	52800141 	mov	w1, #0xa                   	// #10
  208ab8:	0b010821 	add	w1, w1, w1, lsl #2
  208abc:	11000400 	add	w0, w0, #0x1
  208ac0:	531f7821 	lsl	w1, w1, #1
  208ac4:	7100241f 	cmp	w0, #0x9
  208ac8:	54ffff81 	b.ne	208ab8 <fmt_fp+0x4a0>  // b.any
  208acc:	2a0103f8 	mov	w24, w1
  208ad0:	b9400260 	ldr	w0, [x19]
  208ad4:	1ad80807 	udiv	w7, w0, w24
  208ad8:	1b1880e3 	msub	w3, w7, w24, w0
  208adc:	350000a3 	cbnz	w3, 208af0 <fmt_fp+0x4d8>
  208ae0:	91001268 	add	x8, x19, #0x4
  208ae4:	aa1603e2 	mov	x2, x22
  208ae8:	eb0802df 	cmp	x22, x8
  208aec:	54000500 	b.eq	208b8c <fmt_fp+0x574>  // b.none
  208af0:	37004d47 	tbnz	w7, #0, 209498 <fmt_fp+0xe80>
  208af4:	52994002 	mov	w2, #0xca00                	// #51712
  208af8:	72a77342 	movk	w2, #0x3b9a, lsl #16
  208afc:	6b02003f 	cmp	w1, w2
  208b00:	fa450260 	ccmp	x19, x5, #0x0, eq  // eq = none
  208b04:	54004c68 	b.hi	209490 <fmt_fp+0xe78>  // b.pmore
  208b08:	90000062 	adrp	x2, 214000 <syscall_table+0x800>
  208b0c:	d2800007 	mov	x7, #0x0                   	// #0
  208b10:	f9429442 	ldr	x2, [x2, #1320]
  208b14:	13017c21 	asr	w1, w1, #1
  208b18:	6b03003f 	cmp	w1, w3
  208b1c:	54005108 	b.hi	20953c <fmt_fp+0xf24>  // b.pmore
  208b20:	54005960 	b.eq	20964c <fmt_fp+0x1034>  // b.none
  208b24:	90000061 	adrp	x1, 214000 <syscall_table+0x800>
  208b28:	f942b421 	ldr	x1, [x1, #1384]
  208b2c:	340000bb 	cbz	w27, 208b40 <fmt_fp+0x528>
  208b30:	f9404be4 	ldr	x4, [sp, #144]
  208b34:	39400088 	ldrb	w8, [x4]
  208b38:	7100b51f 	cmp	w8, #0x2d
  208b3c:	54005940 	b.eq	209664 <fmt_fp+0x104c>  // b.none
  208b40:	d280000a 	mov	x10, #0x0                   	// #0
  208b44:	9e6700e0 	fmov	d0, x7
  208b48:	9e670141 	fmov	d1, x10
  208b4c:	f90057e5 	str	x5, [sp, #168]
  208b50:	9eaf0040 	fmov	v0.d[1], x2
  208b54:	4b03001a 	sub	w26, w0, w3
  208b58:	9eaf0021 	fmov	v1.d[1], x1
  208b5c:	f90043e2 	str	x2, [sp, #128]
  208b60:	f9004fe7 	str	x7, [sp, #152]
  208b64:	940019cf 	bl	20f2a0 <__addtf3>
  208b68:	f9404fe7 	ldr	x7, [sp, #152]
  208b6c:	f94043e2 	ldr	x2, [sp, #128]
  208b70:	9e6700e1 	fmov	d1, x7
  208b74:	9eaf0041 	fmov	v1.d[1], x2
  208b78:	94001ce4 	bl	20ff08 <__eqtf2>
  208b7c:	f94057e5 	ldr	x5, [sp, #168]
  208b80:	35004e40 	cbnz	w0, 209548 <fmt_fp+0xf30>
  208b84:	aa1303e2 	mov	x2, x19
  208b88:	b800445a 	str	w26, [x2], #4
  208b8c:	eb0202df 	cmp	x22, x2
  208b90:	9a8292d6 	csel	x22, x22, x2, ls  // ls = plast
  208b94:	eb1600bf 	cmp	x5, x22
  208b98:	540000a3 	b.cc	208bac <fmt_fp+0x594>  // b.lo, b.ul, b.last
  208b9c:	14000006 	b	208bb4 <fmt_fp+0x59c>
  208ba0:	d10012d6 	sub	x22, x22, #0x4
  208ba4:	eb0502df 	cmp	x22, x5
  208ba8:	54000069 	b.ls	208bb4 <fmt_fp+0x59c>  // b.plast
  208bac:	b85fc2c0 	ldur	w0, [x22, #-4]
  208bb0:	34ffff80 	cbz	w0, 208ba0 <fmt_fp+0x588>
  208bb4:	71019f9f 	cmp	w28, #0x67
  208bb8:	54002a00 	b.eq	2090f8 <fmt_fp+0xae0>  // b.none
  208bbc:	35003015 	cbnz	w21, 2091bc <fmt_fp+0xba4>
  208bc0:	f94037e0 	ldr	x0, [sp, #104]
  208bc4:	52800033 	mov	w19, #0x1                   	// #1
  208bc8:	d3430c00 	ubfx	x0, x0, #3, #1
  208bcc:	0b130013 	add	w19, w0, w19
  208bd0:	b9407be0 	ldr	w0, [sp, #120]
  208bd4:	321b001c 	orr	w28, w0, #0x20
  208bd8:	12b00000 	mov	w0, #0x7fffffff            	// #2147483647
  208bdc:	71019b9f 	cmp	w28, #0x66
  208be0:	4b130008 	sub	w8, w0, w19
  208be4:	54003060 	b.eq	2091f0 <fmt_fp+0xbd8>  // b.none
  208be8:	7100029f 	cmp	w20, #0x0
  208bec:	910333e6 	add	x6, sp, #0xcc
  208bf0:	5a94a683 	cneg	w3, w20, lt  // lt = tstop
  208bf4:	aa0603e2 	mov	x2, x6
  208bf8:	93407c63 	sxtw	x3, w3
  208bfc:	340001d4 	cbz	w20, 208c34 <fmt_fp+0x61c>
  208c00:	b202e7e7 	mov	x7, #0xcccccccccccccccc    	// #-3689348814741910324
  208c04:	f29999a7 	movk	x7, #0xcccd
  208c08:	9bc77c61 	umulh	x1, x3, x7
  208c0c:	d343fc21 	lsr	x1, x1, #3
  208c10:	8b010820 	add	x0, x1, x1, lsl #2
  208c14:	cb000460 	sub	x0, x3, x0, lsl #1
  208c18:	aa0103e3 	mov	x3, x1
  208c1c:	1100c000 	add	w0, w0, #0x30
  208c20:	381ffc40 	strb	w0, [x2, #-1]!
  208c24:	b5ffff21 	cbnz	x1, 208c08 <fmt_fp+0x5f0>
  208c28:	cb0200c0 	sub	x0, x6, x2
  208c2c:	f100041f 	cmp	x0, #0x1
  208c30:	540000cc 	b.gt	208c48 <fmt_fp+0x630>
  208c34:	52800600 	mov	w0, #0x30                  	// #48
  208c38:	381ffc40 	strb	w0, [x2, #-1]!
  208c3c:	cb0200c3 	sub	x3, x6, x2
  208c40:	f100047f 	cmp	x3, #0x1
  208c44:	54ffffad 	b.le	208c38 <fmt_fp+0x620>
  208c48:	7100029f 	cmp	w20, #0x0
  208c4c:	528005a1 	mov	w1, #0x2d                  	// #45
  208c50:	52800560 	mov	w0, #0x2b                  	// #43
  208c54:	1a81a000 	csel	w0, w0, w1, ge  // ge = tcont
  208c58:	3941e3e1 	ldrb	w1, [sp, #120]
  208c5c:	d1000843 	sub	x3, x2, #0x2
  208c60:	381fe041 	sturb	w1, [x2, #-2]
  208c64:	cb0300c1 	sub	x1, x6, x3
  208c68:	381ff040 	sturb	w0, [x2, #-1]
  208c6c:	eb28c03f 	cmp	x1, w8, sxtw
  208c70:	f90053e3 	str	x3, [sp, #160]
  208c74:	540059ec 	b.gt	2097b0 <fmt_fp+0x1198>
  208c78:	0b010273 	add	w19, w19, w1
  208c7c:	12b00000 	mov	w0, #0x7fffffff            	// #2147483647
  208c80:	4b1b0000 	sub	w0, w0, w27
  208c84:	6b13001f 	cmp	w0, w19
  208c88:	5400594b 	b.lt	2097b0 <fmt_fp+0x1198>  // b.tstop
  208c8c:	b9406be0 	ldr	w0, [sp, #104]
  208c90:	0b1b0273 	add	w19, w19, w27
  208c94:	b94077e1 	ldr	w1, [sp, #116]
  208c98:	12130c00 	and	w0, w0, #0x1e000
  208c9c:	6b01027f 	cmp	w19, w1
  208ca0:	12107400 	and	w0, w0, #0xffff3fff
  208ca4:	1a9fb7f4 	cset	w20, ge  // ge = tcont
  208ca8:	7100001f 	cmp	w0, #0x0
  208cac:	1a9f0680 	csinc	w0, w20, wzr, eq  // eq = none
  208cb0:	34005020 	cbz	w0, 2096b4 <fmt_fp+0x109c>
  208cb4:	b94002e0 	ldr	w0, [x23]
  208cb8:	36283d20 	tbz	w0, #5, 20945c <fmt_fp+0xe44>
  208cbc:	b9406be0 	ldr	w0, [sp, #104]
  208cc0:	12130c00 	and	w0, w0, #0x1e000
  208cc4:	12107400 	and	w0, w0, #0xffff3fff
  208cc8:	7140401f 	cmp	w0, #0x10, lsl #12
  208ccc:	1a9f0680 	csinc	w0, w20, wzr, eq  // eq = none
  208cd0:	34004e20 	cbz	w0, 209694 <fmt_fp+0x107c>
  208cd4:	71019b9f 	cmp	w28, #0x66
  208cd8:	540031e0 	b.eq	209314 <fmt_fp+0xcfc>  // b.none
  208cdc:	eb1600bf 	cmp	x5, x22
  208ce0:	910010a0 	add	x0, x5, #0x4
  208ce4:	9a962016 	csel	x22, x0, x22, cs  // cs = hs, nlast
  208ce8:	710002bf 	cmp	w21, #0x0
  208cec:	fa45a2c0 	ccmp	x22, x5, #0x0, ge  // ge = tcont
  208cf0:	540005c9 	b.ls	208da8 <fmt_fp+0x790>  // b.plast
  208cf4:	910343f8 	add	x24, sp, #0xd0
  208cf8:	b202e7fb 	mov	x27, #0xcccccccccccccccc    	// #-3689348814741910324
  208cfc:	9100271a 	add	x26, x24, #0x9
  208d00:	aa0503fc 	mov	x28, x5
  208d04:	aa1a03f9 	mov	x25, x26
  208d08:	90000060 	adrp	x0, 214000 <syscall_table+0x800>
  208d0c:	f29999bb 	movk	x27, #0xcccd
  208d10:	9118e000 	add	x0, x0, #0x638
  208d14:	f9004be0 	str	x0, [sp, #144]
  208d18:	b9400383 	ldr	w3, [x28]
  208d1c:	91002700 	add	x0, x24, #0x9
  208d20:	b94002e6 	ldr	w6, [x23]
  208d24:	b4002863 	cbz	x3, 209230 <fmt_fp+0xc18>
  208d28:	9bdb7c62 	umulh	x2, x3, x27
  208d2c:	d343fc42 	lsr	x2, x2, #3
  208d30:	8b020841 	add	x1, x2, x2, lsl #2
  208d34:	cb010461 	sub	x1, x3, x1, lsl #1
  208d38:	aa0203e3 	mov	x3, x2
  208d3c:	1100c021 	add	w1, w1, #0x30
  208d40:	381ffc01 	strb	w1, [x0, #-1]!
  208d44:	b5ffff22 	cbnz	x2, 208d28 <fmt_fp+0x710>
  208d48:	eb19001f 	cmp	x0, x25
  208d4c:	54002720 	b.eq	209230 <fmt_fp+0xc18>  // b.none
  208d50:	121b00c1 	and	w1, w6, #0x20
  208d54:	eb1c00bf 	cmp	x5, x28
  208d58:	54002780 	b.eq	209248 <fmt_fp+0xc30>  // b.none
  208d5c:	eb18001f 	cmp	x0, x24
  208d60:	540000a9 	b.ls	208d74 <fmt_fp+0x75c>  // b.plast
  208d64:	52800602 	mov	w2, #0x30                  	// #48
  208d68:	381ffc02 	strb	w2, [x0, #-1]!
  208d6c:	eb18001f 	cmp	x0, x24
  208d70:	54ffffc8 	b.hi	208d68 <fmt_fp+0x750>  // b.pmore
  208d74:	cb000343 	sub	x3, x26, x0
  208d78:	35000101 	cbnz	w1, 208d98 <fmt_fp+0x780>
  208d7c:	93407ea1 	sxtw	x1, w21
  208d80:	a90797e3 	stp	x3, x5, [sp, #120]
  208d84:	eb03003f 	cmp	x1, x3
  208d88:	aa1703e2 	mov	x2, x23
  208d8c:	9a83d021 	csel	x1, x1, x3, le
  208d90:	9400140e 	bl	20ddc8 <__fwritex>
  208d94:	a94797e3 	ldp	x3, x5, [sp, #120]
  208d98:	9100139c 	add	x28, x28, #0x4
  208d9c:	6b0302b5 	subs	w21, w21, w3
  208da0:	fa5c52c0 	ccmp	x22, x28, #0x0, pl  // pl = nfrst
  208da4:	54fffba8 	b.hi	208d18 <fmt_fp+0x700>  // b.pmore
  208da8:	11004aa2 	add	w2, w21, #0x12
  208dac:	7100485f 	cmp	w2, #0x12
  208db0:	5400414c 	b.gt	2095d8 <fmt_fp+0xfc0>
  208db4:	b94002e0 	ldr	w0, [x23]
  208db8:	36284040 	tbz	w0, #5, 2095c0 <fmt_fp+0xfa8>
  208dbc:	b9406be0 	ldr	w0, [sp, #104]
  208dc0:	12130c16 	and	w22, w0, #0x1e000
  208dc4:	121076d6 	and	w22, w22, #0xffff3fff
  208dc8:	71400adf 	cmp	w22, #0x2, lsl #12
  208dcc:	1a9f0694 	csinc	w20, w20, wzr, eq  // eq = none
  208dd0:	34004834 	cbz	w20, 2096d4 <fmt_fp+0x10bc>
  208dd4:	b94077e0 	ldr	w0, [sp, #116]
  208dd8:	d283b810 	mov	x16, #0x1dc0                	// #7616
  208ddc:	a942e7f8 	ldp	x24, x25, [sp, #40]
  208de0:	6b00027f 	cmp	w19, w0
  208de4:	1a80a260 	csel	w0, w19, w0, ge  // ge = tcont
  208de8:	f94027fc 	ldr	x28, [sp, #72]
  208dec:	a94053f3 	ldp	x19, x20, [sp]
  208df0:	a9415bf5 	ldp	x21, x22, [sp, #16]
  208df4:	a943effa 	ldp	x26, x27, [sp, #56]
  208df8:	f94013f7 	ldr	x23, [sp, #32]
  208dfc:	f9402bfe 	ldr	x30, [sp, #80]
  208e00:	8b3063ff 	add	sp, sp, x16
  208e04:	d65f03c0 	ret
  208e08:	36001500 	tbz	w0, #0, 2090a8 <fmt_fp+0xa90>
  208e0c:	90000060 	adrp	x0, 214000 <syscall_table+0x800>
  208e10:	5280003b 	mov	w27, #0x1                   	// #1
  208e14:	91181800 	add	x0, x0, #0x606
  208e18:	f9004be0 	str	x0, [sp, #144]
  208e1c:	17fffe18 	b	20867c <fmt_fp+0x64>
  208e20:	b940bfe6 	ldr	w6, [sp, #188]
  208e24:	b9407be0 	ldr	w0, [sp, #120]
  208e28:	510004da 	sub	w26, w6, #0x1
  208e2c:	b900bffa 	str	w26, [sp, #188]
  208e30:	321b001c 	orr	w28, w0, #0x20
  208e34:	7101879f 	cmp	w28, #0x61
  208e38:	54ffcd01 	b.ne	2087d8 <fmt_fp+0x1c0>  // b.any
  208e3c:	f9404be1 	ldr	x1, [sp, #144]
  208e40:	721b001c 	ands	w28, w0, #0x20
  208e44:	90000079 	adrp	x25, 214000 <syscall_table+0x800>
  208e48:	91002420 	add	x0, x1, #0x9
  208e4c:	9a811000 	csel	x0, x0, x1, ne  // ne = any
  208e50:	f9004be0 	str	x0, [sp, #144]
  208e54:	11000b60 	add	w0, w27, #0x2
  208e58:	b9009be0 	str	w0, [sp, #152]
  208e5c:	71006abf 	cmp	w21, #0x1a
  208e60:	540044e9 	b.ls	2096fc <fmt_fp+0x10e4>  // b.plast
  208e64:	7100035f 	cmp	w26, #0x0
  208e68:	910303f6 	add	x22, sp, #0xc0
  208e6c:	5a9aa742 	cneg	w2, w26, lt  // lt = tstop
  208e70:	93407c42 	sxtw	x2, w2
  208e74:	340043da 	cbz	w26, 2096ec <fmt_fp+0x10d4>
  208e78:	b202e7e4 	mov	x4, #0xcccccccccccccccc    	// #-3689348814741910324
  208e7c:	910032c3 	add	x3, x22, #0xc
  208e80:	f29999a4 	movk	x4, #0xcccd
  208e84:	9bc47c41 	umulh	x1, x2, x4
  208e88:	d343fc21 	lsr	x1, x1, #3
  208e8c:	8b010820 	add	x0, x1, x1, lsl #2
  208e90:	cb000440 	sub	x0, x2, x0, lsl #1
  208e94:	aa0103e2 	mov	x2, x1
  208e98:	1100c000 	add	w0, w0, #0x30
  208e9c:	381ffc60 	strb	w0, [x3, #-1]!
  208ea0:	b5ffff21 	cbnz	x1, 208e84 <fmt_fp+0x86c>
  208ea4:	910032c0 	add	x0, x22, #0xc
  208ea8:	eb00007f 	cmp	x3, x0
  208eac:	54004200 	b.eq	2096ec <fmt_fp+0x10d4>  // b.none
  208eb0:	91144339 	add	x25, x25, #0x510
  208eb4:	90000060 	adrp	x0, 214000 <syscall_table+0x800>
  208eb8:	13001f9b 	sxtb	w27, w28
  208ebc:	9120a01c 	add	x28, x0, #0x828
  208ec0:	b9406be0 	ldr	w0, [sp, #104]
  208ec4:	910343f8 	add	x24, sp, #0xd0
  208ec8:	3dc00320 	ldr	q0, [x25]
  208ecc:	7100035f 	cmp	w26, #0x0
  208ed0:	b9407be2 	ldr	w2, [sp, #120]
  208ed4:	d1000861 	sub	x1, x3, #0x2
  208ed8:	121d0000 	and	w0, w0, #0x8
  208edc:	aa1803f9 	mov	x25, x24
  208ee0:	11003c5a 	add	w26, w2, #0xf
  208ee4:	f90053e1 	str	x1, [sp, #160]
  208ee8:	b900abe0 	str	w0, [sp, #168]
  208eec:	528005a1 	mov	w1, #0x2d                  	// #45
  208ef0:	52800560 	mov	w0, #0x2b                  	// #43
  208ef4:	381fe07a 	sturb	w26, [x3, #-2]
  208ef8:	1a81a000 	csel	w0, w0, w1, ge  // ge = tcont
  208efc:	381ff060 	sturb	w0, [x3, #-1]
  208f00:	3d8023e0 	str	q0, [sp, #128]
  208f04:	9e670280 	fmov	d0, x20
  208f08:	9100073a 	add	x26, x25, #0x1
  208f0c:	9eaf0260 	fmov	v0.d[1], x19
  208f10:	9400215a 	bl	211478 <__fixtfsi>
  208f14:	3860cb81 	ldrb	w1, [x28, w0, sxtw]
  208f18:	2a010361 	orr	w1, w27, w1
  208f1c:	39000321 	strb	w1, [x25]
  208f20:	940021cc 	bl	211650 <__floatsitf>
  208f24:	4ea01c01 	mov	v1.16b, v0.16b
  208f28:	9e670280 	fmov	d0, x20
  208f2c:	9eaf0260 	fmov	v0.d[1], x19
  208f30:	94001e40 	bl	210830 <__subtf3>
  208f34:	3dc023e1 	ldr	q1, [sp, #128]
  208f38:	94001c38 	bl	210018 <__multf3>
  208f3c:	9e660000 	fmov	x0, d0
  208f40:	9eae0001 	fmov	x1, v0.d[1]
  208f44:	aa0003f4 	mov	x20, x0
  208f48:	cb180340 	sub	x0, x26, x24
  208f4c:	aa0103f3 	mov	x19, x1
  208f50:	f100041f 	cmp	x0, #0x1
  208f54:	54001ba0 	b.eq	2092c8 <fmt_fp+0xcb0>  // b.none
  208f58:	aa1a03f9 	mov	x25, x26
  208f5c:	6f00e401 	movi	v1.2d, #0x0
  208f60:	9e670280 	fmov	d0, x20
  208f64:	9eaf0260 	fmov	v0.d[1], x19
  208f68:	94001be8 	bl	20ff08 <__eqtf2>
  208f6c:	35fffcc0 	cbnz	w0, 208f04 <fmt_fp+0x8ec>
  208f70:	f94053e1 	ldr	x1, [sp, #160]
  208f74:	910032d3 	add	x19, x22, #0xc
  208f78:	d29fffa0 	mov	x0, #0xfffd                	// #65533
  208f7c:	b9809bfb 	ldrsw	x27, [sp, #152]
  208f80:	cb010273 	sub	x19, x19, x1
  208f84:	f2afffe0 	movk	x0, #0x7fff, lsl #16
  208f88:	cb130000 	sub	x0, x0, x19
  208f8c:	93407ea1 	sxtw	x1, w21
  208f90:	cb1b0000 	sub	x0, x0, x27
  208f94:	eb00003f 	cmp	x1, x0
  208f98:	540040cc 	b.gt	2097b0 <fmt_fp+0x1198>
  208f9c:	cb180339 	sub	x25, x25, x24
  208fa0:	34000095 	cbz	w21, 208fb0 <fmt_fp+0x998>
  208fa4:	d1000720 	sub	x0, x25, #0x1
  208fa8:	eb00003f 	cmp	x1, x0
  208fac:	540032aa 	b.ge	209600 <fmt_fp+0xfe8>  // b.tcont
  208fb0:	0b13033a 	add	w26, w25, w19
  208fb4:	b9409be0 	ldr	w0, [sp, #152]
  208fb8:	b94077e1 	ldr	w1, [sp, #116]
  208fbc:	0b00035c 	add	w28, w26, w0
  208fc0:	b9406be0 	ldr	w0, [sp, #104]
  208fc4:	6b01039f 	cmp	w28, w1
  208fc8:	12130c00 	and	w0, w0, #0x1e000
  208fcc:	1a9fb7f5 	cset	w21, ge  // ge = tcont
  208fd0:	12107400 	and	w0, w0, #0xffff3fff
  208fd4:	7100001f 	cmp	w0, #0x0
  208fd8:	1a9f06a0 	csinc	w0, w21, wzr, eq  // eq = none
  208fdc:	34003d80 	cbz	w0, 20978c <fmt_fp+0x1174>
  208fe0:	b94002e0 	ldr	w0, [x23]
  208fe4:	36282620 	tbz	w0, #5, 2094a8 <fmt_fp+0xe90>
  208fe8:	b9406be0 	ldr	w0, [sp, #104]
  208fec:	4b130354 	sub	w20, w26, w19
  208ff0:	4b190294 	sub	w20, w20, w25
  208ff4:	12130c00 	and	w0, w0, #0x1e000
  208ff8:	12107400 	and	w0, w0, #0xffff3fff
  208ffc:	7140401f 	cmp	w0, #0x10, lsl #12
  209000:	1a9f06a0 	csinc	w0, w21, wzr, eq  // eq = none
  209004:	34002660 	cbz	w0, 2094d0 <fmt_fp+0xeb8>
  209008:	7100029f 	cmp	w20, #0x0
  20900c:	5400280c 	b.gt	20950c <fmt_fp+0xef4>
  209010:	b9406be0 	ldr	w0, [sp, #104]
  209014:	12130c16 	and	w22, w0, #0x1e000
  209018:	121076d6 	and	w22, w22, #0xffff3fff
  20901c:	71400adf 	cmp	w22, #0x2, lsl #12
  209020:	1a9f06b5 	csinc	w21, w21, wzr, eq  // eq = none
  209024:	34003a95 	cbz	w21, 209774 <fmt_fp+0x115c>
  209028:	b94077e0 	ldr	w0, [sp, #116]
  20902c:	d283b810 	mov	x16, #0x1dc0                	// #7616
  209030:	a942e7f8 	ldp	x24, x25, [sp, #40]
  209034:	6b00039f 	cmp	w28, w0
  209038:	1a80a380 	csel	w0, w28, w0, ge  // ge = tcont
  20903c:	f94013f7 	ldr	x23, [sp, #32]
  209040:	f94027fc 	ldr	x28, [sp, #72]
  209044:	a94053f3 	ldp	x19, x20, [sp]
  209048:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20904c:	a943effa 	ldp	x26, x27, [sp, #56]
  209050:	f9402bfe 	ldr	x30, [sp, #80]
  209054:	8b3063ff 	add	sp, sp, x16
  209058:	d65f03c0 	ret
  20905c:	d503201f 	nop
  209060:	f9404be0 	ldr	x0, [sp, #144]
  209064:	aa1703e2 	mov	x2, x23
  209068:	93407f61 	sxtw	x1, w27
  20906c:	94001357 	bl	20ddc8 <__fwritex>
  209070:	b94002e0 	ldr	w0, [x23]
  209074:	372fb4a0 	tbnz	w0, #5, 208708 <fmt_fp+0xf0>
  209078:	aa1703e2 	mov	x2, x23
  20907c:	d2800061 	mov	x1, #0x3                   	// #3
  209080:	aa1403e0 	mov	x0, x20
  209084:	94001351 	bl	20ddc8 <__fwritex>
  209088:	b9406be0 	ldr	w0, [sp, #104]
  20908c:	12130c16 	and	w22, w0, #0x1e000
  209090:	121076d6 	and	w22, w22, #0xffff3fff
  209094:	71400adf 	cmp	w22, #0x2, lsl #12
  209098:	1a9f06b5 	csinc	w21, w21, wzr, eq  // eq = none
  20909c:	35ffb435 	cbnz	w21, 208720 <fmt_fp+0x108>
  2090a0:	1400000a 	b	2090c8 <fmt_fp+0xab0>
  2090a4:	d503201f 	nop
  2090a8:	f0000040 	adrp	x0, 214000 <syscall_table+0x800>
  2090ac:	91180400 	add	x0, x0, #0x601
  2090b0:	f9004be0 	str	x0, [sp, #144]
  2090b4:	17fffd72 	b	20867c <fmt_fp+0x64>
  2090b8:	52800038 	mov	w24, #0x1                   	// #1
  2090bc:	528000d5 	mov	w21, #0x6                   	// #6
  2090c0:	17fffdc9 	b	2087e4 <fmt_fp+0x1cc>
  2090c4:	d503201f 	nop
  2090c8:	b94077e2 	ldr	w2, [sp, #116]
  2090cc:	2a1303e3 	mov	w3, w19
  2090d0:	52800401 	mov	w1, #0x20                  	// #32
  2090d4:	aa1703e0 	mov	x0, x23
  2090d8:	97fffd26 	bl	208570 <pad.part.0>
  2090dc:	17fffd91 	b	208720 <fmt_fp+0x108>
  2090e0:	aa0103e2 	mov	x2, x1
  2090e4:	2a1303e3 	mov	w3, w19
  2090e8:	52800401 	mov	w1, #0x20                  	// #32
  2090ec:	aa1703e0 	mov	x0, x23
  2090f0:	97fffd20 	bl	208570 <pad.part.0>
  2090f4:	17fffd83 	b	208700 <fmt_fp+0xe8>
  2090f8:	710002bf 	cmp	w21, #0x0
  2090fc:	1a9f16b5 	csinc	w21, w21, wzr, ne  // ne = any
  209100:	6b1402bf 	cmp	w21, w20
  209104:	3a44ca81 	ccmn	w20, #0x4, #0x1, gt
  209108:	5400272b 	b.lt	2095ec <fmt_fp+0xfd4>  // b.tstop
  20910c:	b9407be1 	ldr	w1, [sp, #120]
  209110:	11000680 	add	w0, w20, #0x1
  209114:	4b0002b5 	sub	w21, w21, w0
  209118:	51000421 	sub	w1, w1, #0x1
  20911c:	b9007be1 	str	w1, [sp, #120]
  209120:	f94037e0 	ldr	x0, [sp, #104]
  209124:	371fd4c0 	tbnz	w0, #3, 208bbc <fmt_fp+0x5a4>
  209128:	d2800121 	mov	x1, #0x9                   	// #9
  20912c:	eb1600bf 	cmp	x5, x22
  209130:	54000282 	b.cs	209180 <fmt_fp+0xb68>  // b.hs, b.nlast
  209134:	b85fc2c3 	ldur	w3, [x22, #-4]
  209138:	34000243 	cbz	w3, 209180 <fmt_fp+0xb68>
  20913c:	529999a0 	mov	w0, #0xcccd                	// #52429
  209140:	72b99980 	movk	w0, #0xcccc, lsl #16
  209144:	9ba07c60 	umull	x0, w3, w0
  209148:	d360fc00 	lsr	x0, x0, #32
  20914c:	53037c00 	lsr	w0, w0, #3
  209150:	0b000800 	add	w0, w0, w0, lsl #2
  209154:	6b00047f 	cmp	w3, w0, lsl #1
  209158:	54003581 	b.ne	209808 <fmt_fp+0x11f0>  // b.any
  20915c:	52800001 	mov	w1, #0x0                   	// #0
  209160:	52800140 	mov	w0, #0xa                   	// #10
  209164:	0b000800 	add	w0, w0, w0, lsl #2
  209168:	11000421 	add	w1, w1, #0x1
  20916c:	531f7800 	lsl	w0, w0, #1
  209170:	1ac00862 	udiv	w2, w3, w0
  209174:	1b008c42 	msub	w2, w2, w0, w3
  209178:	34ffff62 	cbz	w2, 209164 <fmt_fp+0xb4c>
  20917c:	93407c21 	sxtw	x1, w1
  209180:	cb1902c0 	sub	x0, x22, x25
  209184:	b9407be2 	ldr	w2, [sp, #120]
  209188:	9342fc00 	asr	x0, x0, #2
  20918c:	93407eb5 	sxtw	x21, w21
  209190:	d1000400 	sub	x0, x0, #0x1
  209194:	321b0042 	orr	w2, w2, #0x20
  209198:	8b000c00 	add	x0, x0, x0, lsl #3
  20919c:	7101985f 	cmp	w2, #0x66
  2091a0:	54000040 	b.eq	2091a8 <fmt_fp+0xb90>  // b.none
  2091a4:	8b34c000 	add	x0, x0, w20, sxtw
  2091a8:	eb010000 	subs	x0, x0, x1
  2091ac:	9a9f5000 	csel	x0, x0, xzr, pl  // pl = nfrst
  2091b0:	eb15001f 	cmp	x0, x21
  2091b4:	9a95d015 	csel	x21, x0, x21, le
  2091b8:	34ffd055 	cbz	w21, 208bc0 <fmt_fp+0x5a8>
  2091bc:	529fffa0 	mov	w0, #0xfffd                	// #65533
  2091c0:	72afffe0 	movk	w0, #0x7fff, lsl #16
  2091c4:	6b0002bf 	cmp	w21, w0
  2091c8:	54002f4c 	b.gt	2097b0 <fmt_fp+0x1198>
  2091cc:	52800020 	mov	w0, #0x1                   	// #1
  2091d0:	110006b3 	add	w19, w21, #0x1
  2091d4:	0b130013 	add	w19, w0, w19
  2091d8:	b9407be0 	ldr	w0, [sp, #120]
  2091dc:	321b001c 	orr	w28, w0, #0x20
  2091e0:	12b00000 	mov	w0, #0x7fffffff            	// #2147483647
  2091e4:	71019b9f 	cmp	w28, #0x66
  2091e8:	4b130008 	sub	w8, w0, w19
  2091ec:	54ffcfe1 	b.ne	208be8 <fmt_fp+0x5d0>  // b.any
  2091f0:	6b08029f 	cmp	w20, w8
  2091f4:	54002dec 	b.gt	2097b0 <fmt_fp+0x1198>
  2091f8:	0b140260 	add	w0, w19, w20
  2091fc:	7100029f 	cmp	w20, #0x0
  209200:	1a93c013 	csel	w19, w0, w19, gt
  209204:	17fffe9e 	b	208c7c <fmt_fp+0x664>
  209208:	4b1a03e8 	neg	w8, w26
  20920c:	eb0502df 	cmp	x22, x5
  209210:	5280001a 	mov	w26, #0x0                   	// #0
  209214:	b94000a0 	ldr	w0, [x5]
  209218:	54ffbc48 	b.hi	2089a0 <fmt_fp+0x388>  // b.pmore
  20921c:	910010a1 	add	x1, x5, #0x4
  209220:	7100001f 	cmp	w0, #0x0
  209224:	9a850025 	csel	x5, x1, x5, eq  // eq = none
  209228:	17fffdf3 	b	2089f4 <fmt_fp+0x3dc>
  20922c:	d503201f 	nop
  209230:	52800600 	mov	w0, #0x30                  	// #48
  209234:	390363e0 	strb	w0, [sp, #216]
  209238:	121b00c1 	and	w1, w6, #0x20
  20923c:	91002300 	add	x0, x24, #0x8
  209240:	eb1c00bf 	cmp	x5, x28
  209244:	54ffd901 	b.ne	208d64 <fmt_fp+0x74c>  // b.any
  209248:	91000406 	add	x6, x0, #0x1
  20924c:	340000e1 	cbz	w1, 209268 <fmt_fp+0xc50>
  209250:	cb060343 	sub	x3, x26, x6
  209254:	35ffda35 	cbnz	w21, 208d98 <fmt_fp+0x780>
  209258:	f94037e0 	ldr	x0, [sp, #104]
  20925c:	37180180 	tbnz	w0, #3, 20928c <fmt_fp+0xc74>
  209260:	aa0603e0 	mov	x0, x6
  209264:	17fffec5 	b	208d78 <fmt_fp+0x760>
  209268:	d2800021 	mov	x1, #0x1                   	// #1
  20926c:	a9079be5 	stp	x5, x6, [sp, #120]
  209270:	aa1703e2 	mov	x2, x23
  209274:	940012d5 	bl	20ddc8 <__fwritex>
  209278:	a9479be5 	ldp	x5, x6, [sp, #120]
  20927c:	b94002e1 	ldr	w1, [x23]
  209280:	cb060343 	sub	x3, x26, x6
  209284:	121b0021 	and	w1, w1, #0x20
  209288:	34fffe95 	cbz	w21, 209258 <fmt_fp+0xc40>
  20928c:	f9003fe6 	str	x6, [sp, #120]
  209290:	35ffd841 	cbnz	w1, 208d98 <fmt_fp+0x780>
  209294:	f9404be0 	ldr	x0, [sp, #144]
  209298:	d2800021 	mov	x1, #0x1                   	// #1
  20929c:	f90043e3 	str	x3, [sp, #128]
  2092a0:	aa1703e2 	mov	x2, x23
  2092a4:	f9004fe5 	str	x5, [sp, #152]
  2092a8:	940012c8 	bl	20ddc8 <__fwritex>
  2092ac:	a9478fe6 	ldp	x6, x3, [sp, #120]
  2092b0:	b94002e1 	ldr	w1, [x23]
  2092b4:	f9404fe5 	ldr	x5, [sp, #152]
  2092b8:	aa0603e0 	mov	x0, x6
  2092bc:	121b0021 	and	w1, w1, #0x20
  2092c0:	17fffeae 	b	208d78 <fmt_fp+0x760>
  2092c4:	d503201f 	nop
  2092c8:	6f00e401 	movi	v1.2d, #0x0
  2092cc:	9e670280 	fmov	d0, x20
  2092d0:	9eaf0020 	fmov	v0.d[1], x1
  2092d4:	94001b0d 	bl	20ff08 <__eqtf2>
  2092d8:	7100001f 	cmp	w0, #0x0
  2092dc:	1a9f07e1 	cset	w1, ne  // ne = any
  2092e0:	710002bf 	cmp	w21, #0x0
  2092e4:	1a9fd7e0 	cset	w0, gt
  2092e8:	2a010000 	orr	w0, w0, w1
  2092ec:	37000060 	tbnz	w0, #0, 2092f8 <fmt_fp+0xce0>
  2092f0:	b940abe0 	ldr	w0, [sp, #168]
  2092f4:	34ffe320 	cbz	w0, 208f58 <fmt_fp+0x940>
  2092f8:	528005c0 	mov	w0, #0x2e                  	// #46
  2092fc:	91000b39 	add	x25, x25, #0x2
  209300:	381ff320 	sturb	w0, [x25, #-1]
  209304:	17ffff16 	b	208f5c <fmt_fp+0x944>
  209308:	2a1503e0 	mov	w0, w21
  20930c:	52800014 	mov	w20, #0x0                   	// #0
  209310:	17fffdd2 	b	208a58 <fmt_fp+0x440>
  209314:	eb05033f 	cmp	x25, x5
  209318:	9a85933c 	csel	x28, x25, x5, ls  // ls = plast
  20931c:	eb19039f 	cmp	x28, x25
  209320:	54000488 	b.hi	2093b0 <fmt_fp+0xd98>  // b.pmore
  209324:	910343f8 	add	x24, sp, #0xd0
  209328:	b202e7fb 	mov	x27, #0xcccccccccccccccc    	// #-3689348814741910324
  20932c:	aa1c03e8 	mov	x8, x28
  209330:	91002700 	add	x0, x24, #0x9
  209334:	5280061a 	mov	w26, #0x30                  	// #48
  209338:	f29999bb 	movk	x27, #0xcccd
  20933c:	f90043e0 	str	x0, [sp, #128]
  209340:	f9004be0 	str	x0, [sp, #144]
  209344:	b9400103 	ldr	w3, [x8]
  209348:	91002700 	add	x0, x24, #0x9
  20934c:	b4000963 	cbz	x3, 209478 <fmt_fp+0xe60>
  209350:	9bdb7c62 	umulh	x2, x3, x27
  209354:	d343fc42 	lsr	x2, x2, #3
  209358:	8b020841 	add	x1, x2, x2, lsl #2
  20935c:	cb010461 	sub	x1, x3, x1, lsl #1
  209360:	aa0203e3 	mov	x3, x2
  209364:	1100c021 	add	w1, w1, #0x30
  209368:	381ffc01 	strb	w1, [x0, #-1]!
  20936c:	b5ffff22 	cbnz	x2, 209350 <fmt_fp+0xd38>
  209370:	eb08039f 	cmp	x28, x8
  209374:	54002420 	b.eq	2097f8 <fmt_fp+0x11e0>  // b.none
  209378:	eb18001f 	cmp	x0, x24
  20937c:	54000089 	b.ls	20938c <fmt_fp+0xd74>  // b.plast
  209380:	381ffc1a 	strb	w26, [x0, #-1]!
  209384:	eb18001f 	cmp	x0, x24
  209388:	54ffffc8 	b.hi	209380 <fmt_fp+0xd68>  // b.pmore
  20938c:	b94002e1 	ldr	w1, [x23]
  209390:	36280581 	tbz	w1, #5, 209440 <fmt_fp+0xe28>
  209394:	91001108 	add	x8, x8, #0x4
  209398:	eb19011f 	cmp	x8, x25
  20939c:	54fffd49 	b.ls	209344 <fmt_fp+0xd2c>  // b.plast
  2093a0:	cb1c0320 	sub	x0, x25, x28
  2093a4:	927ef400 	and	x0, x0, #0xfffffffffffffffc
  2093a8:	91001000 	add	x0, x0, #0x4
  2093ac:	8b00039c 	add	x28, x28, x0
  2093b0:	350016d5 	cbnz	w21, 209688 <fmt_fp+0x1070>
  2093b4:	f94037e0 	ldr	x0, [sp, #104]
  2093b8:	361fd020 	tbz	w0, #3, 208dbc <fmt_fp+0x7a4>
  2093bc:	b94002e0 	ldr	w0, [x23]
  2093c0:	372fcfe0 	tbnz	w0, #5, 208dbc <fmt_fp+0x7a4>
  2093c4:	f0000040 	adrp	x0, 214000 <syscall_table+0x800>
  2093c8:	aa1703e2 	mov	x2, x23
  2093cc:	d2800021 	mov	x1, #0x1                   	// #1
  2093d0:	9118e000 	add	x0, x0, #0x638
  2093d4:	9400127d 	bl	20ddc8 <__fwritex>
  2093d8:	710002bf 	cmp	w21, #0x0
  2093dc:	fa5cc2c0 	ccmp	x22, x28, #0x0, gt
  2093e0:	54001269 	b.ls	20962c <fmt_fp+0x1014>  // b.plast
  2093e4:	b202e7fa 	mov	x26, #0xcccccccccccccccc    	// #-3689348814741910324
  2093e8:	910343f8 	add	x24, sp, #0xd0
  2093ec:	5280061b 	mov	w27, #0x30                  	// #48
  2093f0:	f29999ba 	movk	x26, #0xcccd
  2093f4:	52800139 	mov	w25, #0x9                   	// #9
  2093f8:	b9400383 	ldr	w3, [x28]
  2093fc:	91002700 	add	x0, x24, #0x9
  209400:	b4000163 	cbz	x3, 20942c <fmt_fp+0xe14>
  209404:	9bda7c62 	umulh	x2, x3, x26
  209408:	d343fc42 	lsr	x2, x2, #3
  20940c:	8b020841 	add	x1, x2, x2, lsl #2
  209410:	cb010461 	sub	x1, x3, x1, lsl #1
  209414:	aa0203e3 	mov	x3, x2
  209418:	1100c021 	add	w1, w1, #0x30
  20941c:	381ffc01 	strb	w1, [x0, #-1]!
  209420:	b5ffff22 	cbnz	x2, 209404 <fmt_fp+0xdec>
  209424:	eb18001f 	cmp	x0, x24
  209428:	54000f49 	b.ls	209610 <fmt_fp+0xff8>  // b.plast
  20942c:	381ffc1b 	strb	w27, [x0, #-1]!
  209430:	eb18001f 	cmp	x0, x24
  209434:	54ffffc8 	b.hi	20942c <fmt_fp+0xe14>  // b.pmore
  209438:	14000076 	b	209610 <fmt_fp+0xff8>
  20943c:	d503201f 	nop
  209440:	f94043e1 	ldr	x1, [sp, #128]
  209444:	aa1703e2 	mov	x2, x23
  209448:	f9003fe8 	str	x8, [sp, #120]
  20944c:	cb000021 	sub	x1, x1, x0
  209450:	9400125e 	bl	20ddc8 <__fwritex>
  209454:	f9403fe8 	ldr	x8, [sp, #120]
  209458:	17ffffcf 	b	209394 <fmt_fp+0xd7c>
  20945c:	f9404be0 	ldr	x0, [sp, #144]
  209460:	aa1703e2 	mov	x2, x23
  209464:	f9003fe5 	str	x5, [sp, #120]
  209468:	93407f61 	sxtw	x1, w27
  20946c:	94001257 	bl	20ddc8 <__fwritex>
  209470:	f9403fe5 	ldr	x5, [sp, #120]
  209474:	17fffe12 	b	208cbc <fmt_fp+0x6a4>
  209478:	eb08039f 	cmp	x28, x8
  20947c:	54fff821 	b.ne	209380 <fmt_fp+0xd68>  // b.any
  209480:	91002300 	add	x0, x24, #0x8
  209484:	390363fa 	strb	w26, [sp, #216]
  209488:	17ffffc1 	b	20938c <fmt_fp+0xd74>
  20948c:	d503201f 	nop
  209490:	b85fc262 	ldur	w2, [x19, #-4]
  209494:	3607b3a2 	tbz	w2, #0, 208b08 <fmt_fp+0x4f0>
  209498:	f0000042 	adrp	x2, 214000 <syscall_table+0x800>
  20949c:	d2800027 	mov	x7, #0x1                   	// #1
  2094a0:	f9429c42 	ldr	x2, [x2, #1336]
  2094a4:	17fffd9c 	b	208b14 <fmt_fp+0x4fc>
  2094a8:	f9404be0 	ldr	x0, [sp, #144]
  2094ac:	aa1703e2 	mov	x2, x23
  2094b0:	aa1b03e1 	mov	x1, x27
  2094b4:	94001245 	bl	20ddc8 <__fwritex>
  2094b8:	b9406be0 	ldr	w0, [sp, #104]
  2094bc:	12130c00 	and	w0, w0, #0x1e000
  2094c0:	12107400 	and	w0, w0, #0xffff3fff
  2094c4:	7140401f 	cmp	w0, #0x10, lsl #12
  2094c8:	1a9f06a0 	csinc	w0, w21, wzr, eq  // eq = none
  2094cc:	350000c0 	cbnz	w0, 2094e4 <fmt_fp+0xecc>
  2094d0:	b94077e2 	ldr	w2, [sp, #116]
  2094d4:	2a1c03e3 	mov	w3, w28
  2094d8:	52800601 	mov	w1, #0x30                  	// #48
  2094dc:	aa1703e0 	mov	x0, x23
  2094e0:	97fffc24 	bl	208570 <pad.part.0>
  2094e4:	b94002e0 	ldr	w0, [x23]
  2094e8:	4b130354 	sub	w20, w26, w19
  2094ec:	4b190294 	sub	w20, w20, w25
  2094f0:	372fd8c0 	tbnz	w0, #5, 209008 <fmt_fp+0x9f0>
  2094f4:	aa1703e2 	mov	x2, x23
  2094f8:	aa1903e1 	mov	x1, x25
  2094fc:	aa1803e0 	mov	x0, x24
  209500:	94001232 	bl	20ddc8 <__fwritex>
  209504:	7100029f 	cmp	w20, #0x0
  209508:	540000cd 	b.le	209520 <fmt_fp+0xf08>
  20950c:	52800003 	mov	w3, #0x0                   	// #0
  209510:	2a1403e2 	mov	w2, w20
  209514:	52800601 	mov	w1, #0x30                  	// #48
  209518:	aa1703e0 	mov	x0, x23
  20951c:	97fffc15 	bl	208570 <pad.part.0>
  209520:	b94002e0 	ldr	w0, [x23]
  209524:	372fd760 	tbnz	w0, #5, 209010 <fmt_fp+0x9f8>
  209528:	f94053e0 	ldr	x0, [sp, #160]
  20952c:	aa1703e2 	mov	x2, x23
  209530:	aa1303e1 	mov	x1, x19
  209534:	94001225 	bl	20ddc8 <__fwritex>
  209538:	17fffeb6 	b	209010 <fmt_fp+0x9f8>
  20953c:	f0000041 	adrp	x1, 214000 <syscall_table+0x800>
  209540:	f942a421 	ldr	x1, [x1, #1352]
  209544:	17fffd7a 	b	208b2c <fmt_fp+0x514>
  209548:	0b180340 	add	w0, w26, w24
  20954c:	b9000260 	str	w0, [x19]
  209550:	52993fe1 	mov	w1, #0xc9ff                	// #51711
  209554:	72a77341 	movk	w1, #0x3b9a, lsl #16
  209558:	6b01001f 	cmp	w0, w1
  20955c:	54000169 	b.ls	209588 <fmt_fp+0xf70>  // b.plast
  209560:	b81fc67f 	str	wzr, [x19], #-4
  209564:	eb05027f 	cmp	x19, x5
  209568:	54000062 	b.cs	209574 <fmt_fp+0xf5c>  // b.hs, b.nlast
  20956c:	b81fc0bf 	stur	wzr, [x5, #-4]
  209570:	d10010a5 	sub	x5, x5, #0x4
  209574:	b9400260 	ldr	w0, [x19]
  209578:	11000400 	add	w0, w0, #0x1
  20957c:	b9000260 	str	w0, [x19]
  209580:	6b01001f 	cmp	w0, w1
  209584:	54fffee8 	b.hi	209560 <fmt_fp+0xf48>  // b.pmore
  209588:	cb050334 	sub	x20, x25, x5
  20958c:	b94000a1 	ldr	w1, [x5]
  209590:	9342fe94 	asr	x20, x20, #2
  209594:	91001262 	add	x2, x19, #0x4
  209598:	0b140e94 	add	w20, w20, w20, lsl #3
  20959c:	7100243f 	cmp	w1, #0x9
  2095a0:	54ffaf69 	b.ls	208b8c <fmt_fp+0x574>  // b.plast
  2095a4:	52800140 	mov	w0, #0xa                   	// #10
  2095a8:	0b000800 	add	w0, w0, w0, lsl #2
  2095ac:	11000694 	add	w20, w20, #0x1
  2095b0:	531f7800 	lsl	w0, w0, #1
  2095b4:	6b01001f 	cmp	w0, w1
  2095b8:	54ffff89 	b.ls	2095a8 <fmt_fp+0xf90>  // b.plast
  2095bc:	17fffd74 	b	208b8c <fmt_fp+0x574>
  2095c0:	f94053e0 	ldr	x0, [sp, #160]
  2095c4:	910333e1 	add	x1, sp, #0xcc
  2095c8:	aa1703e2 	mov	x2, x23
  2095cc:	cb000021 	sub	x1, x1, x0
  2095d0:	940011fe 	bl	20ddc8 <__fwritex>
  2095d4:	17fffdfa 	b	208dbc <fmt_fp+0x7a4>
  2095d8:	52800243 	mov	w3, #0x12                  	// #18
  2095dc:	52800601 	mov	w1, #0x30                  	// #48
  2095e0:	aa1703e0 	mov	x0, x23
  2095e4:	97fffbe3 	bl	208570 <pad.part.0>
  2095e8:	17fffdf3 	b	208db4 <fmt_fp+0x79c>
  2095ec:	b9407be0 	ldr	w0, [sp, #120]
  2095f0:	510006b5 	sub	w21, w21, #0x1
  2095f4:	51000800 	sub	w0, w0, #0x2
  2095f8:	b9007be0 	str	w0, [sp, #120]
  2095fc:	17fffec9 	b	209120 <fmt_fp+0xb08>
  209600:	11000ab4 	add	w20, w21, #0x2
  209604:	0b13029a 	add	w26, w20, w19
  209608:	17fffe6b 	b	208fb4 <fmt_fp+0x99c>
  20960c:	d503201f 	nop
  209610:	b94002e1 	ldr	w1, [x23]
  209614:	362802e1 	tbz	w1, #5, 209670 <fmt_fp+0x1058>
  209618:	510026b5 	sub	w21, w21, #0x9
  20961c:	9100139c 	add	x28, x28, #0x4
  209620:	710002bf 	cmp	w21, #0x0
  209624:	fa56c382 	ccmp	x28, x22, #0x2, gt
  209628:	54ffee83 	b.cc	2093f8 <fmt_fp+0xde0>  // b.lo, b.ul, b.last
  20962c:	110026a2 	add	w2, w21, #0x9
  209630:	7100245f 	cmp	w2, #0x9
  209634:	54ffbc4d 	b.le	208dbc <fmt_fp+0x7a4>
  209638:	52800123 	mov	w3, #0x9                   	// #9
  20963c:	52800601 	mov	w1, #0x30                  	// #48
  209640:	aa1703e0 	mov	x0, x23
  209644:	97fffbcb 	bl	208570 <pad.part.0>
  209648:	17fffddd 	b	208dbc <fmt_fp+0x7a4>
  20964c:	91001261 	add	x1, x19, #0x4
  209650:	eb0102df 	cmp	x22, x1
  209654:	54ffa681 	b.ne	208b24 <fmt_fp+0x50c>  // b.any
  209658:	f0000041 	adrp	x1, 214000 <syscall_table+0x800>
  20965c:	f942ac21 	ldr	x1, [x1, #1368]
  209660:	17fffd33 	b	208b2c <fmt_fp+0x514>
  209664:	d2410042 	eor	x2, x2, #0x8000000000000000
  209668:	d2410021 	eor	x1, x1, #0x8000000000000000
  20966c:	17fffd35 	b	208b40 <fmt_fp+0x528>
  209670:	710026bf 	cmp	w21, #0x9
  209674:	aa1703e2 	mov	x2, x23
  209678:	1a99d2a1 	csel	w1, w21, w25, le
  20967c:	93407c21 	sxtw	x1, w1
  209680:	940011d2 	bl	20ddc8 <__fwritex>
  209684:	17ffffe5 	b	209618 <fmt_fp+0x1000>
  209688:	b94002e0 	ldr	w0, [x23]
  20968c:	372fea60 	tbnz	w0, #5, 2093d8 <fmt_fp+0xdc0>
  209690:	17ffff4d 	b	2093c4 <fmt_fp+0xdac>
  209694:	b94077e2 	ldr	w2, [sp, #116]
  209698:	2a1303e3 	mov	w3, w19
  20969c:	f9003fe5 	str	x5, [sp, #120]
  2096a0:	52800601 	mov	w1, #0x30                  	// #48
  2096a4:	aa1703e0 	mov	x0, x23
  2096a8:	97fffbb2 	bl	208570 <pad.part.0>
  2096ac:	f9403fe5 	ldr	x5, [sp, #120]
  2096b0:	17fffd89 	b	208cd4 <fmt_fp+0x6bc>
  2096b4:	aa0103e2 	mov	x2, x1
  2096b8:	f9003fe5 	str	x5, [sp, #120]
  2096bc:	2a1303e3 	mov	w3, w19
  2096c0:	52800401 	mov	w1, #0x20                  	// #32
  2096c4:	aa1703e0 	mov	x0, x23
  2096c8:	97fffbaa 	bl	208570 <pad.part.0>
  2096cc:	f9403fe5 	ldr	x5, [sp, #120]
  2096d0:	17fffd79 	b	208cb4 <fmt_fp+0x69c>
  2096d4:	b94077e2 	ldr	w2, [sp, #116]
  2096d8:	2a1303e3 	mov	w3, w19
  2096dc:	52800401 	mov	w1, #0x20                  	// #32
  2096e0:	aa1703e0 	mov	x0, x23
  2096e4:	97fffba3 	bl	208570 <pad.part.0>
  2096e8:	17fffdbb 	b	208dd4 <fmt_fp+0x7bc>
  2096ec:	52800600 	mov	w0, #0x30                  	// #48
  2096f0:	91002ec3 	add	x3, x22, #0xb
  2096f4:	39032fe0 	strb	w0, [sp, #203]
  2096f8:	17fffdee 	b	208eb0 <fmt_fp+0x898>
  2096fc:	91144320 	add	x0, x25, #0x510
  209700:	5280035b 	mov	w27, #0x1a                  	// #26
  209704:	4b15037b 	sub	w27, w27, w21
  209708:	3dc00002 	ldr	q2, [x0]
  20970c:	f0000040 	adrp	x0, 214000 <syscall_table+0x800>
  209710:	91144000 	add	x0, x0, #0x510
  209714:	4ea21c40 	mov	v0.16b, v2.16b
  209718:	5100077b 	sub	w27, w27, #0x1
  20971c:	3dc00001 	ldr	q1, [x0]
  209720:	94001a3e 	bl	210018 <__multf3>
  209724:	4ea01c02 	mov	v2.16b, v0.16b
  209728:	3100077f 	cmn	w27, #0x1
  20972c:	54ffff01 	b.ne	20970c <fmt_fp+0x10f4>  // b.any
  209730:	f9404be0 	ldr	x0, [sp, #144]
  209734:	39400000 	ldrb	w0, [x0]
  209738:	7100b41f 	cmp	w0, #0x2d
  20973c:	54000420 	b.eq	2097c0 <fmt_fp+0x11a8>  // b.none
  209740:	4ea01c01 	mov	v1.16b, v0.16b
  209744:	3d8023e0 	str	q0, [sp, #128]
  209748:	9e670280 	fmov	d0, x20
  20974c:	9eaf0260 	fmov	v0.d[1], x19
  209750:	940016d4 	bl	20f2a0 <__addtf3>
  209754:	3dc023e2 	ldr	q2, [sp, #128]
  209758:	4ea21c41 	mov	v1.16b, v2.16b
  20975c:	94001c35 	bl	210830 <__subtf3>
  209760:	9e660000 	fmov	x0, d0
  209764:	9eae0001 	fmov	x1, v0.d[1]
  209768:	aa0003f4 	mov	x20, x0
  20976c:	aa0103f3 	mov	x19, x1
  209770:	17fffdbd 	b	208e64 <fmt_fp+0x84c>
  209774:	b94077e2 	ldr	w2, [sp, #116]
  209778:	2a1c03e3 	mov	w3, w28
  20977c:	52800401 	mov	w1, #0x20                  	// #32
  209780:	aa1703e0 	mov	x0, x23
  209784:	97fffb7b 	bl	208570 <pad.part.0>
  209788:	17fffe28 	b	209028 <fmt_fp+0xa10>
  20978c:	aa0103e2 	mov	x2, x1
  209790:	2a1c03e3 	mov	w3, w28
  209794:	52800401 	mov	w1, #0x20                  	// #32
  209798:	aa1703e0 	mov	x0, x23
  20979c:	97fffb75 	bl	208570 <pad.part.0>
  2097a0:	17fffe10 	b	208fe0 <fmt_fp+0x9c8>
  2097a4:	52800158 	mov	w24, #0xa                   	// #10
  2097a8:	2a1803e1 	mov	w1, w24
  2097ac:	17fffcc9 	b	208ad0 <fmt_fp+0x4b8>
  2097b0:	12800000 	mov	w0, #0xffffffff            	// #-1
  2097b4:	f94027fc 	ldr	x28, [sp, #72]
  2097b8:	a942e7f8 	ldp	x24, x25, [sp, #40]
  2097bc:	17fffbdc 	b	20872c <fmt_fp+0x114>
  2097c0:	4ea01c01 	mov	v1.16b, v0.16b
  2097c4:	3d8023e0 	str	q0, [sp, #128]
  2097c8:	9e670280 	fmov	d0, x20
  2097cc:	d2410273 	eor	x19, x19, #0x8000000000000000
  2097d0:	9eaf0260 	fmov	v0.d[1], x19
  2097d4:	94001c17 	bl	210830 <__subtf3>
  2097d8:	3dc023e2 	ldr	q2, [sp, #128]
  2097dc:	4ea21c41 	mov	v1.16b, v2.16b
  2097e0:	940016b0 	bl	20f2a0 <__addtf3>
  2097e4:	9e660000 	fmov	x0, d0
  2097e8:	9eae0001 	fmov	x1, v0.d[1]
  2097ec:	aa0003f4 	mov	x20, x0
  2097f0:	d2410033 	eor	x19, x1, #0x8000000000000000
  2097f4:	17fffd9c 	b	208e64 <fmt_fp+0x84c>
  2097f8:	f9404be1 	ldr	x1, [sp, #144]
  2097fc:	eb01001f 	cmp	x0, x1
  209800:	54ffdc61 	b.ne	20938c <fmt_fp+0xd74>  // b.any
  209804:	17ffff1f 	b	209480 <fmt_fp+0xe68>
  209808:	d2800001 	mov	x1, #0x0                   	// #0
  20980c:	17fffe5d 	b	209180 <fmt_fp+0xb68>

0000000000209810 <printf_core>:
  209810:	a9af53f3 	stp	x19, x20, [sp, #-272]!
  209814:	a90473fb 	stp	x27, x28, [sp, #64]
  209818:	f000005c 	adrp	x28, 214000 <syscall_table+0x800>
  20981c:	aa0103fb 	mov	x27, x1
  209820:	9119639c 	add	x28, x28, #0x658
  209824:	a9015bf5 	stp	x21, x22, [sp, #16]
  209828:	52800016 	mov	w22, #0x0                   	// #0
  20982c:	a90263f7 	stp	x23, x24, [sp, #32]
  209830:	aa0003f8 	mov	x24, x0
  209834:	a9036bf9 	stp	x25, x26, [sp, #48]
  209838:	91043fe0 	add	x0, sp, #0x10f
  20983c:	52800019 	mov	w25, #0x0                   	// #0
  209840:	f9002bfe 	str	x30, [sp, #80]
  209844:	a9068fe4 	stp	x4, x3, [sp, #104]
  209848:	a90803e2 	stp	x2, x0, [sp, #128]
  20984c:	b900a3ff 	str	wzr, [sp, #160]
  209850:	39400360 	ldrb	w0, [x27]
  209854:	0b160339 	add	w25, w25, w22
  209858:	340034c0 	cbz	w0, 209ef0 <printf_core+0x6e0>
  20985c:	7100941f 	cmp	w0, #0x25
  209860:	aa1b03e0 	mov	x0, x27
  209864:	540000e0 	b.eq	209880 <printf_core+0x70>  // b.none
  209868:	38401c01 	ldrb	w1, [x0, #1]!
  20986c:	7100943f 	cmp	w1, #0x25
  209870:	7a401824 	ccmp	w1, #0x0, #0x4, ne  // ne = any
  209874:	54ffffa1 	b.ne	209868 <printf_core+0x58>  // b.any
  209878:	7100943f 	cmp	w1, #0x25
  20987c:	540025e1 	b.ne	209d38 <printf_core+0x528>  // b.any
  209880:	39400401 	ldrb	w1, [x0, #1]
  209884:	aa0003f4 	mov	x20, x0
  209888:	7100943f 	cmp	w1, #0x25
  20988c:	540000c0 	b.eq	2098a4 <printf_core+0x94>  // b.none
  209890:	14000009 	b	2098b4 <printf_core+0xa4>
  209894:	d503201f 	nop
  209898:	39400681 	ldrb	w1, [x20, #1]
  20989c:	7100943f 	cmp	w1, #0x25
  2098a0:	540000a1 	b.ne	2098b4 <printf_core+0xa4>  // b.any
  2098a4:	38402e81 	ldrb	w1, [x20, #2]!
  2098a8:	91000400 	add	x0, x0, #0x1
  2098ac:	7100943f 	cmp	w1, #0x25
  2098b0:	54ffff40 	b.eq	209898 <printf_core+0x88>  // b.none
  2098b4:	cb1b0013 	sub	x19, x0, x27
  2098b8:	12b00007 	mov	w7, #0x7fffffff            	// #2147483647
  2098bc:	4b1900f7 	sub	w23, w7, w25
  2098c0:	eb37c27f 	cmp	x19, w23, sxtw
  2098c4:	5400276c 	b.gt	209db0 <printf_core+0x5a0>
  2098c8:	2a1303f6 	mov	w22, w19
  2098cc:	b4000078 	cbz	x24, 2098d8 <printf_core+0xc8>
  2098d0:	b9400300 	ldr	w0, [x24]
  2098d4:	36280e20 	tbz	w0, #5, 209a98 <printf_core+0x288>
  2098d8:	35000eb3 	cbnz	w19, 209aac <printf_core+0x29c>
  2098dc:	39400681 	ldrb	w1, [x20, #1]
  2098e0:	5100c022 	sub	w2, w1, #0x30
  2098e4:	7100245f 	cmp	w2, #0x9
  2098e8:	54000088 	b.hi	2098f8 <printf_core+0xe8>  // b.pmore
  2098ec:	39400a80 	ldrb	w0, [x20, #2]
  2098f0:	7100901f 	cmp	w0, #0x24
  2098f4:	54002900 	b.eq	209e14 <printf_core+0x604>  // b.none
  2098f8:	51008020 	sub	w0, w1, #0x20
  2098fc:	91000683 	add	x3, x20, #0x1
  209900:	12800002 	mov	w2, #0xffffffff            	// #-1
  209904:	71007c1f 	cmp	w0, #0x1f
  209908:	54002948 	b.hi	209e30 <printf_core+0x620>  // b.pmore
  20990c:	52851129 	mov	w9, #0x2889                	// #10377
  209910:	72a00029 	movk	w9, #0x1, lsl #16
  209914:	1ac02524 	lsr	w4, w9, w0
  209918:	1200009a 	and	w26, w4, #0x1
  20991c:	360001a4 	tbz	w4, #0, 209950 <printf_core+0x140>
  209920:	5280001a 	mov	w26, #0x0                   	// #0
  209924:	5280002a 	mov	w10, #0x1                   	// #1
  209928:	14000004 	b	209938 <printf_core+0x128>
  20992c:	d503201f 	nop
  209930:	1ac02524 	lsr	w4, w9, w0
  209934:	360000e4 	tbz	w4, #0, 209950 <printf_core+0x140>
  209938:	38401c61 	ldrb	w1, [x3, #1]!
  20993c:	1ac02140 	lsl	w0, w10, w0
  209940:	2a00035a 	orr	w26, w26, w0
  209944:	51008020 	sub	w0, w1, #0x20
  209948:	71007c1f 	cmp	w0, #0x1f
  20994c:	54ffff29 	b.ls	209930 <printf_core+0x120>  // b.plast
  209950:	7100a83f 	cmp	w1, #0x2a
  209954:	54000c20 	b.eq	209ad8 <printf_core+0x2c8>  // b.none
  209958:	39400061 	ldrb	w1, [x3]
  20995c:	2a1303f5 	mov	w21, w19
  209960:	5100c020 	sub	w0, w1, #0x30
  209964:	7100241f 	cmp	w0, #0x9
  209968:	54002a08 	b.hi	209ea8 <printf_core+0x698>  // b.pmore
  20996c:	5299998b 	mov	w11, #0xcccc                	// #52428
  209970:	1280012d 	mov	w13, #0xfffffff6            	// #-10
  209974:	72a1998b 	movk	w11, #0xccc, lsl #16
  209978:	12b0000c 	mov	w12, #0x7fffffff            	// #2147483647
  20997c:	38401c60 	ldrb	w0, [x3, #1]!
  209980:	6b0b02bf 	cmp	w21, w11
  209984:	5100c004 	sub	w4, w0, #0x30
  209988:	540009c8 	b.hi	209ac0 <printf_core+0x2b0>  // b.pmore
  20998c:	1b0d32aa 	madd	w10, w21, w13, w12
  209990:	5100c021 	sub	w1, w1, #0x30
  209994:	6b0a003f 	cmp	w1, w10
  209998:	5400094c 	b.gt	209ac0 <printf_core+0x2b0>
  20999c:	0b150aa9 	add	w9, w21, w21, lsl #2
  2099a0:	7100249f 	cmp	w4, #0x9
  2099a4:	0b090435 	add	w21, w1, w9, lsl #1
  2099a8:	54000929 	b.ls	209acc <printf_core+0x2bc>  // b.plast
  2099ac:	37f82035 	tbnz	w21, #31, 209db0 <printf_core+0x5a0>
  2099b0:	7100b81f 	cmp	w0, #0x2e
  2099b4:	54000b61 	b.ne	209b20 <printf_core+0x310>  // b.any
  2099b8:	39400460 	ldrb	w0, [x3, #1]
  2099bc:	7100a81f 	cmp	w0, #0x2a
  2099c0:	54001701 	b.ne	209ca0 <printf_core+0x490>  // b.any
  2099c4:	39400860 	ldrb	w0, [x3, #2]
  2099c8:	5100c001 	sub	w1, w0, #0x30
  2099cc:	7100243f 	cmp	w1, #0x9
  2099d0:	54000088 	b.hi	2099e0 <printf_core+0x1d0>  // b.pmore
  2099d4:	39400c61 	ldrb	w1, [x3, #3]
  2099d8:	7100903f 	cmp	w1, #0x24
  2099dc:	54001ba0 	b.eq	209d50 <printf_core+0x540>  // b.none
  2099e0:	b940a3e1 	ldr	w1, [sp, #160]
  2099e4:	35000421 	cbnz	w1, 209a68 <printf_core+0x258>
  2099e8:	b4001ad8 	cbz	x24, 209d40 <printf_core+0x530>
  2099ec:	f94043e4 	ldr	x4, [sp, #128]
  2099f0:	b9401881 	ldr	w1, [x4, #24]
  2099f4:	f9400080 	ldr	x0, [x4]
  2099f8:	37f85181 	tbnz	w1, #31, 20a428 <printf_core+0xc18>
  2099fc:	91002c01 	add	x1, x0, #0xb
  209a00:	927df021 	and	x1, x1, #0xfffffffffffffff8
  209a04:	f9000081 	str	x1, [x4]
  209a08:	b940000a 	ldr	w10, [x0]
  209a0c:	91000863 	add	x3, x3, #0x2
  209a10:	39400060 	ldrb	w0, [x3]
  209a14:	2a2a03ec 	mvn	w12, w10
  209a18:	531f7d8c 	lsr	w12, w12, #31
  209a1c:	5280000b 	mov	w11, #0x0                   	// #0
  209a20:	1400000f 	b	209a5c <printf_core+0x24c>
  209a24:	d503201f 	nop
  209a28:	2a0b03e1 	mov	w1, w11
  209a2c:	91000474 	add	x20, x3, #0x1
  209a30:	d37df020 	lsl	x0, x1, #3
  209a34:	cb010000 	sub	x0, x0, x1
  209a38:	8b000820 	add	x0, x1, x0, lsl #2
  209a3c:	8b000780 	add	x0, x28, x0, lsl #1
  209a40:	3864c801 	ldrb	w1, [x0, w4, sxtw]
  209a44:	51000420 	sub	w0, w1, #0x1
  209a48:	71001c1f 	cmp	w0, #0x7
  209a4c:	54000728 	b.hi	209b30 <printf_core+0x320>  // b.pmore
  209a50:	39400460 	ldrb	w0, [x3, #1]
  209a54:	2a0103eb 	mov	w11, w1
  209a58:	aa1403e3 	mov	x3, x20
  209a5c:	51010404 	sub	w4, w0, #0x41
  209a60:	7100e49f 	cmp	w4, #0x39
  209a64:	54fffe29 	b.ls	209a28 <printf_core+0x218>  // b.plast
  209a68:	97ffe6ae 	bl	203520 <__errno_location>
  209a6c:	12800019 	mov	w25, #0xffffffff            	// #-1
  209a70:	528002c1 	mov	w1, #0x16                  	// #22
  209a74:	b9000001 	str	w1, [x0]
  209a78:	2a1903e0 	mov	w0, w25
  209a7c:	f9402bfe 	ldr	x30, [sp, #80]
  209a80:	a9415bf5 	ldp	x21, x22, [sp, #16]
  209a84:	a94263f7 	ldp	x23, x24, [sp, #32]
  209a88:	a9436bf9 	ldp	x25, x26, [sp, #48]
  209a8c:	a94473fb 	ldp	x27, x28, [sp, #64]
  209a90:	a8d153f3 	ldp	x19, x20, [sp], #272
  209a94:	d65f03c0 	ret
  209a98:	aa1803e2 	mov	x2, x24
  209a9c:	93407e61 	sxtw	x1, w19
  209aa0:	aa1b03e0 	mov	x0, x27
  209aa4:	940010c9 	bl	20ddc8 <__fwritex>
  209aa8:	34fff1b3 	cbz	w19, 2098dc <printf_core+0xcc>
  209aac:	6b1602ff 	cmp	w23, w22
  209ab0:	5400180b 	b.lt	209db0 <printf_core+0x5a0>  // b.tstop
  209ab4:	aa1403fb 	mov	x27, x20
  209ab8:	17ffff66 	b	209850 <printf_core+0x40>
  209abc:	d503201f 	nop
  209ac0:	7100249f 	cmp	w4, #0x9
  209ac4:	54001768 	b.hi	209db0 <printf_core+0x5a0>  // b.pmore
  209ac8:	12800015 	mov	w21, #0xffffffff            	// #-1
  209acc:	2a0003e1 	mov	w1, w0
  209ad0:	17ffffab 	b	20997c <printf_core+0x16c>
  209ad4:	d503201f 	nop
  209ad8:	39400460 	ldrb	w0, [x3, #1]
  209adc:	5100c001 	sub	w1, w0, #0x30
  209ae0:	7100243f 	cmp	w1, #0x9
  209ae4:	54000b69 	b.ls	209c50 <printf_core+0x440>  // b.plast
  209ae8:	b940a3e1 	ldr	w1, [sp, #160]
  209aec:	35fffbe1 	cbnz	w1, 209a68 <printf_core+0x258>
  209af0:	91000463 	add	x3, x3, #0x1
  209af4:	2a1303f5 	mov	w21, w19
  209af8:	b4fff5d8 	cbz	x24, 2099b0 <printf_core+0x1a0>
  209afc:	f94043e4 	ldr	x4, [sp, #128]
  209b00:	b9401881 	ldr	w1, [x4, #24]
  209b04:	f9400080 	ldr	x0, [x4]
  209b08:	37f84a21 	tbnz	w1, #31, 20a44c <printf_core+0xc3c>
  209b0c:	91002c01 	add	x1, x0, #0xb
  209b10:	b9400015 	ldr	w21, [x0]
  209b14:	927df021 	and	x1, x1, #0xfffffffffffffff8
  209b18:	f9000081 	str	x1, [x4]
  209b1c:	1400005c 	b	209c8c <printf_core+0x47c>
  209b20:	2a1303ec 	mov	w12, w19
  209b24:	1280000a 	mov	w10, #0xffffffff            	// #-1
  209b28:	17ffffbd 	b	209a1c <printf_core+0x20c>
  209b2c:	d503201f 	nop
  209b30:	34fff9c1 	cbz	w1, 209a68 <printf_core+0x258>
  209b34:	71006c3f 	cmp	w1, #0x1b
  209b38:	54000f00 	b.eq	209d18 <printf_core+0x508>  // b.none
  209b3c:	37f81522 	tbnz	w2, #31, 209de0 <printf_core+0x5d0>
  209b40:	f94037e0 	ldr	x0, [sp, #104]
  209b44:	93407c42 	sxtw	x2, w2
  209b48:	b8227801 	str	w1, [x0, x2, lsl #2]
  209b4c:	f9403be0 	ldr	x0, [sp, #112]
  209b50:	8b021002 	add	x2, x0, x2, lsl #4
  209b54:	a9400440 	ldp	x0, x1, [x2]
  209b58:	a90c07e0 	stp	x0, x1, [sp, #192]
  209b5c:	b4fffa98 	cbz	x24, 209aac <printf_core+0x29c>
  209b60:	39400064 	ldrb	w4, [x3]
  209b64:	340000ab 	cbz	w11, 209b78 <printf_core+0x368>
  209b68:	12000c80 	and	w0, w4, #0xf
  209b6c:	71000c1f 	cmp	w0, #0x3
  209b70:	121a7880 	and	w0, w4, #0xffffffdf
  209b74:	1a840004 	csel	w4, w0, w4, eq  // eq = none
  209b78:	f273035f 	tst	x26, #0x2000
  209b7c:	120f7b40 	and	w0, w26, #0xfffeffff
  209b80:	1a9a101a 	csel	w26, w0, w26, ne  // ne = any
  209b84:	51010480 	sub	w0, w4, #0x41
  209b88:	7100dc1f 	cmp	w0, #0x37
  209b8c:	54000ca9 	b.ls	209d20 <printf_core+0x510>  // b.plast
  209b90:	f94047e1 	ldr	x1, [sp, #136]
  209b94:	93407d40 	sxtw	x0, w10
  209b98:	f0000044 	adrp	x4, 214000 <syscall_table+0x800>
  209b9c:	2a1303eb 	mov	w11, w19
  209ba0:	cb1b002c 	sub	x12, x1, x27
  209ba4:	91190084 	add	x4, x4, #0x640
  209ba8:	12b00001 	mov	w1, #0x7fffffff            	// #2147483647
  209bac:	eb0c001f 	cmp	x0, x12
  209bb0:	5400004a 	b.ge	209bb8 <printf_core+0x3a8>  // b.tcont
  209bb4:	2a0c03ea 	mov	w10, w12
  209bb8:	6b01015f 	cmp	w10, w1
  209bbc:	54000fac 	b.gt	209db0 <printf_core+0x5a0>
  209bc0:	0b0b014d 	add	w13, w10, w11
  209bc4:	6b1501bf 	cmp	w13, w21
  209bc8:	1a95a1b6 	csel	w22, w13, w21, ge  // ge = tcont
  209bcc:	6b1602ff 	cmp	w23, w22
  209bd0:	54000f0b 	b.lt	209db0 <printf_core+0x5a0>  // b.tstop
  209bd4:	12130f40 	and	w0, w26, #0x1e000
  209bd8:	6b1601bf 	cmp	w13, w22
  209bdc:	12107400 	and	w0, w0, #0xffff3fff
  209be0:	1a9fb7f3 	cset	w19, ge  // ge = tcont
  209be4:	7100001f 	cmp	w0, #0x0
  209be8:	1a9f0660 	csinc	w0, w19, wzr, eq  // eq = none
  209bec:	34001620 	cbz	w0, 209eb0 <printf_core+0x6a0>
  209bf0:	b9400300 	ldr	w0, [x24]
  209bf4:	36281440 	tbz	w0, #5, 209e7c <printf_core+0x66c>
  209bf8:	12130f40 	and	w0, w26, #0x1e000
  209bfc:	12107400 	and	w0, w0, #0xffff3fff
  209c00:	7140401f 	cmp	w0, #0x10, lsl #12
  209c04:	1a9f0660 	csinc	w0, w19, wzr, eq  // eq = none
  209c08:	34001980 	cbz	w0, 209f38 <printf_core+0x728>
  209c0c:	6b0a019f 	cmp	w12, w10
  209c10:	5400122b 	b.lt	209e54 <printf_core+0x644>  // b.tstop
  209c14:	b9400300 	ldr	w0, [x24]
  209c18:	36281100 	tbz	w0, #5, 209e38 <printf_core+0x628>
  209c1c:	12130f5a 	and	w26, w26, #0x1e000
  209c20:	1210775a 	and	w26, w26, #0xffff3fff
  209c24:	71400b5f 	cmp	w26, #0x2, lsl #12
  209c28:	1a9f0673 	csinc	w19, w19, wzr, eq  // eq = none
  209c2c:	35fff453 	cbnz	w19, 209ab4 <printf_core+0x2a4>
  209c30:	2a0d03e3 	mov	w3, w13
  209c34:	2a1603e2 	mov	w2, w22
  209c38:	52800401 	mov	w1, #0x20                  	// #32
  209c3c:	aa1803e0 	mov	x0, x24
  209c40:	aa1403fb 	mov	x27, x20
  209c44:	97fffa4b 	bl	208570 <pad.part.0>
  209c48:	17ffff02 	b	209850 <printf_core+0x40>
  209c4c:	d503201f 	nop
  209c50:	39400861 	ldrb	w1, [x3, #2]
  209c54:	7100903f 	cmp	w1, #0x24
  209c58:	54fff481 	b.ne	209ae8 <printf_core+0x2d8>  // b.any
  209c5c:	f94037e1 	ldr	x1, [sp, #104]
  209c60:	91000c63 	add	x3, x3, #0x3
  209c64:	52800144 	mov	w4, #0xa                   	// #10
  209c68:	52800025 	mov	w5, #0x1                   	// #1
  209c6c:	b900a3e5 	str	w5, [sp, #160]
  209c70:	8b200820 	add	x0, x1, w0, uxtb #2
  209c74:	92805fe1 	mov	x1, #0xfffffffffffffd00    	// #-768
  209c78:	b8140004 	stur	w4, [x0, #-192]
  209c7c:	385fe060 	ldurb	w0, [x3, #-2]
  209c80:	8b205020 	add	x0, x1, w0, uxtw #4
  209c84:	f9403be1 	ldr	x1, [sp, #112]
  209c88:	b8606835 	ldr	w21, [x1, x0]
  209c8c:	39400060 	ldrb	w0, [x3]
  209c90:	36ffe915 	tbz	w21, #31, 2099b0 <printf_core+0x1a0>
  209c94:	3213035a 	orr	w26, w26, #0x2000
  209c98:	4b1503f5 	neg	w21, w21
  209c9c:	17ffff45 	b	2099b0 <printf_core+0x1a0>
  209ca0:	5100c001 	sub	w1, w0, #0x30
  209ca4:	91000463 	add	x3, x3, #0x1
  209ca8:	2a1303ea 	mov	w10, w19
  209cac:	7100243f 	cmp	w1, #0x9
  209cb0:	54000308 	b.hi	209d10 <printf_core+0x500>  // b.pmore
  209cb4:	52999984 	mov	w4, #0xcccc                	// #52428
  209cb8:	1280012d 	mov	w13, #0xfffffff6            	// #-10
  209cbc:	72a19984 	movk	w4, #0xccc, lsl #16
  209cc0:	12b0000c 	mov	w12, #0x7fffffff            	// #2147483647
  209cc4:	1280000b 	mov	w11, #0xffffffff            	// #-1
  209cc8:	1400000b 	b	209cf4 <printf_core+0x4e4>
  209ccc:	d503201f 	nop
  209cd0:	1b0d3140 	madd	w0, w10, w13, w12
  209cd4:	0b0a094a 	add	w10, w10, w10, lsl #2
  209cd8:	6b00003f 	cmp	w1, w0
  209cdc:	38401c60 	ldrb	w0, [x3, #1]!
  209ce0:	0b0a0421 	add	w1, w1, w10, lsl #1
  209ce4:	1a8bd02a 	csel	w10, w1, w11, le
  209ce8:	5100c001 	sub	w1, w0, #0x30
  209cec:	7100243f 	cmp	w1, #0x9
  209cf0:	54000108 	b.hi	209d10 <printf_core+0x500>  // b.pmore
  209cf4:	6b04015f 	cmp	w10, w4
  209cf8:	54fffec9 	b.ls	209cd0 <printf_core+0x4c0>  // b.plast
  209cfc:	38401c60 	ldrb	w0, [x3, #1]!
  209d00:	1280000a 	mov	w10, #0xffffffff            	// #-1
  209d04:	5100c001 	sub	w1, w0, #0x30
  209d08:	7100243f 	cmp	w1, #0x9
  209d0c:	54ffff49 	b.ls	209cf4 <printf_core+0x4e4>  // b.plast
  209d10:	5280002c 	mov	w12, #0x1                   	// #1
  209d14:	17ffff42 	b	209a1c <printf_core+0x20c>
  209d18:	37fff222 	tbnz	w2, #31, 209b5c <printf_core+0x34c>
  209d1c:	17ffff53 	b	209a68 <printf_core+0x258>
  209d20:	f0000041 	adrp	x1, 214000 <syscall_table+0x800>
  209d24:	91164021 	add	x1, x1, #0x590
  209d28:	78605820 	ldrh	w0, [x1, w0, uxtw #1]
  209d2c:	10000061 	adr	x1, 209d38 <printf_core+0x528>
  209d30:	8b20a820 	add	x0, x1, w0, sxth #2
  209d34:	d61f0000 	br	x0
  209d38:	aa0003f4 	mov	x20, x0
  209d3c:	17fffede 	b	2098b4 <printf_core+0xa4>
  209d40:	2a1303ea 	mov	w10, w19
  209d44:	5280002c 	mov	w12, #0x1                   	// #1
  209d48:	91000863 	add	x3, x3, #0x2
  209d4c:	17ffff34 	b	209a1c <printf_core+0x20c>
  209d50:	f94037e1 	ldr	x1, [sp, #104]
  209d54:	52800144 	mov	w4, #0xa                   	// #10
  209d58:	91001063 	add	x3, x3, #0x4
  209d5c:	8b200820 	add	x0, x1, w0, uxtb #2
  209d60:	92805fe1 	mov	x1, #0xfffffffffffffd00    	// #-768
  209d64:	b8140004 	stur	w4, [x0, #-192]
  209d68:	385fe060 	ldurb	w0, [x3, #-2]
  209d6c:	8b205020 	add	x0, x1, w0, uxtw #4
  209d70:	f9403be1 	ldr	x1, [sp, #112]
  209d74:	f860682a 	ldr	x10, [x1, x0]
  209d78:	39400060 	ldrb	w0, [x3]
  209d7c:	2a2a03ec 	mvn	w12, w10
  209d80:	531f7d8c 	lsr	w12, w12, #31
  209d84:	17ffff26 	b	209a1c <printf_core+0x20c>
  209d88:	6a4a7d9f 	tst	w12, w10, lsr #31
  209d8c:	54000121 	b.ne	209db0 <printf_core+0x5a0>  // b.any
  209d90:	3dc033e0 	ldr	q0, [sp, #192]
  209d94:	2a1a03e3 	mov	w3, w26
  209d98:	2a0a03e2 	mov	w2, w10
  209d9c:	2a1503e1 	mov	w1, w21
  209da0:	aa1803e0 	mov	x0, x24
  209da4:	97fffa1d 	bl	208618 <fmt_fp>
  209da8:	2a0003f6 	mov	w22, w0
  209dac:	36ffe800 	tbz	w0, #31, 209aac <printf_core+0x29c>
  209db0:	97ffe5dc 	bl	203520 <__errno_location>
  209db4:	12800019 	mov	w25, #0xffffffff            	// #-1
  209db8:	52800961 	mov	w1, #0x4b                  	// #75
  209dbc:	b9000001 	str	w1, [x0]
  209dc0:	2a1903e0 	mov	w0, w25
  209dc4:	a9415bf5 	ldp	x21, x22, [sp, #16]
  209dc8:	a94263f7 	ldp	x23, x24, [sp, #32]
  209dcc:	a9436bf9 	ldp	x25, x26, [sp, #48]
  209dd0:	a94473fb 	ldp	x27, x28, [sp, #64]
  209dd4:	f9402bfe 	ldr	x30, [sp, #80]
  209dd8:	a8d153f3 	ldp	x19, x20, [sp], #272
  209ddc:	d65f03c0 	ret
  209de0:	b4002e78 	cbz	x24, 20a3ac <printf_core+0xb9c>
  209de4:	f94043e2 	ldr	x2, [sp, #128]
  209de8:	910303e0 	add	x0, sp, #0xc0
  209dec:	f9003fe3 	str	x3, [sp, #120]
  209df0:	b90093ec 	str	w12, [sp, #144]
  209df4:	b9009beb 	str	w11, [sp, #152]
  209df8:	b900a7ea 	str	w10, [sp, #164]
  209dfc:	97fff93d 	bl	2082f0 <pop_arg>
  209e00:	b94093ec 	ldr	w12, [sp, #144]
  209e04:	b9409beb 	ldr	w11, [sp, #152]
  209e08:	b940a7ea 	ldr	w10, [sp, #164]
  209e0c:	f9403fe3 	ldr	x3, [sp, #120]
  209e10:	17ffff54 	b	209b60 <printf_core+0x350>
  209e14:	39400e81 	ldrb	w1, [x20, #3]
  209e18:	52800020 	mov	w0, #0x1                   	// #1
  209e1c:	b900a3e0 	str	w0, [sp, #160]
  209e20:	91000e83 	add	x3, x20, #0x3
  209e24:	51008020 	sub	w0, w1, #0x20
  209e28:	71007c1f 	cmp	w0, #0x1f
  209e2c:	54ffd709 	b.ls	20990c <printf_core+0xfc>  // b.plast
  209e30:	5280001a 	mov	w26, #0x0                   	// #0
  209e34:	17fffec7 	b	209950 <printf_core+0x140>
  209e38:	b9007bed 	str	w13, [sp, #120]
  209e3c:	aa1803e2 	mov	x2, x24
  209e40:	aa0c03e1 	mov	x1, x12
  209e44:	aa1b03e0 	mov	x0, x27
  209e48:	94000fe0 	bl	20ddc8 <__fwritex>
  209e4c:	b9407bed 	ldr	w13, [sp, #120]
  209e50:	17ffff73 	b	209c1c <printf_core+0x40c>
  209e54:	2a0c03e3 	mov	w3, w12
  209e58:	f9003fec 	str	x12, [sp, #120]
  209e5c:	b90093ed 	str	w13, [sp, #144]
  209e60:	2a0a03e2 	mov	w2, w10
  209e64:	52800601 	mov	w1, #0x30                  	// #48
  209e68:	aa1803e0 	mov	x0, x24
  209e6c:	97fff9c1 	bl	208570 <pad.part.0>
  209e70:	b94093ed 	ldr	w13, [sp, #144]
  209e74:	f9403fec 	ldr	x12, [sp, #120]
  209e78:	17ffff67 	b	209c14 <printf_core+0x404>
  209e7c:	b9007bed 	str	w13, [sp, #120]
  209e80:	aa1803e2 	mov	x2, x24
  209e84:	b90093ea 	str	w10, [sp, #144]
  209e88:	93407d61 	sxtw	x1, w11
  209e8c:	f9004fec 	str	x12, [sp, #152]
  209e90:	aa0403e0 	mov	x0, x4
  209e94:	94000fcd 	bl	20ddc8 <__fwritex>
  209e98:	b9407bed 	ldr	w13, [sp, #120]
  209e9c:	b94093ea 	ldr	w10, [sp, #144]
  209ea0:	f9404fec 	ldr	x12, [sp, #152]
  209ea4:	17ffff55 	b	209bf8 <printf_core+0x3e8>
  209ea8:	2a0103e0 	mov	w0, w1
  209eac:	17fffec1 	b	2099b0 <printf_core+0x1a0>
  209eb0:	2a0d03e3 	mov	w3, w13
  209eb4:	b9007bed 	str	w13, [sp, #120]
  209eb8:	b90093eb 	str	w11, [sp, #144]
  209ebc:	2a1603e2 	mov	w2, w22
  209ec0:	f9004fe4 	str	x4, [sp, #152]
  209ec4:	52800401 	mov	w1, #0x20                  	// #32
  209ec8:	b900a7ea 	str	w10, [sp, #164]
  209ecc:	aa1803e0 	mov	x0, x24
  209ed0:	f90057ec 	str	x12, [sp, #168]
  209ed4:	97fff9a7 	bl	208570 <pad.part.0>
  209ed8:	b9407bed 	ldr	w13, [sp, #120]
  209edc:	b94093eb 	ldr	w11, [sp, #144]
  209ee0:	b940a7ea 	ldr	w10, [sp, #164]
  209ee4:	f9404fe4 	ldr	x4, [sp, #152]
  209ee8:	f94057ec 	ldr	x12, [sp, #168]
  209eec:	17ffff41 	b	209bf0 <printf_core+0x3e0>
  209ef0:	b5ffdc58 	cbnz	x24, 209a78 <printf_core+0x268>
  209ef4:	b940a3e0 	ldr	w0, [sp, #160]
  209ef8:	340025a0 	cbz	w0, 20a3ac <printf_core+0xb9c>
  209efc:	f9403be0 	ldr	x0, [sp, #112]
  209f00:	d2800033 	mov	x19, #0x1                   	// #1
  209f04:	91004016 	add	x22, x0, #0x10
  209f08:	f94037e0 	ldr	x0, [sp, #104]
  209f0c:	b8737801 	ldr	w1, [x0, x19, lsl #2]
  209f10:	34001861 	cbz	w1, 20a21c <printf_core+0xa0c>
  209f14:	f94043e2 	ldr	x2, [sp, #128]
  209f18:	aa1603e0 	mov	x0, x22
  209f1c:	91000673 	add	x19, x19, #0x1
  209f20:	910042d6 	add	x22, x22, #0x10
  209f24:	97fff8f3 	bl	2082f0 <pop_arg>
  209f28:	f1002a7f 	cmp	x19, #0xa
  209f2c:	54fffee1 	b.ne	209f08 <printf_core+0x6f8>  // b.any
  209f30:	52800039 	mov	w25, #0x1                   	// #1
  209f34:	17fffed1 	b	209a78 <printf_core+0x268>
  209f38:	2a0d03e3 	mov	w3, w13
  209f3c:	b9007bed 	str	w13, [sp, #120]
  209f40:	b90093ea 	str	w10, [sp, #144]
  209f44:	2a1603e2 	mov	w2, w22
  209f48:	f9004fec 	str	x12, [sp, #152]
  209f4c:	52800601 	mov	w1, #0x30                  	// #48
  209f50:	aa1803e0 	mov	x0, x24
  209f54:	97fff987 	bl	208570 <pad.part.0>
  209f58:	b9407bed 	ldr	w13, [sp, #120]
  209f5c:	b94093ea 	ldr	w10, [sp, #144]
  209f60:	f9404fec 	ldr	x12, [sp, #152]
  209f64:	17ffff2a 	b	209c0c <printf_core+0x3fc>
  209f68:	f94063e3 	ldr	x3, [sp, #192]
  209f6c:	f0000044 	adrp	x4, 214000 <syscall_table+0x800>
  209f70:	2a1303eb 	mov	w11, w19
  209f74:	91190084 	add	x4, x4, #0x640
  209f78:	aa0303e2 	mov	x2, x3
  209f7c:	91043ffb 	add	x27, sp, #0x10f
  209f80:	b4000163 	cbz	x3, 209fac <printf_core+0x79c>
  209f84:	b202e7e8 	mov	x8, #0xcccccccccccccccc    	// #-3689348814741910324
  209f88:	f29999a8 	movk	x8, #0xcccd
  209f8c:	9bc87c41 	umulh	x1, x2, x8
  209f90:	d343fc21 	lsr	x1, x1, #3
  209f94:	8b010820 	add	x0, x1, x1, lsl #2
  209f98:	cb000440 	sub	x0, x2, x0, lsl #1
  209f9c:	aa0103e2 	mov	x2, x1
  209fa0:	1100c000 	add	w0, w0, #0x30
  209fa4:	381fff60 	strb	w0, [x27, #-1]!
  209fa8:	b5ffff21 	cbnz	x1, 209f8c <printf_core+0x77c>
  209fac:	6a4a7d9f 	tst	w12, w10, lsr #31
  209fb0:	54fff001 	b.ne	209db0 <printf_core+0x5a0>  // b.any
  209fb4:	7100019f 	cmp	w12, #0x0
  209fb8:	120f7b40 	and	w0, w26, #0xfffeffff
  209fbc:	1a9a101a 	csel	w26, w0, w26, ne  // ne = any
  209fc0:	f100007f 	cmp	x3, #0x0
  209fc4:	1a9f17e0 	cset	w0, eq  // eq = none
  209fc8:	7100015f 	cmp	w10, #0x0
  209fcc:	12b00001 	mov	w1, #0x7fffffff            	// #2147483647
  209fd0:	91043fec 	add	x12, sp, #0x10f
  209fd4:	4b0b0021 	sub	w1, w1, w11
  209fd8:	1a9f0002 	csel	w2, w0, wzr, eq  // eq = none
  209fdc:	35001ac2 	cbnz	w2, 20a334 <printf_core+0xb24>
  209fe0:	cb1b018c 	sub	x12, x12, x27
  209fe4:	92401c00 	and	x0, x0, #0xff
  209fe8:	93407d4a 	sxtw	x10, w10
  209fec:	8b0c0000 	add	x0, x0, x12
  209ff0:	eb0a001f 	cmp	x0, x10
  209ff4:	9a8aa000 	csel	x0, x0, x10, ge  // ge = tcont
  209ff8:	2a0003ea 	mov	w10, w0
  209ffc:	93407c00 	sxtw	x0, w0
  20a000:	eb0c001f 	cmp	x0, x12
  20a004:	54ffdd8b 	b.lt	209bb4 <printf_core+0x3a4>  // b.tstop
  20a008:	17fffeec 	b	209bb8 <printf_core+0x3a8>
  20a00c:	f94047ec 	ldr	x12, [sp, #136]
  20a010:	d2800020 	mov	x0, #0x1                   	// #1
  20a014:	f94063e3 	ldr	x3, [sp, #192]
  20a018:	120f7b5a 	and	w26, w26, #0xfffeffff
  20a01c:	2a0003ea 	mov	w10, w0
  20a020:	91043bfb 	add	x27, sp, #0x10e
  20a024:	39043be3 	strb	w3, [sp, #270]
  20a028:	cb1b018c 	sub	x12, x12, x27
  20a02c:	d0000044 	adrp	x4, 214000 <syscall_table+0x800>
  20a030:	2a1303eb 	mov	w11, w19
  20a034:	91190084 	add	x4, x4, #0x640
  20a038:	eb00019f 	cmp	x12, x0
  20a03c:	54ffdc2d 	b.le	209bc0 <printf_core+0x3b0>
  20a040:	12b00001 	mov	w1, #0x7fffffff            	// #2147483647
  20a044:	17fffedc 	b	209bb4 <printf_core+0x3a4>
  20a048:	f94063fb 	ldr	x27, [sp, #192]
  20a04c:	d0000040 	adrp	x0, 214000 <syscall_table+0x800>
  20a050:	91194000 	add	x0, x0, #0x650
  20a054:	f100037f 	cmp	x27, #0x0
  20a058:	9a9b001b 	csel	x27, x0, x27, eq  // eq = none
  20a05c:	37f8174a 	tbnz	w10, #31, 20a344 <printf_core+0xb34>
  20a060:	93407d41 	sxtw	x1, w10
  20a064:	aa1b03e0 	mov	x0, x27
  20a068:	94000418 	bl	20b0c8 <strnlen>
  20a06c:	8b00036c 	add	x12, x27, x0
  20a070:	2a0003ea 	mov	w10, w0
  20a074:	120f7b5a 	and	w26, w26, #0xfffeffff
  20a078:	93407c00 	sxtw	x0, w0
  20a07c:	17ffffeb 	b	20a028 <printf_core+0x818>
  20a080:	f94063e1 	ldr	x1, [sp, #192]
  20a084:	9102e3fb 	add	x27, sp, #0xb8
  20a088:	9280000a 	mov	x10, #0xffffffffffffffff    	// #-1
  20a08c:	29177fe1 	stp	w1, wzr, [sp, #184]
  20a090:	f90063fb 	str	x27, [sp, #192]
  20a094:	9102c3e0 	add	x0, sp, #0xb0
  20a098:	f9003fe0 	str	x0, [sp, #120]
  20a09c:	d2800013 	mov	x19, #0x0                   	// #0
  20a0a0:	35000181 	cbnz	w1, 20a0d0 <printf_core+0x8c0>
  20a0a4:	1400008e 	b	20a2dc <printf_core+0xacc>
  20a0a8:	f9404bea 	ldr	x10, [sp, #144]
  20a0ac:	93407c00 	sxtw	x0, w0
  20a0b0:	cb130141 	sub	x1, x10, x19
  20a0b4:	eb01001f 	cmp	x0, x1
  20a0b8:	54000c08 	b.hi	20a238 <printf_core+0xa28>  // b.pmore
  20a0bc:	8b000273 	add	x19, x19, x0
  20a0c0:	eb13015f 	cmp	x10, x19
  20a0c4:	54000ba9 	b.ls	20a238 <printf_core+0xa28>  // b.plast
  20a0c8:	b9400361 	ldr	w1, [x27]
  20a0cc:	34000b61 	cbz	w1, 20a238 <printf_core+0xa28>
  20a0d0:	f9403fe0 	ldr	x0, [sp, #120]
  20a0d4:	9100137b 	add	x27, x27, #0x4
  20a0d8:	f9004bea 	str	x10, [sp, #144]
  20a0dc:	94000c99 	bl	20d340 <wctomb>
  20a0e0:	36fffe40 	tbz	w0, #31, 20a0a8 <printf_core+0x898>
  20a0e4:	12800019 	mov	w25, #0xffffffff            	// #-1
  20a0e8:	17fffe64 	b	209a78 <printf_core+0x268>
  20a0ec:	93407d4a 	sxtw	x10, w10
  20a0f0:	f94063fb 	ldr	x27, [sp, #192]
  20a0f4:	b4000f4a 	cbz	x10, 20a2dc <printf_core+0xacc>
  20a0f8:	b9400361 	ldr	w1, [x27]
  20a0fc:	17ffffe6 	b	20a094 <printf_core+0x884>
  20a100:	121b0082 	and	w2, w4, #0x20
  20a104:	f94063e3 	ldr	x3, [sp, #192]
  20a108:	aa0303e0 	mov	x0, x3
  20a10c:	b40016a3 	cbz	x3, 20a3e0 <printf_core+0xbd0>
  20a110:	d0000048 	adrp	x8, 214000 <syscall_table+0x800>
  20a114:	13001c42 	sxtb	w2, w2
  20a118:	9120a108 	add	x8, x8, #0x828
  20a11c:	91043ffb 	add	x27, sp, #0x10f
  20a120:	92400c01 	and	x1, x0, #0xf
  20a124:	d344fc00 	lsr	x0, x0, #4
  20a128:	38616901 	ldrb	w1, [x8, x1]
  20a12c:	2a010041 	orr	w1, w2, w1
  20a130:	381fff61 	strb	w1, [x27, #-1]!
  20a134:	b5ffff60 	cbnz	x0, 20a120 <printf_core+0x910>
  20a138:	36180f7a 	tbz	w26, #3, 20a324 <printf_core+0xb14>
  20a13c:	d3441c84 	ubfx	x4, x4, #4, #4
  20a140:	d0000040 	adrp	x0, 214000 <syscall_table+0x800>
  20a144:	91190000 	add	x0, x0, #0x640
  20a148:	5280004b 	mov	w11, #0x2                   	// #2
  20a14c:	8b000084 	add	x4, x4, x0
  20a150:	17ffff97 	b	209fac <printf_core+0x79c>
  20a154:	7100415f 	cmp	w10, #0x10
  20a158:	52800200 	mov	w0, #0x10                  	// #16
  20a15c:	321d035a 	orr	w26, w26, #0x8
  20a160:	1a80214a 	csel	w10, w10, w0, cs  // cs = hs, nlast
  20a164:	52800402 	mov	w2, #0x20                  	// #32
  20a168:	52800f04 	mov	w4, #0x78                  	// #120
  20a16c:	17ffffe6 	b	20a104 <printf_core+0x8f4>
  20a170:	f94063e3 	ldr	x3, [sp, #192]
  20a174:	91043ffb 	add	x27, sp, #0x10f
  20a178:	aa0303e0 	mov	x0, x3
  20a17c:	b40000c3 	cbz	x3, 20a194 <printf_core+0x984>
  20a180:	12000801 	and	w1, w0, #0x7
  20a184:	d343fc00 	lsr	x0, x0, #3
  20a188:	1100c021 	add	w1, w1, #0x30
  20a18c:	381fff61 	strb	w1, [x27, #-1]!
  20a190:	b5ffff80 	cbnz	x0, 20a180 <printf_core+0x970>
  20a194:	36180c9a 	tbz	w26, #3, 20a324 <printf_core+0xb14>
  20a198:	91043fe0 	add	x0, sp, #0x10f
  20a19c:	d0000044 	adrp	x4, 214000 <syscall_table+0x800>
  20a1a0:	cb1b0000 	sub	x0, x0, x27
  20a1a4:	eb2ac01f 	cmp	x0, w10, sxtw
  20a1a8:	54000c0b 	b.lt	20a328 <printf_core+0xb18>  // b.tstop
  20a1ac:	1100040a 	add	w10, w0, #0x1
  20a1b0:	2a1303eb 	mov	w11, w19
  20a1b4:	91190084 	add	x4, x4, #0x640
  20a1b8:	17ffff7d 	b	209fac <printf_core+0x79c>
  20a1bc:	b9007bea 	str	w10, [sp, #120]
  20a1c0:	97ffe4d8 	bl	203520 <__errno_location>
  20a1c4:	b9400000 	ldr	w0, [x0]
  20a1c8:	97ffe4f6 	bl	2035a0 <strerror>
  20a1cc:	aa0003fb 	mov	x27, x0
  20a1d0:	b9407bea 	ldr	w10, [sp, #120]
  20a1d4:	17ffffa2 	b	20a05c <printf_core+0x84c>
  20a1d8:	71000d7f 	cmp	w11, #0x3
  20a1dc:	54001200 	b.eq	20a41c <printf_core+0xc0c>  // b.none
  20a1e0:	54000c88 	b.hi	20a370 <printf_core+0xb60>  // b.pmore
  20a1e4:	7100057f 	cmp	w11, #0x1
  20a1e8:	54000bc0 	b.eq	20a360 <printf_core+0xb50>  // b.none
  20a1ec:	54000ba8 	b.hi	20a360 <printf_core+0xb50>  // b.pmore
  20a1f0:	f94063e0 	ldr	x0, [sp, #192]
  20a1f4:	b9000019 	str	w25, [x0]
  20a1f8:	17fffe2d 	b	209aac <printf_core+0x29c>
  20a1fc:	f94063e3 	ldr	x3, [sp, #192]
  20a200:	b7f80ca3 	tbnz	x3, #63, 20a394 <printf_core+0xb84>
  20a204:	37580d9a 	tbnz	w26, #11, 20a3b4 <printf_core+0xba4>
  20a208:	3600103a 	tbz	w26, #0, 20a40c <printf_core+0xbfc>
  20a20c:	d0000044 	adrp	x4, 214000 <syscall_table+0x800>
  20a210:	5280002b 	mov	w11, #0x1                   	// #1
  20a214:	91190884 	add	x4, x4, #0x642
  20a218:	17ffff58 	b	209f78 <printf_core+0x768>
  20a21c:	91000673 	add	x19, x19, #0x1
  20a220:	f1002a7f 	cmp	x19, #0xa
  20a224:	54ffe860 	b.eq	209f30 <printf_core+0x720>  // b.none
  20a228:	f94037e0 	ldr	x0, [sp, #104]
  20a22c:	b8737800 	ldr	w0, [x0, x19, lsl #2]
  20a230:	34ffff60 	cbz	w0, 20a21c <printf_core+0xa0c>
  20a234:	17fffe0d 	b	209a68 <printf_core+0x258>
  20a238:	b2407be0 	mov	x0, #0x7fffffff            	// #2147483647
  20a23c:	eb00027f 	cmp	x19, x0
  20a240:	54ffdb88 	b.hi	209db0 <printf_core+0x5a0>  // b.pmore
  20a244:	6b1302bf 	cmp	w21, w19
  20a248:	12130f40 	and	w0, w26, #0x1e000
  20a24c:	1a9fc7e1 	cset	w1, le
  20a250:	12107400 	and	w0, w0, #0xffff3fff
  20a254:	b900a7e1 	str	w1, [sp, #164]
  20a258:	7100001f 	cmp	w0, #0x0
  20a25c:	2a1303f6 	mov	w22, w19
  20a260:	1a9f0420 	csinc	w0, w1, wzr, eq  // eq = none
  20a264:	34000b00 	cbz	w0, 20a3c4 <printf_core+0xbb4>
  20a268:	f94063ea 	ldr	x10, [sp, #192]
  20a26c:	b40004b3 	cbz	x19, 20a300 <printf_core+0xaf0>
  20a270:	b9400141 	ldr	w1, [x10]
  20a274:	9102c3e0 	add	x0, sp, #0xb0
  20a278:	f9003fe0 	str	x0, [sp, #120]
  20a27c:	d280001b 	mov	x27, #0x0                   	// #0
  20a280:	350000c1 	cbnz	w1, 20a298 <printf_core+0xa88>
  20a284:	1400001f 	b	20a300 <printf_core+0xaf0>
  20a288:	eb13037f 	cmp	x27, x19
  20a28c:	540003a2 	b.cs	20a300 <printf_core+0xaf0>  // b.hs, b.nlast
  20a290:	b9400141 	ldr	w1, [x10]
  20a294:	34000361 	cbz	w1, 20a300 <printf_core+0xaf0>
  20a298:	f9403fe0 	ldr	x0, [sp, #120]
  20a29c:	9100114a 	add	x10, x10, #0x4
  20a2a0:	a9092bea 	stp	x10, x10, [sp, #144]
  20a2a4:	94000c27 	bl	20d340 <wctomb>
  20a2a8:	93407c01 	sxtw	x1, w0
  20a2ac:	8b01037b 	add	x27, x27, x1
  20a2b0:	f9404bea 	ldr	x10, [sp, #144]
  20a2b4:	eb13037f 	cmp	x27, x19
  20a2b8:	54000248 	b.hi	20a300 <printf_core+0xaf0>  // b.pmore
  20a2bc:	b9400300 	ldr	w0, [x24]
  20a2c0:	372ffe40 	tbnz	w0, #5, 20a288 <printf_core+0xa78>
  20a2c4:	f9403fe0 	ldr	x0, [sp, #120]
  20a2c8:	aa1803e2 	mov	x2, x24
  20a2cc:	f9004bea 	str	x10, [sp, #144]
  20a2d0:	94000ebe 	bl	20ddc8 <__fwritex>
  20a2d4:	f9404bea 	ldr	x10, [sp, #144]
  20a2d8:	17ffffec 	b	20a288 <printf_core+0xa78>
  20a2dc:	710002bf 	cmp	w21, #0x0
  20a2e0:	12130f40 	and	w0, w26, #0x1e000
  20a2e4:	1a9fc7e1 	cset	w1, le
  20a2e8:	12107400 	and	w0, w0, #0xffff3fff
  20a2ec:	b900a7e1 	str	w1, [sp, #164]
  20a2f0:	7100001f 	cmp	w0, #0x0
  20a2f4:	1a9f0420 	csinc	w0, w1, wzr, eq  // eq = none
  20a2f8:	d2800013 	mov	x19, #0x0                   	// #0
  20a2fc:	34000640 	cbz	w0, 20a3c4 <printf_core+0xbb4>
  20a300:	12130f5a 	and	w26, w26, #0x1e000
  20a304:	b940a7e0 	ldr	w0, [sp, #164]
  20a308:	1210775a 	and	w26, w26, #0xffff3fff
  20a30c:	71400b5f 	cmp	w26, #0x2, lsl #12
  20a310:	1a9f041b 	csinc	w27, w0, wzr, eq  // eq = none
  20a314:	3400071b 	cbz	w27, 20a3f4 <printf_core+0xbe4>
  20a318:	6b1502df 	cmp	w22, w21
  20a31c:	1a95a2d6 	csel	w22, w22, w21, ge  // ge = tcont
  20a320:	17fffde3 	b	209aac <printf_core+0x29c>
  20a324:	d0000044 	adrp	x4, 214000 <syscall_table+0x800>
  20a328:	2a1303eb 	mov	w11, w19
  20a32c:	91190084 	add	x4, x4, #0x640
  20a330:	17ffff1f 	b	209fac <printf_core+0x79c>
  20a334:	aa0c03fb 	mov	x27, x12
  20a338:	2a1303ea 	mov	w10, w19
  20a33c:	d280000c 	mov	x12, #0x0                   	// #0
  20a340:	17fffe20 	b	209bc0 <printf_core+0x3b0>
  20a344:	b2407be1 	mov	x1, #0x7fffffff            	// #2147483647
  20a348:	aa1b03e0 	mov	x0, x27
  20a34c:	9400035f 	bl	20b0c8 <strnlen>
  20a350:	38606b61 	ldrb	w1, [x27, x0]
  20a354:	8b00036c 	add	x12, x27, x0
  20a358:	34ffe8c1 	cbz	w1, 20a070 <printf_core+0x860>
  20a35c:	17fffe95 	b	209db0 <printf_core+0x5a0>
  20a360:	f94063e0 	ldr	x0, [sp, #192]
  20a364:	93407f21 	sxtw	x1, w25
  20a368:	f9000001 	str	x1, [x0]
  20a36c:	17fffdd0 	b	209aac <printf_core+0x29c>
  20a370:	7100197f 	cmp	w11, #0x6
  20a374:	54ffff60 	b.eq	20a360 <printf_core+0xb50>  // b.none
  20a378:	71001d7f 	cmp	w11, #0x7
  20a37c:	54ffff20 	b.eq	20a360 <printf_core+0xb50>  // b.none
  20a380:	7100117f 	cmp	w11, #0x4
  20a384:	54ffb941 	b.ne	209aac <printf_core+0x29c>  // b.any
  20a388:	f94063e0 	ldr	x0, [sp, #192]
  20a38c:	39000019 	strb	w25, [x0]
  20a390:	17fffdc7 	b	209aac <printf_core+0x29c>
  20a394:	cb0303e3 	neg	x3, x3
  20a398:	d0000044 	adrp	x4, 214000 <syscall_table+0x800>
  20a39c:	5280002b 	mov	w11, #0x1                   	// #1
  20a3a0:	91190084 	add	x4, x4, #0x640
  20a3a4:	f90063e3 	str	x3, [sp, #192]
  20a3a8:	17fffef4 	b	209f78 <printf_core+0x768>
  20a3ac:	52800019 	mov	w25, #0x0                   	// #0
  20a3b0:	17fffdb2 	b	209a78 <printf_core+0x268>
  20a3b4:	d0000044 	adrp	x4, 214000 <syscall_table+0x800>
  20a3b8:	5280002b 	mov	w11, #0x1                   	// #1
  20a3bc:	91190484 	add	x4, x4, #0x641
  20a3c0:	17fffeee 	b	209f78 <printf_core+0x768>
  20a3c4:	2a1603e3 	mov	w3, w22
  20a3c8:	2a1503e2 	mov	w2, w21
  20a3cc:	52800401 	mov	w1, #0x20                  	// #32
  20a3d0:	aa1803e0 	mov	x0, x24
  20a3d4:	b900a7ff 	str	wzr, [sp, #164]
  20a3d8:	97fff866 	bl	208570 <pad.part.0>
  20a3dc:	17ffffa3 	b	20a268 <printf_core+0xa58>
  20a3e0:	d0000044 	adrp	x4, 214000 <syscall_table+0x800>
  20a3e4:	2a1303eb 	mov	w11, w19
  20a3e8:	91190084 	add	x4, x4, #0x640
  20a3ec:	91043ffb 	add	x27, sp, #0x10f
  20a3f0:	17fffeef 	b	209fac <printf_core+0x79c>
  20a3f4:	2a1603e3 	mov	w3, w22
  20a3f8:	2a1503e2 	mov	w2, w21
  20a3fc:	52800401 	mov	w1, #0x20                  	// #32
  20a400:	aa1803e0 	mov	x0, x24
  20a404:	97fff85b 	bl	208570 <pad.part.0>
  20a408:	17ffffc4 	b	20a318 <printf_core+0xb08>
  20a40c:	d0000044 	adrp	x4, 214000 <syscall_table+0x800>
  20a410:	2a1303eb 	mov	w11, w19
  20a414:	91190084 	add	x4, x4, #0x640
  20a418:	17fffed8 	b	209f78 <printf_core+0x768>
  20a41c:	f94063e0 	ldr	x0, [sp, #192]
  20a420:	79000019 	strh	w25, [x0]
  20a424:	17fffda2 	b	209aac <printf_core+0x29c>
  20a428:	f94043e5 	ldr	x5, [sp, #128]
  20a42c:	11002024 	add	w4, w1, #0x8
  20a430:	7100009f 	cmp	w4, #0x0
  20a434:	b90018a4 	str	w4, [x5, #24]
  20a438:	540001ed 	b.le	20a474 <printf_core+0xc64>
  20a43c:	91002c01 	add	x1, x0, #0xb
  20a440:	927df021 	and	x1, x1, #0xfffffffffffffff8
  20a444:	f90000a1 	str	x1, [x5]
  20a448:	17fffd70 	b	209a08 <printf_core+0x1f8>
  20a44c:	f94043e5 	ldr	x5, [sp, #128]
  20a450:	11002024 	add	w4, w1, #0x8
  20a454:	7100009f 	cmp	w4, #0x0
  20a458:	b90018a4 	str	w4, [x5, #24]
  20a45c:	5400014d 	b.le	20a484 <printf_core+0xc74>
  20a460:	91002c01 	add	x1, x0, #0xb
  20a464:	b9400015 	ldr	w21, [x0]
  20a468:	927df021 	and	x1, x1, #0xfffffffffffffff8
  20a46c:	f90000a1 	str	x1, [x5]
  20a470:	17fffe07 	b	209c8c <printf_core+0x47c>
  20a474:	f94043e0 	ldr	x0, [sp, #128]
  20a478:	f9400400 	ldr	x0, [x0, #8]
  20a47c:	8b21c000 	add	x0, x0, w1, sxtw
  20a480:	17fffd62 	b	209a08 <printf_core+0x1f8>
  20a484:	f94043e0 	ldr	x0, [sp, #128]
  20a488:	f9400400 	ldr	x0, [x0, #8]
  20a48c:	8b21c000 	add	x0, x0, w1, sxtw
  20a490:	b9400015 	ldr	w21, [x0]
  20a494:	17fffdfe 	b	209c8c <printf_core+0x47c>

000000000020a498 <vfprintf>:
  20a498:	a9a853f3 	stp	x19, x20, [sp, #-384]!
  20a49c:	aa0003f3 	mov	x19, x0
  20a4a0:	d2800000 	mov	x0, #0x0                   	// #0
  20a4a4:	a902fbf8 	stp	x24, x30, [sp, #40]
  20a4a8:	aa0103f8 	mov	x24, x1
  20a4ac:	a906ffff 	stp	xzr, xzr, [sp, #104]
  20a4b0:	a9401444 	ldp	x4, x5, [x2]
  20a4b4:	a90497e4 	stp	x4, x5, [sp, #72]
  20a4b8:	a9410c42 	ldp	x2, x3, [x2, #16]
  20a4bc:	a9058fe2 	stp	x2, x3, [sp, #88]
  20a4c0:	a907ffff 	stp	xzr, xzr, [sp, #120]
  20a4c4:	9101a3e4 	add	x4, sp, #0x68
  20a4c8:	910383e3 	add	x3, sp, #0xe0
  20a4cc:	910123e2 	add	x2, sp, #0x48
  20a4d0:	f90047ff 	str	xzr, [sp, #136]
  20a4d4:	97fffccf 	bl	209810 <printf_core>
  20a4d8:	37f80900 	tbnz	w0, #31, 20a5f8 <vfprintf+0x160>
  20a4dc:	b9408e60 	ldr	w0, [x19, #140]
  20a4e0:	a9015bf5 	stp	x21, x22, [sp, #16]
  20a4e4:	f90013f7 	str	x23, [sp, #32]
  20a4e8:	52800017 	mov	w23, #0x0                   	// #0
  20a4ec:	37f80080 	tbnz	w0, #31, 20a4fc <vfprintf+0x64>
  20a4f0:	aa1303e0 	mov	x0, x19
  20a4f4:	94000c8f 	bl	20d730 <__lockfile>
  20a4f8:	2a0003f7 	mov	w23, w0
  20a4fc:	b9400260 	ldr	w0, [x19]
  20a500:	b9408a61 	ldr	w1, [x19, #136]
  20a504:	121b0015 	and	w21, w0, #0x20
  20a508:	7100003f 	cmp	w1, #0x0
  20a50c:	5400006c 	b.gt	20a518 <vfprintf+0x80>
  20a510:	121a7800 	and	w0, w0, #0xffffffdf
  20a514:	b9000260 	str	w0, [x19]
  20a518:	f9403260 	ldr	x0, [x19, #96]
  20a51c:	b4000460 	cbz	x0, 20a5a8 <vfprintf+0x110>
  20a520:	f9401276 	ldr	x22, [x19, #32]
  20a524:	b40006f6 	cbz	x22, 20a600 <vfprintf+0x168>
  20a528:	d2800016 	mov	x22, #0x0                   	// #0
  20a52c:	9101a3e4 	add	x4, sp, #0x68
  20a530:	910383e3 	add	x3, sp, #0xe0
  20a534:	910123e2 	add	x2, sp, #0x48
  20a538:	aa1803e1 	mov	x1, x24
  20a53c:	aa1303e0 	mov	x0, x19
  20a540:	97fffcb4 	bl	209810 <printf_core>
  20a544:	2a0003f4 	mov	w20, w0
  20a548:	b4000196 	cbz	x22, 20a578 <vfprintf+0xe0>
  20a54c:	f9402663 	ldr	x3, [x19, #72]
  20a550:	d2800002 	mov	x2, #0x0                   	// #0
  20a554:	d2800001 	mov	x1, #0x0                   	// #0
  20a558:	aa1303e0 	mov	x0, x19
  20a55c:	d63f0060 	blr	x3
  20a560:	f9001e7f 	str	xzr, [x19, #56]
  20a564:	f9401660 	ldr	x0, [x19, #40]
  20a568:	a905fe76 	stp	x22, xzr, [x19, #88]
  20a56c:	f100001f 	cmp	x0, #0x0
  20a570:	a9027e7f 	stp	xzr, xzr, [x19, #32]
  20a574:	5a9f1294 	csinv	w20, w20, wzr, ne  // ne = any
  20a578:	b9400260 	ldr	w0, [x19]
  20a57c:	2a0002b5 	orr	w21, w21, w0
  20a580:	b9000275 	str	w21, [x19]
  20a584:	f27b001f 	tst	x0, #0x20
  20a588:	5a9f0294 	csinv	w20, w20, wzr, eq  // eq = none
  20a58c:	35000277 	cbnz	w23, 20a5d8 <vfprintf+0x140>
  20a590:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20a594:	f94013f7 	ldr	x23, [sp, #32]
  20a598:	2a1403e0 	mov	w0, w20
  20a59c:	a942fbf8 	ldp	x24, x30, [sp, #40]
  20a5a0:	a8d853f3 	ldp	x19, x20, [sp], #384
  20a5a4:	d65f03c0 	ret
  20a5a8:	910243e1 	add	x1, sp, #0x90
  20a5ac:	d2800a00 	mov	x0, #0x50                  	// #80
  20a5b0:	f9402e76 	ldr	x22, [x19, #88]
  20a5b4:	12800014 	mov	w20, #0xffffffff            	// #-1
  20a5b8:	a9058261 	stp	x1, x0, [x19, #88]
  20a5bc:	aa1303e0 	mov	x0, x19
  20a5c0:	a9027e7f 	stp	xzr, xzr, [x19, #32]
  20a5c4:	f9001e7f 	str	xzr, [x19, #56]
  20a5c8:	94000d84 	bl	20dbd8 <__towrite>
  20a5cc:	35fffbe0 	cbnz	w0, 20a548 <vfprintf+0xb0>
  20a5d0:	17ffffd7 	b	20a52c <vfprintf+0x94>
  20a5d4:	d503201f 	nop
  20a5d8:	aa1303e0 	mov	x0, x19
  20a5dc:	94000c97 	bl	20d838 <__unlockfile>
  20a5e0:	2a1403e0 	mov	w0, w20
  20a5e4:	f94013f7 	ldr	x23, [sp, #32]
  20a5e8:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20a5ec:	a942fbf8 	ldp	x24, x30, [sp, #40]
  20a5f0:	a8d853f3 	ldp	x19, x20, [sp], #384
  20a5f4:	d65f03c0 	ret
  20a5f8:	12800014 	mov	w20, #0xffffffff            	// #-1
  20a5fc:	17ffffe7 	b	20a598 <vfprintf+0x100>
  20a600:	aa1303e0 	mov	x0, x19
  20a604:	94000d75 	bl	20dbd8 <__towrite>
  20a608:	34fff920 	cbz	w0, 20a52c <vfprintf+0x94>
  20a60c:	12800014 	mov	w20, #0xffffffff            	// #-1
  20a610:	17ffffda 	b	20a578 <vfprintf+0xe0>
  20a614:	00000000 	.inst	0x00000000 ; undefined

000000000020a618 <sn_write>:
  20a618:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  20a61c:	aa0003f4 	mov	x20, x0
  20a620:	a9015bf5 	stp	x21, x22, [sp, #16]
  20a624:	aa0203f6 	mov	x22, x2
  20a628:	a9027bf7 	stp	x23, x30, [sp, #32]
  20a62c:	aa0103f7 	mov	x23, x1
  20a630:	f9404c15 	ldr	x21, [x0, #152]
  20a634:	f9401403 	ldr	x3, [x0, #40]
  20a638:	f9401c01 	ldr	x1, [x0, #56]
  20a63c:	a9400aa0 	ldp	x0, x2, [x21]
  20a640:	cb010063 	sub	x3, x3, x1
  20a644:	eb02007f 	cmp	x3, x2
  20a648:	9a829073 	csel	x19, x3, x2, ls  // ls = plast
  20a64c:	b50002b3 	cbnz	x19, 20a6a0 <sn_write+0x88>
  20a650:	eb0202df 	cmp	x22, x2
  20a654:	9a8292d3 	csel	x19, x22, x2, ls  // ls = plast
  20a658:	b4000113 	cbz	x19, 20a678 <sn_write+0x60>
  20a65c:	aa1303e2 	mov	x2, x19
  20a660:	aa1703e1 	mov	x1, x23
  20a664:	9400007f 	bl	20a860 <memcpy>
  20a668:	a9400aa0 	ldp	x0, x2, [x21]
  20a66c:	8b130000 	add	x0, x0, x19
  20a670:	cb130042 	sub	x2, x2, x19
  20a674:	a9000aa0 	stp	x0, x2, [x21]
  20a678:	3900001f 	strb	wzr, [x0]
  20a67c:	aa1603e0 	mov	x0, x22
  20a680:	f9402e81 	ldr	x1, [x20, #88]
  20a684:	f9001681 	str	x1, [x20, #40]
  20a688:	f9001e81 	str	x1, [x20, #56]
  20a68c:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20a690:	a9427bf7 	ldp	x23, x30, [sp, #32]
  20a694:	a8c353f3 	ldp	x19, x20, [sp], #48
  20a698:	d65f03c0 	ret
  20a69c:	d503201f 	nop
  20a6a0:	aa1303e2 	mov	x2, x19
  20a6a4:	9400006f 	bl	20a860 <memcpy>
  20a6a8:	a9400aa0 	ldp	x0, x2, [x21]
  20a6ac:	8b130000 	add	x0, x0, x19
  20a6b0:	cb130042 	sub	x2, x2, x19
  20a6b4:	a9000aa0 	stp	x0, x2, [x21]
  20a6b8:	17ffffe6 	b	20a650 <sn_write+0x38>
  20a6bc:	00000000 	.inst	0x00000000 ; undefined

000000000020a6c0 <vsnprintf>:
  20a6c0:	a9aa53f3 	stp	x19, x20, [sp, #-352]!
  20a6c4:	a901dff6 	stp	x22, x23, [sp, #24]
  20a6c8:	aa0203f7 	mov	x23, x2
  20a6cc:	f90017fe 	str	x30, [sp, #40]
  20a6d0:	aa0303f6 	mov	x22, x3
  20a6d4:	b4000361 	cbz	x1, 20a740 <vsnprintf+0x80>
  20a6d8:	9101e3e4 	add	x4, sp, #0x78
  20a6dc:	aa0003f3 	mov	x19, x0
  20a6e0:	d2801d02 	mov	x2, #0xe8                  	// #232
  20a6e4:	aa0403e0 	mov	x0, x4
  20a6e8:	f9000bf5 	str	x21, [sp, #16]
  20a6ec:	aa0103f5 	mov	x21, x1
  20a6f0:	f90037f3 	str	x19, [sp, #104]
  20a6f4:	52800001 	mov	w1, #0x0                   	// #0
  20a6f8:	f9003bf5 	str	x21, [sp, #112]
  20a6fc:	940001ab 	bl	20ada8 <memset>
  20a700:	12800014 	mov	w20, #0xffffffff            	// #-1
  20a704:	aa0003e4 	mov	x4, x0
  20a708:	910163e2 	add	x2, sp, #0x58
  20a70c:	90000000 	adrp	x0, 20a000 <printf_core+0x7f0>
  20a710:	9101a3e1 	add	x1, sp, #0x68
  20a714:	91186000 	add	x0, x0, #0x618
  20a718:	f9006be2 	str	x2, [sp, #208]
  20a71c:	f90063e0 	str	x0, [sp, #192]
  20a720:	b2407be0 	mov	x0, #0x7fffffff            	// #2147483647
  20a724:	b90107f4 	str	w20, [sp, #260]
  20a728:	eb0002bf 	cmp	x21, x0
  20a72c:	b9010bf4 	str	w20, [sp, #264]
  20a730:	f9008be1 	str	x1, [sp, #272]
  20a734:	540004a8 	b.hi	20a7c8 <vsnprintf+0x108>  // b.pmore
  20a738:	f9400bf5 	ldr	x21, [sp, #16]
  20a73c:	14000013 	b	20a788 <vsnprintf+0xc8>
  20a740:	9101e3e4 	add	x4, sp, #0x78
  20a744:	d2801d02 	mov	x2, #0xe8                  	// #232
  20a748:	52800001 	mov	w1, #0x0                   	// #0
  20a74c:	aa0403e0 	mov	x0, x4
  20a750:	910183f3 	add	x19, sp, #0x60
  20a754:	a906fff3 	stp	x19, xzr, [sp, #104]
  20a758:	94000194 	bl	20ada8 <memset>
  20a75c:	aa0003e4 	mov	x4, x0
  20a760:	12800001 	mov	w1, #0xffffffff            	// #-1
  20a764:	90000000 	adrp	x0, 20a000 <printf_core+0x7f0>
  20a768:	910163e3 	add	x3, sp, #0x58
  20a76c:	91186000 	add	x0, x0, #0x618
  20a770:	9101a3e2 	add	x2, sp, #0x68
  20a774:	f90063e0 	str	x0, [sp, #192]
  20a778:	f9006be3 	str	x3, [sp, #208]
  20a77c:	b90107e1 	str	w1, [sp, #260]
  20a780:	b9010be1 	str	w1, [sp, #264]
  20a784:	f9008be2 	str	x2, [sp, #272]
  20a788:	a9400ec2 	ldp	x2, x3, [x22]
  20a78c:	3900027f 	strb	wzr, [x19]
  20a790:	a94106c0 	ldp	x0, x1, [x22, #16]
  20a794:	a90407e0 	stp	x0, x1, [sp, #64]
  20a798:	a9030fe2 	stp	x2, x3, [sp, #48]
  20a79c:	aa1703e1 	mov	x1, x23
  20a7a0:	9100c3e2 	add	x2, sp, #0x30
  20a7a4:	aa0403e0 	mov	x0, x4
  20a7a8:	97ffff3c 	bl	20a498 <vfprintf>
  20a7ac:	2a0003f4 	mov	w20, w0
  20a7b0:	2a1403e0 	mov	w0, w20
  20a7b4:	f94017fe 	ldr	x30, [sp, #40]
  20a7b8:	a941dff6 	ldp	x22, x23, [sp, #24]
  20a7bc:	a8d653f3 	ldp	x19, x20, [sp], #352
  20a7c0:	d65f03c0 	ret
  20a7c4:	d503201f 	nop
  20a7c8:	97ffe356 	bl	203520 <__errno_location>
  20a7cc:	f9400bf5 	ldr	x21, [sp, #16]
  20a7d0:	52800962 	mov	w2, #0x4b                  	// #75
  20a7d4:	b9000002 	str	w2, [x0]
  20a7d8:	17fffff6 	b	20a7b0 <vsnprintf+0xf0>
  20a7dc:	00000000 	.inst	0x00000000 ; undefined

000000000020a7e0 <vsprintf>:
  20a7e0:	aa0203e4 	mov	x4, x2
  20a7e4:	f81d0ffe 	str	x30, [sp, #-48]!
  20a7e8:	aa0103e2 	mov	x2, x1
  20a7ec:	b2407be1 	mov	x1, #0x7fffffff            	// #2147483647
  20a7f0:	910043e3 	add	x3, sp, #0x10
  20a7f4:	a9401c86 	ldp	x6, x7, [x4]
  20a7f8:	a9411484 	ldp	x4, x5, [x4, #16]
  20a7fc:	a90217e4 	stp	x4, x5, [sp, #32]
  20a800:	a9011fe6 	stp	x6, x7, [sp, #16]
  20a804:	97ffffaf 	bl	20a6c0 <vsnprintf>
  20a808:	f84307fe 	ldr	x30, [sp], #48
  20a80c:	d65f03c0 	ret

000000000020a810 <memcmp>:
  20a810:	b4000202 	cbz	x2, 20a850 <memcmp+0x40>
  20a814:	39400004 	ldrb	w4, [x0]
  20a818:	39400025 	ldrb	w5, [x1]
  20a81c:	6b0400bf 	cmp	w5, w4
  20a820:	540001c1 	b.ne	20a858 <memcmp+0x48>  // b.any
  20a824:	d2800023 	mov	x3, #0x1                   	// #1
  20a828:	14000008 	b	20a848 <memcmp+0x38>
  20a82c:	d503201f 	nop
  20a830:	38636804 	ldrb	w4, [x0, x3]
  20a834:	91000463 	add	x3, x3, #0x1
  20a838:	8b030025 	add	x5, x1, x3
  20a83c:	385ff0a5 	ldurb	w5, [x5, #-1]
  20a840:	6b05009f 	cmp	w4, w5
  20a844:	540000a1 	b.ne	20a858 <memcmp+0x48>  // b.any
  20a848:	eb03005f 	cmp	x2, x3
  20a84c:	54ffff21 	b.ne	20a830 <memcmp+0x20>  // b.any
  20a850:	52800000 	mov	w0, #0x0                   	// #0
  20a854:	d65f03c0 	ret
  20a858:	4b050080 	sub	w0, w4, w5
  20a85c:	d65f03c0 	ret

000000000020a860 <memcpy>:
  20a860:	f240043f 	tst	x1, #0x3
  20a864:	54001d60 	b.eq	20ac10 <memcpy+0x3b0>  // b.none
  20a868:	b4000642 	cbz	x2, 20a930 <memcpy+0xd0>
  20a86c:	aa0003ea 	mov	x10, x0
  20a870:	14000003 	b	20a87c <memcpy+0x1c>
  20a874:	d503201f 	nop
  20a878:	b40014c2 	cbz	x2, 20ab10 <memcpy+0x2b0>
  20a87c:	38401423 	ldrb	w3, [x1], #1
  20a880:	d1000442 	sub	x2, x2, #0x1
  20a884:	38001543 	strb	w3, [x10], #1
  20a888:	f240043f 	tst	x1, #0x3
  20a88c:	54ffff61 	b.ne	20a878 <memcpy+0x18>  // b.any
  20a890:	f2400543 	ands	x3, x10, #0x3
  20a894:	54000521 	b.ne	20a938 <memcpy+0xd8>  // b.any
  20a898:	f1003c5f 	cmp	x2, #0xf
  20a89c:	54000209 	b.ls	20a8dc <memcpy+0x7c>  // b.plast
  20a8a0:	d1004049 	sub	x9, x2, #0x10
  20a8a4:	aa0a03e3 	mov	x3, x10
  20a8a8:	927ced29 	and	x9, x9, #0xfffffffffffffff0
  20a8ac:	91004129 	add	x9, x9, #0x10
  20a8b0:	8b090028 	add	x8, x1, x9
  20a8b4:	29401827 	ldp	w7, w6, [x1]
  20a8b8:	29001867 	stp	w7, w6, [x3]
  20a8bc:	29411025 	ldp	w5, w4, [x1, #8]
  20a8c0:	29011065 	stp	w5, w4, [x3, #8]
  20a8c4:	91004021 	add	x1, x1, #0x10
  20a8c8:	91004063 	add	x3, x3, #0x10
  20a8cc:	eb08003f 	cmp	x1, x8
  20a8d0:	54ffff21 	b.ne	20a8b4 <memcpy+0x54>  // b.any
  20a8d4:	92400c42 	and	x2, x2, #0xf
  20a8d8:	8b09014a 	add	x10, x10, x9
  20a8dc:	927e0045 	and	x5, x2, #0x4
  20a8e0:	927f0044 	and	x4, x2, #0x2
  20a8e4:	92400043 	and	x3, x2, #0x1
  20a8e8:	361800a2 	tbz	w2, #3, 20a8fc <memcpy+0x9c>
  20a8ec:	29400826 	ldp	w6, w2, [x1]
  20a8f0:	29000946 	stp	w6, w2, [x10]
  20a8f4:	91002021 	add	x1, x1, #0x8
  20a8f8:	9100214a 	add	x10, x10, #0x8
  20a8fc:	b4000065 	cbz	x5, 20a908 <memcpy+0xa8>
  20a900:	b8404422 	ldr	w2, [x1], #4
  20a904:	b8004542 	str	w2, [x10], #4
  20a908:	aa0a03e2 	mov	x2, x10
  20a90c:	b40000a4 	cbz	x4, 20a920 <memcpy+0xc0>
  20a910:	39400424 	ldrb	w4, [x1, #1]
  20a914:	38402425 	ldrb	w5, [x1], #2
  20a918:	38002445 	strb	w5, [x2], #2
  20a91c:	39000544 	strb	w4, [x10, #1]
  20a920:	b4000083 	cbz	x3, 20a930 <memcpy+0xd0>
  20a924:	39400021 	ldrb	w1, [x1]
  20a928:	39000041 	strb	w1, [x2]
  20a92c:	d65f03c0 	ret
  20a930:	d65f03c0 	ret
  20a934:	d503201f 	nop
  20a938:	f81f0ffe 	str	x30, [sp, #-16]!
  20a93c:	f1007c5f 	cmp	x2, #0x1f
  20a940:	54000489 	b.ls	20a9d0 <memcpy+0x170>  // b.plast
  20a944:	39400025 	ldrb	w5, [x1]
  20a948:	f100087f 	cmp	x3, #0x2
  20a94c:	b9400028 	ldr	w8, [x1]
  20a950:	54000e40 	b.eq	20ab18 <memcpy+0x2b8>  // b.none
  20a954:	f1000c7f 	cmp	x3, #0x3
  20a958:	540011c1 	b.ne	20ab90 <memcpy+0x330>  // b.any
  20a95c:	d100504c 	sub	x12, x2, #0x14
  20a960:	91000421 	add	x1, x1, #0x1
  20a964:	d344fd8c 	lsr	x12, x12, #4
  20a968:	9100054d 	add	x13, x10, #0x1
  20a96c:	8b0c114b 	add	x11, x10, x12, lsl #4
  20a970:	aa0103e4 	mov	x4, x1
  20a974:	9100456b 	add	x11, x11, #0x11
  20a978:	aa0d03e3 	mov	x3, x13
  20a97c:	39000145 	strb	w5, [x10]
  20a980:	b8403087 	ldur	w7, [x4, #3]
  20a984:	91004084 	add	x4, x4, #0x10
  20a988:	b85f7086 	ldur	w6, [x4, #-9]
  20a98c:	91004063 	add	x3, x3, #0x10
  20a990:	b85fb085 	ldur	w5, [x4, #-5]
  20a994:	eb0b007f 	cmp	x3, x11
  20a998:	138820e9 	extr	w9, w7, w8, #8
  20a99c:	138720c7 	extr	w7, w6, w7, #8
  20a9a0:	293e1c69 	stp	w9, w7, [x3, #-16]
  20a9a4:	138620a6 	extr	w6, w5, w6, #8
  20a9a8:	b85ff088 	ldur	w8, [x4, #-1]
  20a9ac:	13852105 	extr	w5, w8, w5, #8
  20a9b0:	293f1466 	stp	w6, w5, [x3, #-8]
  20a9b4:	54fffe61 	b.ne	20a980 <memcpy+0x120>  // b.any
  20a9b8:	91000583 	add	x3, x12, #0x1
  20a9bc:	d1004442 	sub	x2, x2, #0x11
  20a9c0:	d37cec63 	lsl	x3, x3, #4
  20a9c4:	cb0c1042 	sub	x2, x2, x12, lsl #4
  20a9c8:	8b0301aa 	add	x10, x13, x3
  20a9cc:	8b030021 	add	x1, x1, x3
  20a9d0:	927d0043 	and	x3, x2, #0x8
  20a9d4:	927e0046 	and	x6, x2, #0x4
  20a9d8:	927f0045 	and	x5, x2, #0x2
  20a9dc:	92400044 	and	x4, x2, #0x1
  20a9e0:	36201242 	tbz	w2, #4, 20ac28 <memcpy+0x3c8>
  20a9e4:	39400422 	ldrb	w2, [x1, #1]
  20a9e8:	91004021 	add	x1, x1, #0x10
  20a9ec:	385f0028 	ldurb	w8, [x1, #-16]
  20a9f0:	385f3027 	ldurb	w7, [x1, #-13]
  20a9f4:	39000542 	strb	w2, [x10, #1]
  20a9f8:	385fe022 	ldurb	w2, [x1, #-2]
  20a9fc:	385f203e 	ldurb	w30, [x1, #-14]
  20aa00:	385f4032 	ldurb	w18, [x1, #-12]
  20aa04:	385f5031 	ldurb	w17, [x1, #-11]
  20aa08:	385f6030 	ldurb	w16, [x1, #-10]
  20aa0c:	385f702f 	ldurb	w15, [x1, #-9]
  20aa10:	385f802e 	ldurb	w14, [x1, #-8]
  20aa14:	385f902d 	ldurb	w13, [x1, #-7]
  20aa18:	385fa02c 	ldurb	w12, [x1, #-6]
  20aa1c:	385fb02b 	ldurb	w11, [x1, #-5]
  20aa20:	385fc029 	ldurb	w9, [x1, #-4]
  20aa24:	39000148 	strb	w8, [x10]
  20aa28:	39000d47 	strb	w7, [x10, #3]
  20aa2c:	385fd028 	ldurb	w8, [x1, #-3]
  20aa30:	385ff027 	ldurb	w7, [x1, #-1]
  20aa34:	39003942 	strb	w2, [x10, #14]
  20aa38:	91004142 	add	x2, x10, #0x10
  20aa3c:	3900095e 	strb	w30, [x10, #2]
  20aa40:	39001152 	strb	w18, [x10, #4]
  20aa44:	39001551 	strb	w17, [x10, #5]
  20aa48:	39001950 	strb	w16, [x10, #6]
  20aa4c:	39001d4f 	strb	w15, [x10, #7]
  20aa50:	3900214e 	strb	w14, [x10, #8]
  20aa54:	3900254d 	strb	w13, [x10, #9]
  20aa58:	3900294c 	strb	w12, [x10, #10]
  20aa5c:	39002d4b 	strb	w11, [x10, #11]
  20aa60:	39003149 	strb	w9, [x10, #12]
  20aa64:	39003548 	strb	w8, [x10, #13]
  20aa68:	39003d47 	strb	w7, [x10, #15]
  20aa6c:	b4000da3 	cbz	x3, 20ac20 <memcpy+0x3c0>
  20aa70:	39401823 	ldrb	w3, [x1, #6]
  20aa74:	91002021 	add	x1, x1, #0x8
  20aa78:	385f802d 	ldurb	w13, [x1, #-8]
  20aa7c:	385f902c 	ldurb	w12, [x1, #-7]
  20aa80:	385fa02b 	ldurb	w11, [x1, #-6]
  20aa84:	385fb02a 	ldurb	w10, [x1, #-5]
  20aa88:	385fc029 	ldurb	w9, [x1, #-4]
  20aa8c:	385fd028 	ldurb	w8, [x1, #-3]
  20aa90:	385ff027 	ldurb	w7, [x1, #-1]
  20aa94:	39001843 	strb	w3, [x2, #6]
  20aa98:	91002043 	add	x3, x2, #0x8
  20aa9c:	3900004d 	strb	w13, [x2]
  20aaa0:	3900044c 	strb	w12, [x2, #1]
  20aaa4:	3900084b 	strb	w11, [x2, #2]
  20aaa8:	39000c4a 	strb	w10, [x2, #3]
  20aaac:	39001049 	strb	w9, [x2, #4]
  20aab0:	39001448 	strb	w8, [x2, #5]
  20aab4:	39001c47 	strb	w7, [x2, #7]
  20aab8:	b4000b06 	cbz	x6, 20ac18 <memcpy+0x3b8>
  20aabc:	39400822 	ldrb	w2, [x1, #2]
  20aac0:	91001021 	add	x1, x1, #0x4
  20aac4:	385fc028 	ldurb	w8, [x1, #-4]
  20aac8:	385fd027 	ldurb	w7, [x1, #-3]
  20aacc:	385ff026 	ldurb	w6, [x1, #-1]
  20aad0:	39000862 	strb	w2, [x3, #2]
  20aad4:	91001062 	add	x2, x3, #0x4
  20aad8:	39000068 	strb	w8, [x3]
  20aadc:	39000467 	strb	w7, [x3, #1]
  20aae0:	39000c66 	strb	w6, [x3, #3]
  20aae4:	aa0203ea 	mov	x10, x2
  20aae8:	b40000a5 	cbz	x5, 20aafc <memcpy+0x29c>
  20aaec:	39400423 	ldrb	w3, [x1, #1]
  20aaf0:	38402425 	ldrb	w5, [x1], #2
  20aaf4:	38002545 	strb	w5, [x10], #2
  20aaf8:	39000443 	strb	w3, [x2, #1]
  20aafc:	b4000064 	cbz	x4, 20ab08 <memcpy+0x2a8>
  20ab00:	39400021 	ldrb	w1, [x1]
  20ab04:	39000141 	strb	w1, [x10]
  20ab08:	f84107fe 	ldr	x30, [sp], #16
  20ab0c:	d65f03c0 	ret
  20ab10:	d65f03c0 	ret
  20ab14:	d503201f 	nop
  20ab18:	aa0a03e3 	mov	x3, x10
  20ab1c:	d1005049 	sub	x9, x2, #0x14
  20ab20:	d344fd29 	lsr	x9, x9, #4
  20ab24:	39400424 	ldrb	w4, [x1, #1]
  20ab28:	9100052b 	add	x11, x9, #0x1
  20ab2c:	9100082c 	add	x12, x1, #0x2
  20ab30:	38002465 	strb	w5, [x3], #2
  20ab34:	d37ced6b 	lsl	x11, x11, #4
  20ab38:	39000544 	strb	w4, [x10, #1]
  20ab3c:	aa0c03e1 	mov	x1, x12
  20ab40:	8b0b006a 	add	x10, x3, x11
  20ab44:	b8402026 	ldur	w6, [x1, #2]
  20ab48:	91004021 	add	x1, x1, #0x10
  20ab4c:	b85f6025 	ldur	w5, [x1, #-10]
  20ab50:	91004063 	add	x3, x3, #0x10
  20ab54:	b85fa024 	ldur	w4, [x1, #-6]
  20ab58:	eb03015f 	cmp	x10, x3
  20ab5c:	138840c7 	extr	w7, w6, w8, #16
  20ab60:	138640a6 	extr	w6, w5, w6, #16
  20ab64:	293e1867 	stp	w7, w6, [x3, #-16]
  20ab68:	13854085 	extr	w5, w4, w5, #16
  20ab6c:	b85fe028 	ldur	w8, [x1, #-2]
  20ab70:	13844104 	extr	w4, w8, w4, #16
  20ab74:	293f1065 	stp	w5, w4, [x3, #-8]
  20ab78:	54fffe61 	b.ne	20ab44 <memcpy+0x2e4>  // b.any
  20ab7c:	d1004842 	sub	x2, x2, #0x12
  20ab80:	8b0b0181 	add	x1, x12, x11
  20ab84:	cb091042 	sub	x2, x2, x9, lsl #4
  20ab88:	17ffff92 	b	20a9d0 <memcpy+0x170>
  20ab8c:	d503201f 	nop
  20ab90:	d1005049 	sub	x9, x2, #0x14
  20ab94:	91000c2d 	add	x13, x1, #0x3
  20ab98:	d344fd29 	lsr	x9, x9, #4
  20ab9c:	91000d43 	add	x3, x10, #0x3
  20aba0:	9100052c 	add	x12, x9, #0x1
  20aba4:	39400426 	ldrb	w6, [x1, #1]
  20aba8:	d37ced8c 	lsl	x12, x12, #4
  20abac:	39400824 	ldrb	w4, [x1, #2]
  20abb0:	8b0c006b 	add	x11, x3, x12
  20abb4:	aa0d03e1 	mov	x1, x13
  20abb8:	39000145 	strb	w5, [x10]
  20abbc:	39000546 	strb	w6, [x10, #1]
  20abc0:	39000944 	strb	w4, [x10, #2]
  20abc4:	b8401026 	ldur	w6, [x1, #1]
  20abc8:	91004021 	add	x1, x1, #0x10
  20abcc:	b85f5025 	ldur	w5, [x1, #-11]
  20abd0:	91004063 	add	x3, x3, #0x10
  20abd4:	b85f9024 	ldur	w4, [x1, #-7]
  20abd8:	eb03017f 	cmp	x11, x3
  20abdc:	138860c7 	extr	w7, w6, w8, #24
  20abe0:	138660a6 	extr	w6, w5, w6, #24
  20abe4:	293e1867 	stp	w7, w6, [x3, #-16]
  20abe8:	13856085 	extr	w5, w4, w5, #24
  20abec:	b85fd028 	ldur	w8, [x1, #-3]
  20abf0:	13846104 	extr	w4, w8, w4, #24
  20abf4:	293f1065 	stp	w5, w4, [x3, #-8]
  20abf8:	54fffe61 	b.ne	20abc4 <memcpy+0x364>  // b.any
  20abfc:	d1004c42 	sub	x2, x2, #0x13
  20ac00:	8b0c01a1 	add	x1, x13, x12
  20ac04:	cb091042 	sub	x2, x2, x9, lsl #4
  20ac08:	aa0b03ea 	mov	x10, x11
  20ac0c:	17ffff71 	b	20a9d0 <memcpy+0x170>
  20ac10:	aa0003ea 	mov	x10, x0
  20ac14:	17ffff1f 	b	20a890 <memcpy+0x30>
  20ac18:	aa0303e2 	mov	x2, x3
  20ac1c:	17ffffb2 	b	20aae4 <memcpy+0x284>
  20ac20:	aa0203e3 	mov	x3, x2
  20ac24:	17ffffa5 	b	20aab8 <memcpy+0x258>
  20ac28:	aa0a03e2 	mov	x2, x10
  20ac2c:	17ffff90 	b	20aa6c <memcpy+0x20c>

000000000020ac30 <memmove>:
  20ac30:	aa0003e5 	mov	x5, x0
  20ac34:	aa0103e4 	mov	x4, x1
  20ac38:	aa0203e3 	mov	x3, x2
  20ac3c:	eb01001f 	cmp	x0, x1
  20ac40:	54000600 	b.eq	20ad00 <memmove+0xd0>  // b.none
  20ac44:	cb000026 	sub	x6, x1, x0
  20ac48:	cb0207e7 	neg	x7, x2, lsl #1
  20ac4c:	cb0200c6 	sub	x6, x6, x2
  20ac50:	eb0700df 	cmp	x6, x7
  20ac54:	54000969 	b.ls	20ad80 <memmove+0x150>  // b.plast
  20ac58:	ca000020 	eor	x0, x1, x0
  20ac5c:	eb0100bf 	cmp	x5, x1
  20ac60:	92400800 	and	x0, x0, #0x7
  20ac64:	54000522 	b.cs	20ad08 <memmove+0xd8>  // b.hs, b.nlast
  20ac68:	b50003c0 	cbnz	x0, 20ace0 <memmove+0xb0>
  20ac6c:	f24008bf 	tst	x5, #0x7
  20ac70:	54000960 	b.eq	20ad9c <memmove+0x16c>  // b.none
  20ac74:	d1000440 	sub	x0, x2, #0x1
  20ac78:	aa0503e1 	mov	x1, x5
  20ac7c:	b50000c2 	cbnz	x2, 20ac94 <memmove+0x64>
  20ac80:	14000020 	b	20ad00 <memmove+0xd0>
  20ac84:	d503201f 	nop
  20ac88:	d1000400 	sub	x0, x0, #0x1
  20ac8c:	b100041f 	cmn	x0, #0x1
  20ac90:	54000380 	b.eq	20ad00 <memmove+0xd0>  // b.none
  20ac94:	38401482 	ldrb	w2, [x4], #1
  20ac98:	38001422 	strb	w2, [x1], #1
  20ac9c:	f240083f 	tst	x1, #0x7
  20aca0:	54ffff41 	b.ne	20ac88 <memmove+0x58>  // b.any
  20aca4:	f1001c1f 	cmp	x0, #0x7
  20aca8:	54000729 	b.ls	20ad8c <memmove+0x15c>  // b.plast
  20acac:	d1002003 	sub	x3, x0, #0x8
  20acb0:	d2800002 	mov	x2, #0x0                   	// #0
  20acb4:	927df063 	and	x3, x3, #0xfffffffffffffff8
  20acb8:	91002063 	add	x3, x3, #0x8
  20acbc:	f8626886 	ldr	x6, [x4, x2]
  20acc0:	f8226826 	str	x6, [x1, x2]
  20acc4:	91002042 	add	x2, x2, #0x8
  20acc8:	eb03005f 	cmp	x2, x3
  20accc:	54ffff81 	b.ne	20acbc <memmove+0x8c>  // b.any
  20acd0:	92400803 	and	x3, x0, #0x7
  20acd4:	8b020021 	add	x1, x1, x2
  20acd8:	8b020084 	add	x4, x4, x2
  20acdc:	14000002 	b	20ace4 <memmove+0xb4>
  20ace0:	aa0503e1 	mov	x1, x5
  20ace4:	d2800000 	mov	x0, #0x0                   	// #0
  20ace8:	b40000c3 	cbz	x3, 20ad00 <memmove+0xd0>
  20acec:	38606882 	ldrb	w2, [x4, x0]
  20acf0:	38206822 	strb	w2, [x1, x0]
  20acf4:	91000400 	add	x0, x0, #0x1
  20acf8:	eb00007f 	cmp	x3, x0
  20acfc:	54ffff81 	b.ne	20acec <memmove+0xbc>  // b.any
  20ad00:	aa0503e0 	mov	x0, x5
  20ad04:	d65f03c0 	ret
  20ad08:	b5000320 	cbnz	x0, 20ad6c <memmove+0x13c>
  20ad0c:	8b0200a0 	add	x0, x5, x2
  20ad10:	f240081f 	tst	x0, #0x7
  20ad14:	54000400 	b.eq	20ad94 <memmove+0x164>  // b.none
  20ad18:	d1000440 	sub	x0, x2, #0x1
  20ad1c:	b50000c2 	cbnz	x2, 20ad34 <memmove+0x104>
  20ad20:	17fffff8 	b	20ad00 <memmove+0xd0>
  20ad24:	d503201f 	nop
  20ad28:	d1000400 	sub	x0, x0, #0x1
  20ad2c:	b100041f 	cmn	x0, #0x1
  20ad30:	54fffe80 	b.eq	20ad00 <memmove+0xd0>  // b.none
  20ad34:	38606882 	ldrb	w2, [x4, x0]
  20ad38:	8b0000a1 	add	x1, x5, x0
  20ad3c:	382068a2 	strb	w2, [x5, x0]
  20ad40:	f240083f 	tst	x1, #0x7
  20ad44:	54ffff21 	b.ne	20ad28 <memmove+0xf8>  // b.any
  20ad48:	f1001c1f 	cmp	x0, #0x7
  20ad4c:	540001c9 	b.ls	20ad84 <memmove+0x154>  // b.plast
  20ad50:	aa0003e1 	mov	x1, x0
  20ad54:	d1002021 	sub	x1, x1, #0x8
  20ad58:	f1001c3f 	cmp	x1, #0x7
  20ad5c:	f8616882 	ldr	x2, [x4, x1]
  20ad60:	f82168a2 	str	x2, [x5, x1]
  20ad64:	54ffff88 	b.hi	20ad54 <memmove+0x124>  // b.pmore
  20ad68:	92400803 	and	x3, x0, #0x7
  20ad6c:	b4fffca3 	cbz	x3, 20ad00 <memmove+0xd0>
  20ad70:	d1000463 	sub	x3, x3, #0x1
  20ad74:	38636880 	ldrb	w0, [x4, x3]
  20ad78:	382368a0 	strb	w0, [x5, x3]
  20ad7c:	17fffffc 	b	20ad6c <memmove+0x13c>
  20ad80:	17fffeb8 	b	20a860 <memcpy>
  20ad84:	aa0003e3 	mov	x3, x0
  20ad88:	17fffff9 	b	20ad6c <memmove+0x13c>
  20ad8c:	aa0003e3 	mov	x3, x0
  20ad90:	17ffffd5 	b	20ace4 <memmove+0xb4>
  20ad94:	aa0203e0 	mov	x0, x2
  20ad98:	17ffffec 	b	20ad48 <memmove+0x118>
  20ad9c:	aa0503e1 	mov	x1, x5
  20ada0:	aa0203e0 	mov	x0, x2
  20ada4:	17ffffc0 	b	20aca4 <memmove+0x74>

000000000020ada8 <memset>:
  20ada8:	b40006e2 	cbz	x2, 20ae84 <memset+0xdc>
  20adac:	8b020004 	add	x4, x0, x2
  20adb0:	12001c23 	and	w3, w1, #0xff
  20adb4:	39000003 	strb	w3, [x0]
  20adb8:	f100085f 	cmp	x2, #0x2
  20adbc:	381ff083 	sturb	w3, [x4, #-1]
  20adc0:	54000629 	b.ls	20ae84 <memset+0xdc>  // b.plast
  20adc4:	39000403 	strb	w3, [x0, #1]
  20adc8:	f100185f 	cmp	x2, #0x6
  20adcc:	39000803 	strb	w3, [x0, #2]
  20add0:	381fe083 	sturb	w3, [x4, #-2]
  20add4:	381fd083 	sturb	w3, [x4, #-3]
  20add8:	54000569 	b.ls	20ae84 <memset+0xdc>  // b.plast
  20addc:	39000c03 	strb	w3, [x0, #3]
  20ade0:	f100205f 	cmp	x2, #0x8
  20ade4:	381fc083 	sturb	w3, [x4, #-4]
  20ade8:	540004e9 	b.ls	20ae84 <memset+0xdc>  // b.plast
  20adec:	cb0003e3 	neg	x3, x0
  20adf0:	12001c21 	and	w1, w1, #0xff
  20adf4:	92400463 	and	x3, x3, #0x3
  20adf8:	3200c3e5 	mov	w5, #0x1010101             	// #16843009
  20adfc:	cb030042 	sub	x2, x2, x3
  20ae00:	8b030004 	add	x4, x0, x3
  20ae04:	927ef442 	and	x2, x2, #0xfffffffffffffffc
  20ae08:	1b057c21 	mul	w1, w1, w5
  20ae0c:	8b020085 	add	x5, x4, x2
  20ae10:	b8236801 	str	w1, [x0, x3]
  20ae14:	f100205f 	cmp	x2, #0x8
  20ae18:	b81fc0a1 	stur	w1, [x5, #-4]
  20ae1c:	54000349 	b.ls	20ae84 <memset+0xdc>  // b.plast
  20ae20:	29008481 	stp	w1, w1, [x4, #4]
  20ae24:	f100605f 	cmp	x2, #0x18
  20ae28:	293e84a1 	stp	w1, w1, [x5, #-12]
  20ae2c:	540002c9 	b.ls	20ae84 <memset+0xdc>  // b.plast
  20ae30:	29018481 	stp	w1, w1, [x4, #12]
  20ae34:	927e0086 	and	x6, x4, #0x4
  20ae38:	29028481 	stp	w1, w1, [x4, #20]
  20ae3c:	910060c6 	add	x6, x6, #0x18
  20ae40:	293c84a1 	stp	w1, w1, [x5, #-28]
  20ae44:	cb060042 	sub	x2, x2, x6
  20ae48:	293d84a1 	stp	w1, w1, [x5, #-20]
  20ae4c:	2a0103e3 	mov	w3, w1
  20ae50:	aa038063 	orr	x3, x3, x3, lsl #32
  20ae54:	f1007c5f 	cmp	x2, #0x1f
  20ae58:	8b060084 	add	x4, x4, x6
  20ae5c:	54000149 	b.ls	20ae84 <memset+0xdc>  // b.plast
  20ae60:	d1008041 	sub	x1, x2, #0x20
  20ae64:	927be821 	and	x1, x1, #0xffffffffffffffe0
  20ae68:	91008021 	add	x1, x1, #0x20
  20ae6c:	8b010081 	add	x1, x4, x1
  20ae70:	a9000c83 	stp	x3, x3, [x4]
  20ae74:	a9010c83 	stp	x3, x3, [x4, #16]
  20ae78:	91008084 	add	x4, x4, #0x20
  20ae7c:	eb01009f 	cmp	x4, x1
  20ae80:	54ffff81 	b.ne	20ae70 <memset+0xc8>  // b.any
  20ae84:	d65f03c0 	ret

000000000020ae88 <strcasecmp>:
  20ae88:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20ae8c:	aa0103f3 	mov	x19, x1
  20ae90:	f9000ffe 	str	x30, [sp, #24]
  20ae94:	39400002 	ldrb	w2, [x0]
  20ae98:	340002a2 	cbz	w2, 20aeec <strcasecmp+0x64>
  20ae9c:	39400021 	ldrb	w1, [x1]
  20aea0:	aa0003f4 	mov	x20, x0
  20aea4:	34000241 	cbz	w1, 20aeec <strcasecmp+0x64>
  20aea8:	f9000bf5 	str	x21, [sp, #16]
  20aeac:	14000003 	b	20aeb8 <strcasecmp+0x30>
  20aeb0:	39400261 	ldrb	w1, [x19]
  20aeb4:	340001a1 	cbz	w1, 20aee8 <strcasecmp+0x60>
  20aeb8:	2a0203e0 	mov	w0, w2
  20aebc:	6b01005f 	cmp	w2, w1
  20aec0:	540000e0 	b.eq	20aedc <strcasecmp+0x54>  // b.none
  20aec4:	9400071b 	bl	20cb30 <tolower>
  20aec8:	2a0003f5 	mov	w21, w0
  20aecc:	39400260 	ldrb	w0, [x19]
  20aed0:	94000718 	bl	20cb30 <tolower>
  20aed4:	6b0002bf 	cmp	w21, w0
  20aed8:	540001c1 	b.ne	20af10 <strcasecmp+0x88>  // b.any
  20aedc:	38401e82 	ldrb	w2, [x20, #1]!
  20aee0:	91000673 	add	x19, x19, #0x1
  20aee4:	35fffe62 	cbnz	w2, 20aeb0 <strcasecmp+0x28>
  20aee8:	f9400bf5 	ldr	x21, [sp, #16]
  20aeec:	2a0203e0 	mov	w0, w2
  20aef0:	94000710 	bl	20cb30 <tolower>
  20aef4:	2a0003f4 	mov	w20, w0
  20aef8:	39400260 	ldrb	w0, [x19]
  20aefc:	9400070d 	bl	20cb30 <tolower>
  20af00:	4b000280 	sub	w0, w20, w0
  20af04:	f9400ffe 	ldr	x30, [sp, #24]
  20af08:	a8c253f3 	ldp	x19, x20, [sp], #32
  20af0c:	d65f03c0 	ret
  20af10:	39400282 	ldrb	w2, [x20]
  20af14:	f9400bf5 	ldr	x21, [sp, #16]
  20af18:	17fffff5 	b	20aeec <strcasecmp+0x64>
  20af1c:	00000000 	.inst	0x00000000 ; undefined

000000000020af20 <__strcasecmp_l>:
  20af20:	17ffffda 	b	20ae88 <strcasecmp>
  20af24:	00000000 	.inst	0x00000000 ; undefined

000000000020af28 <strcmp>:
  20af28:	39400002 	ldrb	w2, [x0]
  20af2c:	39400023 	ldrb	w3, [x1]
  20af30:	6b02007f 	cmp	w3, w2
  20af34:	540001e1 	b.ne	20af70 <strcmp+0x48>  // b.any
  20af38:	34000183 	cbz	w3, 20af68 <strcmp+0x40>
  20af3c:	d2800022 	mov	x2, #0x1                   	// #1
  20af40:	14000003 	b	20af4c <strcmp+0x24>
  20af44:	d503201f 	nop
  20af48:	34000103 	cbz	w3, 20af68 <strcmp+0x40>
  20af4c:	38626803 	ldrb	w3, [x0, x2]
  20af50:	38626824 	ldrb	w4, [x1, x2]
  20af54:	91000442 	add	x2, x2, #0x1
  20af58:	6b04007f 	cmp	w3, w4
  20af5c:	54ffff60 	b.eq	20af48 <strcmp+0x20>  // b.none
  20af60:	4b040060 	sub	w0, w3, w4
  20af64:	d65f03c0 	ret
  20af68:	52800000 	mov	w0, #0x0                   	// #0
  20af6c:	d65f03c0 	ret
  20af70:	4b030040 	sub	w0, w2, w3
  20af74:	d65f03c0 	ret

000000000020af78 <strdup>:
  20af78:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20af7c:	aa0003f4 	mov	x20, x0
  20af80:	f9000bfe 	str	x30, [sp, #16]
  20af84:	9400000f 	bl	20afc0 <strlen>
  20af88:	91000413 	add	x19, x0, #0x1
  20af8c:	aa1303e0 	mov	x0, x19
  20af90:	97fff04e 	bl	2070c8 <malloc>
  20af94:	b40000e0 	cbz	x0, 20afb0 <strdup+0x38>
  20af98:	aa1303e2 	mov	x2, x19
  20af9c:	aa1403e1 	mov	x1, x20
  20afa0:	f9400bfe 	ldr	x30, [sp, #16]
  20afa4:	a8c253f3 	ldp	x19, x20, [sp], #32
  20afa8:	17fffe2e 	b	20a860 <memcpy>
  20afac:	d503201f 	nop
  20afb0:	f9400bfe 	ldr	x30, [sp, #16]
  20afb4:	a8c253f3 	ldp	x19, x20, [sp], #32
  20afb8:	d65f03c0 	ret
  20afbc:	00000000 	.inst	0x00000000 ; undefined

000000000020afc0 <strlen>:
  20afc0:	aa0003e4 	mov	x4, x0
  20afc4:	f240081f 	tst	x0, #0x7
  20afc8:	54000120 	b.eq	20afec <strlen+0x2c>  // b.none
  20afcc:	39400001 	ldrb	w1, [x0]
  20afd0:	35000081 	cbnz	w1, 20afe0 <strlen+0x20>
  20afd4:	14000019 	b	20b038 <strlen+0x78>
  20afd8:	39400001 	ldrb	w1, [x0]
  20afdc:	34000281 	cbz	w1, 20b02c <strlen+0x6c>
  20afe0:	91000400 	add	x0, x0, #0x1
  20afe4:	f240081f 	tst	x0, #0x7
  20afe8:	54ffff81 	b.ne	20afd8 <strlen+0x18>  // b.any
  20afec:	f9400001 	ldr	x1, [x0]
  20aff0:	b207dbe3 	mov	x3, #0xfefefefefefefefe    	// #-72340172838076674
  20aff4:	f29fdfe3 	movk	x3, #0xfeff
  20aff8:	8b030022 	add	x2, x1, x3
  20affc:	8a210041 	bic	x1, x2, x1
  20b000:	f201c03f 	tst	x1, #0x8080808080808080
  20b004:	540000c1 	b.ne	20b01c <strlen+0x5c>  // b.any
  20b008:	f8408c01 	ldr	x1, [x0, #8]!
  20b00c:	8b030022 	add	x2, x1, x3
  20b010:	8a210041 	bic	x1, x2, x1
  20b014:	f201c03f 	tst	x1, #0x8080808080808080
  20b018:	54ffff80 	b.eq	20b008 <strlen+0x48>  // b.none
  20b01c:	39400001 	ldrb	w1, [x0]
  20b020:	34000061 	cbz	w1, 20b02c <strlen+0x6c>
  20b024:	38401c01 	ldrb	w1, [x0, #1]!
  20b028:	35ffffe1 	cbnz	w1, 20b024 <strlen+0x64>
  20b02c:	cb040000 	sub	x0, x0, x4
  20b030:	d65f03c0 	ret
  20b034:	d503201f 	nop
  20b038:	d2800000 	mov	x0, #0x0                   	// #0
  20b03c:	d65f03c0 	ret

000000000020b040 <strncmp>:
  20b040:	b40002c2 	cbz	x2, 20b098 <strncmp+0x58>
  20b044:	39400004 	ldrb	w4, [x0]
  20b048:	39400026 	ldrb	w6, [x1]
  20b04c:	340002a4 	cbz	w4, 20b0a0 <strncmp+0x60>
  20b050:	f1000442 	subs	x2, x2, #0x1
  20b054:	d2800023 	mov	x3, #0x1                   	// #1
  20b058:	7a4018c4 	ccmp	w6, #0x0, #0x4, ne  // ne = any
  20b05c:	7a461080 	ccmp	w4, w6, #0x0, ne  // ne = any
  20b060:	54000161 	b.ne	20b08c <strncmp+0x4c>  // b.any
  20b064:	38636826 	ldrb	w6, [x1, x3]
  20b068:	38636804 	ldrb	w4, [x0, x3]
  20b06c:	710000df 	cmp	w6, #0x0
  20b070:	7a461080 	ccmp	w4, w6, #0x0, ne  // ne = any
  20b074:	1a9f17e5 	cset	w5, eq  // eq = none
  20b078:	eb03005f 	cmp	x2, x3
  20b07c:	34000124 	cbz	w4, 20b0a0 <strncmp+0x60>
  20b080:	1a9f10a5 	csel	w5, w5, wzr, ne  // ne = any
  20b084:	91000463 	add	x3, x3, #0x1
  20b088:	35fffee5 	cbnz	w5, 20b064 <strncmp+0x24>
  20b08c:	4b060080 	sub	w0, w4, w6
  20b090:	d65f03c0 	ret
  20b094:	d503201f 	nop
  20b098:	52800000 	mov	w0, #0x0                   	// #0
  20b09c:	d65f03c0 	ret
  20b0a0:	52800004 	mov	w4, #0x0                   	// #0
  20b0a4:	4b060080 	sub	w0, w4, w6
  20b0a8:	17fffffa 	b	20b090 <strncmp+0x50>
  20b0ac:	00000000 	.inst	0x00000000 ; undefined

000000000020b0b0 <strncpy>:
  20b0b0:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20b0b4:	aa0003f3 	mov	x19, x0
  20b0b8:	94000c00 	bl	20e0b8 <__stpncpy>
  20b0bc:	aa1303e0 	mov	x0, x19
  20b0c0:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20b0c4:	d65f03c0 	ret

000000000020b0c8 <strnlen>:
  20b0c8:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20b0cc:	aa0003f3 	mov	x19, x0
  20b0d0:	aa0103f4 	mov	x20, x1
  20b0d4:	aa0103e2 	mov	x2, x1
  20b0d8:	f9000bfe 	str	x30, [sp, #16]
  20b0dc:	52800001 	mov	w1, #0x0                   	// #0
  20b0e0:	94000bb6 	bl	20dfb8 <memchr>
  20b0e4:	cb130013 	sub	x19, x0, x19
  20b0e8:	f100001f 	cmp	x0, #0x0
  20b0ec:	f9400bfe 	ldr	x30, [sp, #16]
  20b0f0:	9a941260 	csel	x0, x19, x20, ne  // ne = any
  20b0f4:	a8c253f3 	ldp	x19, x20, [sp], #32
  20b0f8:	d65f03c0 	ret
  20b0fc:	00000000 	.inst	0x00000000 ; undefined

000000000020b100 <twoway_strstr>:
  20b100:	d12243ff 	sub	sp, sp, #0x890
  20b104:	b0000042 	adrp	x2, 214000 <syscall_table+0x800>
  20b108:	91210042 	add	x2, x2, #0x840
  20b10c:	a903effa 	stp	x26, x27, [sp, #56]
  20b110:	9101c3fb 	add	x27, sp, #0x70
  20b114:	a9015bf5 	stp	x21, x22, [sp, #16]
  20b118:	aa0103f5 	mov	x21, x1
  20b11c:	a90053f3 	stp	x19, x20, [sp]
  20b120:	aa0003fa 	mov	x26, x0
  20b124:	a904fbfc 	stp	x28, x30, [sp, #72]
  20b128:	4c40a040 	ld1	{v0.16b, v1.16b}, [x2]
  20b12c:	39400021 	ldrb	w1, [x1]
  20b130:	4c00a360 	st1	{v0.16b, v1.16b}, [x27]
  20b134:	34001961 	cbz	w1, 20b460 <twoway_strstr+0x360>
  20b138:	39400000 	ldrb	w0, [x0]
  20b13c:	d2800014 	mov	x20, #0x0                   	// #0
  20b140:	910243e5 	add	x5, sp, #0x90
  20b144:	d2800024 	mov	x4, #0x1                   	// #1
  20b148:	35000080 	cbnz	w0, 20b158 <twoway_strstr+0x58>
  20b14c:	14000079 	b	20b330 <twoway_strstr+0x230>
  20b150:	38746b40 	ldrb	w0, [x26, x20]
  20b154:	34000ee0 	cbz	w0, 20b330 <twoway_strstr+0x230>
  20b158:	d3461c22 	ubfx	x2, x1, #6, #2
  20b15c:	91000694 	add	x20, x20, #0x1
  20b160:	12001420 	and	w0, w1, #0x3f
  20b164:	f821d8b4 	str	x20, [x5, w1, sxtw #3]
  20b168:	f8627b63 	ldr	x3, [x27, x2, lsl #3]
  20b16c:	9ac02080 	lsl	x0, x4, x0
  20b170:	38746aa1 	ldrb	w1, [x21, x20]
  20b174:	aa030000 	orr	x0, x0, x3
  20b178:	f8227b60 	str	x0, [x27, x2, lsl #3]
  20b17c:	35fffea1 	cbnz	w1, 20b150 <twoway_strstr+0x50>
  20b180:	d2800026 	mov	x6, #0x1                   	// #1
  20b184:	aa0603e1 	mov	x1, x6
  20b188:	a90263f7 	stp	x23, x24, [sp, #32]
  20b18c:	d2800002 	mov	x2, #0x0                   	// #0
  20b190:	92800004 	mov	x4, #0xffffffffffffffff    	// #-1
  20b194:	f9001bf9 	str	x25, [sp, #48]
  20b198:	8b010040 	add	x0, x2, x1
  20b19c:	8b0402a3 	add	x3, x21, x4
  20b1a0:	eb00029f 	cmp	x20, x0
  20b1a4:	540001a9 	b.ls	20b1d8 <twoway_strstr+0xd8>  // b.plast
  20b1a8:	38616865 	ldrb	w5, [x3, x1]
  20b1ac:	38606aa3 	ldrb	w3, [x21, x0]
  20b1b0:	6b0300bf 	cmp	w5, w3
  20b1b4:	540012e0 	b.eq	20b410 <twoway_strstr+0x310>  // b.none
  20b1b8:	540013c9 	b.ls	20b430 <twoway_strstr+0x330>  // b.plast
  20b1bc:	cb040006 	sub	x6, x0, x4
  20b1c0:	aa0003e2 	mov	x2, x0
  20b1c4:	d2800021 	mov	x1, #0x1                   	// #1
  20b1c8:	8b010040 	add	x0, x2, x1
  20b1cc:	8b0402a3 	add	x3, x21, x4
  20b1d0:	eb00029f 	cmp	x20, x0
  20b1d4:	54fffea8 	b.hi	20b1a8 <twoway_strstr+0xa8>  // b.pmore
  20b1d8:	d2800036 	mov	x22, #0x1                   	// #1
  20b1dc:	aa1603e0 	mov	x0, x22
  20b1e0:	d2800002 	mov	x2, #0x0                   	// #0
  20b1e4:	9280001c 	mov	x28, #0xffffffffffffffff    	// #-1
  20b1e8:	8b000041 	add	x1, x2, x0
  20b1ec:	8b0002a3 	add	x3, x21, x0
  20b1f0:	eb01029f 	cmp	x20, x1
  20b1f4:	540001c9 	b.ls	20b22c <twoway_strstr+0x12c>  // b.plast
  20b1f8:	387c6865 	ldrb	w5, [x3, x28]
  20b1fc:	38616aa3 	ldrb	w3, [x21, x1]
  20b200:	6b0300bf 	cmp	w5, w3
  20b204:	540010e0 	b.eq	20b420 <twoway_strstr+0x320>  // b.none
  20b208:	d2800036 	mov	x22, #0x1                   	// #1
  20b20c:	aa1603e0 	mov	x0, x22
  20b210:	540011c2 	b.cs	20b448 <twoway_strstr+0x348>  // b.hs, b.nlast
  20b214:	aa0103e2 	mov	x2, x1
  20b218:	cb1c0036 	sub	x22, x1, x28
  20b21c:	8b000041 	add	x1, x2, x0
  20b220:	8b0002a3 	add	x3, x21, x0
  20b224:	eb01029f 	cmp	x20, x1
  20b228:	54fffe88 	b.hi	20b1f8 <twoway_strstr+0xf8>  // b.pmore
  20b22c:	91000782 	add	x2, x28, #0x1
  20b230:	91000481 	add	x1, x4, #0x1
  20b234:	eb01005f 	cmp	x2, x1
  20b238:	aa1503e0 	mov	x0, x21
  20b23c:	9a8682d6 	csel	x22, x22, x6, hi  // hi = pmore
  20b240:	9a818057 	csel	x23, x2, x1, hi  // hi = pmore
  20b244:	cb160283 	sub	x3, x20, x22
  20b248:	9a84839c 	csel	x28, x28, x4, hi  // hi = pmore
  20b24c:	aa1703e2 	mov	x2, x23
  20b250:	8b1602a1 	add	x1, x21, x22
  20b254:	f90037e3 	str	x3, [sp, #104]
  20b258:	97fffd6e 	bl	20a810 <memcmp>
  20b25c:	340000e0 	cbz	w0, 20b278 <twoway_strstr+0x178>
  20b260:	d1000680 	sub	x0, x20, #0x1
  20b264:	f90037ff 	str	xzr, [sp, #104]
  20b268:	cb1c0000 	sub	x0, x0, x28
  20b26c:	eb1c001f 	cmp	x0, x28
  20b270:	9a9c2000 	csel	x0, x0, x28, cs  // cs = hs, nlast
  20b274:	91000416 	add	x22, x0, #0x1
  20b278:	aa1a03f3 	mov	x19, x26
  20b27c:	910243f8 	add	x24, sp, #0x90
  20b280:	b2401680 	orr	x0, x20, #0x3f
  20b284:	d2800019 	mov	x25, #0x0                   	// #0
  20b288:	f90033e0 	str	x0, [sp, #96]
  20b28c:	cb130340 	sub	x0, x26, x19
  20b290:	eb14001f 	cmp	x0, x20
  20b294:	54000243 	b.cc	20b2dc <twoway_strstr+0x1dc>  // b.lo, b.ul, b.last
  20b298:	8b140262 	add	x2, x19, x20
  20b29c:	385ff041 	ldurb	w1, [x2, #-1]
  20b2a0:	12001425 	and	w5, w1, #0x3f
  20b2a4:	d3461c20 	ubfx	x0, x1, #6, #2
  20b2a8:	f8607b60 	ldr	x0, [x27, x0, lsl #3]
  20b2ac:	9ac52400 	lsr	x0, x0, x5
  20b2b0:	36000360 	tbz	w0, #0, 20b31c <twoway_strstr+0x21c>
  20b2b4:	f861db00 	ldr	x0, [x24, w1, sxtw #3]
  20b2b8:	eb000280 	subs	x0, x20, x0
  20b2bc:	540004a0 	b.eq	20b350 <twoway_strstr+0x250>  // b.none
  20b2c0:	eb00033f 	cmp	x25, x0
  20b2c4:	9a802320 	csel	x0, x25, x0, cs  // cs = hs, nlast
  20b2c8:	d2800019 	mov	x25, #0x0                   	// #0
  20b2cc:	8b000273 	add	x19, x19, x0
  20b2d0:	cb130340 	sub	x0, x26, x19
  20b2d4:	eb14001f 	cmp	x0, x20
  20b2d8:	54fffe02 	b.cs	20b298 <twoway_strstr+0x198>  // b.hs, b.nlast
  20b2dc:	f94033e2 	ldr	x2, [sp, #96]
  20b2e0:	52800001 	mov	w1, #0x0                   	// #0
  20b2e4:	aa1a03e0 	mov	x0, x26
  20b2e8:	94000b34 	bl	20dfb8 <memchr>
  20b2ec:	b40008a0 	cbz	x0, 20b400 <twoway_strstr+0x300>
  20b2f0:	cb130001 	sub	x1, x0, x19
  20b2f4:	eb14003f 	cmp	x1, x20
  20b2f8:	54000183 	b.cc	20b328 <twoway_strstr+0x228>  // b.lo, b.ul, b.last
  20b2fc:	8b140262 	add	x2, x19, x20
  20b300:	aa0003fa 	mov	x26, x0
  20b304:	385ff041 	ldurb	w1, [x2, #-1]
  20b308:	12001425 	and	w5, w1, #0x3f
  20b30c:	d3461c20 	ubfx	x0, x1, #6, #2
  20b310:	f8607b60 	ldr	x0, [x27, x0, lsl #3]
  20b314:	9ac52400 	lsr	x0, x0, x5
  20b318:	3707fce0 	tbnz	w0, #0, 20b2b4 <twoway_strstr+0x1b4>
  20b31c:	aa0203f3 	mov	x19, x2
  20b320:	d2800019 	mov	x25, #0x0                   	// #0
  20b324:	17ffffda 	b	20b28c <twoway_strstr+0x18c>
  20b328:	a94263f7 	ldp	x23, x24, [sp, #32]
  20b32c:	f9401bf9 	ldr	x25, [sp, #48]
  20b330:	d2800013 	mov	x19, #0x0                   	// #0
  20b334:	aa1303e0 	mov	x0, x19
  20b338:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20b33c:	a94053f3 	ldp	x19, x20, [sp]
  20b340:	a943effa 	ldp	x26, x27, [sp, #56]
  20b344:	a944fbfc 	ldp	x28, x30, [sp, #72]
  20b348:	912243ff 	add	sp, sp, #0x890
  20b34c:	d65f03c0 	ret
  20b350:	eb17033f 	cmp	x25, x23
  20b354:	9a972320 	csel	x0, x25, x23, cs  // cs = hs, nlast
  20b358:	38606aa1 	ldrb	w1, [x21, x0]
  20b35c:	350000c1 	cbnz	w1, 20b374 <twoway_strstr+0x274>
  20b360:	1400000c 	b	20b390 <twoway_strstr+0x290>
  20b364:	d503201f 	nop
  20b368:	91000400 	add	x0, x0, #0x1
  20b36c:	38606aa1 	ldrb	w1, [x21, x0]
  20b370:	34000101 	cbz	w1, 20b390 <twoway_strstr+0x290>
  20b374:	38606a62 	ldrb	w2, [x19, x0]
  20b378:	6b01005f 	cmp	w2, w1
  20b37c:	54ffff60 	b.eq	20b368 <twoway_strstr+0x268>  // b.none
  20b380:	cb1c0000 	sub	x0, x0, x28
  20b384:	d2800019 	mov	x25, #0x0                   	// #0
  20b388:	8b000273 	add	x19, x19, x0
  20b38c:	17ffffc0 	b	20b28c <twoway_strstr+0x18c>
  20b390:	eb17033f 	cmp	x25, x23
  20b394:	540001c2 	b.cs	20b3cc <twoway_strstr+0x2cc>  // b.hs, b.nlast
  20b398:	387c6a62 	ldrb	w2, [x19, x28]
  20b39c:	aa1c03e0 	mov	x0, x28
  20b3a0:	387c6aa1 	ldrb	w1, [x21, x28]
  20b3a4:	6b01005f 	cmp	w2, w1
  20b3a8:	540000c0 	b.eq	20b3c0 <twoway_strstr+0x2c0>  // b.none
  20b3ac:	14000011 	b	20b3f0 <twoway_strstr+0x2f0>
  20b3b0:	38606aa2 	ldrb	w2, [x21, x0]
  20b3b4:	38606a61 	ldrb	w1, [x19, x0]
  20b3b8:	6b01005f 	cmp	w2, w1
  20b3bc:	540001a1 	b.ne	20b3f0 <twoway_strstr+0x2f0>  // b.any
  20b3c0:	eb00033f 	cmp	x25, x0
  20b3c4:	d1000400 	sub	x0, x0, #0x1
  20b3c8:	54ffff43 	b.cc	20b3b0 <twoway_strstr+0x2b0>  // b.lo, b.ul, b.last
  20b3cc:	a94263f7 	ldp	x23, x24, [sp, #32]
  20b3d0:	aa1303e0 	mov	x0, x19
  20b3d4:	f9401bf9 	ldr	x25, [sp, #48]
  20b3d8:	a94053f3 	ldp	x19, x20, [sp]
  20b3dc:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20b3e0:	a943effa 	ldp	x26, x27, [sp, #56]
  20b3e4:	a944fbfc 	ldp	x28, x30, [sp, #72]
  20b3e8:	912243ff 	add	sp, sp, #0x890
  20b3ec:	d65f03c0 	ret
  20b3f0:	8b160273 	add	x19, x19, x22
  20b3f4:	f94037f9 	ldr	x25, [sp, #104]
  20b3f8:	17ffffa5 	b	20b28c <twoway_strstr+0x18c>
  20b3fc:	d503201f 	nop
  20b400:	f94033e0 	ldr	x0, [sp, #96]
  20b404:	8b00035a 	add	x26, x26, x0
  20b408:	17ffffa4 	b	20b298 <twoway_strstr+0x198>
  20b40c:	d503201f 	nop
  20b410:	eb06003f 	cmp	x1, x6
  20b414:	54ffed60 	b.eq	20b1c0 <twoway_strstr+0xc0>  // b.none
  20b418:	91000421 	add	x1, x1, #0x1
  20b41c:	17ffff5f 	b	20b198 <twoway_strstr+0x98>
  20b420:	eb16001f 	cmp	x0, x22
  20b424:	54000180 	b.eq	20b454 <twoway_strstr+0x354>  // b.none
  20b428:	91000400 	add	x0, x0, #0x1
  20b42c:	17ffff6f 	b	20b1e8 <twoway_strstr+0xe8>
  20b430:	d2800026 	mov	x6, #0x1                   	// #1
  20b434:	aa0203e4 	mov	x4, x2
  20b438:	aa0603e1 	mov	x1, x6
  20b43c:	8b060042 	add	x2, x2, x6
  20b440:	17ffff56 	b	20b198 <twoway_strstr+0x98>
  20b444:	d503201f 	nop
  20b448:	aa0203fc 	mov	x28, x2
  20b44c:	91000442 	add	x2, x2, #0x1
  20b450:	17ffff66 	b	20b1e8 <twoway_strstr+0xe8>
  20b454:	aa0103e2 	mov	x2, x1
  20b458:	d2800020 	mov	x0, #0x1                   	// #1
  20b45c:	17ffff63 	b	20b1e8 <twoway_strstr+0xe8>
  20b460:	92800004 	mov	x4, #0xffffffffffffffff    	// #-1
  20b464:	d2800026 	mov	x6, #0x1                   	// #1
  20b468:	a90263f7 	stp	x23, x24, [sp, #32]
  20b46c:	aa0403fc 	mov	x28, x4
  20b470:	aa0603f6 	mov	x22, x6
  20b474:	d2800014 	mov	x20, #0x0                   	// #0
  20b478:	f9001bf9 	str	x25, [sp, #48]
  20b47c:	17ffff6c 	b	20b22c <twoway_strstr+0x12c>

000000000020b480 <strstr>:
  20b480:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20b484:	aa0103f3 	mov	x19, x1
  20b488:	aa0003e2 	mov	x2, x0
  20b48c:	39400021 	ldrb	w1, [x1]
  20b490:	35000081 	cbnz	w1, 20b4a0 <strstr+0x20>
  20b494:	aa0203e0 	mov	x0, x2
  20b498:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20b49c:	d65f03c0 	ret
  20b4a0:	94000b4c 	bl	20e1d0 <strchr>
  20b4a4:	aa0003e2 	mov	x2, x0
  20b4a8:	b4ffff60 	cbz	x0, 20b494 <strstr+0x14>
  20b4ac:	39400663 	ldrb	w3, [x19, #1]
  20b4b0:	34ffff23 	cbz	w3, 20b494 <strstr+0x14>
  20b4b4:	39400405 	ldrb	w5, [x0, #1]
  20b4b8:	34000365 	cbz	w5, 20b524 <strstr+0xa4>
  20b4bc:	39400a64 	ldrb	w4, [x19, #2]
  20b4c0:	34000384 	cbz	w4, 20b530 <strstr+0xb0>
  20b4c4:	39400801 	ldrb	w1, [x0, #2]
  20b4c8:	340002e1 	cbz	w1, 20b524 <strstr+0xa4>
  20b4cc:	39400e66 	ldrb	w6, [x19, #3]
  20b4d0:	340004c6 	cbz	w6, 20b568 <strstr+0xe8>
  20b4d4:	39400c01 	ldrb	w1, [x0, #3]
  20b4d8:	34000261 	cbz	w1, 20b524 <strstr+0xa4>
  20b4dc:	39401261 	ldrb	w1, [x19, #4]
  20b4e0:	34000081 	cbz	w1, 20b4f0 <strstr+0x70>
  20b4e4:	aa1303e1 	mov	x1, x19
  20b4e8:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20b4ec:	17ffff05 	b	20b100 <twoway_strstr>
  20b4f0:	b8403440 	ldr	w0, [x2], #3
  20b4f4:	b9400263 	ldr	w3, [x19]
  20b4f8:	5ac00800 	rev	w0, w0
  20b4fc:	5ac00863 	rev	w3, w3
  20b500:	6b03001f 	cmp	w0, w3
  20b504:	540000a1 	b.ne	20b518 <strstr+0x98>  // b.any
  20b508:	1400002a 	b	20b5b0 <strstr+0x130>
  20b50c:	d503201f 	nop
  20b510:	6b00007f 	cmp	w3, w0
  20b514:	540004e0 	b.eq	20b5b0 <strstr+0x130>  // b.none
  20b518:	38401c41 	ldrb	w1, [x2, #1]!
  20b51c:	2a002020 	orr	w0, w1, w0, lsl #8
  20b520:	35ffff81 	cbnz	w1, 20b510 <strstr+0x90>
  20b524:	d2800002 	mov	x2, #0x0                   	// #0
  20b528:	17ffffdb 	b	20b494 <strstr+0x14>
  20b52c:	d503201f 	nop
  20b530:	39400261 	ldrb	w1, [x19]
  20b534:	38401440 	ldrb	w0, [x2], #1
  20b538:	2a012063 	orr	w3, w3, w1, lsl #8
  20b53c:	2a0020a0 	orr	w0, w5, w0, lsl #8
  20b540:	14000006 	b	20b558 <strstr+0xd8>
  20b544:	d503201f 	nop
  20b548:	38401c41 	ldrb	w1, [x2, #1]!
  20b54c:	2a002020 	orr	w0, w1, w0, lsl #8
  20b550:	12003c00 	and	w0, w0, #0xffff
  20b554:	34fffe81 	cbz	w1, 20b524 <strstr+0xa4>
  20b558:	6b00007f 	cmp	w3, w0
  20b55c:	54ffff61 	b.ne	20b548 <strstr+0xc8>  // b.any
  20b560:	d1000442 	sub	x2, x2, #0x1
  20b564:	17ffffcc 	b	20b494 <strstr+0x14>
  20b568:	53103ca0 	lsl	w0, w5, #16
  20b56c:	39400266 	ldrb	w6, [x19]
  20b570:	38402445 	ldrb	w5, [x2], #2
  20b574:	53103c63 	lsl	w3, w3, #16
  20b578:	2a066063 	orr	w3, w3, w6, lsl #24
  20b57c:	2a056000 	orr	w0, w0, w5, lsl #24
  20b580:	2a042064 	orr	w4, w3, w4, lsl #8
  20b584:	2a012000 	orr	w0, w0, w1, lsl #8
  20b588:	14000006 	b	20b5a0 <strstr+0x120>
  20b58c:	d503201f 	nop
  20b590:	38401c41 	ldrb	w1, [x2, #1]!
  20b594:	2a000020 	orr	w0, w1, w0
  20b598:	53185c00 	lsl	w0, w0, #8
  20b59c:	34fffc41 	cbz	w1, 20b524 <strstr+0xa4>
  20b5a0:	6b00009f 	cmp	w4, w0
  20b5a4:	54ffff61 	b.ne	20b590 <strstr+0x110>  // b.any
  20b5a8:	d1000842 	sub	x2, x2, #0x2
  20b5ac:	17ffffba 	b	20b494 <strstr+0x14>
  20b5b0:	d1000c42 	sub	x2, x2, #0x3
  20b5b4:	17ffffb8 	b	20b494 <strstr+0x14>

000000000020b5b8 <__lock>:
  20b5b8:	d0000041 	adrp	x1, 215000 <__data_start__>
  20b5bc:	913ba021 	add	x1, x1, #0xee8
  20b5c0:	b9400c21 	ldr	w1, [x1, #12]
  20b5c4:	34000621 	cbz	w1, 20b688 <__lock+0xd0>
  20b5c8:	320107e2 	mov	w2, #0x80000001            	// #-2147483647
  20b5cc:	14000003 	b	20b5d8 <__lock+0x20>
  20b5d0:	8801fc02 	stlxr	w1, w2, [x0]
  20b5d4:	34000621 	cbz	w1, 20b698 <__lock+0xe0>
  20b5d8:	885ffc01 	ldaxr	w1, [x0]
  20b5dc:	34ffffa1 	cbz	w1, 20b5d0 <__lock+0x18>
  20b5e0:	d5033bbf 	dmb	ish
  20b5e4:	52800144 	mov	w4, #0xa                   	// #10
  20b5e8:	12b00006 	mov	w6, #0x7fffffff            	// #2147483647
  20b5ec:	320107e5 	mov	w5, #0x80000001            	// #-2147483647
  20b5f0:	0b060022 	add	w2, w1, w6
  20b5f4:	7100003f 	cmp	w1, #0x0
  20b5f8:	1a81b041 	csel	w1, w2, w1, lt  // lt = tstop
  20b5fc:	0b050023 	add	w3, w1, w5
  20b600:	14000004 	b	20b610 <__lock+0x58>
  20b604:	d503201f 	nop
  20b608:	8802fc03 	stlxr	w2, w3, [x0]
  20b60c:	34000422 	cbz	w2, 20b690 <__lock+0xd8>
  20b610:	885ffc02 	ldaxr	w2, [x0]
  20b614:	6b02003f 	cmp	w1, w2
  20b618:	54ffff80 	b.eq	20b608 <__lock+0x50>  // b.none
  20b61c:	d5033bbf 	dmb	ish
  20b620:	2a0203e1 	mov	w1, w2
  20b624:	71000484 	subs	w4, w4, #0x1
  20b628:	54fffe41 	b.ne	20b5f0 <__lock+0x38>  // b.any
  20b62c:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  20b630:	a9015bf5 	stp	x21, x22, [sp, #16]
  20b634:	a9027bf7 	stp	x23, x30, [sp, #32]
  20b638:	885ffc14 	ldaxr	w20, [x0]
  20b63c:	11000694 	add	w20, w20, #0x1
  20b640:	8801fc14 	stlxr	w1, w20, [x0]
  20b644:	35ffffa1 	cbnz	w1, 20b638 <__lock+0x80>
  20b648:	aa0003f3 	mov	x19, x0
  20b64c:	12b00017 	mov	w23, #0x7fffffff            	// #2147483647
  20b650:	52b00015 	mov	w21, #0x80000000            	// #-2147483648
  20b654:	37f80274 	tbnz	w20, #31, 20b6a0 <__lock+0xe8>
  20b658:	0b150281 	add	w1, w20, w21
  20b65c:	14000003 	b	20b668 <__lock+0xb0>
  20b660:	8800fe61 	stlxr	w0, w1, [x19]
  20b664:	34000520 	cbz	w0, 20b708 <__lock+0x150>
  20b668:	885ffe60 	ldaxr	w0, [x19]
  20b66c:	6b00029f 	cmp	w20, w0
  20b670:	54ffff80 	b.eq	20b660 <__lock+0xa8>  // b.none
  20b674:	d5033bbf 	dmb	ish
  20b678:	2a0003f4 	mov	w20, w0
  20b67c:	36fffef4 	tbz	w20, #31, 20b658 <__lock+0xa0>
  20b680:	14000008 	b	20b6a0 <__lock+0xe8>
  20b684:	d503201f 	nop
  20b688:	d65f03c0 	ret
  20b68c:	d503201f 	nop
  20b690:	d65f03c0 	ret
  20b694:	d503201f 	nop
  20b698:	d65f03c0 	ret
  20b69c:	d503201f 	nop
  20b6a0:	d2801e00 	mov	x0, #0xf0                  	// #240
  20b6a4:	93407e96 	sxtw	x22, w20
  20b6a8:	97ffeb16 	bl	206300 <get_rtt_syscall>
  20b6ac:	aa0003e4 	mov	x4, x0
  20b6b0:	b4000100 	cbz	x0, 20b6d0 <__lock+0x118>
  20b6b4:	d2800003 	mov	x3, #0x0                   	// #0
  20b6b8:	aa1603e2 	mov	x2, x22
  20b6bc:	d2801001 	mov	x1, #0x80                  	// #128
  20b6c0:	aa1303e0 	mov	x0, x19
  20b6c4:	d63f0080 	blr	x4
  20b6c8:	b100981f 	cmn	x0, #0x26
  20b6cc:	54000060 	b.eq	20b6d8 <__lock+0x120>  // b.none
  20b6d0:	0b170294 	add	w20, w20, w23
  20b6d4:	17ffffe1 	b	20b658 <__lock+0xa0>
  20b6d8:	d2801e00 	mov	x0, #0xf0                  	// #240
  20b6dc:	97ffeb09 	bl	206300 <get_rtt_syscall>
  20b6e0:	aa0003e4 	mov	x4, x0
  20b6e4:	b4ffff60 	cbz	x0, 20b6d0 <__lock+0x118>
  20b6e8:	d2800003 	mov	x3, #0x0                   	// #0
  20b6ec:	aa1603e2 	mov	x2, x22
  20b6f0:	d2800001 	mov	x1, #0x0                   	// #0
  20b6f4:	aa1303e0 	mov	x0, x19
  20b6f8:	0b170294 	add	w20, w20, w23
  20b6fc:	d63f0080 	blr	x4
  20b700:	17ffffd6 	b	20b658 <__lock+0xa0>
  20b704:	d503201f 	nop
  20b708:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20b70c:	a9427bf7 	ldp	x23, x30, [sp, #32]
  20b710:	a8c353f3 	ldp	x19, x20, [sp], #48
  20b714:	d65f03c0 	ret

000000000020b718 <__unlock>:
  20b718:	b9400001 	ldr	w1, [x0]
  20b71c:	37f80061 	tbnz	w1, #31, 20b728 <__unlock+0x10>
  20b720:	d65f03c0 	ret
  20b724:	d503201f 	nop
  20b728:	12b00004 	mov	w4, #0x7fffffff            	// #2147483647
  20b72c:	885ffc02 	ldaxr	w2, [x0]
  20b730:	0b040041 	add	w1, w2, w4
  20b734:	8803fc01 	stlxr	w3, w1, [x0]
  20b738:	35ffffa3 	cbnz	w3, 20b72c <__unlock+0x14>
  20b73c:	320107e1 	mov	w1, #0x80000001            	// #-2147483647
  20b740:	6b01005f 	cmp	w2, w1
  20b744:	54fffee0 	b.eq	20b720 <__unlock+0x8>  // b.none
  20b748:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20b74c:	aa0003f3 	mov	x19, x0
  20b750:	d2801e00 	mov	x0, #0xf0                  	// #240
  20b754:	97ffeaeb 	bl	206300 <get_rtt_syscall>
  20b758:	aa0003e3 	mov	x3, x0
  20b75c:	b40000e0 	cbz	x0, 20b778 <__unlock+0x60>
  20b760:	d2800022 	mov	x2, #0x1                   	// #1
  20b764:	d2801021 	mov	x1, #0x81                  	// #129
  20b768:	aa1303e0 	mov	x0, x19
  20b76c:	d63f0060 	blr	x3
  20b770:	b100981f 	cmn	x0, #0x26
  20b774:	54000060 	b.eq	20b780 <__unlock+0x68>  // b.none
  20b778:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20b77c:	d65f03c0 	ret
  20b780:	d2801e00 	mov	x0, #0xf0                  	// #240
  20b784:	97ffeadf 	bl	206300 <get_rtt_syscall>
  20b788:	aa0003e3 	mov	x3, x0
  20b78c:	b4ffff60 	cbz	x0, 20b778 <__unlock+0x60>
  20b790:	aa1303e0 	mov	x0, x19
  20b794:	d2800022 	mov	x2, #0x1                   	// #1
  20b798:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20b79c:	aa0203e1 	mov	x1, x2
  20b7a0:	d61f0060 	br	x3
  20b7a4:	00000000 	.inst	0x00000000 ; undefined

000000000020b7a8 <__syscall_cp_c>:
  20b7a8:	17ffe03c 	b	203898 <__syscall>
  20b7ac:	00000000 	.inst	0x00000000 ; undefined

000000000020b7b0 <__syscall_cp>:
  20b7b0:	17ffe03a 	b	203898 <__syscall>
  20b7b4:	00000000 	.inst	0x00000000 ; undefined

000000000020b7b8 <__wait>:
  20b7b8:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  20b7bc:	7100007f 	cmp	w3, #0x0
  20b7c0:	52801004 	mov	w4, #0x80                  	// #128
  20b7c4:	aa0103f3 	mov	x19, x1
  20b7c8:	f9000bf5 	str	x21, [sp, #16]
  20b7cc:	1a840063 	csel	w3, w3, w4, eq  // eq = none
  20b7d0:	2a0203f5 	mov	w21, w2
  20b7d4:	aa0003f4 	mov	x20, x0
  20b7d8:	f90017fe 	str	x30, [sp, #40]
  20b7dc:	52800c80 	mov	w0, #0x64                  	// #100
  20b7e0:	b4000073 	cbz	x19, 20b7ec <__wait+0x34>
  20b7e4:	b9400261 	ldr	w1, [x19]
  20b7e8:	350003c1 	cbnz	w1, 20b860 <__wait+0xa8>
  20b7ec:	b9400281 	ldr	w1, [x20]
  20b7f0:	6b15003f 	cmp	w1, w21
  20b7f4:	540002c1 	b.ne	20b84c <__wait+0x94>  // b.any
  20b7f8:	d5033bbf 	dmb	ish
  20b7fc:	71000400 	subs	w0, w0, #0x1
  20b800:	54ffff01 	b.ne	20b7e0 <__wait+0x28>  // b.any
  20b804:	a901dff6 	stp	x22, x23, [sp, #24]
  20b808:	b50002f3 	cbnz	x19, 20b864 <__wait+0xac>
  20b80c:	93407eb7 	sxtw	x23, w21
  20b810:	93407c76 	sxtw	x22, w3
  20b814:	14000004 	b	20b824 <__wait+0x6c>
  20b818:	97ffeaba 	bl	206300 <get_rtt_syscall>
  20b81c:	aa0003e4 	mov	x4, x0
  20b820:	b50002c0 	cbnz	x0, 20b878 <__wait+0xc0>
  20b824:	b9400281 	ldr	w1, [x20]
  20b828:	d2801e00 	mov	x0, #0xf0                  	// #240
  20b82c:	6b15003f 	cmp	w1, w21
  20b830:	54ffff40 	b.eq	20b818 <__wait+0x60>  // b.none
  20b834:	b40000b3 	cbz	x19, 20b848 <__wait+0x90>
  20b838:	885ffe60 	ldaxr	w0, [x19]
  20b83c:	51000400 	sub	w0, w0, #0x1
  20b840:	8801fe60 	stlxr	w1, w0, [x19]
  20b844:	35ffffa1 	cbnz	w1, 20b838 <__wait+0x80>
  20b848:	a941dff6 	ldp	x22, x23, [sp, #24]
  20b84c:	f9400bf5 	ldr	x21, [sp, #16]
  20b850:	f94017fe 	ldr	x30, [sp, #40]
  20b854:	a8c353f3 	ldp	x19, x20, [sp], #48
  20b858:	d65f03c0 	ret
  20b85c:	d503201f 	nop
  20b860:	a901dff6 	stp	x22, x23, [sp, #24]
  20b864:	885ffe60 	ldaxr	w0, [x19]
  20b868:	11000400 	add	w0, w0, #0x1
  20b86c:	8801fe60 	stlxr	w1, w0, [x19]
  20b870:	35ffffa1 	cbnz	w1, 20b864 <__wait+0xac>
  20b874:	17ffffe6 	b	20b80c <__wait+0x54>
  20b878:	d2800003 	mov	x3, #0x0                   	// #0
  20b87c:	aa1703e2 	mov	x2, x23
  20b880:	aa1603e1 	mov	x1, x22
  20b884:	aa1403e0 	mov	x0, x20
  20b888:	d63f0080 	blr	x4
  20b88c:	b100981f 	cmn	x0, #0x26
  20b890:	54fffca1 	b.ne	20b824 <__wait+0x6c>  // b.any
  20b894:	d2801e00 	mov	x0, #0xf0                  	// #240
  20b898:	97ffea9a 	bl	206300 <get_rtt_syscall>
  20b89c:	aa0003e4 	mov	x4, x0
  20b8a0:	b4fffc20 	cbz	x0, 20b824 <__wait+0x6c>
  20b8a4:	d2800003 	mov	x3, #0x0                   	// #0
  20b8a8:	aa1703e2 	mov	x2, x23
  20b8ac:	d2800001 	mov	x1, #0x0                   	// #0
  20b8b0:	aa1403e0 	mov	x0, x20
  20b8b4:	d63f0080 	blr	x4
  20b8b8:	17ffffdb 	b	20b824 <__wait+0x6c>
  20b8bc:	00000000 	.inst	0x00000000 ; undefined

000000000020b8c0 <__wake.constprop.2>:
  20b8c0:	7100003f 	cmp	w1, #0x0
  20b8c4:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20b8c8:	d2801021 	mov	x1, #0x81                  	// #129
  20b8cc:	d2800034 	mov	x20, #0x1                   	// #1
  20b8d0:	a9017bf5 	stp	x21, x30, [sp, #16]
  20b8d4:	9a810293 	csel	x19, x20, x1, eq  // eq = none
  20b8d8:	aa0003f5 	mov	x21, x0
  20b8dc:	d2801e00 	mov	x0, #0xf0                  	// #240
  20b8e0:	97ffea88 	bl	206300 <get_rtt_syscall>
  20b8e4:	b4000100 	cbz	x0, 20b904 <__wake.constprop.2+0x44>
  20b8e8:	aa0003e3 	mov	x3, x0
  20b8ec:	aa1403e2 	mov	x2, x20
  20b8f0:	aa1303e1 	mov	x1, x19
  20b8f4:	aa1503e0 	mov	x0, x21
  20b8f8:	d63f0060 	blr	x3
  20b8fc:	b100981f 	cmn	x0, #0x26
  20b900:	54000080 	b.eq	20b910 <__wake.constprop.2+0x50>  // b.none
  20b904:	a9417bf5 	ldp	x21, x30, [sp, #16]
  20b908:	a8c253f3 	ldp	x19, x20, [sp], #32
  20b90c:	d65f03c0 	ret
  20b910:	d2801e00 	mov	x0, #0xf0                  	// #240
  20b914:	97ffea7b 	bl	206300 <get_rtt_syscall>
  20b918:	aa0003e3 	mov	x3, x0
  20b91c:	b4ffff40 	cbz	x0, 20b904 <__wake.constprop.2+0x44>
  20b920:	aa1403e2 	mov	x2, x20
  20b924:	aa1403e1 	mov	x1, x20
  20b928:	aa1503e0 	mov	x0, x21
  20b92c:	a9417bf5 	ldp	x21, x30, [sp, #16]
  20b930:	a8c253f3 	ldp	x19, x20, [sp], #32
  20b934:	d61f0060 	br	x3

000000000020b938 <__acquire_ptc>:
  20b938:	d65f03c0 	ret
  20b93c:	00000000 	.inst	0x00000000 ; undefined

000000000020b940 <__tl_lock>:
  20b940:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20b944:	d0000053 	adrp	x19, 215000 <__data_start__>
  20b948:	d53bd040 	mrs	x0, tpidr_el0
  20b94c:	b94f6661 	ldr	w1, [x19, #3940]
  20b950:	f9000ffe 	str	x30, [sp, #24]
  20b954:	b8558014 	ldur	w20, [x0, #-168]
  20b958:	6b01029f 	cmp	w20, w1
  20b95c:	540002a0 	b.eq	20b9b0 <__tl_lock+0x70>  // b.none
  20b960:	f9000bf5 	str	x21, [sp, #16]
  20b964:	913d9273 	add	x19, x19, #0xf64
  20b968:	d0000055 	adrp	x21, 215000 <__data_start__>
  20b96c:	9133b2b5 	add	x21, x21, #0xcec
  20b970:	14000004 	b	20b980 <__tl_lock+0x40>
  20b974:	d503201f 	nop
  20b978:	8800fe74 	stlxr	w0, w20, [x19]
  20b97c:	34000120 	cbz	w0, 20b9a0 <__tl_lock+0x60>
  20b980:	885ffe62 	ldaxr	w2, [x19]
  20b984:	34ffffa2 	cbz	w2, 20b978 <__tl_lock+0x38>
  20b988:	d5033bbf 	dmb	ish
  20b98c:	52800003 	mov	w3, #0x0                   	// #0
  20b990:	aa1503e1 	mov	x1, x21
  20b994:	aa1303e0 	mov	x0, x19
  20b998:	97ffff88 	bl	20b7b8 <__wait>
  20b99c:	17fffff9 	b	20b980 <__tl_lock+0x40>
  20b9a0:	f9400bf5 	ldr	x21, [sp, #16]
  20b9a4:	f9400ffe 	ldr	x30, [sp, #24]
  20b9a8:	a8c253f3 	ldp	x19, x20, [sp], #32
  20b9ac:	d65f03c0 	ret
  20b9b0:	d0000041 	adrp	x1, 215000 <__data_start__>
  20b9b4:	f9400ffe 	ldr	x30, [sp, #24]
  20b9b8:	a8c253f3 	ldp	x19, x20, [sp], #32
  20b9bc:	b94ce820 	ldr	w0, [x1, #3304]
  20b9c0:	11000400 	add	w0, w0, #0x1
  20b9c4:	b90ce820 	str	w0, [x1, #3304]
  20b9c8:	d65f03c0 	ret
  20b9cc:	00000000 	.inst	0x00000000 ; undefined

000000000020b9d0 <__tl_unlock>:
  20b9d0:	d0000041 	adrp	x1, 215000 <__data_start__>
  20b9d4:	b94ce820 	ldr	w0, [x1, #3304]
  20b9d8:	35000180 	cbnz	w0, 20ba08 <__tl_unlock+0x38>
  20b9dc:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20b9e0:	d5033bbf 	dmb	ish
  20b9e4:	d0000040 	adrp	x0, 215000 <__data_start__>
  20b9e8:	913d9013 	add	x19, x0, #0xf64
  20b9ec:	b90f641f 	str	wzr, [x0, #3940]
  20b9f0:	d5033bbf 	dmb	ish
  20b9f4:	d0000040 	adrp	x0, 215000 <__data_start__>
  20b9f8:	b94cec00 	ldr	w0, [x0, #3308]
  20b9fc:	350000e0 	cbnz	w0, 20ba18 <__tl_unlock+0x48>
  20ba00:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20ba04:	d65f03c0 	ret
  20ba08:	51000400 	sub	w0, w0, #0x1
  20ba0c:	b90ce820 	str	w0, [x1, #3304]
  20ba10:	d65f03c0 	ret
  20ba14:	d503201f 	nop
  20ba18:	d2801e00 	mov	x0, #0xf0                  	// #240
  20ba1c:	97ffea39 	bl	206300 <get_rtt_syscall>
  20ba20:	aa0003e3 	mov	x3, x0
  20ba24:	b4fffee0 	cbz	x0, 20ba00 <__tl_unlock+0x30>
  20ba28:	d2800022 	mov	x2, #0x1                   	// #1
  20ba2c:	aa1303e0 	mov	x0, x19
  20ba30:	aa0203e1 	mov	x1, x2
  20ba34:	d63f0060 	blr	x3
  20ba38:	b100981f 	cmn	x0, #0x26
  20ba3c:	54fffe21 	b.ne	20ba00 <__tl_unlock+0x30>  // b.any
  20ba40:	d2801e00 	mov	x0, #0xf0                  	// #240
  20ba44:	97ffea2f 	bl	206300 <get_rtt_syscall>
  20ba48:	aa0003e3 	mov	x3, x0
  20ba4c:	b4fffda0 	cbz	x0, 20ba00 <__tl_unlock+0x30>
  20ba50:	aa1303e0 	mov	x0, x19
  20ba54:	d2800022 	mov	x2, #0x1                   	// #1
  20ba58:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20ba5c:	aa0203e1 	mov	x1, x2
  20ba60:	d61f0060 	br	x3
  20ba64:	00000000 	.inst	0x00000000 ; undefined

000000000020ba68 <__tl_sync>:
  20ba68:	d5033bbf 	dmb	ish
  20ba6c:	d0000040 	adrp	x0, 215000 <__data_start__>
  20ba70:	b94f6402 	ldr	w2, [x0, #3940]
  20ba74:	35000062 	cbnz	w2, 20ba80 <__tl_sync+0x18>
  20ba78:	d65f03c0 	ret
  20ba7c:	d503201f 	nop
  20ba80:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20ba84:	d0000054 	adrp	x20, 215000 <__data_start__>
  20ba88:	913d9013 	add	x19, x0, #0xf64
  20ba8c:	52800003 	mov	w3, #0x0                   	// #0
  20ba90:	aa1303e0 	mov	x0, x19
  20ba94:	9133b281 	add	x1, x20, #0xcec
  20ba98:	f9000bfe 	str	x30, [sp, #16]
  20ba9c:	97ffff47 	bl	20b7b8 <__wait>
  20baa0:	b94cee80 	ldr	w0, [x20, #3308]
  20baa4:	350000a0 	cbnz	w0, 20bab8 <__tl_sync+0x50>
  20baa8:	f9400bfe 	ldr	x30, [sp, #16]
  20baac:	a8c253f3 	ldp	x19, x20, [sp], #32
  20bab0:	d65f03c0 	ret
  20bab4:	d503201f 	nop
  20bab8:	d2801e00 	mov	x0, #0xf0                  	// #240
  20babc:	97ffea11 	bl	206300 <get_rtt_syscall>
  20bac0:	aa0003e3 	mov	x3, x0
  20bac4:	b4ffff20 	cbz	x0, 20baa8 <__tl_sync+0x40>
  20bac8:	d2800022 	mov	x2, #0x1                   	// #1
  20bacc:	aa1303e0 	mov	x0, x19
  20bad0:	aa0203e1 	mov	x1, x2
  20bad4:	d63f0060 	blr	x3
  20bad8:	b100981f 	cmn	x0, #0x26
  20badc:	54fffe61 	b.ne	20baa8 <__tl_sync+0x40>  // b.any
  20bae0:	d2801e00 	mov	x0, #0xf0                  	// #240
  20bae4:	97ffea07 	bl	206300 <get_rtt_syscall>
  20bae8:	aa0003e3 	mov	x3, x0
  20baec:	b4fffde0 	cbz	x0, 20baa8 <__tl_sync+0x40>
  20baf0:	aa1303e0 	mov	x0, x19
  20baf4:	f9400bfe 	ldr	x30, [sp, #16]
  20baf8:	a8c253f3 	ldp	x19, x20, [sp], #32
  20bafc:	d2800022 	mov	x2, #0x1                   	// #1
  20bb00:	aa0203e1 	mov	x1, x2
  20bb04:	d61f0060 	br	x3

000000000020bb08 <__pthread_exit>:
  20bb08:	a9b553f3 	stp	x19, x20, [sp, #-176]!
  20bb0c:	52800022 	mov	w2, #0x1                   	// #1
  20bb10:	d53bd054 	mrs	x20, tpidr_el0
  20bb14:	f9000bf5 	str	x21, [sp, #16]
  20bb18:	d1038293 	sub	x19, x20, #0xe0
  20bb1c:	f90017fe 	str	x30, [sp, #40]
  20bb20:	38168282 	sturb	w2, [x20, #-152]
  20bb24:	f85a0281 	ldur	x1, [x20, #-96]
  20bb28:	3816929f 	sturb	wzr, [x20, #-151]
  20bb2c:	f8198280 	stur	x0, [x20, #-104]
  20bb30:	b40000e1 	cbz	x1, 20bb4c <__pthread_exit+0x44>
  20bb34:	a9400022 	ldp	x2, x0, [x1]
  20bb38:	f9400823 	ldr	x3, [x1, #16]
  20bb3c:	f9004263 	str	x3, [x19, #128]
  20bb40:	d63f0040 	blr	x2
  20bb44:	f9404261 	ldr	x1, [x19, #128]
  20bb48:	b5ffff61 	cbnz	x1, 20bb34 <__pthread_exit+0x2c>
  20bb4c:	97ffff7b 	bl	20b938 <__acquire_ptc>
  20bb50:	9102e275 	add	x21, x19, #0xb8
  20bb54:	aa1503e0 	mov	x0, x21
  20bb58:	97fffe98 	bl	20b5b8 <__lock>
  20bb5c:	9100c3e0 	add	x0, sp, #0x30
  20bb60:	94000632 	bl	20d428 <__block_app_sigs>
  20bb64:	97ffff77 	bl	20b940 <__tl_lock>
  20bb68:	f8538281 	ldur	x1, [x20, #-200]
  20bb6c:	a901dff6 	stp	x22, x23, [sp, #24]
  20bb70:	eb13003f 	cmp	x1, x19
  20bb74:	54000800 	b.eq	20bc74 <__pthread_exit+0x16c>  // b.none
  20bb78:	f8530282 	ldur	x2, [x20, #-208]
  20bb7c:	d0000040 	adrp	x0, 215000 <__data_start__>
  20bb80:	f9000822 	str	x2, [x1, #16]
  20bb84:	913ba000 	add	x0, x0, #0xee8
  20bb88:	91024277 	add	x23, x19, #0x90
  20bb8c:	52a80016 	mov	w22, #0x40000000            	// #1073741824
  20bb90:	f8530283 	ldur	x3, [x20, #-208]
  20bb94:	b9400c02 	ldr	w2, [x0, #12]
  20bb98:	51000442 	sub	w2, w2, #0x1
  20bb9c:	b9000c02 	str	w2, [x0, #12]
  20bba0:	f9000c61 	str	x1, [x3, #24]
  20bba4:	a9334e93 	stp	x19, x19, [x20, #-208]
  20bba8:	94000258 	bl	20c508 <__vm_lock>
  20bbac:	f9404a61 	ldr	x1, [x19, #144]
  20bbb0:	b40002a1 	cbz	x1, 20bc04 <__pthread_exit+0xfc>
  20bbb4:	eb17003f 	cmp	x1, x23
  20bbb8:	54000260 	b.eq	20bc04 <__pthread_exit+0xfc>  // b.none
  20bbbc:	b85e0022 	ldur	w2, [x1, #-32]
  20bbc0:	d1007020 	sub	x0, x1, #0x1c
  20bbc4:	b85e8023 	ldur	w3, [x1, #-24]
  20bbc8:	f9005261 	str	x1, [x19, #160]
  20bbcc:	f9400021 	ldr	x1, [x1]
  20bbd0:	f9004a61 	str	x1, [x19, #144]
  20bbd4:	885ffc01 	ldaxr	w1, [x0]
  20bbd8:	8804fc16 	stlxr	w4, w22, [x0]
  20bbdc:	35ffffc4 	cbnz	w4, 20bbd4 <__pthread_exit+0xcc>
  20bbe0:	f900527f 	str	xzr, [x19, #160]
  20bbe4:	7100003f 	cmp	w1, #0x0
  20bbe8:	7a40a860 	ccmp	w3, #0x0, #0x0, ge  // ge = tcont
  20bbec:	54fffe00 	b.eq	20bbac <__pthread_exit+0xa4>  // b.none
  20bbf0:	2a2203e1 	mvn	w1, w2
  20bbf4:	12190021 	and	w1, w1, #0x80
  20bbf8:	97ffff32 	bl	20b8c0 <__wake.constprop.2>
  20bbfc:	f9404a61 	ldr	x1, [x19, #144]
  20bc00:	b5fffda1 	cbnz	x1, 20bbb4 <__pthread_exit+0xac>
  20bc04:	94000249 	bl	20c528 <__vm_unlock>
  20bc08:	91010273 	add	x19, x19, #0x40
  20bc0c:	97ffff4b 	bl	20b938 <__acquire_ptc>
  20bc10:	97ffff4a 	bl	20b938 <__acquire_ptc>
  20bc14:	52800001 	mov	w1, #0x0                   	// #0
  20bc18:	14000004 	b	20bc28 <__pthread_exit+0x120>
  20bc1c:	d503201f 	nop
  20bc20:	8800fe61 	stlxr	w0, w1, [x19]
  20bc24:	340000e0 	cbz	w0, 20bc40 <__pthread_exit+0x138>
  20bc28:	885ffe60 	ldaxr	w0, [x19]
  20bc2c:	7100041f 	cmp	w0, #0x1
  20bc30:	54ffff80 	b.eq	20bc20 <__pthread_exit+0x118>  // b.none
  20bc34:	d5033bbf 	dmb	ish
  20bc38:	7100081f 	cmp	w0, #0x2
  20bc3c:	540002a0 	b.eq	20bc90 <__pthread_exit+0x188>  // b.none
  20bc40:	aa1303e0 	mov	x0, x19
  20bc44:	52800021 	mov	w1, #0x1                   	// #1
  20bc48:	97ffff1e 	bl	20b8c0 <__wake.constprop.2>
  20bc4c:	b815829f 	stur	wzr, [x20, #-168]
  20bc50:	aa1503e0 	mov	x0, x21
  20bc54:	97fffeb1 	bl	20b718 <__unlock>
  20bc58:	d2800020 	mov	x0, #0x1                   	// #1
  20bc5c:	97ffe9a9 	bl	206300 <get_rtt_syscall>
  20bc60:	aa0003e1 	mov	x1, x0
  20bc64:	b4ffffa0 	cbz	x0, 20bc58 <__pthread_exit+0x150>
  20bc68:	d2800000 	mov	x0, #0x0                   	// #0
  20bc6c:	d63f0020 	blr	x1
  20bc70:	17fffffa 	b	20bc58 <__pthread_exit+0x150>
  20bc74:	97ffff57 	bl	20b9d0 <__tl_unlock>
  20bc78:	9100c3e0 	add	x0, sp, #0x30
  20bc7c:	940005ff 	bl	20d478 <__restore_sigs>
  20bc80:	aa1503e0 	mov	x0, x21
  20bc84:	97fffea5 	bl	20b718 <__unlock>
  20bc88:	52800000 	mov	w0, #0x0                   	// #0
  20bc8c:	97ffde5b 	bl	2035f8 <exit>
  20bc90:	f8570280 	ldur	x0, [x20, #-144]
  20bc94:	b4fffd60 	cbz	x0, 20bc40 <__pthread_exit+0x138>
  20bc98:	9100c3e0 	add	x0, sp, #0x30
  20bc9c:	940005cf 	bl	20d3d8 <__block_all_sigs>
  20bca0:	f85b8280 	ldur	x0, [x20, #-72]
  20bca4:	b50000a0 	cbnz	x0, 20bcb8 <__pthread_exit+0x1b0>
  20bca8:	94000208 	bl	20c4c8 <__vm_wait>
  20bcac:	a9770680 	ldp	x0, x1, [x20, #-144]
  20bcb0:	9400098f 	bl	20e2ec <__unmapself>
  20bcb4:	17ffffe3 	b	20bc40 <__pthread_exit+0x138>
  20bcb8:	d2802a40 	mov	x0, #0x152                 	// #338
  20bcbc:	97ffe991 	bl	206300 <get_rtt_syscall>
  20bcc0:	aa0003e2 	mov	x2, x0
  20bcc4:	b4ffff20 	cbz	x0, 20bca8 <__pthread_exit+0x1a0>
  20bcc8:	d2800301 	mov	x1, #0x18                  	// #24
  20bccc:	d2800000 	mov	x0, #0x0                   	// #0
  20bcd0:	d63f0040 	blr	x2
  20bcd4:	17fffff5 	b	20bca8 <__pthread_exit+0x1a0>

000000000020bcd8 <start>:
  20bcd8:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  20bcdc:	aa0003f4 	mov	x20, x0
  20bce0:	a9015bf5 	stp	x21, x22, [sp, #16]
  20bce4:	a9027bf7 	stp	x23, x30, [sp, #32]
  20bce8:	f9400802 	ldr	x2, [x0, #16]
  20bcec:	b40002a2 	cbz	x2, 20bd40 <start+0x68>
  20bcf0:	d53bd055 	mrs	x21, tpidr_el0
  20bcf4:	91009053 	add	x19, x2, #0x24
  20bcf8:	d2801380 	mov	x0, #0x9c                  	// #156
  20bcfc:	b9802057 	ldrsw	x23, [x2, #32]
  20bd00:	b89582b6 	ldursw	x22, [x21, #-168]
  20bd04:	97ffe97f 	bl	206300 <get_rtt_syscall>
  20bd08:	aa0003e3 	mov	x3, x0
  20bd0c:	b4000460 	cbz	x0, 20bd98 <start+0xc0>
  20bd10:	aa1303e2 	mov	x2, x19
  20bd14:	aa1703e1 	mov	x1, x23
  20bd18:	aa1603e0 	mov	x0, x22
  20bd1c:	d63f0060 	blr	x3
  20bd20:	f9400e81 	ldr	x1, [x20, #24]
  20bd24:	4b0003f3 	neg	w19, w0
  20bd28:	885ffc22 	ldaxr	w2, [x1]
  20bd2c:	8800fc33 	stlxr	w0, w19, [x1]
  20bd30:	35ffffc0 	cbnz	w0, 20bd28 <start+0x50>
  20bd34:	3100085f 	cmn	w2, #0x2
  20bd38:	54000260 	b.eq	20bd84 <start+0xac>  // b.none
  20bd3c:	350001d3 	cbnz	w19, 20bd74 <start+0x9c>
  20bd40:	d28015e0 	mov	x0, #0xaf                  	// #175
  20bd44:	91008293 	add	x19, x20, #0x20
  20bd48:	97ffe96e 	bl	206300 <get_rtt_syscall>
  20bd4c:	aa0003e4 	mov	x4, x0
  20bd50:	b40000c0 	cbz	x0, 20bd68 <start+0x90>
  20bd54:	d2800103 	mov	x3, #0x8                   	// #8
  20bd58:	d2800002 	mov	x2, #0x0                   	// #0
  20bd5c:	aa1303e1 	mov	x1, x19
  20bd60:	d2800040 	mov	x0, #0x2                   	// #2
  20bd64:	d63f0080 	blr	x4
  20bd68:	a9400281 	ldp	x1, x0, [x20]
  20bd6c:	d63f0020 	blr	x1
  20bd70:	97ffff66 	bl	20bb08 <__pthread_exit>
  20bd74:	52800040 	mov	w0, #0x2                   	// #2
  20bd78:	b81602a0 	stur	w0, [x21, #-160]
  20bd7c:	d2800000 	mov	x0, #0x0                   	// #0
  20bd80:	97ffff62 	bl	20bb08 <__pthread_exit>
  20bd84:	f9400e80 	ldr	x0, [x20, #24]
  20bd88:	52800021 	mov	w1, #0x1                   	// #1
  20bd8c:	97fffecd 	bl	20b8c0 <__wake.constprop.2>
  20bd90:	34fffd93 	cbz	w19, 20bd40 <start+0x68>
  20bd94:	17fffff8 	b	20bd74 <start+0x9c>
  20bd98:	d2800000 	mov	x0, #0x0                   	// #0
  20bd9c:	17ffffe1 	b	20bd20 <start+0x48>

000000000020bda0 <start_c11>:
  20bda0:	f81f0ffe 	str	x30, [sp, #-16]!
  20bda4:	a9400001 	ldp	x1, x0, [x0]
  20bda8:	d63f0020 	blr	x1
  20bdac:	93407c00 	sxtw	x0, w0
  20bdb0:	97ffff56 	bl	20bb08 <__pthread_exit>
  20bdb4:	00000000 	.inst	0x00000000 ; undefined

000000000020bdb8 <__do_cleanup_push>:
  20bdb8:	d53bd041 	mrs	x1, tpidr_el0
  20bdbc:	f85a0022 	ldur	x2, [x1, #-96]
  20bdc0:	f9000802 	str	x2, [x0, #16]
  20bdc4:	f81a0020 	stur	x0, [x1, #-96]
  20bdc8:	d65f03c0 	ret
  20bdcc:	00000000 	.inst	0x00000000 ; undefined

000000000020bdd0 <__do_cleanup_pop>:
  20bdd0:	f9400801 	ldr	x1, [x0, #16]
  20bdd4:	d53bd040 	mrs	x0, tpidr_el0
  20bdd8:	f81a0001 	stur	x1, [x0, #-96]
  20bddc:	d65f03c0 	ret

000000000020bde0 <__pthread_create>:
  20bde0:	a9ab53f3 	stp	x19, x20, [sp, #-336]!
  20bde4:	12800005 	mov	w5, #0xffffffff            	// #-1
  20bde8:	f9000bf5 	str	x21, [sp, #16]
  20bdec:	d0000055 	adrp	x21, 215000 <__data_start__>
  20bdf0:	a909ffff 	stp	xzr, xzr, [sp, #152]
  20bdf4:	b94eeaa4 	ldr	w4, [x21, #3816]
  20bdf8:	a90affff 	stp	xzr, xzr, [sp, #168]
  20bdfc:	a90bffff 	stp	xzr, xzr, [sp, #184]
  20be00:	f9002bfe 	str	x30, [sp, #80]
  20be04:	b9008fe5 	str	w5, [sp, #140]
  20be08:	f90067ff 	str	xzr, [sp, #200]
  20be0c:	34002024 	cbz	w4, 20c210 <__pthread_create+0x430>
  20be10:	913ba2a5 	add	x5, x21, #0xee8
  20be14:	f9003be0 	str	x0, [sp, #112]
  20be18:	a901dff6 	stp	x22, x23, [sp, #24]
  20be1c:	aa0103f6 	mov	x22, x1
  20be20:	a902e7f8 	stp	x24, x25, [sp, #40]
  20be24:	b94004a0 	ldr	w0, [x5, #4]
  20be28:	a903effa 	stp	x26, x27, [sp, #56]
  20be2c:	f90027fc 	str	x28, [sp, #72]
  20be30:	a9060fe2 	stp	x2, x3, [sp, #96]
  20be34:	d53bd058 	mrs	x24, tpidr_el0
  20be38:	34001880 	cbz	w0, 20c148 <__pthread_create+0x368>
  20be3c:	d10006c0 	sub	x0, x22, #0x1
  20be40:	b1000c1f 	cmn	x0, #0x3
  20be44:	54001129 	b.ls	20c068 <__pthread_create+0x288>  // b.plast
  20be48:	97fffebc 	bl	20b938 <__acquire_ptc>
  20be4c:	f94057f7 	ldr	x23, [sp, #168]
  20be50:	d0000041 	adrp	x1, 215000 <__data_start__>
  20be54:	d0000040 	adrp	x0, 215000 <__data_start__>
  20be58:	913ba2a9 	add	x9, x21, #0xee8
  20be5c:	b941ec3b 	ldr	w27, [x1, #492]
  20be60:	b941e800 	ldr	w0, [x0, #488]
  20be64:	a90983fb 	stp	x27, x0, [sp, #152]
  20be68:	f9401123 	ldr	x3, [x9, #32]
  20be6c:	b40011b7 	cbz	x23, 20c0a0 <__pthread_create+0x2c0>
  20be70:	d0000053 	adrp	x19, 215000 <__data_start__>
  20be74:	d343ff60 	lsr	x0, x27, #3
  20be78:	927ceefa 	and	x26, x23, #0xfffffffffffffff0
  20be7c:	cb1b02f7 	sub	x23, x23, x27
  20be80:	f9466a62 	ldr	x2, [x19, #3280]
  20be84:	8b030042 	add	x2, x2, x3
  20be88:	f11ffc5f 	cmp	x2, #0x7ff
  20be8c:	fa429000 	ccmp	x0, x2, #0x0, ls  // ls = plast
  20be90:	540022c8 	b.hi	20c2e8 <__pthread_create+0x508>  // b.pmore
  20be94:	f9401d20 	ldr	x0, [x9, #56]
  20be98:	d1000407 	sub	x7, x0, #0x1
  20be9c:	cb0003e0 	neg	x0, x0
  20bea0:	8b0200e2 	add	x2, x7, x2
  20bea4:	8a00005b 	and	x27, x2, x0
  20bea8:	d2800005 	mov	x5, #0x0                   	// #0
  20beac:	12800004 	mov	w4, #0xffffffff            	// #-1
  20beb0:	52800443 	mov	w3, #0x22                  	// #34
  20beb4:	52800062 	mov	w2, #0x3                   	// #3
  20beb8:	aa1b03e1 	mov	x1, x27
  20bebc:	d2800000 	mov	x0, #0x0                   	// #0
  20bec0:	97ffeeea 	bl	207a68 <__mmap>
  20bec4:	aa0003fc 	mov	x28, x0
  20bec8:	b100041f 	cmn	x0, #0x1
  20becc:	54001b20 	b.eq	20c230 <__pthread_create+0x450>  // b.none
  20bed0:	913ba2a0 	add	x0, x21, #0xee8
  20bed4:	f9466a74 	ldr	x20, [x19, #3280]
  20bed8:	cb140374 	sub	x20, x27, x20
  20bedc:	f9401000 	ldr	x0, [x0, #32]
  20bee0:	8b140394 	add	x20, x28, x20
  20bee4:	cb0003e0 	neg	x0, x0
  20bee8:	b400235a 	cbz	x26, 20c350 <__pthread_create+0x570>
  20beec:	8b000280 	add	x0, x20, x0
  20bef0:	d2800019 	mov	x25, #0x0                   	// #0
  20bef4:	94000341 	bl	20cbf8 <__copy_tls>
  20bef8:	aa0003f3 	mov	x19, x0
  20befc:	b940b3e1 	ldr	w1, [sp, #176]
  20bf00:	cb170357 	sub	x23, x26, x23
  20bf04:	d0000040 	adrp	x0, 215000 <__data_start__>
  20bf08:	913ca000 	add	x0, x0, #0xf28
  20bf0c:	f9000273 	str	x19, [x19]
  20bf10:	a9056e7c 	stp	x28, x27, [x19, #80]
  20bf14:	a9065e7a 	stp	x26, x23, [x19, #96]
  20bf18:	f9003a79 	str	x25, [x19, #112]
  20bf1c:	f9004674 	str	x20, [x19, #136]
  20bf20:	f9005a60 	str	x0, [x19, #176]
  20bf24:	340019e1 	cbz	w1, 20c260 <__pthread_create+0x480>
  20bf28:	52800040 	mov	w0, #0x2                   	// #2
  20bf2c:	b9004260 	str	w0, [x19, #64]
  20bf30:	f8548301 	ldur	x1, [x24, #-184]
  20bf34:	927df354 	and	x20, x26, #0xfffffffffffffff8
  20bf38:	b940b7e0 	ldr	w0, [sp, #180]
  20bf3c:	d100a297 	sub	x23, x20, #0x28
  20bf40:	f9001661 	str	x1, [x19, #40]
  20bf44:	91024261 	add	x1, x19, #0x90
  20bf48:	f9004a61 	str	x1, [x19, #144]
  20bf4c:	f94033e1 	ldr	x1, [sp, #96]
  20bf50:	f81d8281 	stur	x1, [x20, #-40]
  20bf54:	f94037e1 	ldr	x1, [sp, #104]
  20bf58:	f81e0281 	stur	x1, [x20, #-32]
  20bf5c:	340017e0 	cbz	w0, 20c258 <__pthread_create+0x478>
  20bf60:	910263e1 	add	x1, sp, #0x98
  20bf64:	910233e0 	add	x0, sp, #0x8c
  20bf68:	a93e8281 	stp	x1, x0, [x20, #-24]
  20bf6c:	910343e0 	add	x0, sp, #0xd0
  20bf70:	9400052e 	bl	20d428 <__block_app_sigs>
  20bf74:	d2800102 	mov	x2, #0x8                   	// #8
  20bf78:	910343e1 	add	x1, sp, #0xd0
  20bf7c:	910082e0 	add	x0, x23, #0x20
  20bf80:	97fffa38 	bl	20a860 <memcpy>
  20bf84:	f85f8280 	ldur	x0, [x20, #-8]
  20bf88:	913ba2b5 	add	x21, x21, #0xee8
  20bf8c:	925ff800 	and	x0, x0, #0xfffffffeffffffff
  20bf90:	f81f8280 	stur	x0, [x20, #-8]
  20bf94:	97fffe6b 	bl	20b940 <__tl_lock>
  20bf98:	b10006df 	cmn	x22, #0x1
  20bf9c:	b9400ea1 	ldr	w1, [x21, #12]
  20bfa0:	90000003 	adrp	x3, 20b000 <strlen+0x40>
  20bfa4:	90000000 	adrp	x0, 20b000 <strlen+0x40>
  20bfa8:	91368063 	add	x3, x3, #0xda0
  20bfac:	11000421 	add	w1, w1, #0x1
  20bfb0:	91336000 	add	x0, x0, #0xcd8
  20bfb4:	5281e002 	mov	w2, #0xf00                 	// #3840
  20bfb8:	9a831000 	csel	x0, x0, x3, ne  // ne = any
  20bfbc:	d0000046 	adrp	x6, 215000 <__data_start__>
  20bfc0:	b9000ea1 	str	w1, [x21, #12]
  20bfc4:	913d90c6 	add	x6, x6, #0xf64
  20bfc8:	91038265 	add	x5, x19, #0xe0
  20bfcc:	9100e264 	add	x4, x19, #0x38
  20bfd0:	aa1703e3 	mov	x3, x23
  20bfd4:	72a00fa2 	movk	w2, #0x7d, lsl #16
  20bfd8:	aa1703e1 	mov	x1, x23
  20bfdc:	940008c8 	bl	20e2fc <__clone>
  20bfe0:	37f81600 	tbnz	w0, #31, 20c2a0 <__pthread_create+0x4c0>
  20bfe4:	f8538300 	ldur	x0, [x24, #-200]
  20bfe8:	d1038318 	sub	x24, x24, #0xe0
  20bfec:	a9010278 	stp	x24, x0, [x19, #16]
  20bff0:	f9000813 	str	x19, [x0, #16]
  20bff4:	f9400a60 	ldr	x0, [x19, #16]
  20bff8:	f9000c13 	str	x19, [x0, #24]
  20bffc:	97fffe75 	bl	20b9d0 <__tl_unlock>
  20c000:	910343e0 	add	x0, sp, #0xd0
  20c004:	9400051d 	bl	20d478 <__restore_sigs>
  20c008:	97fffe4c 	bl	20b938 <__acquire_ptc>
  20c00c:	b940b7e1 	ldr	w1, [sp, #180]
  20c010:	12800020 	mov	w0, #0xfffffffe            	// #-2
  20c014:	350000c1 	cbnz	w1, 20c02c <__pthread_create+0x24c>
  20c018:	14000096 	b	20c270 <__pthread_create+0x490>
  20c01c:	d503201f 	nop
  20c020:	910233e2 	add	x2, sp, #0x8c
  20c024:	8801fc40 	stlxr	w1, w0, [x2]
  20c028:	34001541 	cbz	w1, 20c2d0 <__pthread_create+0x4f0>
  20c02c:	910233e1 	add	x1, sp, #0x8c
  20c030:	885ffc21 	ldaxr	w1, [x1]
  20c034:	3100043f 	cmn	w1, #0x1
  20c038:	54ffff40 	b.eq	20c020 <__pthread_create+0x240>  // b.none
  20c03c:	d5033bbf 	dmb	ish
  20c040:	b9408fe0 	ldr	w0, [sp, #140]
  20c044:	34001160 	cbz	w0, 20c270 <__pthread_create+0x490>
  20c048:	a941dff6 	ldp	x22, x23, [sp, #24]
  20c04c:	a942e7f8 	ldp	x24, x25, [sp, #40]
  20c050:	a943effa 	ldp	x26, x27, [sp, #56]
  20c054:	f94027fc 	ldr	x28, [sp, #72]
  20c058:	f9400bf5 	ldr	x21, [sp, #16]
  20c05c:	f9402bfe 	ldr	x30, [sp, #80]
  20c060:	a8d553f3 	ldp	x19, x20, [sp], #336
  20c064:	d65f03c0 	ret
  20c068:	a9420ec2 	ldp	x2, x3, [x22, #32]
  20c06c:	a90b8fe2 	stp	x2, x3, [sp, #184]
  20c070:	a9401ec6 	ldp	x6, x7, [x22]
  20c074:	a9099fe6 	stp	x6, x7, [sp, #152]
  20c078:	a94116c4 	ldp	x4, x5, [x22, #16]
  20c07c:	a90a97e4 	stp	x4, x5, [sp, #168]
  20c080:	f9401ac0 	ldr	x0, [x22, #48]
  20c084:	f90067e0 	str	x0, [sp, #200]
  20c088:	97fffe2c 	bl	20b938 <__acquire_ptc>
  20c08c:	f94057f7 	ldr	x23, [sp, #168]
  20c090:	913ba2a9 	add	x9, x21, #0xee8
  20c094:	f9404ffb 	ldr	x27, [sp, #152]
  20c098:	f9401123 	ldr	x3, [x9, #32]
  20c09c:	b5ffeeb7 	cbnz	x23, 20be70 <__pthread_create+0x90>
  20c0a0:	b0000054 	adrp	x20, 215000 <__data_start__>
  20c0a4:	f9401d20 	ldr	x0, [x9, #56]
  20c0a8:	f94053e8 	ldr	x8, [sp, #160]
  20c0ac:	d2800005 	mov	x5, #0x0                   	// #0
  20c0b0:	f9466a93 	ldr	x19, [x20, #3280]
  20c0b4:	8b030003 	add	x3, x0, x3
  20c0b8:	8b080008 	add	x8, x0, x8
  20c0bc:	f9003fe9 	str	x9, [sp, #120]
  20c0c0:	d1000673 	sub	x19, x19, #0x1
  20c0c4:	cb0003e0 	neg	x0, x0
  20c0c8:	8b030273 	add	x19, x19, x3
  20c0cc:	d1000508 	sub	x8, x8, #0x1
  20c0d0:	8b1b0267 	add	x7, x19, x27
  20c0d4:	8a000119 	and	x25, x8, x0
  20c0d8:	8a0000f3 	and	x19, x7, x0
  20c0dc:	12800004 	mov	w4, #0xffffffff            	// #-1
  20c0e0:	52800443 	mov	w3, #0x22                  	// #34
  20c0e4:	8b19027b 	add	x27, x19, x25
  20c0e8:	b40013b9 	cbz	x25, 20c35c <__pthread_create+0x57c>
  20c0ec:	52800002 	mov	w2, #0x0                   	// #0
  20c0f0:	aa1b03e1 	mov	x1, x27
  20c0f4:	d2800000 	mov	x0, #0x0                   	// #0
  20c0f8:	97ffee5c 	bl	207a68 <__mmap>
  20c0fc:	aa0003fc 	mov	x28, x0
  20c100:	b100041f 	cmn	x0, #0x1
  20c104:	54000960 	b.eq	20c230 <__pthread_create+0x450>  // b.none
  20c108:	8b190017 	add	x23, x0, x25
  20c10c:	52800062 	mov	w2, #0x3                   	// #3
  20c110:	aa1303e1 	mov	x1, x19
  20c114:	aa1703e0 	mov	x0, x23
  20c118:	9400046e 	bl	20d2d0 <__mprotect>
  20c11c:	f9403fe9 	ldr	x9, [sp, #120]
  20c120:	35001000 	cbnz	w0, 20c320 <__pthread_create+0x540>
  20c124:	f9466a94 	ldr	x20, [x20, #3280]
  20c128:	f9401120 	ldr	x0, [x9, #32]
  20c12c:	cb140374 	sub	x20, x27, x20
  20c130:	8b140394 	add	x20, x28, x20
  20c134:	cb0003e0 	neg	x0, x0
  20c138:	8b00029a 	add	x26, x20, x0
  20c13c:	aa1a03e0 	mov	x0, x26
  20c140:	17ffff6d 	b	20bef4 <__pthread_create+0x114>
  20c144:	d503201f 	nop
  20c148:	94000790 	bl	20df88 <__ofl_lock>
  20c14c:	f9400000 	ldr	x0, [x0]
  20c150:	b40000c0 	cbz	x0, 20c168 <__pthread_create+0x388>
  20c154:	b9408c01 	ldr	w1, [x0, #140]
  20c158:	36f80041 	tbz	w1, #31, 20c160 <__pthread_create+0x380>
  20c15c:	b9008c1f 	str	wzr, [x0, #140]
  20c160:	f9403800 	ldr	x0, [x0, #112]
  20c164:	b5ffff80 	cbnz	x0, 20c154 <__pthread_create+0x374>
  20c168:	94000790 	bl	20dfa8 <__ofl_unlock>
  20c16c:	b0000040 	adrp	x0, 215000 <__data_start__>
  20c170:	f9466c00 	ldr	x0, [x0, #3288]
  20c174:	b4000080 	cbz	x0, 20c184 <__pthread_create+0x3a4>
  20c178:	b9408c01 	ldr	w1, [x0, #140]
  20c17c:	36f80041 	tbz	w1, #31, 20c184 <__pthread_create+0x3a4>
  20c180:	b9008c1f 	str	wzr, [x0, #140]
  20c184:	b0000040 	adrp	x0, 215000 <__data_start__>
  20c188:	f940f000 	ldr	x0, [x0, #480]
  20c18c:	b4000080 	cbz	x0, 20c19c <__pthread_create+0x3bc>
  20c190:	b9408c01 	ldr	w1, [x0, #140]
  20c194:	36f80041 	tbz	w1, #31, 20c19c <__pthread_create+0x3bc>
  20c198:	b9008c1f 	str	wzr, [x0, #140]
  20c19c:	b0000040 	adrp	x0, 215000 <__data_start__>
  20c1a0:	f9407800 	ldr	x0, [x0, #240]
  20c1a4:	b4000080 	cbz	x0, 20c1b4 <__pthread_create+0x3d4>
  20c1a8:	b9408c01 	ldr	w1, [x0, #140]
  20c1ac:	36f80041 	tbz	w1, #31, 20c1b4 <__pthread_create+0x3d4>
  20c1b0:	b9008c1f 	str	wzr, [x0, #140]
  20c1b4:	910543f3 	add	x19, sp, #0x150
  20c1b8:	d2c00061 	mov	x1, #0x300000000           	// #12884901888
  20c1bc:	d28015e0 	mov	x0, #0xaf                  	// #175
  20c1c0:	f8140e61 	str	x1, [x19, #-192]!
  20c1c4:	97ffe84f 	bl	206300 <get_rtt_syscall>
  20c1c8:	aa0003e4 	mov	x4, x0
  20c1cc:	b40000c0 	cbz	x0, 20c1e4 <__pthread_create+0x404>
  20c1d0:	d2800103 	mov	x3, #0x8                   	// #8
  20c1d4:	d2800002 	mov	x2, #0x0                   	// #0
  20c1d8:	aa1303e1 	mov	x1, x19
  20c1dc:	d2800020 	mov	x0, #0x1                   	// #1
  20c1e0:	d63f0080 	blr	x4
  20c1e4:	b0000040 	adrp	x0, 215000 <__data_start__>
  20c1e8:	91338000 	add	x0, x0, #0xce0
  20c1ec:	f81a8300 	stur	x0, [x24, #-88]
  20c1f0:	97fffdd2 	bl	20b938 <__acquire_ptc>
  20c1f4:	913ba2a0 	add	x0, x21, #0xee8
  20c1f8:	52800021 	mov	w1, #0x1                   	// #1
  20c1fc:	b9000401 	str	w1, [x0, #4]
  20c200:	d10006c0 	sub	x0, x22, #0x1
  20c204:	b1000c1f 	cmn	x0, #0x3
  20c208:	54ffe208 	b.hi	20be48 <__pthread_create+0x68>  // b.pmore
  20c20c:	17ffff97 	b	20c068 <__pthread_create+0x288>
  20c210:	f9400bf5 	ldr	x21, [sp, #16]
  20c214:	528004c0 	mov	w0, #0x26                  	// #38
  20c218:	f9402bfe 	ldr	x30, [sp, #80]
  20c21c:	a8d553f3 	ldp	x19, x20, [sp], #336
  20c220:	d65f03c0 	ret
  20c224:	aa1b03e1 	mov	x1, x27
  20c228:	aa1c03e0 	mov	x0, x28
  20c22c:	97ffee85 	bl	207c40 <__munmap>
  20c230:	97fffdc2 	bl	20b938 <__acquire_ptc>
  20c234:	a941dff6 	ldp	x22, x23, [sp, #24]
  20c238:	52800160 	mov	w0, #0xb                   	// #11
  20c23c:	a942e7f8 	ldp	x24, x25, [sp, #40]
  20c240:	a943effa 	ldp	x26, x27, [sp, #56]
  20c244:	f94027fc 	ldr	x28, [sp, #72]
  20c248:	f9400bf5 	ldr	x21, [sp, #16]
  20c24c:	f9402bfe 	ldr	x30, [sp, #80]
  20c250:	a8d553f3 	ldp	x19, x20, [sp], #336
  20c254:	d65f03c0 	ret
  20c258:	a93efe9f 	stp	xzr, xzr, [x20, #-24]
  20c25c:	17ffff44 	b	20bf6c <__pthread_create+0x18c>
  20c260:	52800020 	mov	w0, #0x1                   	// #1
  20c264:	b9004260 	str	w0, [x19, #64]
  20c268:	17ffff32 	b	20bf30 <__pthread_create+0x150>
  20c26c:	d503201f 	nop
  20c270:	f9403be0 	ldr	x0, [sp, #112]
  20c274:	a941dff6 	ldp	x22, x23, [sp, #24]
  20c278:	a942e7f8 	ldp	x24, x25, [sp, #40]
  20c27c:	a943effa 	ldp	x26, x27, [sp, #56]
  20c280:	f94027fc 	ldr	x28, [sp, #72]
  20c284:	f9000013 	str	x19, [x0]
  20c288:	52800000 	mov	w0, #0x0                   	// #0
  20c28c:	f9400bf5 	ldr	x21, [sp, #16]
  20c290:	f9402bfe 	ldr	x30, [sp, #80]
  20c294:	a8d553f3 	ldp	x19, x20, [sp], #336
  20c298:	d65f03c0 	ret
  20c29c:	d503201f 	nop
  20c2a0:	97fffdcc 	bl	20b9d0 <__tl_unlock>
  20c2a4:	910343e0 	add	x0, sp, #0xd0
  20c2a8:	94000474 	bl	20d478 <__restore_sigs>
  20c2ac:	97fffda3 	bl	20b938 <__acquire_ptc>
  20c2b0:	b9400ea0 	ldr	w0, [x21, #12]
  20c2b4:	51000400 	sub	w0, w0, #0x1
  20c2b8:	b9000ea0 	str	w0, [x21, #12]
  20c2bc:	b4fffbdc 	cbz	x28, 20c234 <__pthread_create+0x454>
  20c2c0:	aa1b03e1 	mov	x1, x27
  20c2c4:	aa1c03e0 	mov	x0, x28
  20c2c8:	97ffee5e 	bl	207c40 <__munmap>
  20c2cc:	17ffffda 	b	20c234 <__pthread_create+0x454>
  20c2d0:	52800023 	mov	w3, #0x1                   	// #1
  20c2d4:	12800022 	mov	w2, #0xfffffffe            	// #-2
  20c2d8:	d2800001 	mov	x1, #0x0                   	// #0
  20c2dc:	910233e0 	add	x0, sp, #0x8c
  20c2e0:	97fffd36 	bl	20b7b8 <__wait>
  20c2e4:	17ffff57 	b	20c040 <__pthread_create+0x260>
  20c2e8:	f9466a74 	ldr	x20, [x19, #3280]
  20c2ec:	52800001 	mov	w1, #0x0                   	// #0
  20c2f0:	f9003fe9 	str	x9, [sp, #120]
  20c2f4:	cb140354 	sub	x20, x26, x20
  20c2f8:	cb03029a 	sub	x26, x20, x3
  20c2fc:	aa1a03e0 	mov	x0, x26
  20c300:	97fffaaa 	bl	20ada8 <memset>
  20c304:	b4ffdd34 	cbz	x20, 20bea8 <__pthread_create+0xc8>
  20c308:	f9403fe9 	ldr	x9, [sp, #120]
  20c30c:	d2800019 	mov	x25, #0x0                   	// #0
  20c310:	d280001c 	mov	x28, #0x0                   	// #0
  20c314:	f9401120 	ldr	x0, [x9, #32]
  20c318:	cb000280 	sub	x0, x20, x0
  20c31c:	17fffef6 	b	20bef4 <__pthread_create+0x114>
  20c320:	f9003fe9 	str	x9, [sp, #120]
  20c324:	97ffdc7f 	bl	203520 <__errno_location>
  20c328:	b9400000 	ldr	w0, [x0]
  20c32c:	7100981f 	cmp	w0, #0x26
  20c330:	54fff7a1 	b.ne	20c224 <__pthread_create+0x444>  // b.any
  20c334:	f9403fe9 	ldr	x9, [sp, #120]
  20c338:	f9466a94 	ldr	x20, [x20, #3280]
  20c33c:	cb140374 	sub	x20, x27, x20
  20c340:	f9401120 	ldr	x0, [x9, #32]
  20c344:	8b140394 	add	x20, x28, x20
  20c348:	cb0003e0 	neg	x0, x0
  20c34c:	17ffff7b 	b	20c138 <__pthread_create+0x358>
  20c350:	aa1c03f7 	mov	x23, x28
  20c354:	d2800019 	mov	x25, #0x0                   	// #0
  20c358:	17ffff78 	b	20c138 <__pthread_create+0x358>
  20c35c:	52800062 	mov	w2, #0x3                   	// #3
  20c360:	aa1b03e1 	mov	x1, x27
  20c364:	d2800000 	mov	x0, #0x0                   	// #0
  20c368:	97ffedc0 	bl	207a68 <__mmap>
  20c36c:	f9403fe9 	ldr	x9, [sp, #120]
  20c370:	aa0003fc 	mov	x28, x0
  20c374:	b100041f 	cmn	x0, #0x1
  20c378:	54fff5c0 	b.eq	20c230 <__pthread_create+0x450>  // b.none
  20c37c:	f9466a94 	ldr	x20, [x20, #3280]
  20c380:	aa1c03f7 	mov	x23, x28
  20c384:	f9401120 	ldr	x0, [x9, #32]
  20c388:	cb140374 	sub	x20, x27, x20
  20c38c:	8b140394 	add	x20, x28, x20
  20c390:	cb0003e0 	neg	x0, x0
  20c394:	17ffff69 	b	20c138 <__pthread_create+0x358>

000000000020c398 <__get_thread_map>:
  20c398:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20c39c:	aa0003f3 	mov	x19, x0
  20c3a0:	f9000bfe 	str	x30, [sp, #16]
  20c3a4:	b40000a0 	cbz	x0, 20c3b8 <__get_thread_map+0x20>
  20c3a8:	91038260 	add	x0, x19, #0xe0
  20c3ac:	f9400bfe 	ldr	x30, [sp, #16]
  20c3b0:	a8c253f3 	ldp	x19, x20, [sp], #32
  20c3b4:	d65f03c0 	ret
  20c3b8:	b0000041 	adrp	x1, 215000 <__data_start__>
  20c3bc:	d2801c14 	mov	x20, #0xe0                  	// #224
  20c3c0:	d2800005 	mov	x5, #0x0                   	// #0
  20c3c4:	12800004 	mov	w4, #0xffffffff            	// #-1
  20c3c8:	f9478421 	ldr	x1, [x1, #3848]
  20c3cc:	52800443 	mov	w3, #0x22                  	// #34
  20c3d0:	52800062 	mov	w2, #0x3                   	// #3
  20c3d4:	f100003f 	cmp	x1, #0x0
  20c3d8:	9a941021 	csel	x1, x1, x20, ne  // ne = any
  20c3dc:	97ffeda3 	bl	207a68 <__mmap>
  20c3e0:	aa0003f3 	mov	x19, x0
  20c3e4:	b4000220 	cbz	x0, 20c428 <__get_thread_map+0x90>
  20c3e8:	b0000040 	adrp	x0, 215000 <__data_start__>
  20c3ec:	91024261 	add	x1, x19, #0x90
  20c3f0:	a9014e73 	stp	x19, x19, [x19, #16]
  20c3f4:	f947b402 	ldr	x2, [x0, #3944]
  20c3f8:	b0000040 	adrp	x0, 215000 <__data_start__>
  20c3fc:	f9000273 	str	x19, [x19]
  20c400:	913ca000 	add	x0, x0, #0xf28
  20c404:	f9001662 	str	x2, [x19, #40]
  20c408:	f9005a60 	str	x0, [x19, #176]
  20c40c:	aa1403e0 	mov	x0, x20
  20c410:	f9004a61 	str	x1, [x19, #144]
  20c414:	97ffe7bb 	bl	206300 <get_rtt_syscall>
  20c418:	b40000c0 	cbz	x0, 20c430 <__get_thread_map+0x98>
  20c41c:	d63f0000 	blr	x0
  20c420:	29077e60 	stp	w0, wzr, [x19, #56]
  20c424:	17ffffe1 	b	20c3a8 <__get_thread_map+0x10>
  20c428:	d2800000 	mov	x0, #0x0                   	// #0
  20c42c:	17ffffe0 	b	20c3ac <__get_thread_map+0x14>
  20c430:	52800000 	mov	w0, #0x0                   	// #0
  20c434:	29077e60 	stp	w0, wzr, [x19, #56]
  20c438:	17ffffdc 	b	20c3a8 <__get_thread_map+0x10>
  20c43c:	00000000 	.inst	0x00000000 ; undefined

000000000020c440 <__put_thread_map>:
  20c440:	b4000100 	cbz	x0, 20c460 <__put_thread_map+0x20>
  20c444:	b0000041 	adrp	x1, 215000 <__data_start__>
  20c448:	d2801c02 	mov	x2, #0xe0                  	// #224
  20c44c:	d1038000 	sub	x0, x0, #0xe0
  20c450:	f9478421 	ldr	x1, [x1, #3848]
  20c454:	f100003f 	cmp	x1, #0x0
  20c458:	9a821021 	csel	x1, x1, x2, ne  // ne = any
  20c45c:	17ffedf9 	b	207c40 <__munmap>
  20c460:	d65f03c0 	ret
  20c464:	00000000 	.inst	0x00000000 ; undefined

000000000020c468 <__pthread_init_run>:
  20c468:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20c46c:	aa0003f4 	mov	x20, x0
  20c470:	d2800000 	mov	x0, #0x0                   	// #0
  20c474:	a9017bf5 	stp	x21, x30, [sp, #16]
  20c478:	aa0103f5 	mov	x21, x1
  20c47c:	97ffffc7 	bl	20c398 <__get_thread_map>
  20c480:	b40001c0 	cbz	x0, 20c4b8 <__pthread_init_run+0x50>
  20c484:	aa0003f3 	mov	x19, x0
  20c488:	94000796 	bl	20e2e0 <__set_thread_area>
  20c48c:	aa1503e0 	mov	x0, x21
  20c490:	d63f0280 	blr	x20
  20c494:	b0000041 	adrp	x1, 215000 <__data_start__>
  20c498:	d1038260 	sub	x0, x19, #0xe0
  20c49c:	a9417bf5 	ldp	x21, x30, [sp, #16]
  20c4a0:	d2801c02 	mov	x2, #0xe0                  	// #224
  20c4a4:	a8c253f3 	ldp	x19, x20, [sp], #32
  20c4a8:	f9478421 	ldr	x1, [x1, #3848]
  20c4ac:	f100003f 	cmp	x1, #0x0
  20c4b0:	9a821021 	csel	x1, x1, x2, ne  // ne = any
  20c4b4:	17ffede3 	b	207c40 <__munmap>
  20c4b8:	a9417bf5 	ldp	x21, x30, [sp, #16]
  20c4bc:	a8c253f3 	ldp	x19, x20, [sp], #32
  20c4c0:	d65f03c0 	ret
  20c4c4:	00000000 	.inst	0x00000000 ; undefined

000000000020c4c8 <__vm_wait>:
  20c4c8:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20c4cc:	b0000053 	adrp	x19, 215000 <__data_start__>
  20c4d0:	b94cf262 	ldr	w2, [x19, #3312]
  20c4d4:	f9000bfe 	str	x30, [sp, #16]
  20c4d8:	34000122 	cbz	w2, 20c4fc <__vm_wait+0x34>
  20c4dc:	9133c273 	add	x19, x19, #0xcf0
  20c4e0:	91001274 	add	x20, x19, #0x4
  20c4e4:	52800023 	mov	w3, #0x1                   	// #1
  20c4e8:	aa1403e1 	mov	x1, x20
  20c4ec:	aa1303e0 	mov	x0, x19
  20c4f0:	97fffcb2 	bl	20b7b8 <__wait>
  20c4f4:	b9400262 	ldr	w2, [x19]
  20c4f8:	35ffff62 	cbnz	w2, 20c4e4 <__vm_wait+0x1c>
  20c4fc:	f9400bfe 	ldr	x30, [sp, #16]
  20c500:	a8c253f3 	ldp	x19, x20, [sp], #32
  20c504:	d65f03c0 	ret

000000000020c508 <__vm_lock>:
  20c508:	b0000041 	adrp	x1, 215000 <__data_start__>
  20c50c:	9133c020 	add	x0, x1, #0xcf0
  20c510:	885ffc00 	ldaxr	w0, [x0]
  20c514:	11000400 	add	w0, w0, #0x1
  20c518:	9133c023 	add	x3, x1, #0xcf0
  20c51c:	8802fc60 	stlxr	w2, w0, [x3]
  20c520:	35ffff62 	cbnz	w2, 20c50c <__vm_lock+0x4>
  20c524:	d65f03c0 	ret

000000000020c528 <__vm_unlock>:
  20c528:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20c52c:	b0000040 	adrp	x0, 215000 <__data_start__>
  20c530:	9133c013 	add	x19, x0, #0xcf0
  20c534:	885ffe62 	ldaxr	w2, [x19]
  20c538:	51000441 	sub	w1, w2, #0x1
  20c53c:	8803fe61 	stlxr	w3, w1, [x19]
  20c540:	35ffff83 	cbnz	w3, 20c530 <__vm_unlock+0x8>
  20c544:	7100045f 	cmp	w2, #0x1
  20c548:	54000080 	b.eq	20c558 <__vm_unlock+0x30>  // b.none
  20c54c:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20c550:	d65f03c0 	ret
  20c554:	d503201f 	nop
  20c558:	b9400660 	ldr	w0, [x19, #4]
  20c55c:	34ffff80 	cbz	w0, 20c54c <__vm_unlock+0x24>
  20c560:	d2801e00 	mov	x0, #0xf0                  	// #240
  20c564:	97ffe767 	bl	206300 <get_rtt_syscall>
  20c568:	aa0003e3 	mov	x3, x0
  20c56c:	b4ffff00 	cbz	x0, 20c54c <__vm_unlock+0x24>
  20c570:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
  20c574:	d2801021 	mov	x1, #0x81                  	// #129
  20c578:	aa1303e0 	mov	x0, x19
  20c57c:	d63f0060 	blr	x3
  20c580:	b100981f 	cmn	x0, #0x26
  20c584:	54fffe41 	b.ne	20c54c <__vm_unlock+0x24>  // b.any
  20c588:	d2801e00 	mov	x0, #0xf0                  	// #240
  20c58c:	97ffe75d 	bl	206300 <get_rtt_syscall>
  20c590:	aa0003e3 	mov	x3, x0
  20c594:	b4fffdc0 	cbz	x0, 20c54c <__vm_unlock+0x24>
  20c598:	aa1303e0 	mov	x0, x19
  20c59c:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
  20c5a0:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20c5a4:	d2800021 	mov	x1, #0x1                   	// #1
  20c5a8:	d61f0060 	br	x3
  20c5ac:	00000000 	.inst	0x00000000 ; undefined

000000000020c5b0 <time>:
  20c5b0:	a9be7bf3 	stp	x19, x30, [sp, #-32]!
  20c5b4:	aa0003f3 	mov	x19, x0
  20c5b8:	52800000 	mov	w0, #0x0                   	// #0
  20c5bc:	910043e1 	add	x1, sp, #0x10
  20c5c0:	940009b0 	bl	20ec80 <__clock_gettime>
  20c5c4:	f9400be0 	ldr	x0, [sp, #16]
  20c5c8:	b4000053 	cbz	x19, 20c5d0 <time+0x20>
  20c5cc:	f9000260 	str	x0, [x19]
  20c5d0:	a8c27bf3 	ldp	x19, x30, [sp], #32
  20c5d4:	d65f03c0 	ret

000000000020c5d8 <timer_handler>:
  20c5d8:	d65f03c0 	ret
  20c5dc:	00000000 	.inst	0x00000000 ; undefined

000000000020c5e0 <start>:
  20c5e0:	d108c3ff 	sub	sp, sp, #0x230
  20c5e4:	d53bd042 	mrs	x2, tpidr_el0
  20c5e8:	d1038042 	sub	x2, x2, #0xe0
  20c5ec:	a90053f3 	stp	x19, x20, [sp]
  20c5f0:	a9017bf5 	stp	x21, x30, [sp, #16]
  20c5f4:	f9401001 	ldr	x1, [x0, #32]
  20c5f8:	b940a855 	ldr	w21, [x2, #168]
  20c5fc:	f90017e2 	str	x2, [sp, #40]
  20c600:	f9400834 	ldr	x20, [x1, #16]
  20c604:	f9400021 	ldr	x1, [x1]
  20c608:	f90023e1 	str	x1, [sp, #64]
  20c60c:	94000773 	bl	20e3d8 <pthread_barrier_wait>
  20c610:	90000000 	adrp	x0, 20c000 <__pthread_create+0x220>
  20c614:	911cc000 	add	x0, x0, #0x730
  20c618:	f90027e0 	str	x0, [sp, #72]
  20c61c:	d2b00013 	mov	x19, #0x80000000            	// #2147483648
  20c620:	9101e3e1 	add	x1, sp, #0x78
  20c624:	910163e0 	add	x0, sp, #0x58
  20c628:	f9002ff3 	str	x19, [sp, #88]
  20c62c:	9400043f 	bl	20d728 <sigwaitinfo>
  20c630:	37ffff80 	tbnz	w0, #31, 20c620 <start+0x40>
  20c634:	b94083e0 	ldr	w0, [sp, #128]
  20c638:	b90027f5 	str	w21, [sp, #36]
  20c63c:	3100081f 	cmn	w0, #0x2
  20c640:	f94017e0 	ldr	x0, [sp, #40]
  20c644:	a90353e0 	stp	x0, x20, [sp, #48]
  20c648:	54000280 	b.eq	20c698 <start+0xb8>  // b.none
  20c64c:	f9401be0 	ldr	x0, [sp, #48]
  20c650:	b940a800 	ldr	w0, [x0, #168]
  20c654:	37f800a0 	tbnz	w0, #31, 20c668 <start+0x88>
  20c658:	b94027f5 	ldr	w21, [sp, #36]
  20c65c:	f9401ff4 	ldr	x20, [sp, #56]
  20c660:	17ffffef 	b	20c61c <start+0x3c>
  20c664:	d503201f 	nop
  20c668:	d28020a0 	mov	x0, #0x105                 	// #261
  20c66c:	b98027f3 	ldrsw	x19, [sp, #36]
  20c670:	97ffe724 	bl	206300 <get_rtt_syscall>
  20c674:	aa0003e1 	mov	x1, x0
  20c678:	b4000060 	cbz	x0, 20c684 <start+0xa4>
  20c67c:	aa1303e0 	mov	x0, x19
  20c680:	d63f0020 	blr	x1
  20c684:	a94053f3 	ldp	x19, x20, [sp]
  20c688:	d2800000 	mov	x0, #0x0                   	// #0
  20c68c:	a9417bf5 	ldp	x21, x30, [sp, #16]
  20c690:	9108c3ff 	add	sp, sp, #0x230
  20c694:	d65f03c0 	ret
  20c698:	9103e3e0 	add	x0, sp, #0xf8
  20c69c:	94000341 	bl	20d3a0 <__setjmp>
  20c6a0:	35fffd60 	cbnz	w0, 20c64c <start+0x6c>
  20c6a4:	f94027e1 	ldr	x1, [sp, #72]
  20c6a8:	9103e3e2 	add	x2, sp, #0xf8
  20c6ac:	910183e0 	add	x0, sp, #0x60
  20c6b0:	940008d4 	bl	20ea00 <_pthread_cleanup_push>
  20c6b4:	a94383e1 	ldp	x1, x0, [sp, #56]
  20c6b8:	d63f0020 	blr	x1
  20c6bc:	52800021 	mov	w1, #0x1                   	// #1
  20c6c0:	910183e0 	add	x0, sp, #0x60
  20c6c4:	940008d1 	bl	20ea08 <_pthread_cleanup_pop>
  20c6c8:	17ffffe1 	b	20c64c <start+0x6c>
  20c6cc:	00000000 	.inst	0x00000000 ; undefined

000000000020c6d0 <install_handler>:
  20c6d0:	f8150ffe 	str	x30, [sp, #-176]!
  20c6d4:	52800081 	mov	w1, #0x4                   	// #4
  20c6d8:	72a20001 	movk	w1, #0x1000, lsl #16
  20c6dc:	90000000 	adrp	x0, 20c000 <__pthread_create+0x220>
  20c6e0:	a90a7fff 	stp	xzr, xzr, [sp, #160]
  20c6e4:	91176000 	add	x0, x0, #0x5d8
  20c6e8:	b900a3e1 	str	w1, [sp, #160]
  20c6ec:	d2800002 	mov	x2, #0x0                   	// #0
  20c6f0:	f9000fe0 	str	x0, [sp, #24]
  20c6f4:	910063e1 	add	x1, sp, #0x18
  20c6f8:	a9027fff 	stp	xzr, xzr, [sp, #32]
  20c6fc:	52800400 	mov	w0, #0x20                  	// #32
  20c700:	a9037fff 	stp	xzr, xzr, [sp, #48]
  20c704:	a9047fff 	stp	xzr, xzr, [sp, #64]
  20c708:	a9057fff 	stp	xzr, xzr, [sp, #80]
  20c70c:	a9067fff 	stp	xzr, xzr, [sp, #96]
  20c710:	a9077fff 	stp	xzr, xzr, [sp, #112]
  20c714:	a9087fff 	stp	xzr, xzr, [sp, #128]
  20c718:	a9097fff 	stp	xzr, xzr, [sp, #144]
  20c71c:	94000369 	bl	20d4c0 <__libc_sigaction>
  20c720:	f84b07fe 	ldr	x30, [sp], #176
  20c724:	d65f03c0 	ret

000000000020c728 <dummy_0>:
  20c728:	d65f03c0 	ret
  20c72c:	00000000 	.inst	0x00000000 ; undefined

000000000020c730 <cleanup_fromsig>:
  20c730:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20c734:	aa0003f4 	mov	x20, x0
  20c738:	d53bd053 	mrs	x19, tpidr_el0
  20c73c:	f9000bfe 	str	x30, [sp, #16]
  20c740:	97fffc7e 	bl	20b938 <__acquire_ptc>
  20c744:	b816427f 	stur	wzr, [x19, #-156]
  20c748:	3816827f 	sturb	wzr, [x19, #-152]
  20c74c:	f81a027f 	stur	xzr, [x19, #-96]
  20c750:	3816927f 	sturb	wzr, [x19, #-151]
  20c754:	940001d7 	bl	20ceb0 <__reset_tls>
  20c758:	52800021 	mov	w1, #0x1                   	// #1
  20c75c:	aa1403e0 	mov	x0, x20
  20c760:	94000300 	bl	20d360 <_longjmp>
  20c764:	00000000 	.inst	0x00000000 ; undefined

000000000020c768 <timer_create>:
  20c768:	a9ac53f3 	stp	x19, x20, [sp, #-320]!
  20c76c:	93407c14 	sxtw	x20, w0
  20c770:	f9000bf5 	str	x21, [sp, #16]
  20c774:	aa0203f5 	mov	x21, x2
  20c778:	f90017fe 	str	x30, [sp, #40]
  20c77c:	b4000e61 	cbz	x1, 20c948 <timer_create+0x1e0>
  20c780:	b9400c20 	ldr	w0, [x1, #12]
  20c784:	aa0103f3 	mov	x19, x1
  20c788:	37f80e40 	tbnz	w0, #31, 20c950 <timer_create+0x1e8>
  20c78c:	7100041f 	cmp	w0, #0x1
  20c790:	54000acd 	b.le	20c8e8 <timer_create+0x180>
  20c794:	7100081f 	cmp	w0, #0x2
  20c798:	54000dc1 	b.ne	20c950 <timer_create+0x1e8>  // b.any
  20c79c:	a901dff6 	stp	x22, x23, [sp, #24]
  20c7a0:	90000001 	adrp	x1, 20c000 <__pthread_create+0x220>
  20c7a4:	b0000040 	adrp	x0, 215000 <__data_start__>
  20c7a8:	911b4021 	add	x1, x1, #0x6d0
  20c7ac:	9133e000 	add	x0, x0, #0xcf8
  20c7b0:	9400090c 	bl	20ebe0 <__pthread_once>
  20c7b4:	f9400e60 	ldr	x0, [x19, #24]
  20c7b8:	b4000e80 	cbz	x0, 20c988 <timer_create+0x220>
  20c7bc:	a9400c02 	ldp	x2, x3, [x0]
  20c7c0:	a9088fe2 	stp	x2, x3, [sp, #136]
  20c7c4:	910223f7 	add	x23, sp, #0x88
  20c7c8:	a9410c02 	ldp	x2, x3, [x0, #16]
  20c7cc:	a9098fe2 	stp	x2, x3, [sp, #152]
  20c7d0:	a9420c02 	ldp	x2, x3, [x0, #32]
  20c7d4:	a90a8fe2 	stp	x2, x3, [sp, #168]
  20c7d8:	f9401800 	ldr	x0, [x0, #48]
  20c7dc:	f9005fe0 	str	x0, [sp, #184]
  20c7e0:	52800021 	mov	w1, #0x1                   	// #1
  20c7e4:	aa1703e0 	mov	x0, x23
  20c7e8:	940006e6 	bl	20e380 <pthread_attr_setdetachstate>
  20c7ec:	910503f6 	add	x22, sp, #0x140
  20c7f0:	52800042 	mov	w2, #0x2                   	// #2
  20c7f4:	d2800001 	mov	x1, #0x0                   	// #0
  20c7f8:	910183e0 	add	x0, sp, #0x60
  20c7fc:	940006e9 	bl	20e3a0 <pthread_barrier_init>
  20c800:	910303e0 	add	x0, sp, #0xc0
  20c804:	f90043f3 	str	x19, [sp, #128]
  20c808:	94000308 	bl	20d428 <__block_app_sigs>
  20c80c:	d2b00001 	mov	x1, #0x80000000            	// #2147483648
  20c810:	d28015e0 	mov	x0, #0xaf                  	// #175
  20c814:	f8100ec1 	str	x1, [x22, #-256]!
  20c818:	97ffe6ba 	bl	206300 <get_rtt_syscall>
  20c81c:	aa0003e4 	mov	x4, x0
  20c820:	b40000c0 	cbz	x0, 20c838 <timer_create+0xd0>
  20c824:	d2800103 	mov	x3, #0x8                   	// #8
  20c828:	d2800002 	mov	x2, #0x0                   	// #0
  20c82c:	aa1603e1 	mov	x1, x22
  20c830:	d2800000 	mov	x0, #0x0                   	// #0
  20c834:	d63f0080 	blr	x4
  20c838:	90000002 	adrp	x2, 20c000 <__pthread_create+0x220>
  20c83c:	910183e3 	add	x3, sp, #0x60
  20c840:	91178042 	add	x2, x2, #0x5e0
  20c844:	aa1703e1 	mov	x1, x23
  20c848:	9100e3e0 	add	x0, sp, #0x38
  20c84c:	97fffd65 	bl	20bde0 <__pthread_create>
  20c850:	2a0003f3 	mov	w19, w0
  20c854:	910303e0 	add	x0, sp, #0xc0
  20c858:	94000308 	bl	20d478 <__restore_sigs>
  20c85c:	35000ad3 	cbnz	w19, 20c9b4 <timer_create+0x24c>
  20c860:	f9401fe1 	ldr	x1, [sp, #56]
  20c864:	d2800402 	mov	x2, #0x20                  	// #32
  20c868:	f2c00082 	movk	x2, #0x4, lsl #32
  20c86c:	d2802020 	mov	x0, #0x101                 	// #257
  20c870:	a9048bff 	stp	xzr, x2, [sp, #72]
  20c874:	b9403821 	ldr	w1, [x1, #56]
  20c878:	b9005be1 	str	w1, [sp, #88]
  20c87c:	97ffe6a1 	bl	206300 <get_rtt_syscall>
  20c880:	aa0003e3 	mov	x3, x0
  20c884:	b40008e0 	cbz	x0, 20c9a0 <timer_create+0x238>
  20c888:	9100d3e2 	add	x2, sp, #0x34
  20c88c:	910123e1 	add	x1, sp, #0x48
  20c890:	aa1403e0 	mov	x0, x20
  20c894:	d63f0060 	blr	x3
  20c898:	97ffe6ca 	bl	2063c0 <__syscall_ret>
  20c89c:	b7f806e0 	tbnz	x0, #63, 20c978 <timer_create+0x210>
  20c8a0:	b94037e2 	ldr	w2, [sp, #52]
  20c8a4:	f9401fe1 	ldr	x1, [sp, #56]
  20c8a8:	910183e0 	add	x0, sp, #0x60
  20c8ac:	b900a822 	str	w2, [x1, #168]
  20c8b0:	940006ca 	bl	20e3d8 <pthread_barrier_wait>
  20c8b4:	b94037e0 	ldr	w0, [sp, #52]
  20c8b8:	37f80780 	tbnz	w0, #31, 20c9a8 <timer_create+0x240>
  20c8bc:	f9401fe0 	ldr	x0, [sp, #56]
  20c8c0:	a941dff6 	ldp	x22, x23, [sp, #24]
  20c8c4:	d341fc00 	lsr	x0, x0, #1
  20c8c8:	b2410000 	orr	x0, x0, #0x8000000000000000
  20c8cc:	f90002a0 	str	x0, [x21]
  20c8d0:	2a1303e0 	mov	w0, w19
  20c8d4:	f9400bf5 	ldr	x21, [sp, #16]
  20c8d8:	f94017fe 	ldr	x30, [sp, #40]
  20c8dc:	a8d453f3 	ldp	x19, x20, [sp], #320
  20c8e0:	d65f03c0 	ret
  20c8e4:	d503201f 	nop
  20c8e8:	f9400262 	ldr	x2, [x19]
  20c8ec:	910123f3 	add	x19, sp, #0x48
  20c8f0:	b9400821 	ldr	w1, [x1, #8]
  20c8f4:	f90027e2 	str	x2, [sp, #72]
  20c8f8:	290a03e1 	stp	w1, w0, [sp, #80]
  20c8fc:	b9005bff 	str	wzr, [sp, #88]
  20c900:	d2802020 	mov	x0, #0x101                 	// #257
  20c904:	97ffe67f 	bl	206300 <get_rtt_syscall>
  20c908:	aa0003e3 	mov	x3, x0
  20c90c:	b4000460 	cbz	x0, 20c998 <timer_create+0x230>
  20c910:	9100d3e2 	add	x2, sp, #0x34
  20c914:	aa1303e1 	mov	x1, x19
  20c918:	aa1403e0 	mov	x0, x20
  20c91c:	d63f0060 	blr	x3
  20c920:	97ffe6a8 	bl	2063c0 <__syscall_ret>
  20c924:	b7f80440 	tbnz	x0, #63, 20c9ac <timer_create+0x244>
  20c928:	b98037e0 	ldrsw	x0, [sp, #52]
  20c92c:	52800013 	mov	w19, #0x0                   	// #0
  20c930:	f90002a0 	str	x0, [x21]
  20c934:	2a1303e0 	mov	w0, w19
  20c938:	f9400bf5 	ldr	x21, [sp, #16]
  20c93c:	f94017fe 	ldr	x30, [sp, #40]
  20c940:	a8d453f3 	ldp	x19, x20, [sp], #320
  20c944:	d65f03c0 	ret
  20c948:	d2800013 	mov	x19, #0x0                   	// #0
  20c94c:	17ffffed 	b	20c900 <timer_create+0x198>
  20c950:	97ffdaf4 	bl	203520 <__errno_location>
  20c954:	12800013 	mov	w19, #0xffffffff            	// #-1
  20c958:	528002c1 	mov	w1, #0x16                  	// #22
  20c95c:	b9000001 	str	w1, [x0]
  20c960:	2a1303e0 	mov	w0, w19
  20c964:	f9400bf5 	ldr	x21, [sp, #16]
  20c968:	f94017fe 	ldr	x30, [sp, #40]
  20c96c:	a8d453f3 	ldp	x19, x20, [sp], #320
  20c970:	d65f03c0 	ret
  20c974:	d503201f 	nop
  20c978:	12800000 	mov	w0, #0xffffffff            	// #-1
  20c97c:	2a0003e2 	mov	w2, w0
  20c980:	b90037e0 	str	w0, [sp, #52]
  20c984:	17ffffc8 	b	20c8a4 <timer_create+0x13c>
  20c988:	910223f7 	add	x23, sp, #0x88
  20c98c:	aa1703e0 	mov	x0, x23
  20c990:	9400066c 	bl	20e340 <pthread_attr_init>
  20c994:	17ffff93 	b	20c7e0 <timer_create+0x78>
  20c998:	d2800000 	mov	x0, #0x0                   	// #0
  20c99c:	17ffffe1 	b	20c920 <timer_create+0x1b8>
  20c9a0:	d2800000 	mov	x0, #0x0                   	// #0
  20c9a4:	17ffffbd 	b	20c898 <timer_create+0x130>
  20c9a8:	a941dff6 	ldp	x22, x23, [sp, #24]
  20c9ac:	12800013 	mov	w19, #0xffffffff            	// #-1
  20c9b0:	17ffffe1 	b	20c934 <timer_create+0x1cc>
  20c9b4:	97ffdadb 	bl	203520 <__errno_location>
  20c9b8:	a941dff6 	ldp	x22, x23, [sp, #24]
  20c9bc:	b9000013 	str	w19, [x0]
  20c9c0:	12800013 	mov	w19, #0xffffffff            	// #-1
  20c9c4:	17ffffdc 	b	20c934 <timer_create+0x1cc>

000000000020c9c8 <timer_delete>:
  20c9c8:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20c9cc:	aa0003f3 	mov	x19, x0
  20c9d0:	b7f80140 	tbnz	x0, #63, 20c9f8 <timer_delete+0x30>
  20c9d4:	d28020a0 	mov	x0, #0x105                 	// #261
  20c9d8:	97ffe64a 	bl	206300 <get_rtt_syscall>
  20c9dc:	aa0003e1 	mov	x1, x0
  20c9e0:	b4000300 	cbz	x0, 20ca40 <timer_delete+0x78>
  20c9e4:	aa1303e0 	mov	x0, x19
  20c9e8:	d63f0020 	blr	x1
  20c9ec:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20c9f0:	d65f03c0 	ret
  20c9f4:	d503201f 	nop
  20c9f8:	d37ff813 	lsl	x19, x0, #1
  20c9fc:	b940aa60 	ldr	w0, [x19, #168]
  20ca00:	32010000 	orr	w0, w0, #0x80000000
  20ca04:	d5033bbf 	dmb	ish
  20ca08:	b900aa60 	str	w0, [x19, #168]
  20ca0c:	d5033bbf 	dmb	ish
  20ca10:	d2801dc0 	mov	x0, #0xee                  	// #238
  20ca14:	b9803a73 	ldrsw	x19, [x19, #56]
  20ca18:	97ffe63a 	bl	206300 <get_rtt_syscall>
  20ca1c:	aa0003e2 	mov	x2, x0
  20ca20:	b4000100 	cbz	x0, 20ca40 <timer_delete+0x78>
  20ca24:	d2800401 	mov	x1, #0x20                  	// #32
  20ca28:	aa1303e0 	mov	x0, x19
  20ca2c:	d63f0040 	blr	x2
  20ca30:	52800000 	mov	w0, #0x0                   	// #0
  20ca34:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20ca38:	d65f03c0 	ret
  20ca3c:	d503201f 	nop
  20ca40:	52800000 	mov	w0, #0x0                   	// #0
  20ca44:	17ffffea 	b	20c9ec <timer_delete+0x24>

000000000020ca48 <timer_settime>:
  20ca48:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  20ca4c:	aa0003f3 	mov	x19, x0
  20ca50:	a9015bf5 	stp	x21, x22, [sp, #16]
  20ca54:	aa0203f5 	mov	x21, x2
  20ca58:	f90013fe 	str	x30, [sp, #32]
  20ca5c:	aa0303f6 	mov	x22, x3
  20ca60:	b6f80080 	tbz	x0, #63, 20ca70 <timer_settime+0x28>
  20ca64:	d37ff813 	lsl	x19, x0, #1
  20ca68:	b940aa73 	ldr	w19, [x19, #168]
  20ca6c:	92407a73 	and	x19, x19, #0x7fffffff
  20ca70:	93407c34 	sxtw	x20, w1
  20ca74:	d2802040 	mov	x0, #0x102                 	// #258
  20ca78:	97ffe622 	bl	206300 <get_rtt_syscall>
  20ca7c:	aa0003e4 	mov	x4, x0
  20ca80:	b4000180 	cbz	x0, 20cab0 <timer_settime+0x68>
  20ca84:	aa1603e3 	mov	x3, x22
  20ca88:	aa1503e2 	mov	x2, x21
  20ca8c:	aa1403e1 	mov	x1, x20
  20ca90:	aa1303e0 	mov	x0, x19
  20ca94:	d63f0080 	blr	x4
  20ca98:	97ffe64a 	bl	2063c0 <__syscall_ret>
  20ca9c:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20caa0:	f94013fe 	ldr	x30, [sp, #32]
  20caa4:	a8c353f3 	ldp	x19, x20, [sp], #48
  20caa8:	d65f03c0 	ret
  20caac:	d503201f 	nop
  20cab0:	d2800000 	mov	x0, #0x0                   	// #0
  20cab4:	17fffff9 	b	20ca98 <timer_settime+0x50>

000000000020cab8 <__aio_close>:
  20cab8:	d65f03c0 	ret
  20cabc:	00000000 	.inst	0x00000000 ; undefined

000000000020cac0 <close>:
  20cac0:	f81f0ffe 	str	x30, [sp, #-16]!
  20cac4:	97fffffd 	bl	20cab8 <__aio_close>
  20cac8:	93407c01 	sxtw	x1, w0
  20cacc:	d2800006 	mov	x6, #0x0                   	// #0
  20cad0:	d2800005 	mov	x5, #0x0                   	// #0
  20cad4:	d2800004 	mov	x4, #0x0                   	// #0
  20cad8:	d2800003 	mov	x3, #0x0                   	// #0
  20cadc:	d2800002 	mov	x2, #0x0                   	// #0
  20cae0:	d28000c0 	mov	x0, #0x6                   	// #6
  20cae4:	97fffb33 	bl	20b7b0 <__syscall_cp>
  20cae8:	3100101f 	cmn	w0, #0x4
  20caec:	1a9f1000 	csel	w0, w0, wzr, ne  // ne = any
  20caf0:	93407c00 	sxtw	x0, w0
  20caf4:	97ffe633 	bl	2063c0 <__syscall_ret>
  20caf8:	f84107fe 	ldr	x30, [sp], #16
  20cafc:	d65f03c0 	ret

000000000020cb00 <sleep>:
  20cb00:	f81e0ffe 	str	x30, [sp, #-32]!
  20cb04:	2a0003e0 	mov	w0, w0
  20cb08:	910043e1 	add	x1, sp, #0x10
  20cb0c:	a9017fe0 	stp	x0, xzr, [sp, #16]
  20cb10:	aa0103e0 	mov	x0, x1
  20cb14:	94000893 	bl	20ed60 <nanosleep>
  20cb18:	b94013e1 	ldr	w1, [sp, #16]
  20cb1c:	7100001f 	cmp	w0, #0x0
  20cb20:	52800000 	mov	w0, #0x0                   	// #0
  20cb24:	f84207fe 	ldr	x30, [sp], #32
  20cb28:	1a801020 	csel	w0, w1, w0, ne  // ne = any
  20cb2c:	d65f03c0 	ret

000000000020cb30 <tolower>:
  20cb30:	51010402 	sub	w2, w0, #0x41
  20cb34:	321b0001 	orr	w1, w0, #0x20
  20cb38:	7100685f 	cmp	w2, #0x1a
  20cb3c:	1a803020 	csel	w0, w1, w0, cc  // cc = lo, ul, last
  20cb40:	d65f03c0 	ret
  20cb44:	00000000 	.inst	0x00000000 ; undefined

000000000020cb48 <__tolower_l>:
  20cb48:	51010402 	sub	w2, w0, #0x41
  20cb4c:	321b0001 	orr	w1, w0, #0x20
  20cb50:	7100685f 	cmp	w2, #0x1a
  20cb54:	1a803020 	csel	w0, w1, w0, cc  // cc = lo, ul, last
  20cb58:	d65f03c0 	ret
  20cb5c:	00000000 	.inst	0x00000000 ; undefined

000000000020cb60 <__init_tp>:
  20cb60:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20cb64:	aa0003f3 	mov	x19, x0
  20cb68:	91038000 	add	x0, x0, #0xe0
  20cb6c:	f9000bfe 	str	x30, [sp, #16]
  20cb70:	f9000273 	str	x19, [x19]
  20cb74:	940005db 	bl	20e2e0 <__set_thread_area>
  20cb78:	7100001f 	cmp	w0, #0x0
  20cb7c:	540003ab 	b.lt	20cbf0 <__init_tp+0x90>  // b.tstop
  20cb80:	540002c0 	b.eq	20cbd8 <__init_tp+0x78>  // b.none
  20cb84:	b0000041 	adrp	x1, 215000 <__data_start__>
  20cb88:	52800020 	mov	w0, #0x1                   	// #1
  20cb8c:	b9004260 	str	w0, [x19, #64]
  20cb90:	913d9034 	add	x20, x1, #0xf64
  20cb94:	d2802000 	mov	x0, #0x100                 	// #256
  20cb98:	97ffe5da 	bl	206300 <get_rtt_syscall>
  20cb9c:	aa0003e1 	mov	x1, x0
  20cba0:	b4000240 	cbz	x0, 20cbe8 <__init_tp+0x88>
  20cba4:	aa1403e0 	mov	x0, x20
  20cba8:	d63f0020 	blr	x1
  20cbac:	b0000041 	adrp	x1, 215000 <__data_start__>
  20cbb0:	91024262 	add	x2, x19, #0x90
  20cbb4:	913ca021 	add	x1, x1, #0xf28
  20cbb8:	b9003a60 	str	w0, [x19, #56]
  20cbbc:	a9014e73 	stp	x19, x19, [x19, #16]
  20cbc0:	52800000 	mov	w0, #0x0                   	// #0
  20cbc4:	f9004a62 	str	x2, [x19, #144]
  20cbc8:	f9005a61 	str	x1, [x19, #176]
  20cbcc:	f9400bfe 	ldr	x30, [sp, #16]
  20cbd0:	a8c253f3 	ldp	x19, x20, [sp], #32
  20cbd4:	d65f03c0 	ret
  20cbd8:	b0000040 	adrp	x0, 215000 <__data_start__>
  20cbdc:	52800021 	mov	w1, #0x1                   	// #1
  20cbe0:	b90ee801 	str	w1, [x0, #3816]
  20cbe4:	17ffffe8 	b	20cb84 <__init_tp+0x24>
  20cbe8:	52800000 	mov	w0, #0x0                   	// #0
  20cbec:	17fffff0 	b	20cbac <__init_tp+0x4c>
  20cbf0:	12800000 	mov	w0, #0xffffffff            	// #-1
  20cbf4:	17fffff6 	b	20cbcc <__init_tp+0x6c>

000000000020cbf8 <__copy_tls>:
  20cbf8:	a9bb53f3 	stp	x19, x20, [sp, #-80]!
  20cbfc:	a902e7f8 	stp	x24, x25, [sp, #40]
  20cc00:	b0000059 	adrp	x25, 215000 <__data_start__>
  20cc04:	913ba321 	add	x1, x25, #0xee8
  20cc08:	a901dff6 	stp	x22, x23, [sp, #24]
  20cc0c:	a903fbfa 	stp	x26, x30, [sp, #56]
  20cc10:	92801bf6 	mov	x22, #0xffffffffffffff20    	// #-224
  20cc14:	aa0003f8 	mov	x24, x0
  20cc18:	cb0002c0 	sub	x0, x22, x0
  20cc1c:	a941dc33 	ldp	x19, x23, [x1, #24]
  20cc20:	a9428836 	ldp	x22, x2, [x1, #40]
  20cc24:	d10022f7 	sub	x23, x23, #0x8
  20cc28:	d10006d6 	sub	x22, x22, #0x1
  20cc2c:	8a0002d6 	and	x22, x22, x0
  20cc30:	cb020ef7 	sub	x23, x23, x2, lsl #3
  20cc34:	8b160316 	add	x22, x24, x22
  20cc38:	8b17031a 	add	x26, x24, x23
  20cc3c:	b4000233 	cbz	x19, 20cc80 <__copy_tls+0x88>
  20cc40:	f9000bf5 	str	x21, [sp, #16]
  20cc44:	910382d4 	add	x20, x22, #0xe0
  20cc48:	91002355 	add	x21, x26, #0x8
  20cc4c:	f9401660 	ldr	x0, [x19, #40]
  20cc50:	f9400661 	ldr	x1, [x19, #8]
  20cc54:	8b000280 	add	x0, x20, x0
  20cc58:	f80086a0 	str	x0, [x21], #8
  20cc5c:	f9400a62 	ldr	x2, [x19, #16]
  20cc60:	f9401660 	ldr	x0, [x19, #40]
  20cc64:	8b000280 	add	x0, x20, x0
  20cc68:	97fff6fe 	bl	20a860 <memcpy>
  20cc6c:	f9400273 	ldr	x19, [x19]
  20cc70:	b5fffef3 	cbnz	x19, 20cc4c <__copy_tls+0x54>
  20cc74:	913ba339 	add	x25, x25, #0xee8
  20cc78:	f9400bf5 	ldr	x21, [sp, #16]
  20cc7c:	f9401b22 	ldr	x2, [x25, #48]
  20cc80:	f8376b02 	str	x2, [x24, x23]
  20cc84:	aa1603e0 	mov	x0, x22
  20cc88:	f90006da 	str	x26, [x22, #8]
  20cc8c:	f9006eda 	str	x26, [x22, #216]
  20cc90:	a941dff6 	ldp	x22, x23, [sp, #24]
  20cc94:	a942e7f8 	ldp	x24, x25, [sp, #40]
  20cc98:	a943fbfa 	ldp	x26, x30, [sp, #56]
  20cc9c:	a8c553f3 	ldp	x19, x20, [sp], #80
  20cca0:	d65f03c0 	ret
  20cca4:	00000000 	.inst	0x00000000 ; undefined

000000000020cca8 <__init_tls>:
  20cca8:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20ccac:	f9401402 	ldr	x2, [x0, #40]
  20ccb0:	f9400c06 	ldr	x6, [x0, #24]
  20ccb4:	b4000d62 	cbz	x2, 20ce60 <__init_tls+0x1b8>
  20ccb8:	b000004b 	adrp	x11, 215000 <__data_start__>
  20ccbc:	529caa2c 	mov	w12, #0xe551                	// #58705
  20ccc0:	f9401004 	ldr	x4, [x0, #32]
  20ccc4:	aa0603e1 	mov	x1, x6
  20ccc8:	52800009 	mov	w9, #0x0                   	// #0
  20cccc:	b941ed67 	ldr	w7, [x11, #492]
  20ccd0:	d2800005 	mov	x5, #0x0                   	// #0
  20ccd4:	72ac8e8c 	movk	w12, #0x6474, lsl #16
  20ccd8:	d2a0100a 	mov	x10, #0x800000              	// #8388608
  20ccdc:	90000048 	adrp	x8, 214000 <syscall_table+0x800>
  20cce0:	d2800000 	mov	x0, #0x0                   	// #0
  20cce4:	1400000a 	b	20cd0c <__init_tls+0x64>
  20cce8:	7100087f 	cmp	w3, #0x2
  20ccec:	54000761 	b.ne	20cdd8 <__init_tls+0x130>  // b.any
  20ccf0:	f9443103 	ldr	x3, [x8, #2144]
  20ccf4:	b4000063 	cbz	x3, 20cd00 <__init_tls+0x58>
  20ccf8:	f9400820 	ldr	x0, [x1, #16]
  20ccfc:	cb000060 	sub	x0, x3, x0
  20cd00:	8b040021 	add	x1, x1, x4
  20cd04:	f1000442 	subs	x2, x2, #0x1
  20cd08:	54000120 	b.eq	20cd2c <__init_tls+0x84>  // b.none
  20cd0c:	b9400023 	ldr	w3, [x1]
  20cd10:	7100187f 	cmp	w3, #0x6
  20cd14:	54fffea1 	b.ne	20cce8 <__init_tls+0x40>  // b.any
  20cd18:	f9400820 	ldr	x0, [x1, #16]
  20cd1c:	f1000442 	subs	x2, x2, #0x1
  20cd20:	8b040021 	add	x1, x1, x4
  20cd24:	cb0000c0 	sub	x0, x6, x0
  20cd28:	54ffff21 	b.ne	20cd0c <__init_tls+0x64>  // b.any
  20cd2c:	35000aa9 	cbnz	w9, 20ce80 <__init_tls+0x1d8>
  20cd30:	b0000042 	adrp	x2, 215000 <__data_start__>
  20cd34:	b4000985 	cbz	x5, 20ce64 <__init_tls+0x1bc>
  20cd38:	9139c041 	add	x1, x2, #0xe70
  20cd3c:	b0000043 	adrp	x3, 215000 <__data_start__>
  20cd40:	913ba066 	add	x6, x3, #0xee8
  20cd44:	f94008a7 	ldr	x7, [x5, #16]
  20cd48:	f94010a8 	ldr	x8, [x5, #32]
  20cd4c:	f94018a4 	ldr	x4, [x5, #48]
  20cd50:	8b070000 	add	x0, x0, x7
  20cd54:	f94014a5 	ldr	x5, [x5, #40]
  20cd58:	d2800027 	mov	x7, #0x1                   	// #1
  20cd5c:	a900a020 	stp	x0, x8, [x1, #8]
  20cd60:	f9001024 	str	x4, [x1, #32]
  20cd64:	f9000cc1 	str	x1, [x6, #24]
  20cd68:	f90018c7 	str	x7, [x6, #48]
  20cd6c:	9139c042 	add	x2, x2, #0xe70
  20cd70:	8b050000 	add	x0, x0, x5
  20cd74:	d1000481 	sub	x1, x4, #0x1
  20cd78:	cb0003f3 	neg	x19, x0
  20cd7c:	8a010273 	and	x19, x19, x1
  20cd80:	927cec21 	and	x1, x1, #0xfffffffffffffff0
  20cd84:	8b050273 	add	x19, x19, x5
  20cd88:	91004021 	add	x1, x1, #0x10
  20cd8c:	f9000c53 	str	x19, [x2, #24]
  20cd90:	f1001c9f 	cmp	x4, #0x7
  20cd94:	f9001441 	str	x1, [x2, #40]
  20cd98:	8b010273 	add	x19, x19, x1
  20cd9c:	54000269 	b.ls	20cde8 <__init_tls+0x140>  // b.plast
  20cda0:	913ba062 	add	x2, x3, #0xee8
  20cda4:	9103dc81 	add	x1, x4, #0xf7
  20cda8:	8b010273 	add	x19, x19, x1
  20cdac:	b0000040 	adrp	x0, 215000 <__data_start__>
  20cdb0:	927df273 	and	x19, x19, #0xfffffffffffffff8
  20cdb4:	91342000 	add	x0, x0, #0xd08
  20cdb8:	a9021053 	stp	x19, x4, [x2, #32]
  20cdbc:	f105a27f 	cmp	x19, #0x168
  20cdc0:	540002c8 	b.hi	20ce18 <__init_tls+0x170>  // b.pmore
  20cdc4:	97ffff8d 	bl	20cbf8 <__copy_tls>
  20cdc8:	97ffff66 	bl	20cb60 <__init_tp>
  20cdcc:	37f80420 	tbnz	w0, #31, 20ce50 <__init_tls+0x1a8>
  20cdd0:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20cdd4:	d65f03c0 	ret
  20cdd8:	71001c7f 	cmp	w3, #0x7
  20cddc:	54000561 	b.ne	20ce88 <__init_tls+0x1e0>  // b.any
  20cde0:	aa0103e5 	mov	x5, x1
  20cde4:	17ffffc7 	b	20cd00 <__init_tls+0x58>
  20cde8:	d2800100 	mov	x0, #0x8                   	// #8
  20cdec:	f9001040 	str	x0, [x2, #32]
  20cdf0:	913ba062 	add	x2, x3, #0xee8
  20cdf4:	d2801fe1 	mov	x1, #0xff                  	// #255
  20cdf8:	8b010273 	add	x19, x19, x1
  20cdfc:	aa0003e4 	mov	x4, x0
  20ce00:	927df273 	and	x19, x19, #0xfffffffffffffff8
  20ce04:	b0000040 	adrp	x0, 215000 <__data_start__>
  20ce08:	a9021053 	stp	x19, x4, [x2, #32]
  20ce0c:	f105a27f 	cmp	x19, #0x168
  20ce10:	91342000 	add	x0, x0, #0xd08
  20ce14:	54fffd89 	b.ls	20cdc4 <__init_tls+0x11c>  // b.plast
  20ce18:	d2801800 	mov	x0, #0xc0                  	// #192
  20ce1c:	97ffe539 	bl	206300 <get_rtt_syscall>
  20ce20:	aa0003e6 	mov	x6, x0
  20ce24:	b40002a0 	cbz	x0, 20ce78 <__init_tls+0x1d0>
  20ce28:	aa1303e1 	mov	x1, x19
  20ce2c:	d2800005 	mov	x5, #0x0                   	// #0
  20ce30:	92800004 	mov	x4, #0xffffffffffffffff    	// #-1
  20ce34:	d2800443 	mov	x3, #0x22                  	// #34
  20ce38:	d2800062 	mov	x2, #0x3                   	// #3
  20ce3c:	d2800000 	mov	x0, #0x0                   	// #0
  20ce40:	d63f00c0 	blr	x6
  20ce44:	97ffff6d 	bl	20cbf8 <__copy_tls>
  20ce48:	97ffff46 	bl	20cb60 <__init_tp>
  20ce4c:	36fffc20 	tbz	w0, #31, 20cdd0 <__init_tls+0x128>
  20ce50:	d2800000 	mov	x0, #0x0                   	// #0
  20ce54:	3900001f 	strb	wzr, [x0]
  20ce58:	d4207d00 	brk	#0x3e8
  20ce5c:	d503201f 	nop
  20ce60:	b0000042 	adrp	x2, 215000 <__data_start__>
  20ce64:	9139c041 	add	x1, x2, #0xe70
  20ce68:	b0000043 	adrp	x3, 215000 <__data_start__>
  20ce6c:	f9400420 	ldr	x0, [x1, #8]
  20ce70:	a9419025 	ldp	x5, x4, [x1, #24]
  20ce74:	17ffffbe 	b	20cd6c <__init_tls+0xc4>
  20ce78:	d2800000 	mov	x0, #0x0                   	// #0
  20ce7c:	17ffffd2 	b	20cdc4 <__init_tls+0x11c>
  20ce80:	b901ed67 	str	w7, [x11, #492]
  20ce84:	17ffffab 	b	20cd30 <__init_tls+0x88>
  20ce88:	6b0c007f 	cmp	w3, w12
  20ce8c:	54fff3a1 	b.ne	20cd00 <__init_tls+0x58>  // b.any
  20ce90:	f9401423 	ldr	x3, [x1, #40]
  20ce94:	eb27407f 	cmp	x3, w7, uxtw
  20ce98:	54fff349 	b.ls	20cd00 <__init_tls+0x58>  // b.plast
  20ce9c:	f160007f 	cmp	x3, #0x800, lsl #12
  20cea0:	52800029 	mov	w9, #0x1                   	// #1
  20cea4:	9a8a9067 	csel	x7, x3, x10, ls  // ls = plast
  20cea8:	17ffff96 	b	20cd00 <__init_tls+0x58>
  20ceac:	00000000 	.inst	0x00000000 ; undefined

000000000020ceb0 <__reset_tls>:
  20ceb0:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  20ceb4:	a901dff6 	stp	x22, x23, [sp, #24]
  20ceb8:	f90017fe 	str	x30, [sp, #40]
  20cebc:	d53bd057 	mrs	x23, tpidr_el0
  20cec0:	f85282e0 	ldur	x0, [x23, #-216]
  20cec4:	f9400016 	ldr	x22, [x0]
  20cec8:	b40002b6 	cbz	x22, 20cf1c <__reset_tls+0x6c>
  20cecc:	b0000041 	adrp	x1, 215000 <__data_start__>
  20ced0:	d2800034 	mov	x20, #0x1                   	// #1
  20ced4:	f9000bf5 	str	x21, [sp, #16]
  20ced8:	f9478033 	ldr	x19, [x1, #3840]
  20cedc:	14000002 	b	20cee4 <__reset_tls+0x34>
  20cee0:	f85282e0 	ldur	x0, [x23, #-216]
  20cee4:	a9408a61 	ldp	x1, x2, [x19, #8]
  20cee8:	f8747815 	ldr	x21, [x0, x20, lsl #3]
  20ceec:	91000694 	add	x20, x20, #0x1
  20cef0:	aa1503e0 	mov	x0, x21
  20cef4:	97fff65b 	bl	20a860 <memcpy>
  20cef8:	a9410e62 	ldp	x2, x3, [x19, #16]
  20cefc:	52800001 	mov	w1, #0x0                   	// #0
  20cf00:	8b0202a0 	add	x0, x21, x2
  20cf04:	cb020062 	sub	x2, x3, x2
  20cf08:	97fff7a8 	bl	20ada8 <memset>
  20cf0c:	f9400273 	ldr	x19, [x19]
  20cf10:	eb1402df 	cmp	x22, x20
  20cf14:	54fffe62 	b.cs	20cee0 <__reset_tls+0x30>  // b.hs, b.nlast
  20cf18:	f9400bf5 	ldr	x21, [sp, #16]
  20cf1c:	a941dff6 	ldp	x22, x23, [sp, #24]
  20cf20:	f94017fe 	ldr	x30, [sp, #40]
  20cf24:	a8c353f3 	ldp	x19, x20, [sp], #48
  20cf28:	d65f03c0 	ret
  20cf2c:	00000000 	.inst	0x00000000 ; undefined

000000000020cf30 <__init_ssp>:
  20cf30:	b5000140 	cbnz	x0, 20cf58 <__init_ssp+0x28>
  20cf34:	b0000041 	adrp	x1, 215000 <__data_start__>
  20cf38:	d289cda2 	mov	x2, #0x4e6d                	// #20077
  20cf3c:	913da020 	add	x0, x1, #0xf68
  20cf40:	f2a838c2 	movk	x2, #0x41c6, lsl #16
  20cf44:	9b027c00 	mul	x0, x0, x2
  20cf48:	f907b420 	str	x0, [x1, #3944]
  20cf4c:	d53bd041 	mrs	x1, tpidr_el0
  20cf50:	f8148020 	stur	x0, [x1, #-184]
  20cf54:	d65f03c0 	ret
  20cf58:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20cf5c:	b0000053 	adrp	x19, 215000 <__data_start__>
  20cf60:	aa0003e1 	mov	x1, x0
  20cf64:	d2800102 	mov	x2, #0x8                   	// #8
  20cf68:	913da260 	add	x0, x19, #0xf68
  20cf6c:	97fff63d 	bl	20a860 <memcpy>
  20cf70:	f947b660 	ldr	x0, [x19, #3944]
  20cf74:	d53bd041 	mrs	x1, tpidr_el0
  20cf78:	f8148020 	stur	x0, [x1, #-184]
  20cf7c:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20cf80:	d65f03c0 	ret
  20cf84:	00000000 	.inst	0x00000000 ; undefined

000000000020cf88 <__stack_chk_fail>:
  20cf88:	d2800000 	mov	x0, #0x0                   	// #0
  20cf8c:	3900001f 	strb	wzr, [x0]
  20cf90:	d4207d00 	brk	#0x3e8
  20cf94:	00000000 	.inst	0x00000000 ; undefined

000000000020cf98 <_Exit>:
  20cf98:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20cf9c:	93407c13 	sxtw	x19, w0
  20cfa0:	d2801f00 	mov	x0, #0xf8                  	// #248
  20cfa4:	97ffe4d7 	bl	206300 <get_rtt_syscall>
  20cfa8:	b4000080 	cbz	x0, 20cfb8 <_Exit+0x20>
  20cfac:	aa0003e1 	mov	x1, x0
  20cfb0:	aa1303e0 	mov	x0, x19
  20cfb4:	d63f0020 	blr	x1
  20cfb8:	d2800020 	mov	x0, #0x1                   	// #1
  20cfbc:	97ffe4d1 	bl	206300 <get_rtt_syscall>
  20cfc0:	aa0003e1 	mov	x1, x0
  20cfc4:	b4ffffa0 	cbz	x0, 20cfb8 <_Exit+0x20>
  20cfc8:	17fffffa 	b	20cfb0 <_Exit+0x18>
  20cfcc:	00000000 	.inst	0x00000000 ; undefined

000000000020cfd0 <__expand_heap>:
  20cfd0:	a9bc53f3 	stp	x19, x20, [sp, #-64]!
  20cfd4:	b0000054 	adrp	x20, 215000 <__data_start__>
  20cfd8:	913ba282 	add	x2, x20, #0xee8
  20cfdc:	92f00001 	mov	x1, #0x7fffffffffffffff    	// #9223372036854775807
  20cfe0:	f9000bf5 	str	x21, [sp, #16]
  20cfe4:	aa0003f5 	mov	x21, x0
  20cfe8:	f90017fe 	str	x30, [sp, #40]
  20cfec:	f9401c40 	ldr	x0, [x2, #56]
  20cff0:	f94002a2 	ldr	x2, [x21]
  20cff4:	cb000021 	sub	x1, x1, x0
  20cff8:	eb02003f 	cmp	x1, x2
  20cffc:	54000b23 	b.cc	20d160 <__expand_heap+0x190>  // b.lo, b.ul, b.last
  20d000:	f9000ff6 	str	x22, [sp, #24]
  20d004:	90000056 	adrp	x22, 215000 <__data_start__>
  20d008:	d1000401 	sub	x1, x0, #0x1
  20d00c:	cb0203f3 	neg	x19, x2
  20d010:	f94752c0 	ldr	x0, [x22, #3744]
  20d014:	8a010273 	and	x19, x19, x1
  20d018:	8b020273 	add	x19, x19, x2
  20d01c:	b40007e0 	cbz	x0, 20d118 <__expand_heap+0x148>
  20d020:	aa2003e1 	mvn	x1, x0
  20d024:	eb13003f 	cmp	x1, x19
  20d028:	540003c8 	b.hi	20d0a0 <__expand_heap+0xd0>  // b.pmore
  20d02c:	90000056 	adrp	x22, 215000 <__data_start__>
  20d030:	913ba294 	add	x20, x20, #0xee8
  20d034:	d2800005 	mov	x5, #0x0                   	// #0
  20d038:	12800004 	mov	w4, #0xffffffff            	// #-1
  20d03c:	b94eaac6 	ldr	w6, [x22, #3752]
  20d040:	52800443 	mov	w3, #0x22                  	// #34
  20d044:	f9401e81 	ldr	x1, [x20, #56]
  20d048:	52800062 	mov	w2, #0x3                   	// #3
  20d04c:	d2800000 	mov	x0, #0x0                   	// #0
  20d050:	53017cc6 	lsr	w6, w6, #1
  20d054:	9ac62021 	lsl	x1, x1, x6
  20d058:	eb13003f 	cmp	x1, x19
  20d05c:	9a932033 	csel	x19, x1, x19, cs  // cs = hs, nlast
  20d060:	aa1303e1 	mov	x1, x19
  20d064:	97ffea81 	bl	207a68 <__mmap>
  20d068:	aa0003e1 	mov	x1, x0
  20d06c:	b100041f 	cmn	x0, #0x1
  20d070:	54000840 	b.eq	20d178 <__expand_heap+0x1a8>  // b.none
  20d074:	b94eaac0 	ldr	w0, [x22, #3752]
  20d078:	11000400 	add	w0, w0, #0x1
  20d07c:	b90eaac0 	str	w0, [x22, #3752]
  20d080:	f9400ff6 	ldr	x22, [sp, #24]
  20d084:	f90002b3 	str	x19, [x21]
  20d088:	f9400bf5 	ldr	x21, [sp, #16]
  20d08c:	aa0103e0 	mov	x0, x1
  20d090:	f94017fe 	ldr	x30, [sp, #40]
  20d094:	a8c453f3 	ldp	x19, x20, [sp], #64
  20d098:	d65f03c0 	ret
  20d09c:	d503201f 	nop
  20d0a0:	913ba282 	add	x2, x20, #0xee8
  20d0a4:	d2a01001 	mov	x1, #0x800000              	// #8388608
  20d0a8:	f9400842 	ldr	x2, [x2, #16]
  20d0ac:	f90013f7 	str	x23, [sp, #32]
  20d0b0:	8b000277 	add	x23, x19, x0
  20d0b4:	eb01005f 	cmp	x2, x1
  20d0b8:	9a812043 	csel	x3, x2, x1, cs  // cs = hs, nlast
  20d0bc:	d1600063 	sub	x3, x3, #0x800, lsl #12
  20d0c0:	eb0302ff 	cmp	x23, x3
  20d0c4:	fa408040 	ccmp	x2, x0, #0x0, hi  // hi = pmore
  20d0c8:	54000248 	b.hi	20d110 <__expand_heap+0x140>  // b.pmore
  20d0cc:	9100e3e2 	add	x2, sp, #0x38
  20d0d0:	eb01005f 	cmp	x2, x1
  20d0d4:	9a812041 	csel	x1, x2, x1, cs  // cs = hs, nlast
  20d0d8:	d1600021 	sub	x1, x1, #0x800, lsl #12
  20d0dc:	eb0102ff 	cmp	x23, x1
  20d0e0:	fa408040 	ccmp	x2, x0, #0x0, hi  // hi = pmore
  20d0e4:	54000168 	b.hi	20d110 <__expand_heap+0x140>  // b.pmore
  20d0e8:	d28005a0 	mov	x0, #0x2d                  	// #45
  20d0ec:	97ffe485 	bl	206300 <get_rtt_syscall>
  20d0f0:	aa0003e1 	mov	x1, x0
  20d0f4:	b4000520 	cbz	x0, 20d198 <__expand_heap+0x1c8>
  20d0f8:	aa1703e0 	mov	x0, x23
  20d0fc:	d63f0020 	blr	x1
  20d100:	f94752c1 	ldr	x1, [x22, #3744]
  20d104:	8b130022 	add	x2, x1, x19
  20d108:	eb00005f 	cmp	x2, x0
  20d10c:	54000220 	b.eq	20d150 <__expand_heap+0x180>  // b.none
  20d110:	f94013f7 	ldr	x23, [sp, #32]
  20d114:	17ffffc6 	b	20d02c <__expand_heap+0x5c>
  20d118:	d28005a0 	mov	x0, #0x2d                  	// #45
  20d11c:	97ffe479 	bl	206300 <get_rtt_syscall>
  20d120:	aa0003e1 	mov	x1, x0
  20d124:	b4000320 	cbz	x0, 20d188 <__expand_heap+0x1b8>
  20d128:	d2800000 	mov	x0, #0x0                   	// #0
  20d12c:	d63f0020 	blr	x1
  20d130:	cb0003e2 	neg	x2, x0
  20d134:	913ba281 	add	x1, x20, #0xee8
  20d138:	f9401c21 	ldr	x1, [x1, #56]
  20d13c:	d1000421 	sub	x1, x1, #0x1
  20d140:	8a020021 	and	x1, x1, x2
  20d144:	8b000020 	add	x0, x1, x0
  20d148:	f90752c0 	str	x0, [x22, #3744]
  20d14c:	17ffffb5 	b	20d020 <__expand_heap+0x50>
  20d150:	f90752c0 	str	x0, [x22, #3744]
  20d154:	a941dff6 	ldp	x22, x23, [sp, #24]
  20d158:	f90002b3 	str	x19, [x21]
  20d15c:	17ffffcb 	b	20d088 <__expand_heap+0xb8>
  20d160:	97ffd8f0 	bl	203520 <__errno_location>
  20d164:	52800182 	mov	w2, #0xc                   	// #12
  20d168:	d2800001 	mov	x1, #0x0                   	// #0
  20d16c:	b9000002 	str	w2, [x0]
  20d170:	17ffffc6 	b	20d088 <__expand_heap+0xb8>
  20d174:	d503201f 	nop
  20d178:	d2800001 	mov	x1, #0x0                   	// #0
  20d17c:	f9400ff6 	ldr	x22, [sp, #24]
  20d180:	17ffffc2 	b	20d088 <__expand_heap+0xb8>
  20d184:	d503201f 	nop
  20d188:	d2800002 	mov	x2, #0x0                   	// #0
  20d18c:	d2800000 	mov	x0, #0x0                   	// #0
  20d190:	17ffffe9 	b	20d134 <__expand_heap+0x164>
  20d194:	d503201f 	nop
  20d198:	d2800000 	mov	x0, #0x0                   	// #0
  20d19c:	17ffffd9 	b	20d100 <__expand_heap+0x130>

000000000020d1a0 <__fpclassifyl>:
  20d1a0:	9eae0003 	fmov	x3, v0.d[1]
  20d1a4:	9e660002 	fmov	x2, d0
  20d1a8:	aa0303e0 	mov	x0, x3
  20d1ac:	9240bc63 	and	x3, x3, #0xffffffffffff
  20d1b0:	d370f801 	ubfx	x1, x0, #48, #15
  20d1b4:	350000e1 	cbnz	w1, 20d1d0 <__fpclassifyl+0x30>
  20d1b8:	aa020062 	orr	x2, x3, x2
  20d1bc:	f100005f 	cmp	x2, #0x0
  20d1c0:	1a9f07e0 	cset	w0, ne  // ne = any
  20d1c4:	11000800 	add	w0, w0, #0x2
  20d1c8:	d65f03c0 	ret
  20d1cc:	d503201f 	nop
  20d1d0:	528fffe4 	mov	w4, #0x7fff                	// #32767
  20d1d4:	52800080 	mov	w0, #0x4                   	// #4
  20d1d8:	6b04003f 	cmp	w1, w4
  20d1dc:	54ffff61 	b.ne	20d1c8 <__fpclassifyl+0x28>  // b.any
  20d1e0:	aa020062 	orr	x2, x3, x2
  20d1e4:	f100005f 	cmp	x2, #0x0
  20d1e8:	1a9f17e0 	cset	w0, eq  // eq = none
  20d1ec:	d65f03c0 	ret

000000000020d1f0 <__signbitl>:
  20d1f0:	9eae0001 	fmov	x1, v0.d[1]
  20d1f4:	d370fc20 	lsr	x0, x1, #48
  20d1f8:	530f7c00 	lsr	w0, w0, #15
  20d1fc:	d65f03c0 	ret

000000000020d200 <frexpl>:
  20d200:	9eae0003 	fmov	x3, v0.d[1]
  20d204:	9e660002 	fmov	x2, d0
  20d208:	d370fc61 	lsr	x1, x3, #48
  20d20c:	72003824 	ands	w4, w1, #0x7fff
  20d210:	54000201 	b.ne	20d250 <frexpl+0x50>  // b.any
  20d214:	6f00e401 	movi	v1.2d, #0x0
  20d218:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20d21c:	aa0003f3 	mov	x19, x0
  20d220:	aa0203f4 	mov	x20, x2
  20d224:	a9017bf5 	stp	x21, x30, [sp, #16]
  20d228:	aa0303f5 	mov	x21, x3
  20d22c:	94000b37 	bl	20ff08 <__eqtf2>
  20d230:	35000340 	cbnz	w0, 20d298 <frexpl+0x98>
  20d234:	9e670281 	fmov	d1, x20
  20d238:	b900027f 	str	wzr, [x19]
  20d23c:	9eaf02a1 	fmov	v1.d[1], x21
  20d240:	4ea11c20 	mov	v0.16b, v1.16b
  20d244:	a9417bf5 	ldp	x21, x30, [sp, #16]
  20d248:	a8c253f3 	ldp	x19, x20, [sp], #32
  20d24c:	d65f03c0 	ret
  20d250:	9e670041 	fmov	d1, x2
  20d254:	528fffe5 	mov	w5, #0x7fff                	// #32767
  20d258:	6b05009f 	cmp	w4, w5
  20d25c:	9eaf0061 	fmov	v1.d[1], x3
  20d260:	54000160 	b.eq	20d28c <frexpl+0x8c>  // b.none
  20d264:	12114021 	and	w1, w1, #0xffff8000
  20d268:	aa0203e6 	mov	x6, x2
  20d26c:	aa0303e7 	mov	x7, x3
  20d270:	321f3021 	orr	w1, w1, #0x3ffe
  20d274:	9e6700c1 	fmov	d1, x6
  20d278:	1287ffa2 	mov	w2, #0xffffc002            	// #-16382
  20d27c:	b3503c27 	bfi	x7, x1, #48, #16
  20d280:	0b020084 	add	w4, w4, w2
  20d284:	9eaf00e1 	fmov	v1.d[1], x7
  20d288:	b9000004 	str	w4, [x0]
  20d28c:	4ea11c20 	mov	v0.16b, v1.16b
  20d290:	d65f03c0 	ret
  20d294:	d503201f 	nop
  20d298:	f0000020 	adrp	x0, 214000 <syscall_table+0x800>
  20d29c:	9121c000 	add	x0, x0, #0x870
  20d2a0:	9e670280 	fmov	d0, x20
  20d2a4:	3dc00001 	ldr	q1, [x0]
  20d2a8:	9eaf02a0 	fmov	v0.d[1], x21
  20d2ac:	94000b5b 	bl	210018 <__multf3>
  20d2b0:	aa1303e0 	mov	x0, x19
  20d2b4:	97ffffd3 	bl	20d200 <frexpl>
  20d2b8:	b9400260 	ldr	w0, [x19]
  20d2bc:	4ea01c01 	mov	v1.16b, v0.16b
  20d2c0:	5101e000 	sub	w0, w0, #0x78
  20d2c4:	b9000260 	str	w0, [x19]
  20d2c8:	17ffffde 	b	20d240 <frexpl+0x40>
  20d2cc:	00000000 	.inst	0x00000000 ; undefined

000000000020d2d0 <__mprotect>:
  20d2d0:	90000044 	adrp	x4, 215000 <__data_start__>
  20d2d4:	aa0003e3 	mov	x3, x0
  20d2d8:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20d2dc:	d2800fa0 	mov	x0, #0x7d                  	// #125
  20d2e0:	f9479084 	ldr	x4, [x4, #3872]
  20d2e4:	a9017bf5 	stp	x21, x30, [sp, #16]
  20d2e8:	93407c55 	sxtw	x21, w2
  20d2ec:	d1000485 	sub	x5, x4, #0x1
  20d2f0:	cb0403e4 	neg	x4, x4
  20d2f4:	8b0100a1 	add	x1, x5, x1
  20d2f8:	8a040074 	and	x20, x3, x4
  20d2fc:	8b010061 	add	x1, x3, x1
  20d300:	8a040021 	and	x1, x1, x4
  20d304:	cb140033 	sub	x19, x1, x20
  20d308:	97ffe3fe 	bl	206300 <get_rtt_syscall>
  20d30c:	b4000160 	cbz	x0, 20d338 <__mprotect+0x68>
  20d310:	aa0003e3 	mov	x3, x0
  20d314:	aa1503e2 	mov	x2, x21
  20d318:	aa1303e1 	mov	x1, x19
  20d31c:	aa1403e0 	mov	x0, x20
  20d320:	d63f0060 	blr	x3
  20d324:	97ffe427 	bl	2063c0 <__syscall_ret>
  20d328:	a9417bf5 	ldp	x21, x30, [sp, #16]
  20d32c:	a8c253f3 	ldp	x19, x20, [sp], #32
  20d330:	d65f03c0 	ret
  20d334:	d503201f 	nop
  20d338:	d2800000 	mov	x0, #0x0                   	// #0
  20d33c:	17fffffa 	b	20d324 <__mprotect+0x54>

000000000020d340 <wctomb>:
  20d340:	b40000c0 	cbz	x0, 20d358 <wctomb+0x18>
  20d344:	f81f0ffe 	str	x30, [sp, #-16]!
  20d348:	d2800002 	mov	x2, #0x0                   	// #0
  20d34c:	94000739 	bl	20f030 <wcrtomb>
  20d350:	f84107fe 	ldr	x30, [sp], #16
  20d354:	d65f03c0 	ret
  20d358:	52800000 	mov	w0, #0x0                   	// #0
  20d35c:	d65f03c0 	ret

000000000020d360 <_longjmp>:
  20d360:	a9405013 	ldp	x19, x20, [x0]
  20d364:	a9415815 	ldp	x21, x22, [x0, #16]
  20d368:	a9426017 	ldp	x23, x24, [x0, #32]
  20d36c:	a9436819 	ldp	x25, x26, [x0, #48]
  20d370:	a944701b 	ldp	x27, x28, [x0, #64]
  20d374:	a945781d 	ldp	x29, x30, [x0, #80]
  20d378:	f9403402 	ldr	x2, [x0, #104]
  20d37c:	9100005f 	mov	sp, x2
  20d380:	6d472408 	ldp	d8, d9, [x0, #112]
  20d384:	6d482c0a 	ldp	d10, d11, [x0, #128]
  20d388:	6d49340c 	ldp	d12, d13, [x0, #144]
  20d38c:	6d4a3c0e 	ldp	d14, d15, [x0, #160]
  20d390:	aa0103e0 	mov	x0, x1
  20d394:	b5000041 	cbnz	x1, 20d39c <_longjmp+0x3c>
  20d398:	d2800020 	mov	x0, #0x1                   	// #1
  20d39c:	d61f03c0 	br	x30

000000000020d3a0 <__setjmp>:
  20d3a0:	a9005013 	stp	x19, x20, [x0]
  20d3a4:	a9015815 	stp	x21, x22, [x0, #16]
  20d3a8:	a9026017 	stp	x23, x24, [x0, #32]
  20d3ac:	a9036819 	stp	x25, x26, [x0, #48]
  20d3b0:	a904701b 	stp	x27, x28, [x0, #64]
  20d3b4:	a905781d 	stp	x29, x30, [x0, #80]
  20d3b8:	910003e2 	mov	x2, sp
  20d3bc:	f9003402 	str	x2, [x0, #104]
  20d3c0:	6d072408 	stp	d8, d9, [x0, #112]
  20d3c4:	6d082c0a 	stp	d10, d11, [x0, #128]
  20d3c8:	6d09340c 	stp	d12, d13, [x0, #144]
  20d3cc:	6d0a3c0e 	stp	d14, d15, [x0, #160]
  20d3d0:	d2800000 	mov	x0, #0x0                   	// #0
  20d3d4:	d65f03c0 	ret

000000000020d3d8 <__block_all_sigs>:
  20d3d8:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20d3dc:	f0000021 	adrp	x1, 214000 <syscall_table+0x800>
  20d3e0:	aa0003f4 	mov	x20, x0
  20d3e4:	91220033 	add	x19, x1, #0x880
  20d3e8:	f9000bfe 	str	x30, [sp, #16]
  20d3ec:	d28015e0 	mov	x0, #0xaf                  	// #175
  20d3f0:	97ffe3c4 	bl	206300 <get_rtt_syscall>
  20d3f4:	b4000120 	cbz	x0, 20d418 <__block_all_sigs+0x40>
  20d3f8:	aa1403e2 	mov	x2, x20
  20d3fc:	aa1303e1 	mov	x1, x19
  20d400:	f9400bfe 	ldr	x30, [sp, #16]
  20d404:	aa0003e4 	mov	x4, x0
  20d408:	a8c253f3 	ldp	x19, x20, [sp], #32
  20d40c:	d2800103 	mov	x3, #0x8                   	// #8
  20d410:	d2800000 	mov	x0, #0x0                   	// #0
  20d414:	d61f0080 	br	x4
  20d418:	f9400bfe 	ldr	x30, [sp, #16]
  20d41c:	a8c253f3 	ldp	x19, x20, [sp], #32
  20d420:	d65f03c0 	ret
  20d424:	00000000 	.inst	0x00000000 ; undefined

000000000020d428 <__block_app_sigs>:
  20d428:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20d42c:	f0000021 	adrp	x1, 214000 <syscall_table+0x800>
  20d430:	aa0003f4 	mov	x20, x0
  20d434:	91222033 	add	x19, x1, #0x888
  20d438:	f9000bfe 	str	x30, [sp, #16]
  20d43c:	d28015e0 	mov	x0, #0xaf                  	// #175
  20d440:	97ffe3b0 	bl	206300 <get_rtt_syscall>
  20d444:	b4000120 	cbz	x0, 20d468 <__block_app_sigs+0x40>
  20d448:	aa1403e2 	mov	x2, x20
  20d44c:	aa1303e1 	mov	x1, x19
  20d450:	f9400bfe 	ldr	x30, [sp, #16]
  20d454:	aa0003e4 	mov	x4, x0
  20d458:	a8c253f3 	ldp	x19, x20, [sp], #32
  20d45c:	d2800103 	mov	x3, #0x8                   	// #8
  20d460:	d2800000 	mov	x0, #0x0                   	// #0
  20d464:	d61f0080 	br	x4
  20d468:	f9400bfe 	ldr	x30, [sp, #16]
  20d46c:	a8c253f3 	ldp	x19, x20, [sp], #32
  20d470:	d65f03c0 	ret
  20d474:	00000000 	.inst	0x00000000 ; undefined

000000000020d478 <__restore_sigs>:
  20d478:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20d47c:	aa0003f3 	mov	x19, x0
  20d480:	d28015e0 	mov	x0, #0xaf                  	// #175
  20d484:	97ffe39f 	bl	206300 <get_rtt_syscall>
  20d488:	b4000100 	cbz	x0, 20d4a8 <__restore_sigs+0x30>
  20d48c:	aa1303e1 	mov	x1, x19
  20d490:	aa0003e4 	mov	x4, x0
  20d494:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20d498:	d2800103 	mov	x3, #0x8                   	// #8
  20d49c:	d2800002 	mov	x2, #0x0                   	// #0
  20d4a0:	d2800040 	mov	x0, #0x2                   	// #2
  20d4a4:	d61f0080 	br	x4
  20d4a8:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20d4ac:	d65f03c0 	ret

000000000020d4b0 <__get_handler_set>:
  20d4b0:	90000041 	adrp	x1, 215000 <__data_start__>
  20d4b4:	d2800102 	mov	x2, #0x8                   	// #8
  20d4b8:	913ae021 	add	x1, x1, #0xeb8
  20d4bc:	17fff4e9 	b	20a860 <memcpy>

000000000020d4c0 <__libc_sigaction>:
  20d4c0:	a9b753f3 	stp	x19, x20, [sp, #-144]!
  20d4c4:	7100181f 	cmp	w0, #0x6
  20d4c8:	aa0203f4 	mov	x20, x2
  20d4cc:	1a9f17f3 	cset	w19, eq  // eq = none
  20d4d0:	a9015bf5 	stp	x21, x22, [sp, #16]
  20d4d4:	aa0103f6 	mov	x22, x1
  20d4d8:	a90263f7 	stp	x23, x24, [sp, #32]
  20d4dc:	93407c15 	sxtw	x21, w0
  20d4e0:	f9001bfe 	str	x30, [sp, #48]
  20d4e4:	d2800017 	mov	x23, #0x0                   	// #0
  20d4e8:	b4000761 	cbz	x1, 20d5d4 <__libc_sigaction+0x114>
  20d4ec:	f9400021 	ldr	x1, [x1]
  20d4f0:	f100043f 	cmp	x1, #0x1
  20d4f4:	540004a9 	b.ls	20d588 <__libc_sigaction+0xc8>  // b.plast
  20d4f8:	51000401 	sub	w1, w0, #0x1
  20d4fc:	d2800022 	mov	x2, #0x1                   	// #1
  20d500:	12001423 	and	w3, w1, #0x3f
  20d504:	90000040 	adrp	x0, 215000 <__data_start__>
  20d508:	93437c21 	sbfx	x1, x1, #3, #29
  20d50c:	913ae000 	add	x0, x0, #0xeb8
  20d510:	927de421 	and	x1, x1, #0x1ffffffffffffff8
  20d514:	9ac32042 	lsl	x2, x2, x3
  20d518:	8b010000 	add	x0, x0, x1
  20d51c:	340000c2 	cbz	w2, 20d534 <__libc_sigaction+0x74>
  20d520:	2a0203e4 	mov	w4, w2
  20d524:	885ffc01 	ldaxr	w1, [x0]
  20d528:	2a010081 	orr	w1, w4, w1
  20d52c:	8803fc01 	stlxr	w3, w1, [x0]
  20d530:	35ffffa3 	cbnz	w3, 20d524 <__libc_sigaction+0x64>
  20d534:	d360fc42 	lsr	x2, x2, #32
  20d538:	b40000c2 	cbz	x2, 20d550 <__libc_sigaction+0x90>
  20d53c:	91001000 	add	x0, x0, #0x4
  20d540:	885ffc01 	ldaxr	w1, [x0]
  20d544:	2a010041 	orr	w1, w2, w1
  20d548:	8803fc01 	stlxr	w3, w1, [x0]
  20d54c:	35ffffa3 	cbnz	w3, 20d540 <__libc_sigaction+0x80>
  20d550:	90000040 	adrp	x0, 215000 <__data_start__>
  20d554:	b94eec00 	ldr	w0, [x0, #3820]
  20d558:	35000080 	cbnz	w0, 20d568 <__libc_sigaction+0xa8>
  20d55c:	90000057 	adrp	x23, 215000 <__data_start__>
  20d560:	b94ec2e0 	ldr	w0, [x23, #3776]
  20d564:	340008e0 	cbz	w0, 20d680 <__libc_sigaction+0x1c0>
  20d568:	b9408ac0 	ldr	w0, [x22, #136]
  20d56c:	37e000c0 	tbnz	w0, #28, 20d584 <__libc_sigaction+0xc4>
  20d570:	d5033bbf 	dmb	ish
  20d574:	90000040 	adrp	x0, 215000 <__data_start__>
  20d578:	52800021 	mov	w1, #0x1                   	// #1
  20d57c:	b90f7001 	str	w1, [x0, #3952]
  20d580:	d5033bbf 	dmb	ish
  20d584:	f94002c1 	ldr	x1, [x22]
  20d588:	f100003f 	cmp	x1, #0x0
  20d58c:	1a9f1260 	csel	w0, w19, wzr, ne  // ne = any
  20d590:	35000980 	cbnz	w0, 20d6c0 <__libc_sigaction+0x200>
  20d594:	b9408ac4 	ldr	w4, [x22, #136]
  20d598:	d0000000 	adrp	x0, 20f000 <__vdsosym+0x270>
  20d59c:	91059003 	add	x3, x0, #0x164
  20d5a0:	d0000000 	adrp	x0, 20f000 <__vdsosym+0x270>
  20d5a4:	32060082 	orr	w2, w4, #0x4000000
  20d5a8:	91059000 	add	x0, x0, #0x164
  20d5ac:	f27e009f 	tst	x4, #0x4
  20d5b0:	93407c42 	sxtw	x2, w2
  20d5b4:	9a830000 	csel	x0, x0, x3, eq  // eq = none
  20d5b8:	910143f7 	add	x23, sp, #0x50
  20d5bc:	a9050be1 	stp	x1, x2, [sp, #80]
  20d5c0:	d2800102 	mov	x2, #0x8                   	// #8
  20d5c4:	f90033e0 	str	x0, [sp, #96]
  20d5c8:	8b0202c1 	add	x1, x22, x2
  20d5cc:	910062e0 	add	x0, x23, #0x18
  20d5d0:	97fff4a4 	bl	20a860 <memcpy>
  20d5d4:	f100029f 	cmp	x20, #0x0
  20d5d8:	9101c3e2 	add	x2, sp, #0x70
  20d5dc:	9a9f1058 	csel	x24, x2, xzr, ne  // ne = any
  20d5e0:	d28015c0 	mov	x0, #0xae                  	// #174
  20d5e4:	97ffe347 	bl	206300 <get_rtt_syscall>
  20d5e8:	aa0003e4 	mov	x4, x0
  20d5ec:	b40007a0 	cbz	x0, 20d6e0 <__libc_sigaction+0x220>
  20d5f0:	aa1703e1 	mov	x1, x23
  20d5f4:	aa1503e0 	mov	x0, x21
  20d5f8:	d2800103 	mov	x3, #0x8                   	// #8
  20d5fc:	aa1803e2 	mov	x2, x24
  20d600:	d63f0080 	blr	x4
  20d604:	7100001f 	cmp	w0, #0x0
  20d608:	93407c15 	sxtw	x21, w0
  20d60c:	1a9f17f7 	cset	w23, eq  // eq = none
  20d610:	f10002df 	cmp	x22, #0x0
  20d614:	1a9f1273 	csel	w19, w19, wzr, ne  // ne = any
  20d618:	34000113 	cbz	w19, 20d638 <__libc_sigaction+0x178>
  20d61c:	f94002c0 	ldr	x0, [x22]
  20d620:	b40000c0 	cbz	x0, 20d638 <__libc_sigaction+0x178>
  20d624:	90000040 	adrp	x0, 215000 <__data_start__>
  20d628:	913ac000 	add	x0, x0, #0xeb0
  20d62c:	97fff83b 	bl	20b718 <__unlock>
  20d630:	910103e0 	add	x0, sp, #0x40
  20d634:	97ffff91 	bl	20d478 <__restore_sigs>
  20d638:	f100029f 	cmp	x20, #0x0
  20d63c:	1a9f12f7 	csel	w23, w23, wzr, ne  // ne = any
  20d640:	34000117 	cbz	w23, 20d660 <__libc_sigaction+0x1a0>
  20d644:	a94703e1 	ldp	x1, x0, [sp, #112]
  20d648:	f9000281 	str	x1, [x20]
  20d64c:	b9008a80 	str	w0, [x20, #136]
  20d650:	d2800102 	mov	x2, #0x8                   	// #8
  20d654:	910223e1 	add	x1, sp, #0x88
  20d658:	8b020280 	add	x0, x20, x2
  20d65c:	97fff481 	bl	20a860 <memcpy>
  20d660:	aa1503e0 	mov	x0, x21
  20d664:	97ffe357 	bl	2063c0 <__syscall_ret>
  20d668:	f9401bfe 	ldr	x30, [sp, #48]
  20d66c:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20d670:	a94263f7 	ldp	x23, x24, [sp, #32]
  20d674:	a8c953f3 	ldp	x19, x20, [sp], #144
  20d678:	d65f03c0 	ret
  20d67c:	d503201f 	nop
  20d680:	910243f8 	add	x24, sp, #0x90
  20d684:	d2c00061 	mov	x1, #0x300000000           	// #12884901888
  20d688:	d28015e0 	mov	x0, #0xaf                  	// #175
  20d68c:	f81b8f01 	str	x1, [x24, #-72]!
  20d690:	97ffe31c 	bl	206300 <get_rtt_syscall>
  20d694:	aa0003e4 	mov	x4, x0
  20d698:	b40000c0 	cbz	x0, 20d6b0 <__libc_sigaction+0x1f0>
  20d69c:	d2800103 	mov	x3, #0x8                   	// #8
  20d6a0:	d2800002 	mov	x2, #0x0                   	// #0
  20d6a4:	aa1803e1 	mov	x1, x24
  20d6a8:	d2800020 	mov	x0, #0x1                   	// #1
  20d6ac:	d63f0080 	blr	x4
  20d6b0:	52800020 	mov	w0, #0x1                   	// #1
  20d6b4:	b90ec2e0 	str	w0, [x23, #3776]
  20d6b8:	17ffffac 	b	20d568 <__libc_sigaction+0xa8>
  20d6bc:	d503201f 	nop
  20d6c0:	910103e0 	add	x0, sp, #0x40
  20d6c4:	97ffff45 	bl	20d3d8 <__block_all_sigs>
  20d6c8:	90000040 	adrp	x0, 215000 <__data_start__>
  20d6cc:	913ac000 	add	x0, x0, #0xeb0
  20d6d0:	97fff7ba 	bl	20b5b8 <__lock>
  20d6d4:	f94002c1 	ldr	x1, [x22]
  20d6d8:	17ffffaf 	b	20d594 <__libc_sigaction+0xd4>
  20d6dc:	d503201f 	nop
  20d6e0:	d2800015 	mov	x21, #0x0                   	// #0
  20d6e4:	52800037 	mov	w23, #0x1                   	// #1
  20d6e8:	17ffffca 	b	20d610 <__libc_sigaction+0x150>
  20d6ec:	00000000 	.inst	0x00000000 ; undefined

000000000020d6f0 <__sigaction>:
  20d6f0:	51000404 	sub	w4, w0, #0x1
  20d6f4:	51008003 	sub	w3, w0, #0x20
  20d6f8:	7100fc9f 	cmp	w4, #0x3f
  20d6fc:	7a429860 	ccmp	w3, #0x2, #0x0, ls  // ls = plast
  20d700:	54000049 	b.ls	20d708 <__sigaction+0x18>  // b.plast
  20d704:	17ffff6f 	b	20d4c0 <__libc_sigaction>
  20d708:	f81f0ffe 	str	x30, [sp, #-16]!
  20d70c:	97ffd785 	bl	203520 <__errno_location>
  20d710:	528002c1 	mov	w1, #0x16                  	// #22
  20d714:	b9000001 	str	w1, [x0]
  20d718:	12800000 	mov	w0, #0xffffffff            	// #-1
  20d71c:	f84107fe 	ldr	x30, [sp], #16
  20d720:	d65f03c0 	ret
  20d724:	00000000 	.inst	0x00000000 ; undefined

000000000020d728 <sigwaitinfo>:
  20d728:	d2800002 	mov	x2, #0x0                   	// #0
  20d72c:	14000691 	b	20f170 <sigtimedwait>

000000000020d730 <__lockfile>:
  20d730:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20d734:	d53bd041 	mrs	x1, tpidr_el0
  20d738:	f9000ffe 	str	x30, [sp, #24]
  20d73c:	b8558034 	ldur	w20, [x1, #-168]
  20d740:	b9408c01 	ldr	w1, [x0, #140]
  20d744:	12017821 	and	w1, w1, #0xbfffffff
  20d748:	6b14003f 	cmp	w1, w20
  20d74c:	540006e0 	b.eq	20d828 <__lockfile+0xf8>  // b.none
  20d750:	91023013 	add	x19, x0, #0x8c
  20d754:	14000003 	b	20d760 <__lockfile+0x30>
  20d758:	8800fe74 	stlxr	w0, w20, [x19]
  20d75c:	340004c0 	cbz	w0, 20d7f4 <__lockfile+0xc4>
  20d760:	885ffe60 	ldaxr	w0, [x19]
  20d764:	34ffffa0 	cbz	w0, 20d758 <__lockfile+0x28>
  20d768:	f9000bf5 	str	x21, [sp, #16]
  20d76c:	d5033bbf 	dmb	ish
  20d770:	32020294 	orr	w20, w20, #0x40000000
  20d774:	14000003 	b	20d780 <__lockfile+0x50>
  20d778:	8800fe74 	stlxr	w0, w20, [x19]
  20d77c:	340003a0 	cbz	w0, 20d7f0 <__lockfile+0xc0>
  20d780:	885ffe60 	ldaxr	w0, [x19]
  20d784:	34ffffa0 	cbz	w0, 20d778 <__lockfile+0x48>
  20d788:	d5033bbf 	dmb	ish
  20d78c:	32020002 	orr	w2, w0, #0x40000000
  20d790:	36f00400 	tbz	w0, #30, 20d810 <__lockfile+0xe0>
  20d794:	93407c55 	sxtw	x21, w2
  20d798:	d2801e00 	mov	x0, #0xf0                  	// #240
  20d79c:	97ffe2d9 	bl	206300 <get_rtt_syscall>
  20d7a0:	aa0003e4 	mov	x4, x0
  20d7a4:	b4fffee0 	cbz	x0, 20d780 <__lockfile+0x50>
  20d7a8:	d2800003 	mov	x3, #0x0                   	// #0
  20d7ac:	aa1503e2 	mov	x2, x21
  20d7b0:	d2801001 	mov	x1, #0x80                  	// #128
  20d7b4:	aa1303e0 	mov	x0, x19
  20d7b8:	d63f0080 	blr	x4
  20d7bc:	b100981f 	cmn	x0, #0x26
  20d7c0:	54fffe01 	b.ne	20d780 <__lockfile+0x50>  // b.any
  20d7c4:	d2801e00 	mov	x0, #0xf0                  	// #240
  20d7c8:	97ffe2ce 	bl	206300 <get_rtt_syscall>
  20d7cc:	aa0003e4 	mov	x4, x0
  20d7d0:	b4fffd80 	cbz	x0, 20d780 <__lockfile+0x50>
  20d7d4:	d2800003 	mov	x3, #0x0                   	// #0
  20d7d8:	aa1503e2 	mov	x2, x21
  20d7dc:	d2800001 	mov	x1, #0x0                   	// #0
  20d7e0:	aa1303e0 	mov	x0, x19
  20d7e4:	d63f0080 	blr	x4
  20d7e8:	17ffffe6 	b	20d780 <__lockfile+0x50>
  20d7ec:	d503201f 	nop
  20d7f0:	f9400bf5 	ldr	x21, [sp, #16]
  20d7f4:	52800020 	mov	w0, #0x1                   	// #1
  20d7f8:	f9400ffe 	ldr	x30, [sp, #24]
  20d7fc:	a8c253f3 	ldp	x19, x20, [sp], #32
  20d800:	d65f03c0 	ret
  20d804:	d503201f 	nop
  20d808:	8801fe62 	stlxr	w1, w2, [x19]
  20d80c:	34fffc41 	cbz	w1, 20d794 <__lockfile+0x64>
  20d810:	885ffe61 	ldaxr	w1, [x19]
  20d814:	6b00003f 	cmp	w1, w0
  20d818:	54ffff80 	b.eq	20d808 <__lockfile+0xd8>  // b.none
  20d81c:	d5033bbf 	dmb	ish
  20d820:	17ffffd8 	b	20d780 <__lockfile+0x50>
  20d824:	d503201f 	nop
  20d828:	52800000 	mov	w0, #0x0                   	// #0
  20d82c:	f9400ffe 	ldr	x30, [sp, #24]
  20d830:	a8c253f3 	ldp	x19, x20, [sp], #32
  20d834:	d65f03c0 	ret

000000000020d838 <__unlockfile>:
  20d838:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20d83c:	91023013 	add	x19, x0, #0x8c
  20d840:	52800000 	mov	w0, #0x0                   	// #0
  20d844:	885ffe62 	ldaxr	w2, [x19]
  20d848:	8801fe60 	stlxr	w1, w0, [x19]
  20d84c:	35ffffc1 	cbnz	w1, 20d844 <__unlockfile+0xc>
  20d850:	37f00082 	tbnz	w2, #30, 20d860 <__unlockfile+0x28>
  20d854:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20d858:	d65f03c0 	ret
  20d85c:	d503201f 	nop
  20d860:	d2801e00 	mov	x0, #0xf0                  	// #240
  20d864:	97ffe2a7 	bl	206300 <get_rtt_syscall>
  20d868:	aa0003e3 	mov	x3, x0
  20d86c:	b4ffff40 	cbz	x0, 20d854 <__unlockfile+0x1c>
  20d870:	d2800022 	mov	x2, #0x1                   	// #1
  20d874:	d2801021 	mov	x1, #0x81                  	// #129
  20d878:	aa1303e0 	mov	x0, x19
  20d87c:	d63f0060 	blr	x3
  20d880:	b100981f 	cmn	x0, #0x26
  20d884:	54fffe81 	b.ne	20d854 <__unlockfile+0x1c>  // b.any
  20d888:	d2801e00 	mov	x0, #0xf0                  	// #240
  20d88c:	97ffe29d 	bl	206300 <get_rtt_syscall>
  20d890:	aa0003e3 	mov	x3, x0
  20d894:	b4fffe00 	cbz	x0, 20d854 <__unlockfile+0x1c>
  20d898:	aa1303e0 	mov	x0, x19
  20d89c:	d2800022 	mov	x2, #0x1                   	// #1
  20d8a0:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20d8a4:	aa0203e1 	mov	x1, x2
  20d8a8:	d61f0060 	br	x3
  20d8ac:	00000000 	.inst	0x00000000 ; undefined

000000000020d8b0 <__overflow>:
  20d8b0:	a9be7bf3 	stp	x19, x30, [sp, #-32]!
  20d8b4:	aa0003f3 	mov	x19, x0
  20d8b8:	39007fe1 	strb	w1, [sp, #31]
  20d8bc:	f9401001 	ldr	x1, [x0, #32]
  20d8c0:	b4000301 	cbz	x1, 20d920 <__overflow+0x70>
  20d8c4:	f9401662 	ldr	x2, [x19, #40]
  20d8c8:	eb01005f 	cmp	x2, x1
  20d8cc:	54000161 	b.ne	20d8f8 <__overflow+0x48>  // b.any
  20d8d0:	f9402663 	ldr	x3, [x19, #72]
  20d8d4:	d2800022 	mov	x2, #0x1                   	// #1
  20d8d8:	91007fe1 	add	x1, sp, #0x1f
  20d8dc:	aa1303e0 	mov	x0, x19
  20d8e0:	d63f0060 	blr	x3
  20d8e4:	f100041f 	cmp	x0, #0x1
  20d8e8:	54000241 	b.ne	20d930 <__overflow+0x80>  // b.any
  20d8ec:	39407fe0 	ldrb	w0, [sp, #31]
  20d8f0:	a8c27bf3 	ldp	x19, x30, [sp], #32
  20d8f4:	d65f03c0 	ret
  20d8f8:	39407fe0 	ldrb	w0, [sp, #31]
  20d8fc:	b9409261 	ldr	w1, [x19, #144]
  20d900:	6b01001f 	cmp	w0, w1
  20d904:	54fffe60 	b.eq	20d8d0 <__overflow+0x20>  // b.none
  20d908:	91000441 	add	x1, x2, #0x1
  20d90c:	f9001661 	str	x1, [x19, #40]
  20d910:	39000040 	strb	w0, [x2]
  20d914:	a8c27bf3 	ldp	x19, x30, [sp], #32
  20d918:	d65f03c0 	ret
  20d91c:	d503201f 	nop
  20d920:	940000ae 	bl	20dbd8 <__towrite>
  20d924:	35000060 	cbnz	w0, 20d930 <__overflow+0x80>
  20d928:	f9401261 	ldr	x1, [x19, #32]
  20d92c:	17ffffe6 	b	20d8c4 <__overflow+0x14>
  20d930:	12800000 	mov	w0, #0xffffffff            	// #-1
  20d934:	17ffffef 	b	20d8f0 <__overflow+0x40>

000000000020d938 <dummy>:
  20d938:	d65f03c0 	ret
  20d93c:	00000000 	.inst	0x00000000 ; undefined

000000000020d940 <__stdio_close>:
  20d940:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20d944:	b9407800 	ldr	w0, [x0, #120]
  20d948:	97fffc5c 	bl	20cab8 <__aio_close>
  20d94c:	93407c13 	sxtw	x19, w0
  20d950:	d28000c0 	mov	x0, #0x6                   	// #6
  20d954:	97ffe26b 	bl	206300 <get_rtt_syscall>
  20d958:	b4000100 	cbz	x0, 20d978 <__stdio_close+0x38>
  20d95c:	aa0003e1 	mov	x1, x0
  20d960:	aa1303e0 	mov	x0, x19
  20d964:	d63f0020 	blr	x1
  20d968:	97ffe296 	bl	2063c0 <__syscall_ret>
  20d96c:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20d970:	d65f03c0 	ret
  20d974:	d503201f 	nop
  20d978:	d2800000 	mov	x0, #0x0                   	// #0
  20d97c:	17fffffb 	b	20d968 <__stdio_close+0x28>

000000000020d980 <__stdio_seek>:
  20d980:	a9bc53f3 	stp	x19, x20, [sp, #-64]!
  20d984:	aa0103f3 	mov	x19, x1
  20d988:	a9015bf5 	stp	x21, x22, [sp, #16]
  20d98c:	93407c56 	sxtw	x22, w2
  20d990:	f90013fe 	str	x30, [sp, #32]
  20d994:	9360fc35 	asr	x21, x1, #32
  20d998:	b9807814 	ldrsw	x20, [x0, #120]
  20d99c:	d2801180 	mov	x0, #0x8c                  	// #140
  20d9a0:	97ffe258 	bl	206300 <get_rtt_syscall>
  20d9a4:	b4000220 	cbz	x0, 20d9e8 <__stdio_seek+0x68>
  20d9a8:	aa0003e5 	mov	x5, x0
  20d9ac:	aa1603e4 	mov	x4, x22
  20d9b0:	9100e3e3 	add	x3, sp, #0x38
  20d9b4:	aa1303e2 	mov	x2, x19
  20d9b8:	aa1503e1 	mov	x1, x21
  20d9bc:	aa1403e0 	mov	x0, x20
  20d9c0:	d63f00a0 	blr	x5
  20d9c4:	97ffe27f 	bl	2063c0 <__syscall_ret>
  20d9c8:	f100001f 	cmp	x0, #0x0
  20d9cc:	f9401fe1 	ldr	x1, [sp, #56]
  20d9d0:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20d9d4:	da9fa020 	csinv	x0, x1, xzr, ge  // ge = tcont
  20d9d8:	f94013fe 	ldr	x30, [sp, #32]
  20d9dc:	a8c453f3 	ldp	x19, x20, [sp], #64
  20d9e0:	d65f03c0 	ret
  20d9e4:	d503201f 	nop
  20d9e8:	d2800000 	mov	x0, #0x0                   	// #0
  20d9ec:	17fffff6 	b	20d9c4 <__stdio_seek+0x44>

000000000020d9f0 <__stdio_write>:
  20d9f0:	a9ba53f3 	stp	x19, x20, [sp, #-96]!
  20d9f4:	a9015bf5 	stp	x21, x22, [sp, #16]
  20d9f8:	aa0003f5 	mov	x21, x0
  20d9fc:	a90263f7 	stp	x23, x24, [sp, #32]
  20da00:	910103f3 	add	x19, sp, #0x40
  20da04:	a9037bf9 	stp	x25, x30, [sp, #48]
  20da08:	aa0203f8 	mov	x24, x2
  20da0c:	52800057 	mov	w23, #0x2                   	// #2
  20da10:	d2800056 	mov	x22, #0x2                   	// #2
  20da14:	f9401414 	ldr	x20, [x0, #40]
  20da18:	f9401c00 	ldr	x0, [x0, #56]
  20da1c:	a9050be1 	stp	x1, x2, [sp, #80]
  20da20:	cb000294 	sub	x20, x20, x0
  20da24:	a90453e0 	stp	x0, x20, [sp, #64]
  20da28:	8b020294 	add	x20, x20, x2
  20da2c:	1400000f 	b	20da68 <__stdio_write+0x78>
  20da30:	cb000294 	sub	x20, x20, x0
  20da34:	b7f80460 	tbnz	x0, #63, 20dac0 <__stdio_write+0xd0>
  20da38:	f9400661 	ldr	x1, [x19, #8]
  20da3c:	eb01001f 	cmp	x0, x1
  20da40:	540000c9 	b.ls	20da58 <__stdio_write+0x68>  // b.plast
  20da44:	91004273 	add	x19, x19, #0x10
  20da48:	510006f7 	sub	w23, w23, #0x1
  20da4c:	cb010000 	sub	x0, x0, x1
  20da50:	93407ef6 	sxtw	x22, w23
  20da54:	f9400661 	ldr	x1, [x19, #8]
  20da58:	f9400262 	ldr	x2, [x19]
  20da5c:	cb000021 	sub	x1, x1, x0
  20da60:	8b000040 	add	x0, x2, x0
  20da64:	a9000660 	stp	x0, x1, [x19]
  20da68:	d2801240 	mov	x0, #0x92                  	// #146
  20da6c:	b9807ab9 	ldrsw	x25, [x21, #120]
  20da70:	97ffe224 	bl	206300 <get_rtt_syscall>
  20da74:	aa0003e3 	mov	x3, x0
  20da78:	b4000440 	cbz	x0, 20db00 <__stdio_write+0x110>
  20da7c:	aa1603e2 	mov	x2, x22
  20da80:	aa1303e1 	mov	x1, x19
  20da84:	aa1903e0 	mov	x0, x25
  20da88:	d63f0060 	blr	x3
  20da8c:	97ffe24d 	bl	2063c0 <__syscall_ret>
  20da90:	eb14001f 	cmp	x0, x20
  20da94:	54fffce1 	b.ne	20da30 <__stdio_write+0x40>  // b.any
  20da98:	a94586a0 	ldp	x0, x1, [x21, #88]
  20da9c:	f9001ea0 	str	x0, [x21, #56]
  20daa0:	8b010001 	add	x1, x0, x1
  20daa4:	a90202a1 	stp	x1, x0, [x21, #32]
  20daa8:	aa1803e0 	mov	x0, x24
  20daac:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20dab0:	a94263f7 	ldp	x23, x24, [sp, #32]
  20dab4:	a9437bf9 	ldp	x25, x30, [sp, #48]
  20dab8:	a8c653f3 	ldp	x19, x20, [sp], #96
  20dabc:	d65f03c0 	ret
  20dac0:	b94002a0 	ldr	w0, [x21]
  20dac4:	71000aff 	cmp	w23, #0x2
  20dac8:	a9027ebf 	stp	xzr, xzr, [x21, #32]
  20dacc:	321b0000 	orr	w0, w0, #0x20
  20dad0:	f9001ebf 	str	xzr, [x21, #56]
  20dad4:	b90002a0 	str	w0, [x21]
  20dad8:	d2800000 	mov	x0, #0x0                   	// #0
  20dadc:	54fffe80 	b.eq	20daac <__stdio_write+0xbc>  // b.none
  20dae0:	f9400660 	ldr	x0, [x19, #8]
  20dae4:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20dae8:	cb000300 	sub	x0, x24, x0
  20daec:	a94263f7 	ldp	x23, x24, [sp, #32]
  20daf0:	a9437bf9 	ldp	x25, x30, [sp, #48]
  20daf4:	a8c653f3 	ldp	x19, x20, [sp], #96
  20daf8:	d65f03c0 	ret
  20dafc:	d503201f 	nop
  20db00:	d2800000 	mov	x0, #0x0                   	// #0
  20db04:	17ffffe2 	b	20da8c <__stdio_write+0x9c>

000000000020db08 <__stdout_write>:
  20db08:	a9bc53f3 	stp	x19, x20, [sp, #-64]!
  20db0c:	aa0003f3 	mov	x19, x0
  20db10:	aa0103f4 	mov	x20, x1
  20db14:	90000000 	adrp	x0, 20d000 <__expand_heap+0x30>
  20db18:	f9000bf5 	str	x21, [sp, #16]
  20db1c:	9127c000 	add	x0, x0, #0x9f0
  20db20:	f90013fe 	str	x30, [sp, #32]
  20db24:	aa0203f5 	mov	x21, x2
  20db28:	f9002660 	str	x0, [x19, #72]
  20db2c:	b9400261 	ldr	w1, [x19]
  20db30:	36300141 	tbz	w1, #6, 20db58 <__stdout_write+0x50>
  20db34:	aa1503e2 	mov	x2, x21
  20db38:	aa1403e1 	mov	x1, x20
  20db3c:	aa1303e0 	mov	x0, x19
  20db40:	97ffffac 	bl	20d9f0 <__stdio_write>
  20db44:	f94013fe 	ldr	x30, [sp, #32]
  20db48:	f9400bf5 	ldr	x21, [sp, #16]
  20db4c:	a8c453f3 	ldp	x19, x20, [sp], #64
  20db50:	d65f03c0 	ret
  20db54:	d503201f 	nop
  20db58:	f9000ff6 	str	x22, [sp, #24]
  20db5c:	d28006c0 	mov	x0, #0x36                  	// #54
  20db60:	b9807a76 	ldrsw	x22, [x19, #120]
  20db64:	97ffe1e7 	bl	206300 <get_rtt_syscall>
  20db68:	aa0003e3 	mov	x3, x0
  20db6c:	b4000220 	cbz	x0, 20dbb0 <__stdout_write+0xa8>
  20db70:	9100e3e2 	add	x2, sp, #0x38
  20db74:	d28a8261 	mov	x1, #0x5413                	// #21523
  20db78:	aa1603e0 	mov	x0, x22
  20db7c:	d63f0060 	blr	x3
  20db80:	b4000180 	cbz	x0, 20dbb0 <__stdout_write+0xa8>
  20db84:	f9400ff6 	ldr	x22, [sp, #24]
  20db88:	12800000 	mov	w0, #0xffffffff            	// #-1
  20db8c:	b9009260 	str	w0, [x19, #144]
  20db90:	aa1503e2 	mov	x2, x21
  20db94:	aa1403e1 	mov	x1, x20
  20db98:	aa1303e0 	mov	x0, x19
  20db9c:	97ffff95 	bl	20d9f0 <__stdio_write>
  20dba0:	f9400bf5 	ldr	x21, [sp, #16]
  20dba4:	f94013fe 	ldr	x30, [sp, #32]
  20dba8:	a8c453f3 	ldp	x19, x20, [sp], #64
  20dbac:	d65f03c0 	ret
  20dbb0:	f9400ff6 	ldr	x22, [sp, #24]
  20dbb4:	aa1503e2 	mov	x2, x21
  20dbb8:	aa1403e1 	mov	x1, x20
  20dbbc:	aa1303e0 	mov	x0, x19
  20dbc0:	97ffff8c 	bl	20d9f0 <__stdio_write>
  20dbc4:	f9400bf5 	ldr	x21, [sp, #16]
  20dbc8:	f94013fe 	ldr	x30, [sp, #32]
  20dbcc:	a8c453f3 	ldp	x19, x20, [sp], #64
  20dbd0:	d65f03c0 	ret
  20dbd4:	00000000 	.inst	0x00000000 ; undefined

000000000020dbd8 <__towrite>:
  20dbd8:	b9408802 	ldr	w2, [x0, #136]
  20dbdc:	b9400003 	ldr	w3, [x0]
  20dbe0:	51000441 	sub	w1, w2, #0x1
  20dbe4:	2a020021 	orr	w1, w1, w2
  20dbe8:	b9008801 	str	w1, [x0, #136]
  20dbec:	37180123 	tbnz	w3, #3, 20dc10 <__towrite+0x38>
  20dbf0:	a9458402 	ldp	x2, x1, [x0, #88]
  20dbf4:	a900fc1f 	stp	xzr, xzr, [x0, #8]
  20dbf8:	f9001c02 	str	x2, [x0, #56]
  20dbfc:	8b010041 	add	x1, x2, x1
  20dc00:	a9020801 	stp	x1, x2, [x0, #32]
  20dc04:	52800001 	mov	w1, #0x0                   	// #0
  20dc08:	2a0103e0 	mov	w0, w1
  20dc0c:	d65f03c0 	ret
  20dc10:	321b0063 	orr	w3, w3, #0x20
  20dc14:	12800001 	mov	w1, #0xffffffff            	// #-1
  20dc18:	b9000003 	str	w3, [x0]
  20dc1c:	17fffffb 	b	20dc08 <__towrite+0x30>

000000000020dc20 <__towrite_needs_stdio_exit>:
  20dc20:	1400058e 	b	20f258 <__stdio_exit>
  20dc24:	00000000 	.inst	0x00000000 ; undefined

000000000020dc28 <locking_putc>:
  20dc28:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  20dc2c:	aa0103f4 	mov	x20, x1
  20dc30:	91023033 	add	x19, x1, #0x8c
  20dc34:	12b80001 	mov	w1, #0x3fffffff            	// #1073741823
  20dc38:	a9015bf5 	stp	x21, x22, [sp, #16]
  20dc3c:	2a0003f6 	mov	w22, w0
  20dc40:	f90013fe 	str	x30, [sp, #32]
  20dc44:	14000003 	b	20dc50 <locking_putc+0x28>
  20dc48:	8800fe61 	stlxr	w0, w1, [x19]
  20dc4c:	340000c0 	cbz	w0, 20dc64 <locking_putc+0x3c>
  20dc50:	885ffe60 	ldaxr	w0, [x19]
  20dc54:	34ffffa0 	cbz	w0, 20dc48 <locking_putc+0x20>
  20dc58:	d5033bbf 	dmb	ish
  20dc5c:	aa1403e0 	mov	x0, x20
  20dc60:	97fffeb4 	bl	20d730 <__lockfile>
  20dc64:	b9409280 	ldr	w0, [x20, #144]
  20dc68:	12001ed5 	and	w21, w22, #0xff
  20dc6c:	6b15001f 	cmp	w0, w21
  20dc70:	54000240 	b.eq	20dcb8 <locking_putc+0x90>  // b.none
  20dc74:	a9420281 	ldp	x1, x0, [x20, #32]
  20dc78:	eb01001f 	cmp	x0, x1
  20dc7c:	540001e0 	b.eq	20dcb8 <locking_putc+0x90>  // b.none
  20dc80:	91000401 	add	x1, x0, #0x1
  20dc84:	f9001681 	str	x1, [x20, #40]
  20dc88:	39000016 	strb	w22, [x0]
  20dc8c:	52800000 	mov	w0, #0x0                   	// #0
  20dc90:	885ffe62 	ldaxr	w2, [x19]
  20dc94:	8801fe60 	stlxr	w1, w0, [x19]
  20dc98:	35ffffc1 	cbnz	w1, 20dc90 <locking_putc+0x68>
  20dc9c:	37f001a2 	tbnz	w2, #30, 20dcd0 <locking_putc+0xa8>
  20dca0:	2a1503e0 	mov	w0, w21
  20dca4:	f94013fe 	ldr	x30, [sp, #32]
  20dca8:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20dcac:	a8c353f3 	ldp	x19, x20, [sp], #48
  20dcb0:	d65f03c0 	ret
  20dcb4:	d503201f 	nop
  20dcb8:	2a1503e1 	mov	w1, w21
  20dcbc:	aa1403e0 	mov	x0, x20
  20dcc0:	97fffefc 	bl	20d8b0 <__overflow>
  20dcc4:	2a0003f5 	mov	w21, w0
  20dcc8:	17fffff1 	b	20dc8c <locking_putc+0x64>
  20dccc:	d503201f 	nop
  20dcd0:	d2801e00 	mov	x0, #0xf0                  	// #240
  20dcd4:	97ffe18b 	bl	206300 <get_rtt_syscall>
  20dcd8:	aa0003e3 	mov	x3, x0
  20dcdc:	b4fffe20 	cbz	x0, 20dca0 <locking_putc+0x78>
  20dce0:	d2800022 	mov	x2, #0x1                   	// #1
  20dce4:	d2801021 	mov	x1, #0x81                  	// #129
  20dce8:	aa1303e0 	mov	x0, x19
  20dcec:	d63f0060 	blr	x3
  20dcf0:	b100981f 	cmn	x0, #0x26
  20dcf4:	54fffd61 	b.ne	20dca0 <locking_putc+0x78>  // b.any
  20dcf8:	d2801e00 	mov	x0, #0xf0                  	// #240
  20dcfc:	97ffe181 	bl	206300 <get_rtt_syscall>
  20dd00:	aa0003e3 	mov	x3, x0
  20dd04:	b4fffce0 	cbz	x0, 20dca0 <locking_putc+0x78>
  20dd08:	d2800022 	mov	x2, #0x1                   	// #1
  20dd0c:	aa1303e0 	mov	x0, x19
  20dd10:	aa0203e1 	mov	x1, x2
  20dd14:	d63f0060 	blr	x3
  20dd18:	17ffffe2 	b	20dca0 <locking_putc+0x78>
  20dd1c:	00000000 	.inst	0x00000000 ; undefined

000000000020dd20 <fputc>:
  20dd20:	aa0103e2 	mov	x2, x1
  20dd24:	b9408c21 	ldr	w1, [x1, #140]
  20dd28:	7100003f 	cmp	w1, #0x0
  20dd2c:	5400012b 	b.lt	20dd50 <fputc+0x30>  // b.tstop
  20dd30:	540000c0 	b.eq	20dd48 <fputc+0x28>  // b.none
  20dd34:	d53bd043 	mrs	x3, tpidr_el0
  20dd38:	b8558063 	ldur	w3, [x3, #-168]
  20dd3c:	12017821 	and	w1, w1, #0xbfffffff
  20dd40:	6b03003f 	cmp	w1, w3
  20dd44:	54000060 	b.eq	20dd50 <fputc+0x30>  // b.none
  20dd48:	aa0203e1 	mov	x1, x2
  20dd4c:	17ffffb7 	b	20dc28 <locking_putc>
  20dd50:	b9409043 	ldr	w3, [x2, #144]
  20dd54:	12001c01 	and	w1, w0, #0xff
  20dd58:	6b03003f 	cmp	w1, w3
  20dd5c:	54000120 	b.eq	20dd80 <fputc+0x60>  // b.none
  20dd60:	a9420c44 	ldp	x4, x3, [x2, #32]
  20dd64:	eb04007f 	cmp	x3, x4
  20dd68:	540000c0 	b.eq	20dd80 <fputc+0x60>  // b.none
  20dd6c:	91000464 	add	x4, x3, #0x1
  20dd70:	f9001444 	str	x4, [x2, #40]
  20dd74:	39000060 	strb	w0, [x3]
  20dd78:	2a0103e0 	mov	w0, w1
  20dd7c:	d65f03c0 	ret
  20dd80:	aa0203e0 	mov	x0, x2
  20dd84:	17fffecb 	b	20d8b0 <__overflow>

000000000020dd88 <fputs>:
  20dd88:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20dd8c:	aa0003f4 	mov	x20, x0
  20dd90:	a9017bf5 	stp	x21, x30, [sp, #16]
  20dd94:	aa0103f5 	mov	x21, x1
  20dd98:	97fff48a 	bl	20afc0 <strlen>
  20dd9c:	aa0003f3 	mov	x19, x0
  20dda0:	aa1503e3 	mov	x3, x21
  20dda4:	aa0003e2 	mov	x2, x0
  20dda8:	d2800021 	mov	x1, #0x1                   	// #1
  20ddac:	aa1403e0 	mov	x0, x20
  20ddb0:	9400004c 	bl	20dee0 <fwrite>
  20ddb4:	eb13001f 	cmp	x0, x19
  20ddb8:	5a9f03e0 	csetm	w0, ne  // ne = any
  20ddbc:	a9417bf5 	ldp	x21, x30, [sp, #16]
  20ddc0:	a8c253f3 	ldp	x19, x20, [sp], #32
  20ddc4:	d65f03c0 	ret

000000000020ddc8 <__fwritex>:
  20ddc8:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  20ddcc:	aa0103f4 	mov	x20, x1
  20ddd0:	aa0203f3 	mov	x19, x2
  20ddd4:	a901fbf6 	stp	x22, x30, [sp, #24]
  20ddd8:	aa0003f6 	mov	x22, x0
  20dddc:	f9401041 	ldr	x1, [x2, #32]
  20dde0:	b4000181 	cbz	x1, 20de10 <__fwritex+0x48>
  20dde4:	f9401660 	ldr	x0, [x19, #40]
  20dde8:	cb000021 	sub	x1, x1, x0
  20ddec:	eb14003f 	cmp	x1, x20
  20ddf0:	540001c2 	b.cs	20de28 <__fwritex+0x60>  // b.hs, b.nlast
  20ddf4:	aa1403e2 	mov	x2, x20
  20ddf8:	aa1603e1 	mov	x1, x22
  20ddfc:	aa1303e0 	mov	x0, x19
  20de00:	f9402663 	ldr	x3, [x19, #72]
  20de04:	a941fbf6 	ldp	x22, x30, [sp, #24]
  20de08:	a8c353f3 	ldp	x19, x20, [sp], #48
  20de0c:	d61f0060 	br	x3
  20de10:	aa0203e0 	mov	x0, x2
  20de14:	97ffff71 	bl	20dbd8 <__towrite>
  20de18:	35000580 	cbnz	w0, 20dec8 <__fwritex+0x100>
  20de1c:	f9401261 	ldr	x1, [x19, #32]
  20de20:	17fffff1 	b	20dde4 <__fwritex+0x1c>
  20de24:	d503201f 	nop
  20de28:	b9409261 	ldr	w1, [x19, #144]
  20de2c:	f9000bf5 	str	x21, [sp, #16]
  20de30:	37f801c1 	tbnz	w1, #31, 20de68 <__fwritex+0xa0>
  20de34:	b4000534 	cbz	x20, 20ded8 <__fwritex+0x110>
  20de38:	d1000695 	sub	x21, x20, #0x1
  20de3c:	38756ac1 	ldrb	w1, [x22, x21]
  20de40:	7100283f 	cmp	w1, #0xa
  20de44:	540000e1 	b.ne	20de60 <__fwritex+0x98>  // b.any
  20de48:	14000014 	b	20de98 <__fwritex+0xd0>
  20de4c:	d503201f 	nop
  20de50:	38616ac2 	ldrb	w2, [x22, x1]
  20de54:	7100285f 	cmp	w2, #0xa
  20de58:	54000220 	b.eq	20de9c <__fwritex+0xd4>  // b.none
  20de5c:	aa0103f5 	mov	x21, x1
  20de60:	d10006a1 	sub	x1, x21, #0x1
  20de64:	b5ffff75 	cbnz	x21, 20de50 <__fwritex+0x88>
  20de68:	aa1403f5 	mov	x21, x20
  20de6c:	aa1503e2 	mov	x2, x21
  20de70:	aa1603e1 	mov	x1, x22
  20de74:	97fff27b 	bl	20a860 <memcpy>
  20de78:	f9401661 	ldr	x1, [x19, #40]
  20de7c:	aa1403e0 	mov	x0, x20
  20de80:	8b150035 	add	x21, x1, x21
  20de84:	f9001675 	str	x21, [x19, #40]
  20de88:	f9400bf5 	ldr	x21, [sp, #16]
  20de8c:	a941fbf6 	ldp	x22, x30, [sp, #24]
  20de90:	a8c353f3 	ldp	x19, x20, [sp], #48
  20de94:	d65f03c0 	ret
  20de98:	aa1403f5 	mov	x21, x20
  20de9c:	f9402663 	ldr	x3, [x19, #72]
  20dea0:	aa1503e2 	mov	x2, x21
  20dea4:	aa1603e1 	mov	x1, x22
  20dea8:	aa1303e0 	mov	x0, x19
  20deac:	d63f0060 	blr	x3
  20deb0:	eb15001f 	cmp	x0, x21
  20deb4:	540000e3 	b.cc	20ded0 <__fwritex+0x108>  // b.lo, b.ul, b.last
  20deb8:	8b1502d6 	add	x22, x22, x21
  20debc:	f9401660 	ldr	x0, [x19, #40]
  20dec0:	cb150295 	sub	x21, x20, x21
  20dec4:	17ffffea 	b	20de6c <__fwritex+0xa4>
  20dec8:	d2800000 	mov	x0, #0x0                   	// #0
  20decc:	17fffff0 	b	20de8c <__fwritex+0xc4>
  20ded0:	f9400bf5 	ldr	x21, [sp, #16]
  20ded4:	17ffffee 	b	20de8c <__fwritex+0xc4>
  20ded8:	d2800015 	mov	x21, #0x0                   	// #0
  20dedc:	17ffffe4 	b	20de6c <__fwritex+0xa4>

000000000020dee0 <fwrite>:
  20dee0:	a9bc53f3 	stp	x19, x20, [sp, #-64]!
  20dee4:	f100003f 	cmp	x1, #0x0
  20dee8:	aa0303f4 	mov	x20, x3
  20deec:	9a9f1053 	csel	x19, x2, xzr, ne  // ne = any
  20def0:	a9015bf5 	stp	x21, x22, [sp, #16]
  20def4:	aa0103f5 	mov	x21, x1
  20def8:	9b027c36 	mul	x22, x1, x2
  20defc:	b9408c61 	ldr	w1, [x3, #140]
  20df00:	f90013f7 	str	x23, [sp, #32]
  20df04:	f9001bfe 	str	x30, [sp, #48]
  20df08:	36f801c1 	tbz	w1, #31, 20df40 <fwrite+0x60>
  20df0c:	aa0303e2 	mov	x2, x3
  20df10:	aa1603e1 	mov	x1, x22
  20df14:	97ffffad 	bl	20ddc8 <__fwritex>
  20df18:	aa0003f7 	mov	x23, x0
  20df1c:	aa1303e0 	mov	x0, x19
  20df20:	eb1702df 	cmp	x22, x23
  20df24:	54000040 	b.eq	20df2c <fwrite+0x4c>  // b.none
  20df28:	9ad50ae0 	udiv	x0, x23, x21
  20df2c:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20df30:	f94013f7 	ldr	x23, [sp, #32]
  20df34:	f9401bfe 	ldr	x30, [sp, #48]
  20df38:	a8c453f3 	ldp	x19, x20, [sp], #64
  20df3c:	d65f03c0 	ret
  20df40:	aa0003f7 	mov	x23, x0
  20df44:	f90017f8 	str	x24, [sp, #40]
  20df48:	aa0303e0 	mov	x0, x3
  20df4c:	97fffdf9 	bl	20d730 <__lockfile>
  20df50:	aa1403e2 	mov	x2, x20
  20df54:	2a0003f8 	mov	w24, w0
  20df58:	aa1603e1 	mov	x1, x22
  20df5c:	aa1703e0 	mov	x0, x23
  20df60:	97ffff9a 	bl	20ddc8 <__fwritex>
  20df64:	aa0003f7 	mov	x23, x0
  20df68:	340000d8 	cbz	w24, 20df80 <fwrite+0xa0>
  20df6c:	aa1403e0 	mov	x0, x20
  20df70:	97fffe32 	bl	20d838 <__unlockfile>
  20df74:	f94017f8 	ldr	x24, [sp, #40]
  20df78:	17ffffe9 	b	20df1c <fwrite+0x3c>
  20df7c:	d503201f 	nop
  20df80:	f94017f8 	ldr	x24, [sp, #40]
  20df84:	17ffffe6 	b	20df1c <fwrite+0x3c>

000000000020df88 <__ofl_lock>:
  20df88:	f81f0ffe 	str	x30, [sp, #-16]!
  20df8c:	90000040 	adrp	x0, 215000 <__data_start__>
  20df90:	913b4000 	add	x0, x0, #0xed0
  20df94:	97fff589 	bl	20b5b8 <__lock>
  20df98:	90000040 	adrp	x0, 215000 <__data_start__>
  20df9c:	f84107fe 	ldr	x30, [sp], #16
  20dfa0:	913b2000 	add	x0, x0, #0xec8
  20dfa4:	d65f03c0 	ret

000000000020dfa8 <__ofl_unlock>:
  20dfa8:	90000040 	adrp	x0, 215000 <__data_start__>
  20dfac:	913b4000 	add	x0, x0, #0xed0
  20dfb0:	17fff5da 	b	20b718 <__unlock>
  20dfb4:	00000000 	.inst	0x00000000 ; undefined

000000000020dfb8 <memchr>:
  20dfb8:	12001c21 	and	w1, w1, #0xff
  20dfbc:	f240081f 	tst	x0, #0x7
  20dfc0:	54000120 	b.eq	20dfe4 <memchr+0x2c>  // b.none
  20dfc4:	b4000722 	cbz	x2, 20e0a8 <memchr+0xf0>
  20dfc8:	39400003 	ldrb	w3, [x0]
  20dfcc:	6b01007f 	cmp	w3, w1
  20dfd0:	540004c0 	b.eq	20e068 <memchr+0xb0>  // b.none
  20dfd4:	91000400 	add	x0, x0, #0x1
  20dfd8:	d1000442 	sub	x2, x2, #0x1
  20dfdc:	f240081f 	tst	x0, #0x7
  20dfe0:	54ffff21 	b.ne	20dfc4 <memchr+0xc>  // b.any
  20dfe4:	d2800004 	mov	x4, #0x0                   	// #0
  20dfe8:	b40003c2 	cbz	x2, 20e060 <memchr+0xa8>
  20dfec:	39400003 	ldrb	w3, [x0]
  20dff0:	6b01007f 	cmp	w3, w1
  20dff4:	540003a0 	b.eq	20e068 <memchr+0xb0>  // b.none
  20dff8:	93407c25 	sxtw	x5, w1
  20dffc:	b200c3e4 	mov	x4, #0x101010101010101     	// #72340172838076673
  20e000:	f1001c5f 	cmp	x2, #0x7
  20e004:	9b047ca5 	mul	x5, x5, x4
  20e008:	54000389 	b.ls	20e078 <memchr+0xc0>  // b.plast
  20e00c:	f9400003 	ldr	x3, [x0]
  20e010:	ca0300a3 	eor	x3, x5, x3
  20e014:	cb040064 	sub	x4, x3, x4
  20e018:	8a230083 	bic	x3, x4, x3
  20e01c:	f201c07f 	tst	x3, #0x8080808080808080
  20e020:	540002c1 	b.ne	20e078 <memchr+0xc0>  // b.any
  20e024:	b207dbe6 	mov	x6, #0xfefefefefefefefe    	// #-72340172838076674
  20e028:	f29fdfe6 	movk	x6, #0xfeff
  20e02c:	14000007 	b	20e048 <memchr+0x90>
  20e030:	f9400003 	ldr	x3, [x0]
  20e034:	ca0300a3 	eor	x3, x5, x3
  20e038:	8b060064 	add	x4, x3, x6
  20e03c:	8a230083 	bic	x3, x4, x3
  20e040:	f201c07f 	tst	x3, #0x8080808080808080
  20e044:	54000121 	b.ne	20e068 <memchr+0xb0>  // b.any
  20e048:	d1002042 	sub	x2, x2, #0x8
  20e04c:	91002000 	add	x0, x0, #0x8
  20e050:	f1001c5f 	cmp	x2, #0x7
  20e054:	54fffee8 	b.hi	20e030 <memchr+0x78>  // b.pmore
  20e058:	d2800004 	mov	x4, #0x0                   	// #0
  20e05c:	b5000062 	cbnz	x2, 20e068 <memchr+0xb0>
  20e060:	aa0403e0 	mov	x0, x4
  20e064:	d65f03c0 	ret
  20e068:	39400003 	ldrb	w3, [x0]
  20e06c:	aa0003e4 	mov	x4, x0
  20e070:	6b03003f 	cmp	w1, w3
  20e074:	54ffff60 	b.eq	20e060 <memchr+0xa8>  // b.none
  20e078:	91000403 	add	x3, x0, #0x1
  20e07c:	8b020002 	add	x2, x0, x2
  20e080:	aa0303e4 	mov	x4, x3
  20e084:	eb03005f 	cmp	x2, x3
  20e088:	54000100 	b.eq	20e0a8 <memchr+0xf0>  // b.none
  20e08c:	39400080 	ldrb	w0, [x4]
  20e090:	91000463 	add	x3, x3, #0x1
  20e094:	6b01001f 	cmp	w0, w1
  20e098:	54ffff41 	b.ne	20e080 <memchr+0xc8>  // b.any
  20e09c:	aa0403e0 	mov	x0, x4
  20e0a0:	d65f03c0 	ret
  20e0a4:	d503201f 	nop
  20e0a8:	d2800004 	mov	x4, #0x0                   	// #0
  20e0ac:	aa0403e0 	mov	x0, x4
  20e0b0:	d65f03c0 	ret
  20e0b4:	00000000 	.inst	0x00000000 ; undefined

000000000020e0b8 <__stpncpy>:
  20e0b8:	ca010003 	eor	x3, x0, x1
  20e0bc:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20e0c0:	f240087f 	tst	x3, #0x7
  20e0c4:	540004a1 	b.ne	20e158 <__stpncpy+0xa0>  // b.any
  20e0c8:	f240083f 	tst	x1, #0x7
  20e0cc:	54000140 	b.eq	20e0f4 <__stpncpy+0x3c>  // b.none
  20e0d0:	b40006c2 	cbz	x2, 20e1a8 <__stpncpy+0xf0>
  20e0d4:	39400023 	ldrb	w3, [x1]
  20e0d8:	39000003 	strb	w3, [x0]
  20e0dc:	34000663 	cbz	w3, 20e1a8 <__stpncpy+0xf0>
  20e0e0:	91000421 	add	x1, x1, #0x1
  20e0e4:	d1000442 	sub	x2, x2, #0x1
  20e0e8:	91000400 	add	x0, x0, #0x1
  20e0ec:	f240083f 	tst	x1, #0x7
  20e0f0:	54ffff01 	b.ne	20e0d0 <__stpncpy+0x18>  // b.any
  20e0f4:	aa0003f3 	mov	x19, x0
  20e0f8:	b40004a2 	cbz	x2, 20e18c <__stpncpy+0xd4>
  20e0fc:	39400026 	ldrb	w6, [x1]
  20e100:	34000466 	cbz	w6, 20e18c <__stpncpy+0xd4>
  20e104:	f1001c5f 	cmp	x2, #0x7
  20e108:	540005e9 	b.ls	20e1c4 <__stpncpy+0x10c>  // b.plast
  20e10c:	f9400023 	ldr	x3, [x1]
  20e110:	b207dbe5 	mov	x5, #0xfefefefefefefefe    	// #-72340172838076674
  20e114:	f29fdfe5 	movk	x5, #0xfeff
  20e118:	8b050064 	add	x4, x3, x5
  20e11c:	8a230084 	bic	x4, x4, x3
  20e120:	f201c09f 	tst	x4, #0x8080808080808080
  20e124:	54000100 	b.eq	20e144 <__stpncpy+0x8c>  // b.none
  20e128:	14000027 	b	20e1c4 <__stpncpy+0x10c>
  20e12c:	d503201f 	nop
  20e130:	f9400023 	ldr	x3, [x1]
  20e134:	8b050064 	add	x4, x3, x5
  20e138:	8a230084 	bic	x4, x4, x3
  20e13c:	f201c09f 	tst	x4, #0x8080808080808080
  20e140:	540000e1 	b.ne	20e15c <__stpncpy+0xa4>  // b.any
  20e144:	f8008403 	str	x3, [x0], #8
  20e148:	d1002042 	sub	x2, x2, #0x8
  20e14c:	91002021 	add	x1, x1, #0x8
  20e150:	f1001c5f 	cmp	x2, #0x7
  20e154:	54fffee8 	b.hi	20e130 <__stpncpy+0x78>  // b.pmore
  20e158:	b4000282 	cbz	x2, 20e1a8 <__stpncpy+0xf0>
  20e15c:	39400023 	ldrb	w3, [x1]
  20e160:	39000003 	strb	w3, [x0]
  20e164:	34000223 	cbz	w3, 20e1a8 <__stpncpy+0xf0>
  20e168:	aa0003f3 	mov	x19, x0
  20e16c:	14000004 	b	20e17c <__stpncpy+0xc4>
  20e170:	39400020 	ldrb	w0, [x1]
  20e174:	39000260 	strb	w0, [x19]
  20e178:	340000a0 	cbz	w0, 20e18c <__stpncpy+0xd4>
  20e17c:	91000421 	add	x1, x1, #0x1
  20e180:	91000673 	add	x19, x19, #0x1
  20e184:	f1000442 	subs	x2, x2, #0x1
  20e188:	54ffff41 	b.ne	20e170 <__stpncpy+0xb8>  // b.any
  20e18c:	52800001 	mov	w1, #0x0                   	// #0
  20e190:	aa1303e0 	mov	x0, x19
  20e194:	97fff305 	bl	20ada8 <memset>
  20e198:	aa1303e0 	mov	x0, x19
  20e19c:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20e1a0:	d65f03c0 	ret
  20e1a4:	d503201f 	nop
  20e1a8:	aa0003f3 	mov	x19, x0
  20e1ac:	52800001 	mov	w1, #0x0                   	// #0
  20e1b0:	aa1303e0 	mov	x0, x19
  20e1b4:	97fff2fd 	bl	20ada8 <memset>
  20e1b8:	aa1303e0 	mov	x0, x19
  20e1bc:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20e1c0:	d65f03c0 	ret
  20e1c4:	39000006 	strb	w6, [x0]
  20e1c8:	17ffffe8 	b	20e168 <__stpncpy+0xb0>
  20e1cc:	00000000 	.inst	0x00000000 ; undefined

000000000020e1d0 <strchr>:
  20e1d0:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20e1d4:	2a0103f3 	mov	w19, w1
  20e1d8:	94000006 	bl	20e1f0 <__strchrnul>
  20e1dc:	39400001 	ldrb	w1, [x0]
  20e1e0:	6b33003f 	cmp	w1, w19, uxtb
  20e1e4:	9a9f0000 	csel	x0, x0, xzr, eq  // eq = none
  20e1e8:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20e1ec:	d65f03c0 	ret

000000000020e1f0 <__strchrnul>:
  20e1f0:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20e1f4:	72001c21 	ands	w1, w1, #0xff
  20e1f8:	aa0003f3 	mov	x19, x0
  20e1fc:	540006a0 	b.eq	20e2d0 <__strchrnul+0xe0>  // b.none
  20e200:	f240081f 	tst	x0, #0x7
  20e204:	540001c0 	b.eq	20e23c <__strchrnul+0x4c>  // b.none
  20e208:	39400000 	ldrb	w0, [x0]
  20e20c:	340005a0 	cbz	w0, 20e2c0 <__strchrnul+0xd0>
  20e210:	6b00003f 	cmp	w1, w0
  20e214:	540000e1 	b.ne	20e230 <__strchrnul+0x40>  // b.any
  20e218:	1400002a 	b	20e2c0 <__strchrnul+0xd0>
  20e21c:	d503201f 	nop
  20e220:	39400260 	ldrb	w0, [x19]
  20e224:	6b01001f 	cmp	w0, w1
  20e228:	340004c0 	cbz	w0, 20e2c0 <__strchrnul+0xd0>
  20e22c:	540004a0 	b.eq	20e2c0 <__strchrnul+0xd0>  // b.none
  20e230:	91000673 	add	x19, x19, #0x1
  20e234:	f2400a7f 	tst	x19, #0x7
  20e238:	54ffff41 	b.ne	20e220 <__strchrnul+0x30>  // b.any
  20e23c:	93407c26 	sxtw	x6, w1
  20e240:	b200c3e3 	mov	x3, #0x101010101010101     	// #72340172838076673
  20e244:	f9400260 	ldr	x0, [x19]
  20e248:	9b037cc6 	mul	x6, x6, x3
  20e24c:	cb030002 	sub	x2, x0, x3
  20e250:	8a200042 	bic	x2, x2, x0
  20e254:	ca0000c0 	eor	x0, x6, x0
  20e258:	cb030003 	sub	x3, x0, x3
  20e25c:	8a200060 	bic	x0, x3, x0
  20e260:	aa000040 	orr	x0, x2, x0
  20e264:	f201c01f 	tst	x0, #0x8080808080808080
  20e268:	54000181 	b.ne	20e298 <__strchrnul+0xa8>  // b.any
  20e26c:	b207dbe3 	mov	x3, #0xfefefefefefefefe    	// #-72340172838076674
  20e270:	f29fdfe3 	movk	x3, #0xfeff
  20e274:	f8408e60 	ldr	x0, [x19, #8]!
  20e278:	ca060002 	eor	x2, x0, x6
  20e27c:	8b030005 	add	x5, x0, x3
  20e280:	8b030044 	add	x4, x2, x3
  20e284:	8a2000a0 	bic	x0, x5, x0
  20e288:	8a220082 	bic	x2, x4, x2
  20e28c:	aa020000 	orr	x0, x0, x2
  20e290:	f201c01f 	tst	x0, #0x8080808080808080
  20e294:	54ffff00 	b.eq	20e274 <__strchrnul+0x84>  // b.none
  20e298:	39400260 	ldrb	w0, [x19]
  20e29c:	34000120 	cbz	w0, 20e2c0 <__strchrnul+0xd0>
  20e2a0:	6b00003f 	cmp	w1, w0
  20e2a4:	aa1303e0 	mov	x0, x19
  20e2a8:	54000080 	b.eq	20e2b8 <__strchrnul+0xc8>  // b.none
  20e2ac:	38401c02 	ldrb	w2, [x0, #1]!
  20e2b0:	6b01005f 	cmp	w2, w1
  20e2b4:	35ffffa2 	cbnz	w2, 20e2a8 <__strchrnul+0xb8>
  20e2b8:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20e2bc:	d65f03c0 	ret
  20e2c0:	aa1303e0 	mov	x0, x19
  20e2c4:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20e2c8:	d65f03c0 	ret
  20e2cc:	d503201f 	nop
  20e2d0:	97fff33c 	bl	20afc0 <strlen>
  20e2d4:	8b000260 	add	x0, x19, x0
  20e2d8:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20e2dc:	d65f03c0 	ret

000000000020e2e0 <__set_thread_area>:
  20e2e0:	d51bd040 	msr	tpidr_el0, x0
  20e2e4:	52800000 	mov	w0, #0x0                   	// #0
  20e2e8:	d65f03c0 	ret

000000000020e2ec <__unmapself>:
  20e2ec:	d28006c8 	mov	x8, #0x36                  	// #54
  20e2f0:	d4000001 	svc	#0x0
  20e2f4:	d2800028 	mov	x8, #0x1                   	// #1
  20e2f8:	d4000001 	svc	#0x0

000000000020e2fc <__clone>:
  20e2fc:	d2801048 	mov	x8, #0x82                  	// #130
  20e300:	2a0203e2 	mov	w2, w2
  20e304:	927cec21 	and	x1, x1, #0xfffffffffffffff0
  20e308:	a9bf0c20 	stp	x0, x3, [x1, #-16]!
  20e30c:	a9bf7fe3 	stp	x3, xzr, [sp, #-16]!
  20e310:	a9bf03e6 	stp	x6, x0, [sp, #-16]!
  20e314:	a9bf17e4 	stp	x4, x5, [sp, #-16]!
  20e318:	a9bf07e2 	stp	x2, x1, [sp, #-16]!
  20e31c:	910003e0 	mov	x0, sp
  20e320:	d4000001 	svc	#0x0
  20e324:	b4000060 	cbz	x0, 20e330 <__clone+0x34>
  20e328:	910103ff 	add	sp, sp, #0x40
  20e32c:	d65f03c0 	ret
  20e330:	a8c103e1 	ldp	x1, x0, [sp], #16
  20e334:	d63f0020 	blr	x1
  20e338:	d2800028 	mov	x8, #0x1                   	// #1
  20e33c:	d4000001 	svc	#0x0

000000000020e340 <pthread_attr_init>:
  20e340:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20e344:	aa0003f3 	mov	x19, x0
  20e348:	a9007c1f 	stp	xzr, xzr, [x0]
  20e34c:	a9017c1f 	stp	xzr, xzr, [x0, #16]
  20e350:	a9027c1f 	stp	xzr, xzr, [x0, #32]
  20e354:	f900181f 	str	xzr, [x0, #48]
  20e358:	97fff578 	bl	20b938 <__acquire_ptc>
  20e35c:	f0000021 	adrp	x1, 215000 <__data_start__>
  20e360:	f0000020 	adrp	x0, 215000 <__data_start__>
  20e364:	b941ec21 	ldr	w1, [x1, #492]
  20e368:	b941e800 	ldr	w0, [x0, #488]
  20e36c:	a9000261 	stp	x1, x0, [x19]
  20e370:	97fff572 	bl	20b938 <__acquire_ptc>
  20e374:	52800000 	mov	w0, #0x0                   	// #0
  20e378:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20e37c:	d65f03c0 	ret

000000000020e380 <pthread_attr_setdetachstate>:
  20e380:	7100043f 	cmp	w1, #0x1
  20e384:	540000a8 	b.hi	20e398 <pthread_attr_setdetachstate+0x18>  // b.pmore
  20e388:	b9001801 	str	w1, [x0, #24]
  20e38c:	52800000 	mov	w0, #0x0                   	// #0
  20e390:	d65f03c0 	ret
  20e394:	d503201f 	nop
  20e398:	528002c0 	mov	w0, #0x16                  	// #22
  20e39c:	d65f03c0 	ret

000000000020e3a0 <pthread_barrier_init>:
  20e3a0:	51000442 	sub	w2, w2, #0x1
  20e3a4:	321f77e3 	mov	w3, #0x7ffffffe            	// #2147483646
  20e3a8:	6b03005f 	cmp	w2, w3
  20e3ac:	54000128 	b.hi	20e3d0 <pthread_barrier_init+0x30>  // b.pmore
  20e3b0:	b4000061 	cbz	x1, 20e3bc <pthread_barrier_init+0x1c>
  20e3b4:	b9400021 	ldr	w1, [x1]
  20e3b8:	2a010042 	orr	w2, w2, w1
  20e3bc:	a9007c1f 	stp	xzr, xzr, [x0]
  20e3c0:	a9017c1f 	stp	xzr, xzr, [x0, #16]
  20e3c4:	b9000802 	str	w2, [x0, #8]
  20e3c8:	52800000 	mov	w0, #0x0                   	// #0
  20e3cc:	d65f03c0 	ret
  20e3d0:	528002c0 	mov	w0, #0x16                  	// #22
  20e3d4:	d65f03c0 	ret

000000000020e3d8 <pthread_barrier_wait>:
  20e3d8:	a9bc53f3 	stp	x19, x20, [sp, #-64]!
  20e3dc:	a9027bf7 	stp	x23, x30, [sp, #32]
  20e3e0:	b9400817 	ldr	w23, [x0, #8]
  20e3e4:	710002ff 	cmp	w23, #0x0
  20e3e8:	54002740 	b.eq	20e8d0 <pthread_barrier_wait+0x4f8>  // b.none
  20e3ec:	f9000bf5 	str	x21, [sp, #16]
  20e3f0:	aa0003f3 	mov	x19, x0
  20e3f4:	5400116b 	b.lt	20e620 <pthread_barrier_wait+0x248>  // b.tstop
  20e3f8:	91001015 	add	x21, x0, #0x4
  20e3fc:	52800034 	mov	w20, #0x1                   	// #1
  20e400:	885ffe61 	ldaxr	w1, [x19]
  20e404:	8800fe74 	stlxr	w0, w20, [x19]
  20e408:	35ffffc0 	cbnz	w0, 20e400 <pthread_barrier_wait+0x28>
  20e40c:	340000e1 	cbz	w1, 20e428 <pthread_barrier_wait+0x50>
  20e410:	52800023 	mov	w3, #0x1                   	// #1
  20e414:	aa1503e1 	mov	x1, x21
  20e418:	2a0303e2 	mov	w2, w3
  20e41c:	aa1303e0 	mov	x0, x19
  20e420:	97fff4e6 	bl	20b7b8 <__wait>
  20e424:	17fffff7 	b	20e400 <pthread_barrier_wait+0x28>
  20e428:	f9400e75 	ldr	x21, [x19, #24]
  20e42c:	b4002575 	cbz	x21, 20e8d8 <pthread_barrier_wait+0x500>
  20e430:	b94002a0 	ldr	w0, [x21]
  20e434:	11000400 	add	w0, w0, #0x1
  20e438:	b90002a0 	str	w0, [x21]
  20e43c:	6b17001f 	cmp	w0, w23
  20e440:	54000640 	b.eq	20e508 <pthread_barrier_wait+0x130>  // b.none
  20e444:	d5033bbf 	dmb	ish
  20e448:	b900027f 	str	wzr, [x19]
  20e44c:	d5033bbf 	dmb	ish
  20e450:	b9400660 	ldr	w0, [x19, #4]
  20e454:	350009a0 	cbnz	w0, 20e588 <pthread_barrier_wait+0x1b0>
  20e458:	52800023 	mov	w3, #0x1                   	// #1
  20e45c:	52800002 	mov	w2, #0x0                   	// #0
  20e460:	910022a1 	add	x1, x21, #0x8
  20e464:	910012a0 	add	x0, x21, #0x4
  20e468:	97fff4d4 	bl	20b7b8 <__wait>
  20e46c:	885ffea1 	ldaxr	w1, [x21]
  20e470:	51000420 	sub	w0, w1, #0x1
  20e474:	8814fea0 	stlxr	w20, w0, [x21]
  20e478:	35ffffb4 	cbnz	w20, 20e46c <pthread_barrier_wait+0x94>
  20e47c:	7100043f 	cmp	w1, #0x1
  20e480:	540000c0 	b.eq	20e498 <pthread_barrier_wait+0xc0>  // b.none
  20e484:	f9400bf5 	ldr	x21, [sp, #16]
  20e488:	2a1403e0 	mov	w0, w20
  20e48c:	a9427bf7 	ldp	x23, x30, [sp, #32]
  20e490:	a8c453f3 	ldp	x19, x20, [sp], #64
  20e494:	d65f03c0 	ret
  20e498:	910032b5 	add	x21, x21, #0xc
  20e49c:	885ffea1 	ldaxr	w1, [x21]
  20e4a0:	11000420 	add	w0, w1, #0x1
  20e4a4:	8802fea0 	stlxr	w2, w0, [x21]
  20e4a8:	35ffffa2 	cbnz	w2, 20e49c <pthread_barrier_wait+0xc4>
  20e4ac:	34fffec1 	cbz	w1, 20e484 <pthread_barrier_wait+0xac>
  20e4b0:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e4b4:	97ffdf93 	bl	206300 <get_rtt_syscall>
  20e4b8:	aa0003e3 	mov	x3, x0
  20e4bc:	b4fffe40 	cbz	x0, 20e484 <pthread_barrier_wait+0xac>
  20e4c0:	d2800022 	mov	x2, #0x1                   	// #1
  20e4c4:	d2801021 	mov	x1, #0x81                  	// #129
  20e4c8:	aa1503e0 	mov	x0, x21
  20e4cc:	d63f0060 	blr	x3
  20e4d0:	b100981f 	cmn	x0, #0x26
  20e4d4:	54fffd81 	b.ne	20e484 <pthread_barrier_wait+0xac>  // b.any
  20e4d8:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e4dc:	97ffdf89 	bl	206300 <get_rtt_syscall>
  20e4e0:	aa0003e3 	mov	x3, x0
  20e4e4:	b4fffd00 	cbz	x0, 20e484 <pthread_barrier_wait+0xac>
  20e4e8:	d2800022 	mov	x2, #0x1                   	// #1
  20e4ec:	aa1503e0 	mov	x0, x21
  20e4f0:	aa0203e1 	mov	x1, x2
  20e4f4:	52800014 	mov	w20, #0x0                   	// #0
  20e4f8:	d63f0060 	blr	x3
  20e4fc:	f9400bf5 	ldr	x21, [sp, #16]
  20e500:	17ffffe2 	b	20e488 <pthread_barrier_wait+0xb0>
  20e504:	d503201f 	nop
  20e508:	f9000e7f 	str	xzr, [x19, #24]
  20e50c:	d5033bbf 	dmb	ish
  20e510:	b900027f 	str	wzr, [x19]
  20e514:	d5033bbf 	dmb	ish
  20e518:	b9400660 	ldr	w0, [x19, #4]
  20e51c:	350005c0 	cbnz	w0, 20e5d4 <pthread_barrier_wait+0x1fc>
  20e520:	d5033bbf 	dmb	ish
  20e524:	52800020 	mov	w0, #0x1                   	// #1
  20e528:	b90006a0 	str	w0, [x21, #4]
  20e52c:	d5033bbf 	dmb	ish
  20e530:	b9400aa0 	ldr	w0, [x21, #8]
  20e534:	34fff9c0 	cbz	w0, 20e46c <pthread_barrier_wait+0x94>
  20e538:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e53c:	910012b3 	add	x19, x21, #0x4
  20e540:	97ffdf70 	bl	206300 <get_rtt_syscall>
  20e544:	aa0003e3 	mov	x3, x0
  20e548:	b4fff920 	cbz	x0, 20e46c <pthread_barrier_wait+0x94>
  20e54c:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
  20e550:	d2801021 	mov	x1, #0x81                  	// #129
  20e554:	aa1303e0 	mov	x0, x19
  20e558:	d63f0060 	blr	x3
  20e55c:	b100981f 	cmn	x0, #0x26
  20e560:	54fff861 	b.ne	20e46c <pthread_barrier_wait+0x94>  // b.any
  20e564:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e568:	97ffdf66 	bl	206300 <get_rtt_syscall>
  20e56c:	aa0003e3 	mov	x3, x0
  20e570:	b4fff7e0 	cbz	x0, 20e46c <pthread_barrier_wait+0x94>
  20e574:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
  20e578:	d2800021 	mov	x1, #0x1                   	// #1
  20e57c:	aa1303e0 	mov	x0, x19
  20e580:	d63f0060 	blr	x3
  20e584:	17ffffba 	b	20e46c <pthread_barrier_wait+0x94>
  20e588:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e58c:	97ffdf5d 	bl	206300 <get_rtt_syscall>
  20e590:	aa0003e3 	mov	x3, x0
  20e594:	b4fff620 	cbz	x0, 20e458 <pthread_barrier_wait+0x80>
  20e598:	d2800022 	mov	x2, #0x1                   	// #1
  20e59c:	d2801021 	mov	x1, #0x81                  	// #129
  20e5a0:	aa1303e0 	mov	x0, x19
  20e5a4:	d63f0060 	blr	x3
  20e5a8:	b100981f 	cmn	x0, #0x26
  20e5ac:	54fff561 	b.ne	20e458 <pthread_barrier_wait+0x80>  // b.any
  20e5b0:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e5b4:	97ffdf53 	bl	206300 <get_rtt_syscall>
  20e5b8:	aa0003e3 	mov	x3, x0
  20e5bc:	b4fff4e0 	cbz	x0, 20e458 <pthread_barrier_wait+0x80>
  20e5c0:	d2800022 	mov	x2, #0x1                   	// #1
  20e5c4:	aa1303e0 	mov	x0, x19
  20e5c8:	aa0203e1 	mov	x1, x2
  20e5cc:	d63f0060 	blr	x3
  20e5d0:	17ffffa2 	b	20e458 <pthread_barrier_wait+0x80>
  20e5d4:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e5d8:	97ffdf4a 	bl	206300 <get_rtt_syscall>
  20e5dc:	aa0003e3 	mov	x3, x0
  20e5e0:	b4fffa00 	cbz	x0, 20e520 <pthread_barrier_wait+0x148>
  20e5e4:	d2800022 	mov	x2, #0x1                   	// #1
  20e5e8:	d2801021 	mov	x1, #0x81                  	// #129
  20e5ec:	aa1303e0 	mov	x0, x19
  20e5f0:	d63f0060 	blr	x3
  20e5f4:	b100981f 	cmn	x0, #0x26
  20e5f8:	54fff941 	b.ne	20e520 <pthread_barrier_wait+0x148>  // b.any
  20e5fc:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e600:	97ffdf40 	bl	206300 <get_rtt_syscall>
  20e604:	aa0003e3 	mov	x3, x0
  20e608:	b4fff8c0 	cbz	x0, 20e520 <pthread_barrier_wait+0x148>
  20e60c:	d2800022 	mov	x2, #0x1                   	// #1
  20e610:	aa1303e0 	mov	x0, x19
  20e614:	aa0203e1 	mov	x1, x2
  20e618:	d63f0060 	blr	x3
  20e61c:	17ffffc1 	b	20e520 <pthread_barrier_wait+0x148>
  20e620:	12007af7 	and	w23, w23, #0x7fffffff
  20e624:	110006f5 	add	w21, w23, #0x1
  20e628:	34001977 	cbz	w23, 20e954 <pthread_barrier_wait+0x57c>
  20e62c:	f9000ff6 	str	x22, [sp, #24]
  20e630:	91001016 	add	x22, x0, #0x4
  20e634:	14000003 	b	20e640 <pthread_barrier_wait+0x268>
  20e638:	8814fe75 	stlxr	w20, w21, [x19]
  20e63c:	34000134 	cbz	w20, 20e660 <pthread_barrier_wait+0x288>
  20e640:	885ffe62 	ldaxr	w2, [x19]
  20e644:	34ffffa2 	cbz	w2, 20e638 <pthread_barrier_wait+0x260>
  20e648:	d5033bbf 	dmb	ish
  20e64c:	52800003 	mov	w3, #0x0                   	// #0
  20e650:	aa1603e1 	mov	x1, x22
  20e654:	aa1303e0 	mov	x0, x19
  20e658:	97fff458 	bl	20b7b8 <__wait>
  20e65c:	17fffff9 	b	20e640 <pthread_barrier_wait+0x268>
  20e660:	aa1303f6 	mov	x22, x19
  20e664:	b9400e60 	ldr	w0, [x19, #12]
  20e668:	11000400 	add	w0, w0, #0x1
  20e66c:	b800cec0 	str	w0, [x22, #12]!
  20e670:	6b0002bf 	cmp	w21, w0
  20e674:	54000be0 	b.eq	20e7f0 <pthread_barrier_wait+0x418>  // b.none
  20e678:	d5033bbf 	dmb	ish
  20e67c:	b900027f 	str	wzr, [x19]
  20e680:	d5033bbf 	dmb	ish
  20e684:	b9400660 	ldr	w0, [x19, #4]
  20e688:	35000ec0 	cbnz	w0, 20e860 <pthread_barrier_wait+0x488>
  20e68c:	b9400e62 	ldr	w2, [x19, #12]
  20e690:	91004275 	add	x21, x19, #0x10
  20e694:	7100005f 	cmp	w2, #0x0
  20e698:	5400010d 	b.le	20e6b8 <pthread_barrier_wait+0x2e0>
  20e69c:	52800003 	mov	w3, #0x0                   	// #0
  20e6a0:	aa1503e1 	mov	x1, x21
  20e6a4:	aa1603e0 	mov	x0, x22
  20e6a8:	97fff444 	bl	20b7b8 <__wait>
  20e6ac:	b9400e62 	ldr	w2, [x19, #12]
  20e6b0:	7100005f 	cmp	w2, #0x0
  20e6b4:	54ffff4c 	b.gt	20e69c <pthread_barrier_wait+0x2c4>
  20e6b8:	97fff794 	bl	20c508 <__vm_lock>
  20e6bc:	885ffec1 	ldaxr	w1, [x22]
  20e6c0:	51000420 	sub	w0, w1, #0x1
  20e6c4:	8802fec0 	stlxr	w2, w0, [x22]
  20e6c8:	35ffffa2 	cbnz	w2, 20e6bc <pthread_barrier_wait+0x2e4>
  20e6cc:	2b17003f 	cmn	w1, w23
  20e6d0:	54000600 	b.eq	20e790 <pthread_barrier_wait+0x3b8>  // b.none
  20e6d4:	b9400e62 	ldr	w2, [x19, #12]
  20e6d8:	91004275 	add	x21, x19, #0x10
  20e6dc:	340000e2 	cbz	w2, 20e6f8 <pthread_barrier_wait+0x320>
  20e6e0:	52800003 	mov	w3, #0x0                   	// #0
  20e6e4:	aa1503e1 	mov	x1, x21
  20e6e8:	aa1603e0 	mov	x0, x22
  20e6ec:	97fff433 	bl	20b7b8 <__wait>
  20e6f0:	b9400e62 	ldr	w2, [x19, #12]
  20e6f4:	35ffff62 	cbnz	w2, 20e6e0 <pthread_barrier_wait+0x308>
  20e6f8:	320107e3 	mov	w3, #0x80000001            	// #-2147483647
  20e6fc:	b9400262 	ldr	w2, [x19]
  20e700:	b9400664 	ldr	w4, [x19, #4]
  20e704:	51000440 	sub	w0, w2, #0x1
  20e708:	6b03005f 	cmp	w2, w3
  20e70c:	1a9f1000 	csel	w0, w0, wzr, ne  // ne = any
  20e710:	14000004 	b	20e720 <pthread_barrier_wait+0x348>
  20e714:	d503201f 	nop
  20e718:	8801fe60 	stlxr	w1, w0, [x19]
  20e71c:	340000e1 	cbz	w1, 20e738 <pthread_barrier_wait+0x360>
  20e720:	885ffe61 	ldaxr	w1, [x19]
  20e724:	6b01005f 	cmp	w2, w1
  20e728:	54ffff80 	b.eq	20e718 <pthread_barrier_wait+0x340>  // b.none
  20e72c:	d5033bbf 	dmb	ish
  20e730:	17fffff3 	b	20e6fc <pthread_barrier_wait+0x324>
  20e734:	d503201f 	nop
  20e738:	320107e0 	mov	w0, #0x80000001            	// #-2147483647
  20e73c:	6b00005f 	cmp	w2, w0
  20e740:	54000080 	b.eq	20e750 <pthread_barrier_wait+0x378>  // b.none
  20e744:	7100009f 	cmp	w4, #0x0
  20e748:	7a411840 	ccmp	w2, #0x1, #0x0, ne  // ne = any
  20e74c:	54000161 	b.ne	20e778 <pthread_barrier_wait+0x3a0>  // b.any
  20e750:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e754:	97ffdeeb 	bl	206300 <get_rtt_syscall>
  20e758:	aa0003e3 	mov	x3, x0
  20e75c:	b40000e0 	cbz	x0, 20e778 <pthread_barrier_wait+0x3a0>
  20e760:	d2800022 	mov	x2, #0x1                   	// #1
  20e764:	aa1303e0 	mov	x0, x19
  20e768:	aa0203e1 	mov	x1, x2
  20e76c:	d63f0060 	blr	x3
  20e770:	b100981f 	cmn	x0, #0x26
  20e774:	540009c0 	b.eq	20e8ac <pthread_barrier_wait+0x4d4>  // b.none
  20e778:	97fff76c 	bl	20c528 <__vm_unlock>
  20e77c:	2a1403e0 	mov	w0, w20
  20e780:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20e784:	a9427bf7 	ldp	x23, x30, [sp, #32]
  20e788:	a8c453f3 	ldp	x19, x20, [sp], #64
  20e78c:	d65f03c0 	ret
  20e790:	d5033bbf 	dmb	ish
  20e794:	b9000e7f 	str	wzr, [x19, #12]
  20e798:	d5033bbf 	dmb	ish
  20e79c:	b9401260 	ldr	w0, [x19, #16]
  20e7a0:	34fffac0 	cbz	w0, 20e6f8 <pthread_barrier_wait+0x320>
  20e7a4:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e7a8:	97ffded6 	bl	206300 <get_rtt_syscall>
  20e7ac:	aa0003e3 	mov	x3, x0
  20e7b0:	b4fffa40 	cbz	x0, 20e6f8 <pthread_barrier_wait+0x320>
  20e7b4:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
  20e7b8:	d2800021 	mov	x1, #0x1                   	// #1
  20e7bc:	aa1603e0 	mov	x0, x22
  20e7c0:	d63f0060 	blr	x3
  20e7c4:	b100981f 	cmn	x0, #0x26
  20e7c8:	54fff981 	b.ne	20e6f8 <pthread_barrier_wait+0x320>  // b.any
  20e7cc:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e7d0:	97ffdecc 	bl	206300 <get_rtt_syscall>
  20e7d4:	aa0003e3 	mov	x3, x0
  20e7d8:	b4fff900 	cbz	x0, 20e6f8 <pthread_barrier_wait+0x320>
  20e7dc:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
  20e7e0:	d2800021 	mov	x1, #0x1                   	// #1
  20e7e4:	aa1603e0 	mov	x0, x22
  20e7e8:	d63f0060 	blr	x3
  20e7ec:	17ffffc3 	b	20e6f8 <pthread_barrier_wait+0x320>
  20e7f0:	d5033bbf 	dmb	ish
  20e7f4:	b9000e7f 	str	wzr, [x19, #12]
  20e7f8:	d5033bbf 	dmb	ish
  20e7fc:	b9401260 	ldr	w0, [x19, #16]
  20e800:	35000060 	cbnz	w0, 20e80c <pthread_barrier_wait+0x434>
  20e804:	12800014 	mov	w20, #0xffffffff            	// #-1
  20e808:	17ffffac 	b	20e6b8 <pthread_barrier_wait+0x2e0>
  20e80c:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e810:	97ffdebc 	bl	206300 <get_rtt_syscall>
  20e814:	aa0003e3 	mov	x3, x0
  20e818:	b4ffff60 	cbz	x0, 20e804 <pthread_barrier_wait+0x42c>
  20e81c:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
  20e820:	d2800021 	mov	x1, #0x1                   	// #1
  20e824:	aa1603e0 	mov	x0, x22
  20e828:	d63f0060 	blr	x3
  20e82c:	b100981f 	cmn	x0, #0x26
  20e830:	54fffea1 	b.ne	20e804 <pthread_barrier_wait+0x42c>  // b.any
  20e834:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e838:	97ffdeb2 	bl	206300 <get_rtt_syscall>
  20e83c:	aa0003e3 	mov	x3, x0
  20e840:	b4fffe20 	cbz	x0, 20e804 <pthread_barrier_wait+0x42c>
  20e844:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
  20e848:	d2800021 	mov	x1, #0x1                   	// #1
  20e84c:	aa1603e0 	mov	x0, x22
  20e850:	12800014 	mov	w20, #0xffffffff            	// #-1
  20e854:	d63f0060 	blr	x3
  20e858:	17ffff98 	b	20e6b8 <pthread_barrier_wait+0x2e0>
  20e85c:	d503201f 	nop
  20e860:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e864:	97ffdea7 	bl	206300 <get_rtt_syscall>
  20e868:	aa0003e3 	mov	x3, x0
  20e86c:	b4fff100 	cbz	x0, 20e68c <pthread_barrier_wait+0x2b4>
  20e870:	d2800022 	mov	x2, #0x1                   	// #1
  20e874:	aa1303e0 	mov	x0, x19
  20e878:	aa0203e1 	mov	x1, x2
  20e87c:	d63f0060 	blr	x3
  20e880:	b100981f 	cmn	x0, #0x26
  20e884:	54fff041 	b.ne	20e68c <pthread_barrier_wait+0x2b4>  // b.any
  20e888:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e88c:	97ffde9d 	bl	206300 <get_rtt_syscall>
  20e890:	aa0003e3 	mov	x3, x0
  20e894:	b4ffefc0 	cbz	x0, 20e68c <pthread_barrier_wait+0x2b4>
  20e898:	d2800022 	mov	x2, #0x1                   	// #1
  20e89c:	aa1303e0 	mov	x0, x19
  20e8a0:	aa0203e1 	mov	x1, x2
  20e8a4:	d63f0060 	blr	x3
  20e8a8:	17ffff79 	b	20e68c <pthread_barrier_wait+0x2b4>
  20e8ac:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e8b0:	97ffde94 	bl	206300 <get_rtt_syscall>
  20e8b4:	aa0003e3 	mov	x3, x0
  20e8b8:	b4fff600 	cbz	x0, 20e778 <pthread_barrier_wait+0x3a0>
  20e8bc:	d2800022 	mov	x2, #0x1                   	// #1
  20e8c0:	aa1303e0 	mov	x0, x19
  20e8c4:	aa0203e1 	mov	x1, x2
  20e8c8:	d63f0060 	blr	x3
  20e8cc:	17ffffab 	b	20e778 <pthread_barrier_wait+0x3a0>
  20e8d0:	12800014 	mov	w20, #0xffffffff            	// #-1
  20e8d4:	17fffeed 	b	20e488 <pthread_barrier_wait+0xb0>
  20e8d8:	910103f4 	add	x20, sp, #0x40
  20e8dc:	a9bf7e9f 	stp	xzr, xzr, [x20, #-16]!
  20e8e0:	f9000e74 	str	x20, [x19, #24]
  20e8e4:	d5033bbf 	dmb	ish
  20e8e8:	b900027f 	str	wzr, [x19]
  20e8ec:	d5033bbf 	dmb	ish
  20e8f0:	b9400660 	ldr	w0, [x19, #4]
  20e8f4:	350005a0 	cbnz	w0, 20e9a8 <pthread_barrier_wait+0x5d0>
  20e8f8:	b9403fe0 	ldr	w0, [sp, #60]
  20e8fc:	350000e0 	cbnz	w0, 20e918 <pthread_barrier_wait+0x540>
  20e900:	52801900 	mov	w0, #0xc8                  	// #200
  20e904:	d5033bbf 	dmb	ish
  20e908:	71000400 	subs	w0, w0, #0x1
  20e90c:	54000060 	b.eq	20e918 <pthread_barrier_wait+0x540>  // b.none
  20e910:	b9403fe1 	ldr	w1, [sp, #60]
  20e914:	34ffff81 	cbz	w1, 20e904 <pthread_barrier_wait+0x52c>
  20e918:	9100f3e0 	add	x0, sp, #0x3c
  20e91c:	885ffc00 	ldaxr	w0, [x0]
  20e920:	11000400 	add	w0, w0, #0x1
  20e924:	9100f3e2 	add	x2, sp, #0x3c
  20e928:	8801fc40 	stlxr	w1, w0, [x2]
  20e92c:	35ffff61 	cbnz	w1, 20e918 <pthread_barrier_wait+0x540>
  20e930:	91003294 	add	x20, x20, #0xc
  20e934:	14000004 	b	20e944 <pthread_barrier_wait+0x56c>
  20e938:	97ffde72 	bl	206300 <get_rtt_syscall>
  20e93c:	aa0003e4 	mov	x4, x0
  20e940:	b5000100 	cbnz	x0, 20e960 <pthread_barrier_wait+0x588>
  20e944:	b9403fe1 	ldr	w1, [sp, #60]
  20e948:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e94c:	7100043f 	cmp	w1, #0x1
  20e950:	54ffff40 	b.eq	20e938 <pthread_barrier_wait+0x560>  // b.none
  20e954:	12800014 	mov	w20, #0xffffffff            	// #-1
  20e958:	f9400bf5 	ldr	x21, [sp, #16]
  20e95c:	17fffecb 	b	20e488 <pthread_barrier_wait+0xb0>
  20e960:	d2800003 	mov	x3, #0x0                   	// #0
  20e964:	d2800022 	mov	x2, #0x1                   	// #1
  20e968:	d2801001 	mov	x1, #0x80                  	// #128
  20e96c:	aa1403e0 	mov	x0, x20
  20e970:	d63f0080 	blr	x4
  20e974:	b100981f 	cmn	x0, #0x26
  20e978:	54fffe61 	b.ne	20e944 <pthread_barrier_wait+0x56c>  // b.any
  20e97c:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e980:	97ffde60 	bl	206300 <get_rtt_syscall>
  20e984:	aa0003e4 	mov	x4, x0
  20e988:	b4fffde0 	cbz	x0, 20e944 <pthread_barrier_wait+0x56c>
  20e98c:	d2800003 	mov	x3, #0x0                   	// #0
  20e990:	d2800022 	mov	x2, #0x1                   	// #1
  20e994:	d2800001 	mov	x1, #0x0                   	// #0
  20e998:	aa1403e0 	mov	x0, x20
  20e99c:	d63f0080 	blr	x4
  20e9a0:	17ffffe9 	b	20e944 <pthread_barrier_wait+0x56c>
  20e9a4:	d503201f 	nop
  20e9a8:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e9ac:	97ffde55 	bl	206300 <get_rtt_syscall>
  20e9b0:	aa0003e3 	mov	x3, x0
  20e9b4:	b4fffa20 	cbz	x0, 20e8f8 <pthread_barrier_wait+0x520>
  20e9b8:	d2800022 	mov	x2, #0x1                   	// #1
  20e9bc:	d2801021 	mov	x1, #0x81                  	// #129
  20e9c0:	aa1303e0 	mov	x0, x19
  20e9c4:	d63f0060 	blr	x3
  20e9c8:	b100981f 	cmn	x0, #0x26
  20e9cc:	54fff961 	b.ne	20e8f8 <pthread_barrier_wait+0x520>  // b.any
  20e9d0:	d2801e00 	mov	x0, #0xf0                  	// #240
  20e9d4:	97ffde4b 	bl	206300 <get_rtt_syscall>
  20e9d8:	aa0003e3 	mov	x3, x0
  20e9dc:	b4fff8e0 	cbz	x0, 20e8f8 <pthread_barrier_wait+0x520>
  20e9e0:	d2800022 	mov	x2, #0x1                   	// #1
  20e9e4:	aa1303e0 	mov	x0, x19
  20e9e8:	aa0203e1 	mov	x1, x2
  20e9ec:	d63f0060 	blr	x3
  20e9f0:	17ffffc2 	b	20e8f8 <pthread_barrier_wait+0x520>
  20e9f4:	00000000 	.inst	0x00000000 ; undefined

000000000020e9f8 <dummy>:
  20e9f8:	d65f03c0 	ret
  20e9fc:	00000000 	.inst	0x00000000 ; undefined

000000000020ea00 <_pthread_cleanup_push>:
  20ea00:	a9000801 	stp	x1, x2, [x0]
  20ea04:	17fff4ed 	b	20bdb8 <__do_cleanup_push>

000000000020ea08 <_pthread_cleanup_pop>:
  20ea08:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20ea0c:	2a0103f4 	mov	w20, w1
  20ea10:	aa0003f3 	mov	x19, x0
  20ea14:	f9000bfe 	str	x30, [sp, #16]
  20ea18:	97fff4ee 	bl	20bdd0 <__do_cleanup_pop>
  20ea1c:	340000b4 	cbz	w20, 20ea30 <_pthread_cleanup_pop+0x28>
  20ea20:	a9400261 	ldp	x1, x0, [x19]
  20ea24:	f9400bfe 	ldr	x30, [sp, #16]
  20ea28:	a8c253f3 	ldp	x19, x20, [sp], #32
  20ea2c:	d61f0020 	br	x1
  20ea30:	f9400bfe 	ldr	x30, [sp, #16]
  20ea34:	a8c253f3 	ldp	x19, x20, [sp], #32
  20ea38:	d65f03c0 	ret
  20ea3c:	00000000 	.inst	0x00000000 ; undefined

000000000020ea40 <undo>:
  20ea40:	52800001 	mov	w1, #0x0                   	// #0
  20ea44:	885ffc03 	ldaxr	w3, [x0]
  20ea48:	8802fc01 	stlxr	w2, w1, [x0]
  20ea4c:	35ffffc2 	cbnz	w2, 20ea44 <undo+0x4>
  20ea50:	71000c7f 	cmp	w3, #0x3
  20ea54:	54000060 	b.eq	20ea60 <undo+0x20>  // b.none
  20ea58:	d65f03c0 	ret
  20ea5c:	d503201f 	nop
  20ea60:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20ea64:	aa0003f3 	mov	x19, x0
  20ea68:	d2801e00 	mov	x0, #0xf0                  	// #240
  20ea6c:	97ffde25 	bl	206300 <get_rtt_syscall>
  20ea70:	aa0003e3 	mov	x3, x0
  20ea74:	b40000e0 	cbz	x0, 20ea90 <undo+0x50>
  20ea78:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
  20ea7c:	d2801021 	mov	x1, #0x81                  	// #129
  20ea80:	aa1303e0 	mov	x0, x19
  20ea84:	d63f0060 	blr	x3
  20ea88:	b100981f 	cmn	x0, #0x26
  20ea8c:	54000060 	b.eq	20ea98 <undo+0x58>  // b.none
  20ea90:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20ea94:	d65f03c0 	ret
  20ea98:	d2801e00 	mov	x0, #0xf0                  	// #240
  20ea9c:	97ffde19 	bl	206300 <get_rtt_syscall>
  20eaa0:	aa0003e3 	mov	x3, x0
  20eaa4:	b4ffff60 	cbz	x0, 20ea90 <undo+0x50>
  20eaa8:	aa1303e0 	mov	x0, x19
  20eaac:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
  20eab0:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20eab4:	d2800021 	mov	x1, #0x1                   	// #1
  20eab8:	d61f0060 	br	x3
  20eabc:	00000000 	.inst	0x00000000 ; undefined

000000000020eac0 <__pthread_once_full>:
  20eac0:	a9bb53f3 	stp	x19, x20, [sp, #-80]!
  20eac4:	aa0003f3 	mov	x19, x0
  20eac8:	52800034 	mov	w20, #0x1                   	// #1
  20eacc:	a9015bf5 	stp	x21, x22, [sp, #16]
  20ead0:	aa0103f6 	mov	x22, x1
  20ead4:	52800075 	mov	w21, #0x3                   	// #3
  20ead8:	f90013fe 	str	x30, [sp, #32]
  20eadc:	14000003 	b	20eae8 <__pthread_once_full+0x28>
  20eae0:	8800fe74 	stlxr	w0, w20, [x19]
  20eae4:	34000320 	cbz	w0, 20eb48 <__pthread_once_full+0x88>
  20eae8:	885ffe60 	ldaxr	w0, [x19]
  20eaec:	34ffffa0 	cbz	w0, 20eae0 <__pthread_once_full+0x20>
  20eaf0:	d5033bbf 	dmb	ish
  20eaf4:	7100081f 	cmp	w0, #0x2
  20eaf8:	540006a0 	b.eq	20ebcc <__pthread_once_full+0x10c>  // b.none
  20eafc:	71000c1f 	cmp	w0, #0x3
  20eb00:	54000180 	b.eq	20eb30 <__pthread_once_full+0x70>  // b.none
  20eb04:	7100041f 	cmp	w0, #0x1
  20eb08:	54ffff01 	b.ne	20eae8 <__pthread_once_full+0x28>  // b.any
  20eb0c:	885ffe60 	ldaxr	w0, [x19]
  20eb10:	7100041f 	cmp	w0, #0x1
  20eb14:	540000c1 	b.ne	20eb2c <__pthread_once_full+0x6c>  // b.any
  20eb18:	8800fe75 	stlxr	w0, w21, [x19]
  20eb1c:	340000a0 	cbz	w0, 20eb30 <__pthread_once_full+0x70>
  20eb20:	885ffe60 	ldaxr	w0, [x19]
  20eb24:	7100041f 	cmp	w0, #0x1
  20eb28:	54ffff80 	b.eq	20eb18 <__pthread_once_full+0x58>  // b.none
  20eb2c:	d5033bbf 	dmb	ish
  20eb30:	52800023 	mov	w3, #0x1                   	// #1
  20eb34:	52800062 	mov	w2, #0x3                   	// #3
  20eb38:	d2800001 	mov	x1, #0x0                   	// #0
  20eb3c:	aa1303e0 	mov	x0, x19
  20eb40:	97fff31e 	bl	20b7b8 <__wait>
  20eb44:	17ffffe9 	b	20eae8 <__pthread_once_full+0x28>
  20eb48:	aa1303e2 	mov	x2, x19
  20eb4c:	9100e3e0 	add	x0, sp, #0x38
  20eb50:	90000001 	adrp	x1, 20e000 <memchr+0x48>
  20eb54:	91290021 	add	x1, x1, #0xa40
  20eb58:	97ffffaa 	bl	20ea00 <_pthread_cleanup_push>
  20eb5c:	d63f02c0 	blr	x22
  20eb60:	9100e3e0 	add	x0, sp, #0x38
  20eb64:	52800001 	mov	w1, #0x0                   	// #0
  20eb68:	97ffffa8 	bl	20ea08 <_pthread_cleanup_pop>
  20eb6c:	52800040 	mov	w0, #0x2                   	// #2
  20eb70:	885ffe62 	ldaxr	w2, [x19]
  20eb74:	8801fe60 	stlxr	w1, w0, [x19]
  20eb78:	35ffffc1 	cbnz	w1, 20eb70 <__pthread_once_full+0xb0>
  20eb7c:	71000c5f 	cmp	w2, #0x3
  20eb80:	54000261 	b.ne	20ebcc <__pthread_once_full+0x10c>  // b.any
  20eb84:	d2801e00 	mov	x0, #0xf0                  	// #240
  20eb88:	97ffddde 	bl	206300 <get_rtt_syscall>
  20eb8c:	aa0003e3 	mov	x3, x0
  20eb90:	b40001e0 	cbz	x0, 20ebcc <__pthread_once_full+0x10c>
  20eb94:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
  20eb98:	d2801021 	mov	x1, #0x81                  	// #129
  20eb9c:	aa1303e0 	mov	x0, x19
  20eba0:	d63f0060 	blr	x3
  20eba4:	b100981f 	cmn	x0, #0x26
  20eba8:	54000121 	b.ne	20ebcc <__pthread_once_full+0x10c>  // b.any
  20ebac:	d2801e00 	mov	x0, #0xf0                  	// #240
  20ebb0:	97ffddd4 	bl	206300 <get_rtt_syscall>
  20ebb4:	aa0003e3 	mov	x3, x0
  20ebb8:	b40000a0 	cbz	x0, 20ebcc <__pthread_once_full+0x10c>
  20ebbc:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
  20ebc0:	d2800021 	mov	x1, #0x1                   	// #1
  20ebc4:	aa1303e0 	mov	x0, x19
  20ebc8:	d63f0060 	blr	x3
  20ebcc:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20ebd0:	52800000 	mov	w0, #0x0                   	// #0
  20ebd4:	f94013fe 	ldr	x30, [sp, #32]
  20ebd8:	a8c553f3 	ldp	x19, x20, [sp], #80
  20ebdc:	d65f03c0 	ret

000000000020ebe0 <__pthread_once>:
  20ebe0:	b9400002 	ldr	w2, [x0]
  20ebe4:	7100085f 	cmp	w2, #0x2
  20ebe8:	54000040 	b.eq	20ebf0 <__pthread_once+0x10>  // b.none
  20ebec:	17ffffb5 	b	20eac0 <__pthread_once_full>
  20ebf0:	d5033bbf 	dmb	ish
  20ebf4:	52800000 	mov	w0, #0x0                   	// #0
  20ebf8:	d65f03c0 	ret
  20ebfc:	00000000 	.inst	0x00000000 ; undefined

000000000020ec00 <cgt_init>:
  20ec00:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20ec04:	2a0003f3 	mov	w19, w0
  20ec08:	aa0103f4 	mov	x20, x1
  20ec0c:	d0000020 	adrp	x0, 214000 <syscall_table+0x800>
  20ec10:	d0000021 	adrp	x1, 214000 <syscall_table+0x800>
  20ec14:	9122a000 	add	x0, x0, #0x8a8
  20ec18:	91224021 	add	x1, x1, #0x890
  20ec1c:	f9000bfe 	str	x30, [sp, #16]
  20ec20:	9400005c 	bl	20ed90 <__vdsosym>
  20ec24:	aa0003e2 	mov	x2, x0
  20ec28:	90000003 	adrp	x3, 20e000 <memchr+0x48>
  20ec2c:	f0000020 	adrp	x0, 215000 <__data_start__>
  20ec30:	91300063 	add	x3, x3, #0xc00
  20ec34:	14000004 	b	20ec44 <cgt_init+0x44>
  20ec38:	9107c004 	add	x4, x0, #0x1f0
  20ec3c:	c801fc82 	stlxr	w1, x2, [x4]
  20ec40:	340000c1 	cbz	w1, 20ec58 <cgt_init+0x58>
  20ec44:	9107c001 	add	x1, x0, #0x1f0
  20ec48:	c85ffc21 	ldaxr	x1, [x1]
  20ec4c:	eb03003f 	cmp	x1, x3
  20ec50:	54ffff40 	b.eq	20ec38 <cgt_init+0x38>  // b.none
  20ec54:	d5033bbf 	dmb	ish
  20ec58:	b40000c2 	cbz	x2, 20ec70 <cgt_init+0x70>
  20ec5c:	aa1403e1 	mov	x1, x20
  20ec60:	2a1303e0 	mov	w0, w19
  20ec64:	f9400bfe 	ldr	x30, [sp, #16]
  20ec68:	a8c253f3 	ldp	x19, x20, [sp], #32
  20ec6c:	d61f0040 	br	x2
  20ec70:	128004a0 	mov	w0, #0xffffffda            	// #-38
  20ec74:	f9400bfe 	ldr	x30, [sp, #16]
  20ec78:	a8c253f3 	ldp	x19, x20, [sp], #32
  20ec7c:	d65f03c0 	ret

000000000020ec80 <__clock_gettime>:
  20ec80:	f0000022 	adrp	x2, 215000 <__data_start__>
  20ec84:	a9be53f3 	stp	x19, x20, [sp, #-32]!
  20ec88:	2a0003f3 	mov	w19, w0
  20ec8c:	aa0103f4 	mov	x20, x1
  20ec90:	f940f842 	ldr	x2, [x2, #496]
  20ec94:	f9000ffe 	str	x30, [sp, #24]
  20ec98:	b40000a2 	cbz	x2, 20ecac <__clock_gettime+0x2c>
  20ec9c:	d63f0040 	blr	x2
  20eca0:	34000240 	cbz	w0, 20ece8 <__clock_gettime+0x68>
  20eca4:	3100581f 	cmn	w0, #0x16
  20eca8:	54000280 	b.eq	20ecf8 <__clock_gettime+0x78>  // b.none
  20ecac:	f9000bf5 	str	x21, [sp, #16]
  20ecb0:	d28020e0 	mov	x0, #0x107                 	// #263
  20ecb4:	93407e75 	sxtw	x21, w19
  20ecb8:	97ffdd92 	bl	206300 <get_rtt_syscall>
  20ecbc:	aa0003e2 	mov	x2, x0
  20ecc0:	b40004c0 	cbz	x0, 20ed58 <__clock_gettime+0xd8>
  20ecc4:	aa1403e1 	mov	x1, x20
  20ecc8:	aa1503e0 	mov	x0, x21
  20eccc:	d63f0040 	blr	x2
  20ecd0:	3100981f 	cmn	w0, #0x26
  20ecd4:	540003a1 	b.ne	20ed48 <__clock_gettime+0xc8>  // b.any
  20ecd8:	928002a0 	mov	x0, #0xffffffffffffffea    	// #-22
  20ecdc:	34000173 	cbz	w19, 20ed08 <__clock_gettime+0x88>
  20ece0:	97ffddb8 	bl	2063c0 <__syscall_ret>
  20ece4:	f9400bf5 	ldr	x21, [sp, #16]
  20ece8:	f9400ffe 	ldr	x30, [sp, #24]
  20ecec:	a8c253f3 	ldp	x19, x20, [sp], #32
  20ecf0:	d65f03c0 	ret
  20ecf4:	d503201f 	nop
  20ecf8:	928002a0 	mov	x0, #0xffffffffffffffea    	// #-22
  20ecfc:	97ffddb1 	bl	2063c0 <__syscall_ret>
  20ed00:	17fffffa 	b	20ece8 <__clock_gettime+0x68>
  20ed04:	d503201f 	nop
  20ed08:	d28009c0 	mov	x0, #0x4e                  	// #78
  20ed0c:	97ffdd7d 	bl	206300 <get_rtt_syscall>
  20ed10:	aa0003e2 	mov	x2, x0
  20ed14:	b4000080 	cbz	x0, 20ed24 <__clock_gettime+0xa4>
  20ed18:	d2800001 	mov	x1, #0x0                   	// #0
  20ed1c:	aa1403e0 	mov	x0, x20
  20ed20:	d63f0040 	blr	x2
  20ed24:	f9400681 	ldr	x1, [x20, #8]
  20ed28:	52807d02 	mov	w2, #0x3e8                 	// #1000
  20ed2c:	f9400bf5 	ldr	x21, [sp, #16]
  20ed30:	52800000 	mov	w0, #0x0                   	// #0
  20ed34:	1b027c21 	mul	w1, w1, w2
  20ed38:	93407c21 	sxtw	x1, w1
  20ed3c:	f9000681 	str	x1, [x20, #8]
  20ed40:	17ffffea 	b	20ece8 <__clock_gettime+0x68>
  20ed44:	d503201f 	nop
  20ed48:	93407c00 	sxtw	x0, w0
  20ed4c:	97ffdd9d 	bl	2063c0 <__syscall_ret>
  20ed50:	f9400bf5 	ldr	x21, [sp, #16]
  20ed54:	17ffffe5 	b	20ece8 <__clock_gettime+0x68>
  20ed58:	d2800000 	mov	x0, #0x0                   	// #0
  20ed5c:	17ffffe1 	b	20ece0 <__clock_gettime+0x60>

000000000020ed60 <nanosleep>:
  20ed60:	aa0103e2 	mov	x2, x1
  20ed64:	aa0003e1 	mov	x1, x0
  20ed68:	f81f0ffe 	str	x30, [sp, #-16]!
  20ed6c:	d2800006 	mov	x6, #0x0                   	// #0
  20ed70:	d2800005 	mov	x5, #0x0                   	// #0
  20ed74:	d2800004 	mov	x4, #0x0                   	// #0
  20ed78:	d2800003 	mov	x3, #0x0                   	// #0
  20ed7c:	d2801440 	mov	x0, #0xa2                  	// #162
  20ed80:	97fff28c 	bl	20b7b0 <__syscall_cp>
  20ed84:	97ffdd8f 	bl	2063c0 <__syscall_ret>
  20ed88:	f84107fe 	ldr	x30, [sp], #16
  20ed8c:	d65f03c0 	ret

000000000020ed90 <__vdsosym>:
  20ed90:	f0000022 	adrp	x2, 215000 <__data_start__>
  20ed94:	f9477c45 	ldr	x5, [x2, #3832]
  20ed98:	f94000a2 	ldr	x2, [x5]
  20ed9c:	f100845f 	cmp	x2, #0x21
  20eda0:	54000cc0 	b.eq	20ef38 <__vdsosym+0x1a8>  // b.none
  20eda4:	b4000c62 	cbz	x2, 20ef30 <__vdsosym+0x1a0>
  20eda8:	d2800004 	mov	x4, #0x0                   	// #0
  20edac:	14000003 	b	20edb8 <__vdsosym+0x28>
  20edb0:	aa0303e4 	mov	x4, x3
  20edb4:	b4000be2 	cbz	x2, 20ef30 <__vdsosym+0x1a0>
  20edb8:	91000883 	add	x3, x4, #0x2
  20edbc:	f86378a2 	ldr	x2, [x5, x3, lsl #3]
  20edc0:	f100845f 	cmp	x2, #0x21
  20edc4:	54ffff61 	b.ne	20edb0 <__vdsosym+0x20>  // b.any
  20edc8:	91000c84 	add	x4, x4, #0x3
  20edcc:	d37df084 	lsl	x4, x4, #3
  20edd0:	f86468a6 	ldr	x6, [x5, x4]
  20edd4:	b4000ae6 	cbz	x6, 20ef30 <__vdsosym+0x1a0>
  20edd8:	794070c7 	ldrh	w7, [x6, #56]
  20eddc:	f94010c3 	ldr	x3, [x6, #32]
  20ede0:	8b0300c3 	add	x3, x6, x3
  20ede4:	b4000a67 	cbz	x7, 20ef30 <__vdsosym+0x1a0>
  20ede8:	a9b953f3 	stp	x19, x20, [sp, #-112]!
  20edec:	d2800002 	mov	x2, #0x0                   	// #0
  20edf0:	92800014 	mov	x20, #0xffffffffffffffff    	// #-1
  20edf4:	d2800004 	mov	x4, #0x0                   	// #0
  20edf8:	f9002bfe 	str	x30, [sp, #80]
  20edfc:	79406cc8 	ldrh	w8, [x6, #54]
  20ee00:	1400000a 	b	20ee28 <__vdsosym+0x98>
  20ee04:	d503201f 	nop
  20ee08:	710008bf 	cmp	w5, #0x2
  20ee0c:	54000061 	b.ne	20ee18 <__vdsosym+0x88>  // b.any
  20ee10:	f9400462 	ldr	x2, [x3, #8]
  20ee14:	8b0200c2 	add	x2, x6, x2
  20ee18:	91000484 	add	x4, x4, #0x1
  20ee1c:	8b080063 	add	x3, x3, x8
  20ee20:	eb07009f 	cmp	x4, x7
  20ee24:	54000160 	b.eq	20ee50 <__vdsosym+0xc0>  // b.none
  20ee28:	b9400065 	ldr	w5, [x3]
  20ee2c:	710004bf 	cmp	w5, #0x1
  20ee30:	54fffec1 	b.ne	20ee08 <__vdsosym+0x78>  // b.any
  20ee34:	a9409474 	ldp	x20, x5, [x3, #8]
  20ee38:	91000484 	add	x4, x4, #0x1
  20ee3c:	8b080063 	add	x3, x3, x8
  20ee40:	eb07009f 	cmp	x4, x7
  20ee44:	8b1400d4 	add	x20, x6, x20
  20ee48:	cb050294 	sub	x20, x20, x5
  20ee4c:	54fffee1 	b.ne	20ee28 <__vdsosym+0x98>  // b.any
  20ee50:	f100005f 	cmp	x2, #0x0
  20ee54:	ba411a84 	ccmn	x20, #0x1, #0x4, ne  // ne = any
  20ee58:	54000580 	b.eq	20ef08 <__vdsosym+0x178>  // b.none
  20ee5c:	f9400053 	ldr	x19, [x2]
  20ee60:	b4000553 	cbz	x19, 20ef08 <__vdsosym+0x178>
  20ee64:	d29ffe04 	mov	x4, #0xfff0                	// #65520
  20ee68:	d29fff85 	mov	x5, #0xfffc                	// #65532
  20ee6c:	a902e7f8 	stp	x24, x25, [sp, #40]
  20ee70:	91002042 	add	x2, x2, #0x8
  20ee74:	a903effa 	stp	x26, x27, [sp, #56]
  20ee78:	d2800019 	mov	x25, #0x0                   	// #0
  20ee7c:	f9000bf5 	str	x21, [sp, #16]
  20ee80:	d280001b 	mov	x27, #0x0                   	// #0
  20ee84:	d280001a 	mov	x26, #0x0                   	// #0
  20ee88:	d2800018 	mov	x24, #0x0                   	// #0
  20ee8c:	f2adffe4 	movk	x4, #0x6fff, lsl #16
  20ee90:	f2adffe5 	movk	x5, #0x6fff, lsl #16
  20ee94:	d2800015 	mov	x21, #0x0                   	// #0
  20ee98:	14000009 	b	20eebc <__vdsosym+0x12c>
  20ee9c:	d503201f 	nop
  20eea0:	f100127f 	cmp	x19, #0x4
  20eea4:	54000420 	b.eq	20ef28 <__vdsosym+0x198>  // b.none
  20eea8:	f100167f 	cmp	x19, #0x5
  20eeac:	9a831318 	csel	x24, x24, x3, ne  // ne = any
  20eeb0:	91004042 	add	x2, x2, #0x10
  20eeb4:	f85f8053 	ldur	x19, [x2, #-8]
  20eeb8:	b40001b3 	cbz	x19, 20eeec <__vdsosym+0x15c>
  20eebc:	f9400043 	ldr	x3, [x2]
  20eec0:	f1001a7f 	cmp	x19, #0x6
  20eec4:	8b030283 	add	x3, x20, x3
  20eec8:	54000280 	b.eq	20ef18 <__vdsosym+0x188>  // b.none
  20eecc:	54fffea9 	b.ls	20eea0 <__vdsosym+0x110>  // b.plast
  20eed0:	eb04027f 	cmp	x19, x4
  20eed4:	54000260 	b.eq	20ef20 <__vdsosym+0x190>  // b.none
  20eed8:	91004042 	add	x2, x2, #0x10
  20eedc:	eb05027f 	cmp	x19, x5
  20eee0:	9a831339 	csel	x25, x25, x3, ne  // ne = any
  20eee4:	f85f8053 	ldur	x19, [x2, #-8]
  20eee8:	b5fffeb3 	cbnz	x19, 20eebc <__vdsosym+0x12c>
  20eeec:	f100031f 	cmp	x24, #0x0
  20eef0:	fa401aa4 	ccmp	x21, #0x0, #0x4, ne  // ne = any
  20eef4:	fa401b44 	ccmp	x26, #0x0, #0x4, ne  // ne = any
  20eef8:	54000241 	b.ne	20ef40 <__vdsosym+0x1b0>  // b.any
  20eefc:	a942e7f8 	ldp	x24, x25, [sp, #40]
  20ef00:	a943effa 	ldp	x26, x27, [sp, #56]
  20ef04:	f9400bf5 	ldr	x21, [sp, #16]
  20ef08:	d2800000 	mov	x0, #0x0                   	// #0
  20ef0c:	f9402bfe 	ldr	x30, [sp, #80]
  20ef10:	a8c753f3 	ldp	x19, x20, [sp], #112
  20ef14:	d65f03c0 	ret
  20ef18:	aa0303f5 	mov	x21, x3
  20ef1c:	17ffffe5 	b	20eeb0 <__vdsosym+0x120>
  20ef20:	aa0303fb 	mov	x27, x3
  20ef24:	17ffffe3 	b	20eeb0 <__vdsosym+0x120>
  20ef28:	aa0303fa 	mov	x26, x3
  20ef2c:	17ffffe1 	b	20eeb0 <__vdsosym+0x120>
  20ef30:	d2800000 	mov	x0, #0x0                   	// #0
  20ef34:	d65f03c0 	ret
  20ef38:	d2800104 	mov	x4, #0x8                   	// #8
  20ef3c:	17ffffa5 	b	20edd0 <__vdsosym+0x40>
  20ef40:	b9400742 	ldr	w2, [x26, #4]
  20ef44:	f100033f 	cmp	x25, #0x0
  20ef48:	9a9f137b 	csel	x27, x27, xzr, ne  // ne = any
  20ef4c:	34fffd82 	cbz	w2, 20eefc <__vdsosym+0x16c>
  20ef50:	a901dff6 	stp	x22, x23, [sp, #24]
  20ef54:	aa0103f6 	mov	x22, x1
  20ef58:	f90027fc 	str	x28, [sp, #72]
  20ef5c:	528080d7 	mov	w23, #0x406                 	// #1030
  20ef60:	f90037e0 	str	x0, [sp, #104]
  20ef64:	528004fc 	mov	w28, #0x27                  	// #39
  20ef68:	394012a2 	ldrb	w2, [x21, #4]
  20ef6c:	12000c43 	and	w3, w2, #0xf
  20ef70:	1ac32b83 	asr	w3, w28, w3
  20ef74:	36000303 	tbz	w3, #0, 20efd4 <__vdsosym+0x244>
  20ef78:	53047c42 	lsr	w2, w2, #4
  20ef7c:	1ac22ae2 	asr	w2, w23, w2
  20ef80:	360002a2 	tbz	w2, #0, 20efd4 <__vdsosym+0x244>
  20ef84:	79400ea0 	ldrh	w0, [x21, #6]
  20ef88:	34000260 	cbz	w0, 20efd4 <__vdsosym+0x244>
  20ef8c:	b94002a1 	ldr	w1, [x21]
  20ef90:	aa1603e0 	mov	x0, x22
  20ef94:	8b010301 	add	x1, x24, x1
  20ef98:	97ffefe4 	bl	20af28 <strcmp>
  20ef9c:	350001c0 	cbnz	w0, 20efd4 <__vdsosym+0x244>
  20efa0:	b40003bb 	cbz	x27, 20f014 <__vdsosym+0x284>
  20efa4:	78737b61 	ldrh	w1, [x27, x19, lsl #1]
  20efa8:	aa1903e2 	mov	x2, x25
  20efac:	12003821 	and	w1, w1, #0x7fff
  20efb0:	79400440 	ldrh	w0, [x2, #2]
  20efb4:	370000a0 	tbnz	w0, #0, 20efc8 <__vdsosym+0x238>
  20efb8:	79400840 	ldrh	w0, [x2, #4]
  20efbc:	12003800 	and	w0, w0, #0x7fff
  20efc0:	6b00003f 	cmp	w1, w0
  20efc4:	540001c0 	b.eq	20effc <__vdsosym+0x26c>  // b.none
  20efc8:	b9401040 	ldr	w0, [x2, #16]
  20efcc:	8b204042 	add	x2, x2, w0, uxtw
  20efd0:	35ffff00 	cbnz	w0, 20efb0 <__vdsosym+0x220>
  20efd4:	b9400740 	ldr	w0, [x26, #4]
  20efd8:	91000673 	add	x19, x19, #0x1
  20efdc:	910062b5 	add	x21, x21, #0x18
  20efe0:	eb13001f 	cmp	x0, x19
  20efe4:	54fffc28 	b.hi	20ef68 <__vdsosym+0x1d8>  // b.pmore
  20efe8:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20efec:	a94263f7 	ldp	x23, x24, [sp, #32]
  20eff0:	a9436bf9 	ldp	x25, x26, [sp, #48]
  20eff4:	a94473fb 	ldp	x27, x28, [sp, #64]
  20eff8:	17ffffc4 	b	20ef08 <__vdsosym+0x178>
  20effc:	b9400c41 	ldr	w1, [x2, #12]
  20f000:	f94037e0 	ldr	x0, [sp, #104]
  20f004:	b8616841 	ldr	w1, [x2, x1]
  20f008:	8b010301 	add	x1, x24, x1
  20f00c:	97ffefc7 	bl	20af28 <strcmp>
  20f010:	35fffe20 	cbnz	w0, 20efd4 <__vdsosym+0x244>
  20f014:	f94006a0 	ldr	x0, [x21, #8]
  20f018:	a94263f7 	ldp	x23, x24, [sp, #32]
  20f01c:	8b000280 	add	x0, x20, x0
  20f020:	a9436bf9 	ldp	x25, x26, [sp, #48]
  20f024:	a94473fb 	ldp	x27, x28, [sp, #64]
  20f028:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20f02c:	17ffffb8 	b	20ef0c <__vdsosym+0x17c>

000000000020f030 <wcrtomb>:
  20f030:	b40004e0 	cbz	x0, 20f0cc <wcrtomb+0x9c>
  20f034:	7101fc3f 	cmp	w1, #0x7f
  20f038:	54000489 	b.ls	20f0c8 <wcrtomb+0x98>  // b.plast
  20f03c:	f81f0ffe 	str	x30, [sp, #-16]!
  20f040:	2a0103e2 	mov	w2, w1
  20f044:	d53bd044 	mrs	x4, tpidr_el0
  20f048:	f85d0084 	ldur	x4, [x4, #-48]
  20f04c:	aa0003e3 	mov	x3, x0
  20f050:	f9400084 	ldr	x4, [x4]
  20f054:	b4000524 	cbz	x4, 20f0f8 <wcrtomb+0xc8>
  20f058:	711ffc3f 	cmp	w1, #0x7ff
  20f05c:	540003e9 	b.ls	20f0d8 <wcrtomb+0xa8>  // b.plast
  20f060:	51403821 	sub	w1, w1, #0xe, lsl #12
  20f064:	5283ffe0 	mov	w0, #0x1fff                	// #8191
  20f068:	6b00003f 	cmp	w1, w0
  20f06c:	529affe0 	mov	w0, #0xd7ff                	// #55295
  20f070:	7a408040 	ccmp	w2, w0, #0x0, hi  // hi = pmore
  20f074:	54000629 	b.ls	20f138 <wcrtomb+0x108>  // b.plast
  20f078:	51404041 	sub	w1, w2, #0x10, lsl #12
  20f07c:	12bffe00 	mov	w0, #0xfffff               	// #1048575
  20f080:	6b00003f 	cmp	w1, w0
  20f084:	540004e8 	b.hi	20f120 <wcrtomb+0xf0>  // b.pmore
  20f088:	d34c4441 	ubfx	x1, x2, #12, #6
  20f08c:	53127c44 	lsr	w4, w2, #18
  20f090:	d3462c40 	ubfx	x0, x2, #6, #6
  20f094:	32196021 	orr	w1, w1, #0xffffff80
  20f098:	12001442 	and	w2, w2, #0x3f
  20f09c:	321c6c84 	orr	w4, w4, #0xfffffff0
  20f0a0:	32196000 	orr	w0, w0, #0xffffff80
  20f0a4:	32196042 	orr	w2, w2, #0xffffff80
  20f0a8:	39000461 	strb	w1, [x3, #1]
  20f0ac:	d2800081 	mov	x1, #0x4                   	// #4
  20f0b0:	39000064 	strb	w4, [x3]
  20f0b4:	39000860 	strb	w0, [x3, #2]
  20f0b8:	39000c62 	strb	w2, [x3, #3]
  20f0bc:	aa0103e0 	mov	x0, x1
  20f0c0:	f84107fe 	ldr	x30, [sp], #16
  20f0c4:	d65f03c0 	ret
  20f0c8:	39000001 	strb	w1, [x0]
  20f0cc:	d2800021 	mov	x1, #0x1                   	// #1
  20f0d0:	aa0103e0 	mov	x0, x1
  20f0d4:	d65f03c0 	ret
  20f0d8:	53067c20 	lsr	w0, w1, #6
  20f0dc:	12001422 	and	w2, w1, #0x3f
  20f0e0:	321a6400 	orr	w0, w0, #0xffffffc0
  20f0e4:	32196042 	orr	w2, w2, #0xffffff80
  20f0e8:	39000060 	strb	w0, [x3]
  20f0ec:	d2800041 	mov	x1, #0x2                   	// #2
  20f0f0:	39000462 	strb	w2, [x3, #1]
  20f0f4:	17fffff2 	b	20f0bc <wcrtomb+0x8c>
  20f0f8:	129befe3 	mov	w3, #0xffff2080            	// #-57216
  20f0fc:	0b030022 	add	w2, w1, w3
  20f100:	7101fc5f 	cmp	w2, #0x7f
  20f104:	540000e8 	b.hi	20f120 <wcrtomb+0xf0>  // b.pmore
  20f108:	39000001 	strb	w1, [x0]
  20f10c:	d2800021 	mov	x1, #0x1                   	// #1
  20f110:	aa0103e0 	mov	x0, x1
  20f114:	f84107fe 	ldr	x30, [sp], #16
  20f118:	d65f03c0 	ret
  20f11c:	d503201f 	nop
  20f120:	97ffd100 	bl	203520 <__errno_location>
  20f124:	52800a82 	mov	w2, #0x54                  	// #84
  20f128:	92800001 	mov	x1, #0xffffffffffffffff    	// #-1
  20f12c:	b9000002 	str	w2, [x0]
  20f130:	17ffffe3 	b	20f0bc <wcrtomb+0x8c>
  20f134:	d503201f 	nop
  20f138:	530c7c41 	lsr	w1, w2, #12
  20f13c:	d3462c40 	ubfx	x0, x2, #6, #6
  20f140:	321b6821 	orr	w1, w1, #0xffffffe0
  20f144:	12001442 	and	w2, w2, #0x3f
  20f148:	32196000 	orr	w0, w0, #0xffffff80
  20f14c:	32196042 	orr	w2, w2, #0xffffff80
  20f150:	39000061 	strb	w1, [x3]
  20f154:	d2800061 	mov	x1, #0x3                   	// #3
  20f158:	39000460 	strb	w0, [x3, #1]
  20f15c:	39000862 	strb	w2, [x3, #2]
  20f160:	17ffffd7 	b	20f0bc <wcrtomb+0x8c>

000000000020f164 <__restore>:
  20f164:	d2801168 	mov	x8, #0x8b                  	// #139
  20f168:	d4000001 	svc	#0x0
  20f16c:	00000000 	.inst	0x00000000 ; undefined

000000000020f170 <sigtimedwait>:
  20f170:	a9bd53f3 	stp	x19, x20, [sp, #-48]!
  20f174:	aa0203f4 	mov	x20, x2
  20f178:	a9015bf5 	stp	x21, x22, [sp, #16]
  20f17c:	aa0003f6 	mov	x22, x0
  20f180:	aa0103f5 	mov	x21, x1
  20f184:	f90013fe 	str	x30, [sp, #32]
  20f188:	14000006 	b	20f1a0 <sigtimedwait+0x30>
  20f18c:	d503201f 	nop
  20f190:	97ffd0e4 	bl	203520 <__errno_location>
  20f194:	b9400000 	ldr	w0, [x0]
  20f198:	7100101f 	cmp	w0, #0x4
  20f19c:	54000181 	b.ne	20f1cc <sigtimedwait+0x5c>  // b.any
  20f1a0:	aa1403e3 	mov	x3, x20
  20f1a4:	aa1503e2 	mov	x2, x21
  20f1a8:	aa1603e1 	mov	x1, x22
  20f1ac:	d2800006 	mov	x6, #0x0                   	// #0
  20f1b0:	d2800005 	mov	x5, #0x0                   	// #0
  20f1b4:	d2800104 	mov	x4, #0x8                   	// #8
  20f1b8:	d2801620 	mov	x0, #0xb1                  	// #177
  20f1bc:	97fff17d 	bl	20b7b0 <__syscall_cp>
  20f1c0:	97ffdc80 	bl	2063c0 <__syscall_ret>
  20f1c4:	2a0003f3 	mov	w19, w0
  20f1c8:	37fffe40 	tbnz	w0, #31, 20f190 <sigtimedwait+0x20>
  20f1cc:	2a1303e0 	mov	w0, w19
  20f1d0:	f94013fe 	ldr	x30, [sp, #32]
  20f1d4:	a9415bf5 	ldp	x21, x22, [sp, #16]
  20f1d8:	a8c353f3 	ldp	x19, x20, [sp], #48
  20f1dc:	d65f03c0 	ret

000000000020f1e0 <close_file>:
  20f1e0:	b4000380 	cbz	x0, 20f250 <close_file+0x70>
  20f1e4:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20f1e8:	aa0003f3 	mov	x19, x0
  20f1ec:	b9408c01 	ldr	w1, [x0, #140]
  20f1f0:	36f80281 	tbz	w1, #31, 20f240 <close_file+0x60>
  20f1f4:	f9401661 	ldr	x1, [x19, #40]
  20f1f8:	f9401e60 	ldr	x0, [x19, #56]
  20f1fc:	eb00003f 	cmp	x1, x0
  20f200:	540000c0 	b.eq	20f218 <close_file+0x38>  // b.none
  20f204:	f9402663 	ldr	x3, [x19, #72]
  20f208:	d2800002 	mov	x2, #0x0                   	// #0
  20f20c:	d2800001 	mov	x1, #0x0                   	// #0
  20f210:	aa1303e0 	mov	x0, x19
  20f214:	d63f0060 	blr	x3
  20f218:	a9408261 	ldp	x1, x0, [x19, #8]
  20f21c:	eb00003f 	cmp	x1, x0
  20f220:	54000140 	b.eq	20f248 <close_file+0x68>  // b.none
  20f224:	cb000021 	sub	x1, x1, x0
  20f228:	f9402a63 	ldr	x3, [x19, #80]
  20f22c:	aa1303e0 	mov	x0, x19
  20f230:	52800022 	mov	w2, #0x1                   	// #1
  20f234:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20f238:	d61f0060 	br	x3
  20f23c:	d503201f 	nop
  20f240:	97fff93c 	bl	20d730 <__lockfile>
  20f244:	17ffffec 	b	20f1f4 <close_file+0x14>
  20f248:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20f24c:	d65f03c0 	ret
  20f250:	d65f03c0 	ret
  20f254:	00000000 	.inst	0x00000000 ; undefined

000000000020f258 <__stdio_exit>:
  20f258:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  20f25c:	97fffb4b 	bl	20df88 <__ofl_lock>
  20f260:	f9400013 	ldr	x19, [x0]
  20f264:	b40000b3 	cbz	x19, 20f278 <__stdio_exit+0x20>
  20f268:	aa1303e0 	mov	x0, x19
  20f26c:	97ffffdd 	bl	20f1e0 <close_file>
  20f270:	f9403a73 	ldr	x19, [x19, #112]
  20f274:	b5ffffb3 	cbnz	x19, 20f268 <__stdio_exit+0x10>
  20f278:	d0000020 	adrp	x0, 215000 <__data_start__>
  20f27c:	f9466c00 	ldr	x0, [x0, #3288]
  20f280:	97ffffd8 	bl	20f1e0 <close_file>
  20f284:	d0000020 	adrp	x0, 215000 <__data_start__>
  20f288:	f940f000 	ldr	x0, [x0, #480]
  20f28c:	97ffffd5 	bl	20f1e0 <close_file>
  20f290:	d0000020 	adrp	x0, 215000 <__data_start__>
  20f294:	a8c17bf3 	ldp	x19, x30, [sp], #16
  20f298:	f9407800 	ldr	x0, [x0, #240]
  20f29c:	17ffffd1 	b	20f1e0 <close_file>

000000000020f2a0 <__addtf3>:
  20f2a0:	9e660000 	fmov	x0, d0
  20f2a4:	9e660022 	fmov	x2, d1
  20f2a8:	9eae0023 	fmov	x3, v1.d[1]
  20f2ac:	9eae0001 	fmov	x1, v0.d[1]
  20f2b0:	aa0003e4 	mov	x4, x0
  20f2b4:	aa0203e5 	mov	x5, x2
  20f2b8:	aa0303e0 	mov	x0, x3
  20f2bc:	d53b4408 	mrs	x8, fpcr
  20f2c0:	d37ffc26 	lsr	x6, x1, #63
  20f2c4:	d37ffc6d 	lsr	x13, x3, #63
  20f2c8:	12001cc6 	and	w6, w6, #0xff
  20f2cc:	12001dad 	and	w13, w13, #0xff
  20f2d0:	d370f802 	ubfx	x2, x0, #48, #15
  20f2d4:	d370f823 	ubfx	x3, x1, #48, #15
  20f2d8:	92401cca 	and	x10, x6, #0xff
  20f2dc:	d37dbc21 	ubfiz	x1, x1, #3, #48
  20f2e0:	92401daf 	and	x15, x13, #0xff
  20f2e4:	d37dbc00 	ubfiz	x0, x0, #3, #48
  20f2e8:	12003c6b 	and	w11, w3, #0xffff
  20f2ec:	12003c47 	and	w7, w2, #0xffff
  20f2f0:	92403c4c 	and	x12, x2, #0xffff
  20f2f4:	92403c63 	and	x3, x3, #0xffff
  20f2f8:	aa44f421 	orr	x1, x1, x4, lsr #61
  20f2fc:	d37df089 	lsl	x9, x4, #3
  20f300:	aa45f402 	orr	x2, x0, x5, lsr #61
  20f304:	d37df0ae 	lsl	x14, x5, #3
  20f308:	eb0f015f 	cmp	x10, x15
  20f30c:	54000c60 	b.eq	20f498 <__addtf3+0x1f8>  // b.none
  20f310:	4b070160 	sub	w0, w11, w7
  20f314:	7100001f 	cmp	w0, #0x0
  20f318:	540009cd 	b.le	20f450 <__addtf3+0x1b0>
  20f31c:	b5000dec 	cbnz	x12, 20f4d8 <__addtf3+0x238>
  20f320:	aa0e0044 	orr	x4, x2, x14
  20f324:	b40012a4 	cbz	x4, 20f578 <__addtf3+0x2d8>
  20f328:	71000400 	subs	w0, w0, #0x1
  20f32c:	540017a1 	b.ne	20f620 <__addtf3+0x380>  // b.any
  20f330:	cb0e012e 	sub	x14, x9, x14
  20f334:	eb0e013f 	cmp	x9, x14
  20f338:	aa0e03e9 	mov	x9, x14
  20f33c:	da020021 	sbc	x1, x1, x2
  20f340:	9240c824 	and	x4, x1, #0x7ffffffffffff
  20f344:	b6981201 	tbz	x1, #51, 20f584 <__addtf3+0x2e4>
  20f348:	dac01121 	clz	x1, x9
  20f34c:	f100009f 	cmp	x4, #0x0
  20f350:	11010021 	add	w1, w1, #0x40
  20f354:	dac01080 	clz	x0, x4
  20f358:	1a800020 	csel	w0, w1, w0, eq  // eq = none
  20f35c:	51003001 	sub	w1, w0, #0xc
  20f360:	7100fc3f 	cmp	w1, #0x3f
  20f364:	5400222c 	b.gt	20f7a8 <__addtf3+0x508>
  20f368:	52800800 	mov	w0, #0x40                  	// #64
  20f36c:	4b010000 	sub	w0, w0, w1
  20f370:	9ac12084 	lsl	x4, x4, x1
  20f374:	9ac02520 	lsr	x0, x9, x0
  20f378:	aa040000 	orr	x0, x0, x4
  20f37c:	9ac12129 	lsl	x9, x9, x1
  20f380:	93407c22 	sxtw	x2, w1
  20f384:	eb03005f 	cmp	x2, x3
  20f388:	5400208b 	b.lt	20f798 <__addtf3+0x4f8>  // b.tstop
  20f38c:	4b030021 	sub	w1, w1, w3
  20f390:	11000421 	add	w1, w1, #0x1
  20f394:	7100fc3f 	cmp	w1, #0x3f
  20f398:	5400258c 	b.gt	20f848 <__addtf3+0x5a8>
  20f39c:	52800802 	mov	w2, #0x40                  	// #64
  20f3a0:	4b010042 	sub	w2, w2, w1
  20f3a4:	9ac12523 	lsr	x3, x9, x1
  20f3a8:	9ac22129 	lsl	x9, x9, x2
  20f3ac:	f100013f 	cmp	x9, #0x0
  20f3b0:	9ac12401 	lsr	x1, x0, x1
  20f3b4:	9a9f07e9 	cset	x9, ne  // ne = any
  20f3b8:	9ac22000 	lsl	x0, x0, x2
  20f3bc:	aa030000 	orr	x0, x0, x3
  20f3c0:	aa090009 	orr	x9, x0, x9
  20f3c4:	aa010127 	orr	x7, x9, x1
  20f3c8:	b4000e87 	cbz	x7, 20f598 <__addtf3+0x2f8>
  20f3cc:	92400920 	and	x0, x9, #0x7
  20f3d0:	d2800003 	mov	x3, #0x0                   	// #0
  20f3d4:	5280002b 	mov	w11, #0x1                   	// #1
  20f3d8:	b40055e0 	cbz	x0, 20fe94 <__addtf3+0xbf4>
  20f3dc:	926a0500 	and	x0, x8, #0xc00000
  20f3e0:	f150001f 	cmp	x0, #0x400, lsl #12
  20f3e4:	54001d20 	b.eq	20f788 <__addtf3+0x4e8>  // b.none
  20f3e8:	f160001f 	cmp	x0, #0x800, lsl #12
  20f3ec:	54001be0 	b.eq	20f768 <__addtf3+0x4c8>  // b.none
  20f3f0:	b4001840 	cbz	x0, 20f6f8 <__addtf3+0x458>
  20f3f4:	52800200 	mov	w0, #0x10                  	// #16
  20f3f8:	924d0022 	and	x2, x1, #0x8000000000000
  20f3fc:	3400004b 	cbz	w11, 20f404 <__addtf3+0x164>
  20f400:	321d0000 	orr	w0, w0, #0x8
  20f404:	b4001da2 	cbz	x2, 20f7b8 <__addtf3+0x518>
  20f408:	91000463 	add	x3, x3, #0x1
  20f40c:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  20f410:	eb02007f 	cmp	x3, x2
  20f414:	54001420 	b.eq	20f698 <__addtf3+0x3f8>  // b.none
  20f418:	924cf821 	and	x1, x1, #0xfff7ffffffffffff
  20f41c:	12003864 	and	w4, w3, #0x7fff
  20f420:	93c90c29 	extr	x9, x1, x9, #3
  20f424:	d343c821 	ubfx	x1, x1, #3, #48
  20f428:	d2800003 	mov	x3, #0x0                   	// #0
  20f42c:	9e670121 	fmov	d1, x9
  20f430:	b340bc23 	bfxil	x3, x1, #0, #48
  20f434:	b3503883 	bfi	x3, x4, #48, #15
  20f438:	b34100c3 	bfi	x3, x6, #63, #1
  20f43c:	9eaf0061 	fmov	v1.d[1], x3
  20f440:	350014c0 	cbnz	w0, 20f6d8 <__addtf3+0x438>
  20f444:	4ea11c20 	mov	v0.16b, v1.16b
  20f448:	d65f03c0 	ret
  20f44c:	d503201f 	nop
  20f450:	54000b01 	b.ne	20f5b0 <__addtf3+0x310>  // b.any
  20f454:	91000467 	add	x7, x3, #0x1
  20f458:	924038e7 	and	x7, x7, #0x7fff
  20f45c:	f10004ff 	cmp	x7, #0x1
  20f460:	54001d8d 	b.le	20f810 <__addtf3+0x570>
  20f464:	cb0e0125 	sub	x5, x9, x14
  20f468:	eb05013f 	cmp	x9, x5
  20f46c:	da020024 	sbc	x4, x1, x2
  20f470:	b7982084 	tbnz	x4, #51, 20f880 <__addtf3+0x5e0>
  20f474:	aa0400a7 	orr	x7, x5, x4
  20f478:	b5003107 	cbnz	x7, 20fa98 <__addtf3+0x7f8>
  20f47c:	926a0508 	and	x8, x8, #0xc00000
  20f480:	d2800009 	mov	x9, #0x0                   	// #0
  20f484:	f160011f 	cmp	x8, #0x800, lsl #12
  20f488:	d2800003 	mov	x3, #0x0                   	// #0
  20f48c:	1a9f17e6 	cset	w6, eq  // eq = none
  20f490:	14000045 	b	20f5a4 <__addtf3+0x304>
  20f494:	d503201f 	nop
  20f498:	4b07016b 	sub	w11, w11, w7
  20f49c:	7100017f 	cmp	w11, #0x0
  20f4a0:	5400140d 	b.le	20f720 <__addtf3+0x480>
  20f4a4:	b500042c 	cbnz	x12, 20f528 <__addtf3+0x288>
  20f4a8:	aa0e0040 	orr	x0, x2, x14
  20f4ac:	b5000d60 	cbnz	x0, 20f658 <__addtf3+0x3b8>
  20f4b0:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  20f4b4:	eb00007f 	cmp	x3, x0
  20f4b8:	54000661 	b.ne	20f584 <__addtf3+0x2e4>  // b.any
  20f4bc:	aa090020 	orr	x0, x1, x9
  20f4c0:	b4002c80 	cbz	x0, 20fa50 <__addtf3+0x7b0>
  20f4c4:	d372fc20 	lsr	x0, x1, #50
  20f4c8:	5280000b 	mov	w11, #0x0                   	// #0
  20f4cc:	52000000 	eor	w0, w0, #0x1
  20f4d0:	1400005d 	b	20f644 <__addtf3+0x3a4>
  20f4d4:	d503201f 	nop
  20f4d8:	d28fffe4 	mov	x4, #0x7fff                	// #32767
  20f4dc:	b24d0042 	orr	x2, x2, #0x8000000000000
  20f4e0:	eb04007f 	cmp	x3, x4
  20f4e4:	54000a40 	b.eq	20f62c <__addtf3+0x38c>  // b.none
  20f4e8:	7101d01f 	cmp	w0, #0x74
  20f4ec:	5400182c 	b.gt	20f7f0 <__addtf3+0x550>
  20f4f0:	7100fc1f 	cmp	w0, #0x3f
  20f4f4:	54001fac 	b.gt	20f8e8 <__addtf3+0x648>
  20f4f8:	52800804 	mov	w4, #0x40                  	// #64
  20f4fc:	4b000084 	sub	w4, w4, w0
  20f500:	9ac025c5 	lsr	x5, x14, x0
  20f504:	9ac421ce 	lsl	x14, x14, x4
  20f508:	f10001df 	cmp	x14, #0x0
  20f50c:	9ac02440 	lsr	x0, x2, x0
  20f510:	cb000021 	sub	x1, x1, x0
  20f514:	9ac42042 	lsl	x2, x2, x4
  20f518:	9a9f07e4 	cset	x4, ne  // ne = any
  20f51c:	aa050042 	orr	x2, x2, x5
  20f520:	aa040042 	orr	x2, x2, x4
  20f524:	140000b6 	b	20f7fc <__addtf3+0x55c>
  20f528:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  20f52c:	b24d0042 	orr	x2, x2, #0x8000000000000
  20f530:	eb00007f 	cmp	x3, x0
  20f534:	540009c0 	b.eq	20f66c <__addtf3+0x3cc>  // b.none
  20f538:	7101d17f 	cmp	w11, #0x74
  20f53c:	54001aec 	b.gt	20f898 <__addtf3+0x5f8>
  20f540:	7100fd7f 	cmp	w11, #0x3f
  20f544:	54002aec 	b.gt	20faa0 <__addtf3+0x800>
  20f548:	52800800 	mov	w0, #0x40                  	// #64
  20f54c:	4b0b0000 	sub	w0, w0, w11
  20f550:	9acb25c4 	lsr	x4, x14, x11
  20f554:	9ac021ce 	lsl	x14, x14, x0
  20f558:	f10001df 	cmp	x14, #0x0
  20f55c:	9acb244b 	lsr	x11, x2, x11
  20f560:	8b0b0021 	add	x1, x1, x11
  20f564:	9ac02040 	lsl	x0, x2, x0
  20f568:	9a9f07e2 	cset	x2, ne  // ne = any
  20f56c:	aa040000 	orr	x0, x0, x4
  20f570:	aa020000 	orr	x0, x0, x2
  20f574:	140000cc 	b	20f8a4 <__addtf3+0x604>
  20f578:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  20f57c:	eb00007f 	cmp	x3, x0
  20f580:	54002640 	b.eq	20fa48 <__addtf3+0x7a8>  // b.none
  20f584:	aa010127 	orr	x7, x9, x1
  20f588:	92400920 	and	x0, x9, #0x7
  20f58c:	5280000b 	mov	w11, #0x0                   	// #0
  20f590:	b5fff243 	cbnz	x3, 20f3d8 <__addtf3+0x138>
  20f594:	b5fff1c7 	cbnz	x7, 20f3cc <__addtf3+0x12c>
  20f598:	d2800009 	mov	x9, #0x0                   	// #0
  20f59c:	d2800003 	mov	x3, #0x0                   	// #0
  20f5a0:	52800000 	mov	w0, #0x0                   	// #0
  20f5a4:	9240bce1 	and	x1, x7, #0xffffffffffff
  20f5a8:	12003864 	and	w4, w3, #0x7fff
  20f5ac:	17ffff9f 	b	20f428 <__addtf3+0x188>
  20f5b0:	b4001b43 	cbz	x3, 20f918 <__addtf3+0x678>
  20f5b4:	d28fffe3 	mov	x3, #0x7fff                	// #32767
  20f5b8:	4b0003e0 	neg	w0, w0
  20f5bc:	b24d0021 	orr	x1, x1, #0x8000000000000
  20f5c0:	eb03019f 	cmp	x12, x3
  20f5c4:	54002c60 	b.eq	20fb50 <__addtf3+0x8b0>  // b.none
  20f5c8:	7101d01f 	cmp	w0, #0x74
  20f5cc:	54002e2c 	b.gt	20fb90 <__addtf3+0x8f0>
  20f5d0:	7100fc1f 	cmp	w0, #0x3f
  20f5d4:	5400372c 	b.gt	20fcb8 <__addtf3+0xa18>
  20f5d8:	52800803 	mov	w3, #0x40                  	// #64
  20f5dc:	4b000063 	sub	w3, w3, w0
  20f5e0:	9ac02524 	lsr	x4, x9, x0
  20f5e4:	9ac32129 	lsl	x9, x9, x3
  20f5e8:	f100013f 	cmp	x9, #0x0
  20f5ec:	9ac02420 	lsr	x0, x1, x0
  20f5f0:	9a9f07e9 	cset	x9, ne  // ne = any
  20f5f4:	9ac32021 	lsl	x1, x1, x3
  20f5f8:	aa040021 	orr	x1, x1, x4
  20f5fc:	cb000042 	sub	x2, x2, x0
  20f600:	aa090020 	orr	x0, x1, x9
  20f604:	cb0001c9 	sub	x9, x14, x0
  20f608:	2a0d03e6 	mov	w6, w13
  20f60c:	eb0901df 	cmp	x14, x9
  20f610:	aa0c03e3 	mov	x3, x12
  20f614:	da1f0041 	sbc	x1, x2, xzr
  20f618:	aa0f03ea 	mov	x10, x15
  20f61c:	17ffff49 	b	20f340 <__addtf3+0xa0>
  20f620:	d28fffe4 	mov	x4, #0x7fff                	// #32767
  20f624:	eb04007f 	cmp	x3, x4
  20f628:	54fff601 	b.ne	20f4e8 <__addtf3+0x248>  // b.any
  20f62c:	aa090020 	orr	x0, x1, x9
  20f630:	b4000240 	cbz	x0, 20f678 <__addtf3+0x3d8>
  20f634:	d372fc20 	lsr	x0, x1, #50
  20f638:	5280000b 	mov	w11, #0x0                   	// #0
  20f63c:	d2400000 	eor	x0, x0, #0x1
  20f640:	12000000 	and	w0, w0, #0x1
  20f644:	924d0022 	and	x2, x1, #0x8000000000000
  20f648:	34ffedeb 	cbz	w11, 20f404 <__addtf3+0x164>
  20f64c:	365fedc8 	tbz	w8, #11, 20f404 <__addtf3+0x164>
  20f650:	321d0000 	orr	w0, w0, #0x8
  20f654:	17ffff6c 	b	20f404 <__addtf3+0x164>
  20f658:	7100056b 	subs	w11, w11, #0x1
  20f65c:	54001a60 	b.eq	20f9a8 <__addtf3+0x708>  // b.none
  20f660:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  20f664:	eb00007f 	cmp	x3, x0
  20f668:	54fff681 	b.ne	20f538 <__addtf3+0x298>  // b.any
  20f66c:	aa090020 	orr	x0, x1, x9
  20f670:	b5fffe20 	cbnz	x0, 20f634 <__addtf3+0x394>
  20f674:	2a0d03e6 	mov	w6, w13
  20f678:	d2800003 	mov	x3, #0x0                   	// #0
  20f67c:	92503c60 	and	x0, x3, #0xffff000000000000
  20f680:	d2800002 	mov	x2, #0x0                   	// #0
  20f684:	b2503803 	orr	x3, x0, #0x7fff000000000000
  20f688:	9e670041 	fmov	d1, x2
  20f68c:	b34100c3 	bfi	x3, x6, #63, #1
  20f690:	9eaf0061 	fmov	v1.d[1], x3
  20f694:	17ffff6c 	b	20f444 <__addtf3+0x1a4>
  20f698:	f26a0508 	ands	x8, x8, #0xc00000
  20f69c:	54000a60 	b.eq	20f7e8 <__addtf3+0x548>  // b.none
  20f6a0:	f150011f 	cmp	x8, #0x400, lsl #12
  20f6a4:	54001ae0 	b.eq	20fa00 <__addtf3+0x760>  // b.none
  20f6a8:	f160011f 	cmp	x8, #0x800, lsl #12
  20f6ac:	52800281 	mov	w1, #0x14                  	// #20
  20f6b0:	fa400944 	ccmp	x10, #0x0, #0x4, eq  // eq = none
  20f6b4:	54001aa0 	b.eq	20fa08 <__addtf3+0x768>  // b.none
  20f6b8:	2a010000 	orr	w0, w0, w1
  20f6bc:	d2800003 	mov	x3, #0x0                   	// #0
  20f6c0:	92503c61 	and	x1, x3, #0xffff000000000000
  20f6c4:	d2800002 	mov	x2, #0x0                   	// #0
  20f6c8:	b2503823 	orr	x3, x1, #0x7fff000000000000
  20f6cc:	9e670041 	fmov	d1, x2
  20f6d0:	b34100c3 	bfi	x3, x6, #63, #1
  20f6d4:	9eaf0061 	fmov	v1.d[1], x3
  20f6d8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  20f6dc:	910003fd 	mov	x29, sp
  20f6e0:	3d8007a1 	str	q1, [x29, #16]
  20f6e4:	94000855 	bl	211838 <__sfp_handle_exceptions>
  20f6e8:	3dc007a1 	ldr	q1, [x29, #16]
  20f6ec:	a8c27bfd 	ldp	x29, x30, [sp], #32
  20f6f0:	4ea11c20 	mov	v0.16b, v1.16b
  20f6f4:	d65f03c0 	ret
  20f6f8:	92400d22 	and	x2, x9, #0xf
  20f6fc:	52800200 	mov	w0, #0x10                  	// #16
  20f700:	f100105f 	cmp	x2, #0x4
  20f704:	54ffe7a0 	b.eq	20f3f8 <__addtf3+0x158>  // b.none
  20f708:	91001122 	add	x2, x9, #0x4
  20f70c:	eb09005f 	cmp	x2, x9
  20f710:	aa0203e9 	mov	x9, x2
  20f714:	9a812421 	cinc	x1, x1, cc  // cc = lo, ul, last
  20f718:	17ffff38 	b	20f3f8 <__addtf3+0x158>
  20f71c:	d503201f 	nop
  20f720:	54001801 	b.ne	20fa20 <__addtf3+0x780>  // b.any
  20f724:	91000467 	add	x7, x3, #0x1
  20f728:	924038e0 	and	x0, x7, #0x7fff
  20f72c:	f100041f 	cmp	x0, #0x1
  20f730:	5400198d 	b.le	20fa60 <__addtf3+0x7c0>
  20f734:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  20f738:	eb0000ff 	cmp	x7, x0
  20f73c:	54001420 	b.eq	20f9c0 <__addtf3+0x720>  // b.none
  20f740:	8b0e012e 	add	x14, x9, x14
  20f744:	8b020020 	add	x0, x1, x2
  20f748:	eb0e013f 	cmp	x9, x14
  20f74c:	aa0703e3 	mov	x3, x7
  20f750:	9a809400 	cinc	x0, x0, hi  // hi = pmore
  20f754:	d341fc01 	lsr	x1, x0, #1
  20f758:	93ce0409 	extr	x9, x0, x14, #1
  20f75c:	92400920 	and	x0, x9, #0x7
  20f760:	17ffff1e 	b	20f3d8 <__addtf3+0x138>
  20f764:	d503201f 	nop
  20f768:	52800200 	mov	w0, #0x10                  	// #16
  20f76c:	b4ffe46a 	cbz	x10, 20f3f8 <__addtf3+0x158>
  20f770:	91002122 	add	x2, x9, #0x8
  20f774:	eb09005f 	cmp	x2, x9
  20f778:	aa0203e9 	mov	x9, x2
  20f77c:	9a812421 	cinc	x1, x1, cc  // cc = lo, ul, last
  20f780:	17ffff1e 	b	20f3f8 <__addtf3+0x158>
  20f784:	d503201f 	nop
  20f788:	52800200 	mov	w0, #0x10                  	// #16
  20f78c:	b4ffff2a 	cbz	x10, 20f770 <__addtf3+0x4d0>
  20f790:	17ffff1a 	b	20f3f8 <__addtf3+0x158>
  20f794:	d503201f 	nop
  20f798:	cb020063 	sub	x3, x3, x2
  20f79c:	924cf801 	and	x1, x0, #0xfff7ffffffffffff
  20f7a0:	17ffff79 	b	20f584 <__addtf3+0x2e4>
  20f7a4:	d503201f 	nop
  20f7a8:	51013000 	sub	w0, w0, #0x4c
  20f7ac:	9ac02120 	lsl	x0, x9, x0
  20f7b0:	d2800009 	mov	x9, #0x0                   	// #0
  20f7b4:	17fffef3 	b	20f380 <__addtf3+0xe0>
  20f7b8:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  20f7bc:	93c90c29 	extr	x9, x1, x9, #3
  20f7c0:	d343fc27 	lsr	x7, x1, #3
  20f7c4:	eb02007f 	cmp	x3, x2
  20f7c8:	54ffeee1 	b.ne	20f5a4 <__addtf3+0x304>  // b.any
  20f7cc:	aa0900e1 	orr	x1, x7, x9
  20f7d0:	b4003921 	cbz	x1, 20fef4 <__addtf3+0xc54>
  20f7d4:	b25100e1 	orr	x1, x7, #0x800000000000
  20f7d8:	528fffe4 	mov	w4, #0x7fff                	// #32767
  20f7dc:	9240bc21 	and	x1, x1, #0xffffffffffff
  20f7e0:	17ffff12 	b	20f428 <__addtf3+0x188>
  20f7e4:	d503201f 	nop
  20f7e8:	52800281 	mov	w1, #0x14                  	// #20
  20f7ec:	17ffffb3 	b	20f6b8 <__addtf3+0x418>
  20f7f0:	aa0e0042 	orr	x2, x2, x14
  20f7f4:	f100005f 	cmp	x2, #0x0
  20f7f8:	9a9f07e2 	cset	x2, ne  // ne = any
  20f7fc:	cb020122 	sub	x2, x9, x2
  20f800:	eb02013f 	cmp	x9, x2
  20f804:	aa0203e9 	mov	x9, x2
  20f808:	da1f0021 	sbc	x1, x1, xzr
  20f80c:	17fffecd 	b	20f340 <__addtf3+0xa0>
  20f810:	aa09002b 	orr	x11, x1, x9
  20f814:	aa0e0047 	orr	x7, x2, x14
  20f818:	b5000983 	cbnz	x3, 20f948 <__addtf3+0x6a8>
  20f81c:	b50020eb 	cbnz	x11, 20fc38 <__addtf3+0x998>
  20f820:	b40027e7 	cbz	x7, 20fd1c <__addtf3+0xa7c>
  20f824:	2a0d03e6 	mov	w6, w13
  20f828:	aa0203e1 	mov	x1, x2
  20f82c:	aa0e03e9 	mov	x9, x14
  20f830:	aa0f03ea 	mov	x10, x15
  20f834:	d2800003 	mov	x3, #0x0                   	// #0
  20f838:	52800000 	mov	w0, #0x0                   	// #0
  20f83c:	5280002b 	mov	w11, #0x1                   	// #1
  20f840:	17ffff81 	b	20f644 <__addtf3+0x3a4>
  20f844:	d503201f 	nop
  20f848:	52801002 	mov	w2, #0x80                  	// #128
  20f84c:	4b010042 	sub	w2, w2, w1
  20f850:	7101003f 	cmp	w1, #0x40
  20f854:	51010021 	sub	w1, w1, #0x40
  20f858:	9ac22002 	lsl	x2, x0, x2
  20f85c:	aa020122 	orr	x2, x9, x2
  20f860:	9a891049 	csel	x9, x2, x9, ne  // ne = any
  20f864:	9ac12400 	lsr	x0, x0, x1
  20f868:	f100013f 	cmp	x9, #0x0
  20f86c:	d2800001 	mov	x1, #0x0                   	// #0
  20f870:	9a9f07e9 	cset	x9, ne  // ne = any
  20f874:	aa000129 	orr	x9, x9, x0
  20f878:	aa0903e7 	mov	x7, x9
  20f87c:	17fffed3 	b	20f3c8 <__addtf3+0x128>
  20f880:	cb0901c9 	sub	x9, x14, x9
  20f884:	2a0d03e6 	mov	w6, w13
  20f888:	eb0901df 	cmp	x14, x9
  20f88c:	aa0f03ea 	mov	x10, x15
  20f890:	da010044 	sbc	x4, x2, x1
  20f894:	17fffead 	b	20f348 <__addtf3+0xa8>
  20f898:	aa0e0042 	orr	x2, x2, x14
  20f89c:	f100005f 	cmp	x2, #0x0
  20f8a0:	9a9f07e0 	cset	x0, ne  // ne = any
  20f8a4:	8b090000 	add	x0, x0, x9
  20f8a8:	eb00013f 	cmp	x9, x0
  20f8ac:	aa0003e9 	mov	x9, x0
  20f8b0:	9a819421 	cinc	x1, x1, hi  // hi = pmore
  20f8b4:	b69fe681 	tbz	x1, #51, 20f584 <__addtf3+0x2e4>
  20f8b8:	91000463 	add	x3, x3, #0x1
  20f8bc:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  20f8c0:	eb00007f 	cmp	x3, x0
  20f8c4:	540007e0 	b.eq	20f9c0 <__addtf3+0x720>  // b.none
  20f8c8:	92400120 	and	x0, x9, #0x1
  20f8cc:	924cf822 	and	x2, x1, #0xfff7ffffffffffff
  20f8d0:	aa490400 	orr	x0, x0, x9, lsr #1
  20f8d4:	d341fc41 	lsr	x1, x2, #1
  20f8d8:	aa02fc09 	orr	x9, x0, x2, lsl #63
  20f8dc:	5280000b 	mov	w11, #0x0                   	// #0
  20f8e0:	92400920 	and	x0, x9, #0x7
  20f8e4:	17fffebd 	b	20f3d8 <__addtf3+0x138>
  20f8e8:	52801004 	mov	w4, #0x80                  	// #128
  20f8ec:	4b000084 	sub	w4, w4, w0
  20f8f0:	7101001f 	cmp	w0, #0x40
  20f8f4:	51010000 	sub	w0, w0, #0x40
  20f8f8:	9ac42044 	lsl	x4, x2, x4
  20f8fc:	aa0401c4 	orr	x4, x14, x4
  20f900:	9a8e108e 	csel	x14, x4, x14, ne  // ne = any
  20f904:	9ac02440 	lsr	x0, x2, x0
  20f908:	f10001df 	cmp	x14, #0x0
  20f90c:	9a9f07e2 	cset	x2, ne  // ne = any
  20f910:	aa000042 	orr	x2, x2, x0
  20f914:	17ffffba 	b	20f7fc <__addtf3+0x55c>
  20f918:	aa090023 	orr	x3, x1, x9
  20f91c:	b50010e3 	cbnz	x3, 20fb38 <__addtf3+0x898>
  20f920:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  20f924:	eb00019f 	cmp	x12, x0
  20f928:	54002120 	b.eq	20fd4c <__addtf3+0xaac>  // b.none
  20f92c:	2a0d03e6 	mov	w6, w13
  20f930:	aa0203e1 	mov	x1, x2
  20f934:	aa0e03e9 	mov	x9, x14
  20f938:	aa0c03e3 	mov	x3, x12
  20f93c:	aa0f03ea 	mov	x10, x15
  20f940:	17ffff11 	b	20f584 <__addtf3+0x2e4>
  20f944:	d503201f 	nop
  20f948:	d28ffff0 	mov	x16, #0x7fff                	// #32767
  20f94c:	eb10007f 	cmp	x3, x16
  20f950:	54001cc0 	b.eq	20fce8 <__addtf3+0xa48>  // b.none
  20f954:	eb10019f 	cmp	x12, x16
  20f958:	54001580 	b.eq	20fc08 <__addtf3+0x968>  // b.none
  20f95c:	b4001d4b 	cbz	x11, 20fd04 <__addtf3+0xa64>
  20f960:	52800000 	mov	w0, #0x0                   	// #0
  20f964:	b4001647 	cbz	x7, 20fc2c <__addtf3+0x98c>
  20f968:	9240f089 	and	x9, x4, #0x1fffffffffffffff
  20f96c:	d343fc23 	lsr	x3, x1, #3
  20f970:	aa01f529 	orr	x9, x9, x1, lsl #61
  20f974:	b67800e3 	tbz	x3, #47, 20f990 <__addtf3+0x6f0>
  20f978:	d343fc41 	lsr	x1, x2, #3
  20f97c:	b77800a1 	tbnz	x1, #47, 20f990 <__addtf3+0x6f0>
  20f980:	9240f0a9 	and	x9, x5, #0x1fffffffffffffff
  20f984:	aa0103e3 	mov	x3, x1
  20f988:	aa02f529 	orr	x9, x9, x2, lsl #61
  20f98c:	aa0f03ea 	mov	x10, x15
  20f990:	2a0a03e6 	mov	w6, w10
  20f994:	93c9f461 	extr	x1, x3, x9, #61
  20f998:	5280000b 	mov	w11, #0x0                   	// #0
  20f99c:	d37df129 	lsl	x9, x9, #3
  20f9a0:	d28fffe3 	mov	x3, #0x7fff                	// #32767
  20f9a4:	17ffff28 	b	20f644 <__addtf3+0x3a4>
  20f9a8:	8b0e012e 	add	x14, x9, x14
  20f9ac:	8b020021 	add	x1, x1, x2
  20f9b0:	eb0e013f 	cmp	x9, x14
  20f9b4:	aa0e03e9 	mov	x9, x14
  20f9b8:	9a819421 	cinc	x1, x1, hi  // hi = pmore
  20f9bc:	17ffffbe 	b	20f8b4 <__addtf3+0x614>
  20f9c0:	f26a0500 	ands	x0, x8, #0xc00000
  20f9c4:	54000de0 	b.eq	20fb80 <__addtf3+0x8e0>  // b.none
  20f9c8:	f150001f 	cmp	x0, #0x400, lsl #12
  20f9cc:	54001ce0 	b.eq	20fd68 <__addtf3+0xac8>  // b.none
  20f9d0:	f160001f 	cmp	x0, #0x800, lsl #12
  20f9d4:	54001de0 	b.eq	20fd90 <__addtf3+0xaf0>  // b.none
  20f9d8:	f150001f 	cmp	x0, #0x400, lsl #12
  20f9dc:	54002680 	b.eq	20feac <__addtf3+0xc0c>  // b.none
  20f9e0:	f160001f 	cmp	x0, #0x800, lsl #12
  20f9e4:	54002721 	b.ne	20fec8 <__addtf3+0xc28>  // b.any
  20f9e8:	92800001 	mov	x1, #0xffffffffffffffff    	// #-1
  20f9ec:	d28fffc3 	mov	x3, #0x7ffe                	// #32766
  20f9f0:	aa0103e9 	mov	x9, x1
  20f9f4:	5280000b 	mov	w11, #0x0                   	// #0
  20f9f8:	52800280 	mov	w0, #0x14                  	// #20
  20f9fc:	17ffff5c 	b	20f76c <__addtf3+0x4cc>
  20fa00:	b4ffef4a 	cbz	x10, 20f7e8 <__addtf3+0x548>
  20fa04:	52800281 	mov	w1, #0x14                  	// #20
  20fa08:	92800009 	mov	x9, #0xffffffffffffffff    	// #-1
  20fa0c:	2a010000 	orr	w0, w0, w1
  20fa10:	92fc0007 	mov	x7, #0x1fffffffffffffff    	// #2305843009213693951
  20fa14:	d28fffc3 	mov	x3, #0x7ffe                	// #32766
  20fa18:	17fffee3 	b	20f5a4 <__addtf3+0x304>
  20fa1c:	d503201f 	nop
  20fa20:	b5000583 	cbnz	x3, 20fad0 <__addtf3+0x830>
  20fa24:	aa090020 	orr	x0, x1, x9
  20fa28:	b5001200 	cbnz	x0, 20fc68 <__addtf3+0x9c8>
  20fa2c:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  20fa30:	eb00019f 	cmp	x12, x0
  20fa34:	54002000 	b.eq	20fe34 <__addtf3+0xb94>  // b.none
  20fa38:	aa0203e1 	mov	x1, x2
  20fa3c:	aa0e03e9 	mov	x9, x14
  20fa40:	aa0c03e3 	mov	x3, x12
  20fa44:	17fffed0 	b	20f584 <__addtf3+0x2e4>
  20fa48:	aa090020 	orr	x0, x1, x9
  20fa4c:	b5ffdf40 	cbnz	x0, 20f634 <__addtf3+0x394>
  20fa50:	d2800009 	mov	x9, #0x0                   	// #0
  20fa54:	d2800007 	mov	x7, #0x0                   	// #0
  20fa58:	52800000 	mov	w0, #0x0                   	// #0
  20fa5c:	17ffff5c 	b	20f7cc <__addtf3+0x52c>
  20fa60:	aa09002d 	orr	x13, x1, x9
  20fa64:	b50009e3 	cbnz	x3, 20fba0 <__addtf3+0x900>
  20fa68:	aa0e0047 	orr	x7, x2, x14
  20fa6c:	b400178d 	cbz	x13, 20fd5c <__addtf3+0xabc>
  20fa70:	b4ffee27 	cbz	x7, 20f834 <__addtf3+0x594>
  20fa74:	8b0e012e 	add	x14, x9, x14
  20fa78:	8b020021 	add	x1, x1, x2
  20fa7c:	eb0e013f 	cmp	x9, x14
  20fa80:	9a819421 	cinc	x1, x1, hi  // hi = pmore
  20fa84:	b79822e1 	tbnz	x1, #51, 20fee0 <__addtf3+0xc40>
  20fa88:	aa0101c7 	orr	x7, x14, x1
  20fa8c:	aa0e03e9 	mov	x9, x14
  20fa90:	17fffe4e 	b	20f3c8 <__addtf3+0x128>
  20fa94:	d503201f 	nop
  20fa98:	aa0503e9 	mov	x9, x5
  20fa9c:	17fffe2b 	b	20f348 <__addtf3+0xa8>
  20faa0:	52801000 	mov	w0, #0x80                  	// #128
  20faa4:	4b0b0000 	sub	w0, w0, w11
  20faa8:	7101017f 	cmp	w11, #0x40
  20faac:	5101016b 	sub	w11, w11, #0x40
  20fab0:	9ac02040 	lsl	x0, x2, x0
  20fab4:	aa0001c0 	orr	x0, x14, x0
  20fab8:	9a8e100e 	csel	x14, x0, x14, ne  // ne = any
  20fabc:	9acb2442 	lsr	x2, x2, x11
  20fac0:	f10001df 	cmp	x14, #0x0
  20fac4:	9a9f07e0 	cset	x0, ne  // ne = any
  20fac8:	aa020000 	orr	x0, x0, x2
  20facc:	17ffff76 	b	20f8a4 <__addtf3+0x604>
  20fad0:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  20fad4:	4b0b03eb 	neg	w11, w11
  20fad8:	b24d0021 	orr	x1, x1, #0x8000000000000
  20fadc:	eb00019f 	cmp	x12, x0
  20fae0:	54000d00 	b.eq	20fc80 <__addtf3+0x9e0>  // b.none
  20fae4:	7101d17f 	cmp	w11, #0x74
  20fae8:	54000e0c 	b.gt	20fca8 <__addtf3+0xa08>
  20faec:	7100fd7f 	cmp	w11, #0x3f
  20faf0:	540015ac 	b.gt	20fda4 <__addtf3+0xb04>
  20faf4:	52800803 	mov	w3, #0x40                  	// #64
  20faf8:	4b0b0063 	sub	w3, w3, w11
  20fafc:	9acb2524 	lsr	x4, x9, x11
  20fb00:	9ac32120 	lsl	x0, x9, x3
  20fb04:	f100001f 	cmp	x0, #0x0
  20fb08:	9acb242b 	lsr	x11, x1, x11
  20fb0c:	8b0b0042 	add	x2, x2, x11
  20fb10:	9ac32020 	lsl	x0, x1, x3
  20fb14:	9a9f07e1 	cset	x1, ne  // ne = any
  20fb18:	aa040000 	orr	x0, x0, x4
  20fb1c:	aa010000 	orr	x0, x0, x1
  20fb20:	8b0e0009 	add	x9, x0, x14
  20fb24:	aa0c03e3 	mov	x3, x12
  20fb28:	eb0901df 	cmp	x14, x9
  20fb2c:	9a829441 	cinc	x1, x2, hi  // hi = pmore
  20fb30:	17ffff61 	b	20f8b4 <__addtf3+0x614>
  20fb34:	d503201f 	nop
  20fb38:	3100041f 	cmn	w0, #0x1
  20fb3c:	54000fa0 	b.eq	20fd30 <__addtf3+0xa90>  // b.none
  20fb40:	d28fffe3 	mov	x3, #0x7fff                	// #32767
  20fb44:	2a2003e0 	mvn	w0, w0
  20fb48:	eb03019f 	cmp	x12, x3
  20fb4c:	54ffd3e1 	b.ne	20f5c8 <__addtf3+0x328>  // b.any
  20fb50:	aa0e0040 	orr	x0, x2, x14
  20fb54:	b4ffd900 	cbz	x0, 20f674 <__addtf3+0x3d4>
  20fb58:	d372fc40 	lsr	x0, x2, #50
  20fb5c:	2a0d03e6 	mov	w6, w13
  20fb60:	d2400000 	eor	x0, x0, #0x1
  20fb64:	aa0203e1 	mov	x1, x2
  20fb68:	12000000 	and	w0, w0, #0x1
  20fb6c:	aa0e03e9 	mov	x9, x14
  20fb70:	aa0c03e3 	mov	x3, x12
  20fb74:	aa0f03ea 	mov	x10, x15
  20fb78:	5280000b 	mov	w11, #0x0                   	// #0
  20fb7c:	17fffeb2 	b	20f644 <__addtf3+0x3a4>
  20fb80:	2a0d03e6 	mov	w6, w13
  20fb84:	52800280 	mov	w0, #0x14                  	// #20
  20fb88:	17fffecd 	b	20f6bc <__addtf3+0x41c>
  20fb8c:	d503201f 	nop
  20fb90:	aa090020 	orr	x0, x1, x9
  20fb94:	f100001f 	cmp	x0, #0x0
  20fb98:	9a9f07e0 	cset	x0, ne  // ne = any
  20fb9c:	17fffe9a 	b	20f604 <__addtf3+0x364>
  20fba0:	d28fffe7 	mov	x7, #0x7fff                	// #32767
  20fba4:	eb07007f 	cmp	x3, x7
  20fba8:	54001160 	b.eq	20fdd4 <__addtf3+0xb34>  // b.none
  20fbac:	eb07019f 	cmp	x12, x7
  20fbb0:	54001600 	b.eq	20fe70 <__addtf3+0xbd0>  // b.none
  20fbb4:	b400154d 	cbz	x13, 20fe5c <__addtf3+0xbbc>
  20fbb8:	52800000 	mov	w0, #0x0                   	// #0
  20fbbc:	aa0e004e 	orr	x14, x2, x14
  20fbc0:	b400124e 	cbz	x14, 20fe08 <__addtf3+0xb68>
  20fbc4:	9240f089 	and	x9, x4, #0x1fffffffffffffff
  20fbc8:	d343fc23 	lsr	x3, x1, #3
  20fbcc:	aa01f529 	orr	x9, x9, x1, lsl #61
  20fbd0:	b67800e3 	tbz	x3, #47, 20fbec <__addtf3+0x94c>
  20fbd4:	d343fc41 	lsr	x1, x2, #3
  20fbd8:	b77800a1 	tbnz	x1, #47, 20fbec <__addtf3+0x94c>
  20fbdc:	9240f0a9 	and	x9, x5, #0x1fffffffffffffff
  20fbe0:	aa0103e3 	mov	x3, x1
  20fbe4:	aa02f529 	orr	x9, x9, x2, lsl #61
  20fbe8:	aa0f03ea 	mov	x10, x15
  20fbec:	2a0a03e6 	mov	w6, w10
  20fbf0:	93c9f461 	extr	x1, x3, x9, #61
  20fbf4:	d37df129 	lsl	x9, x9, #3
  20fbf8:	d28fffe3 	mov	x3, #0x7fff                	// #32767
  20fbfc:	17fffe92 	b	20f644 <__addtf3+0x3a4>
  20fc00:	eb03019f 	cmp	x12, x3
  20fc04:	54000801 	b.ne	20fd04 <__addtf3+0xa64>  // b.any
  20fc08:	52800000 	mov	w0, #0x0                   	// #0
  20fc0c:	b4001047 	cbz	x7, 20fe14 <__addtf3+0xb74>
  20fc10:	f24e005f 	tst	x2, #0x4000000000000
  20fc14:	1a9f1400 	csinc	w0, w0, wzr, ne  // ne = any
  20fc18:	b5ffea8b 	cbnz	x11, 20f968 <__addtf3+0x6c8>
  20fc1c:	2a0d03e6 	mov	w6, w13
  20fc20:	aa0203e1 	mov	x1, x2
  20fc24:	aa0e03e9 	mov	x9, x14
  20fc28:	aa0f03ea 	mov	x10, x15
  20fc2c:	5280000b 	mov	w11, #0x0                   	// #0
  20fc30:	d28fffe3 	mov	x3, #0x7fff                	// #32767
  20fc34:	17fffe84 	b	20f644 <__addtf3+0x3a4>
  20fc38:	b4ffdfe7 	cbz	x7, 20f834 <__addtf3+0x594>
  20fc3c:	cb0e0124 	sub	x4, x9, x14
  20fc40:	eb04013f 	cmp	x9, x4
  20fc44:	da020025 	sbc	x5, x1, x2
  20fc48:	b6980fc5 	tbz	x5, #51, 20fe40 <__addtf3+0xba0>
  20fc4c:	cb0901c9 	sub	x9, x14, x9
  20fc50:	2a0d03e6 	mov	w6, w13
  20fc54:	eb0901df 	cmp	x14, x9
  20fc58:	aa0f03ea 	mov	x10, x15
  20fc5c:	da010041 	sbc	x1, x2, x1
  20fc60:	aa010127 	orr	x7, x9, x1
  20fc64:	17fffdd9 	b	20f3c8 <__addtf3+0x128>
  20fc68:	3100057f 	cmn	w11, #0x1
  20fc6c:	54000d80 	b.eq	20fe1c <__addtf3+0xb7c>  // b.none
  20fc70:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  20fc74:	2a2b03eb 	mvn	w11, w11
  20fc78:	eb00019f 	cmp	x12, x0
  20fc7c:	54fff341 	b.ne	20fae4 <__addtf3+0x844>  // b.any
  20fc80:	aa0e0040 	orr	x0, x2, x14
  20fc84:	b4ffcf80 	cbz	x0, 20f674 <__addtf3+0x3d4>
  20fc88:	d372fc40 	lsr	x0, x2, #50
  20fc8c:	aa0203e1 	mov	x1, x2
  20fc90:	d2400000 	eor	x0, x0, #0x1
  20fc94:	aa0e03e9 	mov	x9, x14
  20fc98:	12000000 	and	w0, w0, #0x1
  20fc9c:	aa0c03e3 	mov	x3, x12
  20fca0:	5280000b 	mov	w11, #0x0                   	// #0
  20fca4:	17fffe68 	b	20f644 <__addtf3+0x3a4>
  20fca8:	aa090020 	orr	x0, x1, x9
  20fcac:	f100001f 	cmp	x0, #0x0
  20fcb0:	9a9f07e0 	cset	x0, ne  // ne = any
  20fcb4:	17ffff9b 	b	20fb20 <__addtf3+0x880>
  20fcb8:	52801003 	mov	w3, #0x80                  	// #128
  20fcbc:	4b000063 	sub	w3, w3, w0
  20fcc0:	7101001f 	cmp	w0, #0x40
  20fcc4:	51010000 	sub	w0, w0, #0x40
  20fcc8:	9ac32023 	lsl	x3, x1, x3
  20fccc:	aa030123 	orr	x3, x9, x3
  20fcd0:	9a891069 	csel	x9, x3, x9, ne  // ne = any
  20fcd4:	9ac02421 	lsr	x1, x1, x0
  20fcd8:	f100013f 	cmp	x9, #0x0
  20fcdc:	9a9f07e0 	cset	x0, ne  // ne = any
  20fce0:	aa010000 	orr	x0, x0, x1
  20fce4:	17fffe48 	b	20f604 <__addtf3+0x364>
  20fce8:	b4fff8cb 	cbz	x11, 20fc00 <__addtf3+0x960>
  20fcec:	d372fc20 	lsr	x0, x1, #50
  20fcf0:	eb03019f 	cmp	x12, x3
  20fcf4:	d2400000 	eor	x0, x0, #0x1
  20fcf8:	12000000 	and	w0, w0, #0x1
  20fcfc:	54ffe341 	b.ne	20f964 <__addtf3+0x6c4>  // b.any
  20fd00:	17ffffc3 	b	20fc0c <__addtf3+0x96c>
  20fd04:	b5fff8c7 	cbnz	x7, 20fc1c <__addtf3+0x97c>
  20fd08:	52800020 	mov	w0, #0x1                   	// #1
  20fd0c:	92800009 	mov	x9, #0xffffffffffffffff    	// #-1
  20fd10:	52800006 	mov	w6, #0x0                   	// #0
  20fd14:	92ffffe7 	mov	x7, #0xffffffffffff        	// #281474976710655
  20fd18:	17fffeaf 	b	20f7d4 <__addtf3+0x534>
  20fd1c:	926a0508 	and	x8, x8, #0xc00000
  20fd20:	d2800009 	mov	x9, #0x0                   	// #0
  20fd24:	f160011f 	cmp	x8, #0x800, lsl #12
  20fd28:	1a9f17e6 	cset	w6, eq  // eq = none
  20fd2c:	17fffe1e 	b	20f5a4 <__addtf3+0x304>
  20fd30:	cb0901c9 	sub	x9, x14, x9
  20fd34:	2a0d03e6 	mov	w6, w13
  20fd38:	eb0901df 	cmp	x14, x9
  20fd3c:	aa0c03e3 	mov	x3, x12
  20fd40:	da010041 	sbc	x1, x2, x1
  20fd44:	aa0f03ea 	mov	x10, x15
  20fd48:	17fffd7e 	b	20f340 <__addtf3+0xa0>
  20fd4c:	aa0e0040 	orr	x0, x2, x14
  20fd50:	b5fff040 	cbnz	x0, 20fb58 <__addtf3+0x8b8>
  20fd54:	2a0d03e6 	mov	w6, w13
  20fd58:	17ffff3e 	b	20fa50 <__addtf3+0x7b0>
  20fd5c:	aa0203e1 	mov	x1, x2
  20fd60:	aa0e03e9 	mov	x9, x14
  20fd64:	17fffd99 	b	20f3c8 <__addtf3+0x128>
  20fd68:	52800026 	mov	w6, #0x1                   	// #1
  20fd6c:	b500008a 	cbnz	x10, 20fd7c <__addtf3+0xadc>
  20fd70:	52800006 	mov	w6, #0x0                   	// #0
  20fd74:	52800280 	mov	w0, #0x14                  	// #20
  20fd78:	17fffe51 	b	20f6bc <__addtf3+0x41c>
  20fd7c:	92800001 	mov	x1, #0xffffffffffffffff    	// #-1
  20fd80:	d28fffc3 	mov	x3, #0x7ffe                	// #32766
  20fd84:	aa0103e9 	mov	x9, x1
  20fd88:	52800280 	mov	w0, #0x14                  	// #20
  20fd8c:	17fffd9f 	b	20f408 <__addtf3+0x168>
  20fd90:	52800006 	mov	w6, #0x0                   	// #0
  20fd94:	b4ffff4a 	cbz	x10, 20fd7c <__addtf3+0xadc>
  20fd98:	52800026 	mov	w6, #0x1                   	// #1
  20fd9c:	52800280 	mov	w0, #0x14                  	// #20
  20fda0:	17fffe47 	b	20f6bc <__addtf3+0x41c>
  20fda4:	52801000 	mov	w0, #0x80                  	// #128
  20fda8:	4b0b0000 	sub	w0, w0, w11
  20fdac:	7101017f 	cmp	w11, #0x40
  20fdb0:	5101016b 	sub	w11, w11, #0x40
  20fdb4:	9ac02020 	lsl	x0, x1, x0
  20fdb8:	aa000120 	orr	x0, x9, x0
  20fdbc:	9a891009 	csel	x9, x0, x9, ne  // ne = any
  20fdc0:	9acb2421 	lsr	x1, x1, x11
  20fdc4:	f100013f 	cmp	x9, #0x0
  20fdc8:	9a9f07e0 	cset	x0, ne  // ne = any
  20fdcc:	aa010000 	orr	x0, x0, x1
  20fdd0:	17ffff54 	b	20fb20 <__addtf3+0x880>
  20fdd4:	b400058d 	cbz	x13, 20fe84 <__addtf3+0xbe4>
  20fdd8:	d372fc20 	lsr	x0, x1, #50
  20fddc:	eb03019f 	cmp	x12, x3
  20fde0:	d2400000 	eor	x0, x0, #0x1
  20fde4:	12000000 	and	w0, w0, #0x1
  20fde8:	54ffeea1 	b.ne	20fbbc <__addtf3+0x91c>  // b.any
  20fdec:	aa0e0043 	orr	x3, x2, x14
  20fdf0:	b40000c3 	cbz	x3, 20fe08 <__addtf3+0xb68>
  20fdf4:	f24e005f 	tst	x2, #0x4000000000000
  20fdf8:	1a9f1400 	csinc	w0, w0, wzr, ne  // ne = any
  20fdfc:	b5ffee4d 	cbnz	x13, 20fbc4 <__addtf3+0x924>
  20fe00:	aa0203e1 	mov	x1, x2
  20fe04:	aa0e03e9 	mov	x9, x14
  20fe08:	aa0f03ea 	mov	x10, x15
  20fe0c:	d28fffe3 	mov	x3, #0x7fff                	// #32767
  20fe10:	17fffe0d 	b	20f644 <__addtf3+0x3a4>
  20fe14:	b5fff0cb 	cbnz	x11, 20fc2c <__addtf3+0x98c>
  20fe18:	17ffffbc 	b	20fd08 <__addtf3+0xa68>
  20fe1c:	8b0e0129 	add	x9, x9, x14
  20fe20:	8b020021 	add	x1, x1, x2
  20fe24:	eb0901df 	cmp	x14, x9
  20fe28:	aa0c03e3 	mov	x3, x12
  20fe2c:	9a819421 	cinc	x1, x1, hi  // hi = pmore
  20fe30:	17fffea1 	b	20f8b4 <__addtf3+0x614>
  20fe34:	aa0e0040 	orr	x0, x2, x14
  20fe38:	b4ffe0c0 	cbz	x0, 20fa50 <__addtf3+0x7b0>
  20fe3c:	17ffff93 	b	20fc88 <__addtf3+0x9e8>
  20fe40:	aa050087 	orr	x7, x4, x5
  20fe44:	b4fff6c7 	cbz	x7, 20fd1c <__addtf3+0xa7c>
  20fe48:	92400880 	and	x0, x4, #0x7
  20fe4c:	aa0503e1 	mov	x1, x5
  20fe50:	aa0403e9 	mov	x9, x4
  20fe54:	5280002b 	mov	w11, #0x1                   	// #1
  20fe58:	17fffd60 	b	20f3d8 <__addtf3+0x138>
  20fe5c:	aa0203e1 	mov	x1, x2
  20fe60:	aa0e03e9 	mov	x9, x14
  20fe64:	52800000 	mov	w0, #0x0                   	// #0
  20fe68:	aa0703e3 	mov	x3, x7
  20fe6c:	17fffdf6 	b	20f644 <__addtf3+0x3a4>
  20fe70:	aa0e0040 	orr	x0, x2, x14
  20fe74:	b5000180 	cbnz	x0, 20fea4 <__addtf3+0xc04>
  20fe78:	52800000 	mov	w0, #0x0                   	// #0
  20fe7c:	b5fffc6d 	cbnz	x13, 20fe08 <__addtf3+0xb68>
  20fe80:	17fffef4 	b	20fa50 <__addtf3+0x7b0>
  20fe84:	eb03019f 	cmp	x12, x3
  20fe88:	540000a0 	b.eq	20fe9c <__addtf3+0xbfc>  // b.none
  20fe8c:	aa0203e1 	mov	x1, x2
  20fe90:	aa0e03e9 	mov	x9, x14
  20fe94:	52800000 	mov	w0, #0x0                   	// #0
  20fe98:	17fffdeb 	b	20f644 <__addtf3+0x3a4>
  20fe9c:	aa0e0040 	orr	x0, x2, x14
  20fea0:	b4ffdd80 	cbz	x0, 20fa50 <__addtf3+0x7b0>
  20fea4:	52800000 	mov	w0, #0x0                   	// #0
  20fea8:	17ffffd3 	b	20fdf4 <__addtf3+0xb54>
  20feac:	92800001 	mov	x1, #0xffffffffffffffff    	// #-1
  20feb0:	d28fffc3 	mov	x3, #0x7ffe                	// #32766
  20feb4:	aa0103e9 	mov	x9, x1
  20feb8:	5280000b 	mov	w11, #0x0                   	// #0
  20febc:	52800280 	mov	w0, #0x14                  	// #20
  20fec0:	b4ffc58a 	cbz	x10, 20f770 <__addtf3+0x4d0>
  20fec4:	17fffd4d 	b	20f3f8 <__addtf3+0x158>
  20fec8:	92800001 	mov	x1, #0xffffffffffffffff    	// #-1
  20fecc:	d28fffc3 	mov	x3, #0x7ffe                	// #32766
  20fed0:	aa0103e9 	mov	x9, x1
  20fed4:	5280000b 	mov	w11, #0x0                   	// #0
  20fed8:	52800280 	mov	w0, #0x14                  	// #20
  20fedc:	17fffd47 	b	20f3f8 <__addtf3+0x158>
  20fee0:	924cf821 	and	x1, x1, #0xfff7ffffffffffff
  20fee4:	924009c0 	and	x0, x14, #0x7
  20fee8:	aa0e03e9 	mov	x9, x14
  20feec:	d2800023 	mov	x3, #0x1                   	// #1
  20fef0:	17fffd3a 	b	20f3d8 <__addtf3+0x138>
  20fef4:	d2800009 	mov	x9, #0x0                   	// #0
  20fef8:	528fffe4 	mov	w4, #0x7fff                	// #32767
  20fefc:	d2800001 	mov	x1, #0x0                   	// #0
  20ff00:	17fffd4a 	b	20f428 <__addtf3+0x188>
  20ff04:	00000000 	.inst	0x00000000 ; undefined

000000000020ff08 <__eqtf2>:
  20ff08:	9e660000 	fmov	x0, d0
  20ff0c:	9e660022 	fmov	x2, d1
  20ff10:	9eae0023 	fmov	x3, v1.d[1]
  20ff14:	9eae0001 	fmov	x1, v0.d[1]
  20ff18:	aa0003e7 	mov	x7, x0
  20ff1c:	aa0203e8 	mov	x8, x2
  20ff20:	aa0303e0 	mov	x0, x3
  20ff24:	d53b4402 	mrs	x2, fpcr
  20ff28:	d37ffc23 	lsr	x3, x1, #63
  20ff2c:	d370f825 	ubfx	x5, x1, #48, #15
  20ff30:	d37ffc04 	lsr	x4, x0, #63
  20ff34:	d28fffe6 	mov	x6, #0x7fff                	// #32767
  20ff38:	d340bc22 	ubfx	x2, x1, #0, #48
  20ff3c:	aa0703eb 	mov	x11, x7
  20ff40:	12001c63 	and	w3, w3, #0xff
  20ff44:	d340bc0a 	ubfx	x10, x0, #0, #48
  20ff48:	d370f801 	ubfx	x1, x0, #48, #15
  20ff4c:	12001c84 	and	w4, w4, #0xff
  20ff50:	eb0600bf 	cmp	x5, x6
  20ff54:	54000260 	b.eq	20ffa0 <__eqtf2+0x98>  // b.none
  20ff58:	eb06003f 	cmp	x1, x6
  20ff5c:	540000a0 	b.eq	20ff70 <__eqtf2+0x68>  // b.none
  20ff60:	52800020 	mov	w0, #0x1                   	// #1
  20ff64:	eb0100bf 	cmp	x5, x1
  20ff68:	540002a0 	b.eq	20ffbc <__eqtf2+0xb4>  // b.none
  20ff6c:	d65f03c0 	ret
  20ff70:	aa080149 	orr	x9, x10, x8
  20ff74:	b40004e9 	cbz	x9, 210010 <__eqtf2+0x108>
  20ff78:	f251015f 	tst	x10, #0x800000000000
  20ff7c:	540004a1 	b.ne	210010 <__eqtf2+0x108>  // b.any
  20ff80:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  20ff84:	52800020 	mov	w0, #0x1                   	// #1
  20ff88:	910003fd 	mov	x29, sp
  20ff8c:	9400062b 	bl	211838 <__sfp_handle_exceptions>
  20ff90:	52800020 	mov	w0, #0x1                   	// #1
  20ff94:	a8c17bfd 	ldp	x29, x30, [sp], #16
  20ff98:	d65f03c0 	ret
  20ff9c:	d503201f 	nop
  20ffa0:	aa070040 	orr	x0, x2, x7
  20ffa4:	b5000260 	cbnz	x0, 20fff0 <__eqtf2+0xe8>
  20ffa8:	52800020 	mov	w0, #0x1                   	// #1
  20ffac:	eb05003f 	cmp	x1, x5
  20ffb0:	54fffde1 	b.ne	20ff6c <__eqtf2+0x64>  // b.any
  20ffb4:	aa080149 	orr	x9, x10, x8
  20ffb8:	b5fffe09 	cbnz	x9, 20ff78 <__eqtf2+0x70>
  20ffbc:	eb0a005f 	cmp	x2, x10
  20ffc0:	52800020 	mov	w0, #0x1                   	// #1
  20ffc4:	fa4800e0 	ccmp	x7, x8, #0x0, eq  // eq = none
  20ffc8:	54fffd21 	b.ne	20ff6c <__eqtf2+0x64>  // b.any
  20ffcc:	52800000 	mov	w0, #0x0                   	// #0
  20ffd0:	6b04007f 	cmp	w3, w4
  20ffd4:	54fffcc0 	b.eq	20ff6c <__eqtf2+0x64>  // b.none
  20ffd8:	52800020 	mov	w0, #0x1                   	// #1
  20ffdc:	b5fffc85 	cbnz	x5, 20ff6c <__eqtf2+0x64>
  20ffe0:	aa0b0041 	orr	x1, x2, x11
  20ffe4:	f100003f 	cmp	x1, #0x0
  20ffe8:	1a9f07e0 	cset	w0, ne  // ne = any
  20ffec:	d65f03c0 	ret
  20fff0:	f251005f 	tst	x2, #0x800000000000
  20fff4:	54fffc60 	b.eq	20ff80 <__eqtf2+0x78>  // b.none
  20fff8:	52800020 	mov	w0, #0x1                   	// #1
  20fffc:	eb05003f 	cmp	x1, x5
  210000:	54fffb61 	b.ne	20ff6c <__eqtf2+0x64>  // b.any
  210004:	aa080149 	orr	x9, x10, x8
  210008:	b5fffb89 	cbnz	x9, 20ff78 <__eqtf2+0x70>
  21000c:	d65f03c0 	ret
  210010:	52800020 	mov	w0, #0x1                   	// #1
  210014:	d65f03c0 	ret

0000000000210018 <__multf3>:
  210018:	9e660022 	fmov	x2, d1
  21001c:	9e660004 	fmov	x4, d0
  210020:	9eae0023 	fmov	x3, v1.d[1]
  210024:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  210028:	9eae0005 	fmov	x5, v0.d[1]
  21002c:	910003fd 	mov	x29, sp
  210030:	aa0203e6 	mov	x6, x2
  210034:	aa0403e0 	mov	x0, x4
  210038:	aa0303e2 	mov	x2, x3
  21003c:	d53b440a 	mrs	x10, fpcr
  210040:	d37ffca9 	lsr	x9, x5, #63
  210044:	d370f8a4 	ubfx	x4, x5, #48, #15
  210048:	12001d29 	and	w9, w9, #0xff
  21004c:	d340bca1 	ubfx	x1, x5, #0, #48
  210050:	92401d2b 	and	x11, x9, #0xff
  210054:	72003c85 	ands	w5, w4, #0xffff
  210058:	54000f00 	b.eq	210238 <__multf3+0x220>  // b.none
  21005c:	528fffe3 	mov	w3, #0x7fff                	// #32767
  210060:	6b0300bf 	cmp	w5, w3
  210064:	540006a0 	b.eq	210138 <__multf3+0x120>  // b.none
  210068:	d37dfc03 	lsr	x3, x0, #61
  21006c:	92403c84 	and	x4, x4, #0xffff
  210070:	b24d0063 	orr	x3, x3, #0x8000000000000
  210074:	9287ffd0 	mov	x16, #0xffffffffffffc001    	// #-16383
  210078:	aa010c61 	orr	x1, x3, x1, lsl #3
  21007c:	8b100084 	add	x4, x4, x16
  210080:	d37df008 	lsl	x8, x0, #3
  210084:	d280000d 	mov	x13, #0x0                   	// #0
  210088:	d280000e 	mov	x14, #0x0                   	// #0
  21008c:	52800000 	mov	w0, #0x0                   	// #0
  210090:	d37ffc45 	lsr	x5, x2, #63
  210094:	aa0603e3 	mov	x3, x6
  210098:	12001ca5 	and	w5, w5, #0xff
  21009c:	d370f846 	ubfx	x6, x2, #48, #15
  2100a0:	92401cb0 	and	x16, x5, #0xff
  2100a4:	d340bc42 	ubfx	x2, x2, #0, #48
  2100a8:	72003cc7 	ands	w7, w6, #0xffff
  2100ac:	54000640 	b.eq	210174 <__multf3+0x15c>  // b.none
  2100b0:	528fffec 	mov	w12, #0x7fff                	// #32767
  2100b4:	6b0c00ff 	cmp	w7, w12
  2100b8:	54000f00 	b.eq	210298 <__multf3+0x280>  // b.none
  2100bc:	92403cc6 	and	x6, x6, #0xffff
  2100c0:	d37dfc67 	lsr	x7, x3, #61
  2100c4:	9287ffcf 	mov	x15, #0xffffffffffffc001    	// #-16383
  2100c8:	8b0f00c6 	add	x6, x6, x15
  2100cc:	b24d00e7 	orr	x7, x7, #0x8000000000000
  2100d0:	d37df063 	lsl	x3, x3, #3
  2100d4:	8b060084 	add	x4, x4, x6
  2100d8:	aa020ce2 	orr	x2, x7, x2, lsl #3
  2100dc:	d2800007 	mov	x7, #0x0                   	// #0
  2100e0:	4a050126 	eor	w6, w9, w5
  2100e4:	9100048f 	add	x15, x4, #0x1
  2100e8:	12001cc6 	and	w6, w6, #0xff
  2100ec:	f1001dbf 	cmp	x13, #0x7
  2100f0:	92401ccc 	and	x12, x6, #0xff
  2100f4:	54001560 	b.eq	2103a0 <__multf3+0x388>  // b.none
  2100f8:	540006cd 	b.le	2101d0 <__multf3+0x1b8>
  2100fc:	f1002dbf 	cmp	x13, #0xb
  210100:	54001500 	b.eq	2103a0 <__multf3+0x388>  // b.none
  210104:	54000ded 	b.le	2102c0 <__multf3+0x2a8>
  210108:	f10039bf 	cmp	x13, #0xe
  21010c:	5400136d 	b.le	210378 <__multf3+0x360>
  210110:	f1003dbf 	cmp	x13, #0xf
  210114:	540018e1 	b.ne	210430 <__multf3+0x418>  // b.any
  210118:	b67813c1 	tbz	x1, #47, 210390 <__multf3+0x378>
  21011c:	b77813a2 	tbnz	x2, #47, 210390 <__multf3+0x378>
  210120:	b2510041 	orr	x1, x2, #0x800000000000
  210124:	2a0503e9 	mov	w9, w5
  210128:	9240bc21 	and	x1, x1, #0xffffffffffff
  21012c:	aa0303e8 	mov	x8, x3
  210130:	528fffe4 	mov	w4, #0x7fff                	// #32767
  210134:	14000036 	b	21020c <__multf3+0x1f4>
  210138:	aa000028 	orr	x8, x1, x0
  21013c:	b5000e68 	cbnz	x8, 210308 <__multf3+0x2f0>
  210140:	d37ffc45 	lsr	x5, x2, #63
  210144:	aa0603e3 	mov	x3, x6
  210148:	12001ca5 	and	w5, w5, #0xff
  21014c:	d370f846 	ubfx	x6, x2, #48, #15
  210150:	d2800001 	mov	x1, #0x0                   	// #0
  210154:	d280010d 	mov	x13, #0x8                   	// #8
  210158:	d28fffe4 	mov	x4, #0x7fff                	// #32767
  21015c:	d280004e 	mov	x14, #0x2                   	// #2
  210160:	52800000 	mov	w0, #0x0                   	// #0
  210164:	d340bc42 	ubfx	x2, x2, #0, #48
  210168:	92401cb0 	and	x16, x5, #0xff
  21016c:	72003cc7 	ands	w7, w6, #0xffff
  210170:	54fffa01 	b.ne	2100b0 <__multf3+0x98>  // b.any
  210174:	aa030046 	orr	x6, x2, x3
  210178:	b4000e46 	cbz	x6, 210340 <__multf3+0x328>
  21017c:	dac01067 	clz	x7, x3
  210180:	f100005f 	cmp	x2, #0x0
  210184:	910100e7 	add	x7, x7, #0x40
  210188:	dac01046 	clz	x6, x2
  21018c:	9a8600e6 	csel	x6, x7, x6, eq  // eq = none
  210190:	d1003cc7 	sub	x7, x6, #0xf
  210194:	f100f0ff 	cmp	x7, #0x3c
  210198:	540013cc 	b.gt	210410 <__multf3+0x3f8>
  21019c:	11000cef 	add	w15, w7, #0x3
  2101a0:	528007ac 	mov	w12, #0x3d                  	// #61
  2101a4:	4b070187 	sub	w7, w12, w7
  2101a8:	9acf2042 	lsl	x2, x2, x15
  2101ac:	9ac72467 	lsr	x7, x3, x7
  2101b0:	aa0200e2 	orr	x2, x7, x2
  2101b4:	9acf2063 	lsl	x3, x3, x15
  2101b8:	cb060084 	sub	x4, x4, x6
  2101bc:	9287fdcc 	mov	x12, #0xffffffffffffc011    	// #-16367
  2101c0:	d2800007 	mov	x7, #0x0                   	// #0
  2101c4:	8b0c0084 	add	x4, x4, x12
  2101c8:	17ffffc6 	b	2100e0 <__multf3+0xc8>
  2101cc:	d503201f 	nop
  2101d0:	f1000dbf 	cmp	x13, #0x3
  2101d4:	54000e60 	b.eq	2103a0 <__multf3+0x388>  // b.none
  2101d8:	54000c0c 	b.gt	210358 <__multf3+0x340>
  2101dc:	f10005bf 	cmp	x13, #0x1
  2101e0:	5400128b 	b.lt	210430 <__multf3+0x418>  // b.tstop
  2101e4:	12000189 	and	w9, w12, #0x1
  2101e8:	f10008ff 	cmp	x7, #0x2
  2101ec:	540007a0 	b.eq	2102e0 <__multf3+0x2c8>  // b.none
  2101f0:	f1000cff 	cmp	x7, #0x3
  2101f4:	54002fa0 	b.eq	2107e8 <__multf3+0x7d0>  // b.none
  2101f8:	52800004 	mov	w4, #0x0                   	// #0
  2101fc:	d2800001 	mov	x1, #0x0                   	// #0
  210200:	d2800008 	mov	x8, #0x0                   	// #0
  210204:	f10004ff 	cmp	x7, #0x1
  210208:	54002901 	b.ne	210728 <__multf3+0x710>  // b.any
  21020c:	d2800003 	mov	x3, #0x0                   	// #0
  210210:	9e670101 	fmov	d1, x8
  210214:	b340bc23 	bfxil	x3, x1, #0, #48
  210218:	b3503883 	bfi	x3, x4, #48, #15
  21021c:	b3410123 	bfi	x3, x9, #63, #1
  210220:	9eaf0061 	fmov	v1.d[1], x3
  210224:	35000e80 	cbnz	w0, 2103f4 <__multf3+0x3dc>
  210228:	4ea11c20 	mov	v0.16b, v1.16b
  21022c:	a8c37bfd 	ldp	x29, x30, [sp], #48
  210230:	d65f03c0 	ret
  210234:	d503201f 	nop
  210238:	aa000028 	orr	x8, x1, x0
  21023c:	b40005a8 	cbz	x8, 2102f0 <__multf3+0x2d8>
  210240:	dac01005 	clz	x5, x0
  210244:	f100003f 	cmp	x1, #0x0
  210248:	dac01024 	clz	x4, x1
  21024c:	910100a5 	add	x5, x5, #0x40
  210250:	9a8400a4 	csel	x4, x5, x4, eq  // eq = none
  210254:	d1003c83 	sub	x3, x4, #0xf
  210258:	f100f07f 	cmp	x3, #0x3c
  21025c:	54000e2c 	b.gt	210420 <__multf3+0x408>
  210260:	11000c68 	add	w8, w3, #0x3
  210264:	528007a5 	mov	w5, #0x3d                  	// #61
  210268:	4b0300a3 	sub	w3, w5, w3
  21026c:	9ac82021 	lsl	x1, x1, x8
  210270:	9ac82008 	lsl	x8, x0, x8
  210274:	9ac32400 	lsr	x0, x0, x3
  210278:	aa010001 	orr	x1, x0, x1
  21027c:	9287fdc0 	mov	x0, #0xffffffffffffc011    	// #-16367
  210280:	d280000d 	mov	x13, #0x0                   	// #0
  210284:	cb040004 	sub	x4, x0, x4
  210288:	d280000e 	mov	x14, #0x0                   	// #0
  21028c:	52800000 	mov	w0, #0x0                   	// #0
  210290:	17ffff80 	b	210090 <__multf3+0x78>
  210294:	d503201f 	nop
  210298:	d28fffe7 	mov	x7, #0x7fff                	// #32767
  21029c:	aa030046 	orr	x6, x2, x3
  2102a0:	8b070084 	add	x4, x4, x7
  2102a4:	b5000426 	cbnz	x6, 210328 <__multf3+0x310>
  2102a8:	b27f01ad 	orr	x13, x13, #0x2
  2102ac:	d2800002 	mov	x2, #0x0                   	// #0
  2102b0:	d2800003 	mov	x3, #0x0                   	// #0
  2102b4:	d2800047 	mov	x7, #0x2                   	// #2
  2102b8:	17ffff8a 	b	2100e0 <__multf3+0xc8>
  2102bc:	d503201f 	nop
  2102c0:	f10025bf 	cmp	x13, #0x9
  2102c4:	540004e0 	b.eq	210360 <__multf3+0x348>  // b.none
  2102c8:	aa0e03e7 	mov	x7, x14
  2102cc:	aa0103e2 	mov	x2, x1
  2102d0:	aa0803e3 	mov	x3, x8
  2102d4:	12000189 	and	w9, w12, #0x1
  2102d8:	f10008ff 	cmp	x7, #0x2
  2102dc:	54fff8a1 	b.ne	2101f0 <__multf3+0x1d8>  // b.any
  2102e0:	528fffe4 	mov	w4, #0x7fff                	// #32767
  2102e4:	d2800001 	mov	x1, #0x0                   	// #0
  2102e8:	d2800008 	mov	x8, #0x0                   	// #0
  2102ec:	17ffffc8 	b	21020c <__multf3+0x1f4>
  2102f0:	d2800001 	mov	x1, #0x0                   	// #0
  2102f4:	d280008d 	mov	x13, #0x4                   	// #4
  2102f8:	d2800004 	mov	x4, #0x0                   	// #0
  2102fc:	d280002e 	mov	x14, #0x1                   	// #1
  210300:	52800000 	mov	w0, #0x0                   	// #0
  210304:	17ffff63 	b	210090 <__multf3+0x78>
  210308:	d36ffc23 	lsr	x3, x1, #47
  21030c:	aa0003e8 	mov	x8, x0
  210310:	d2400060 	eor	x0, x3, #0x1
  210314:	d280018d 	mov	x13, #0xc                   	// #12
  210318:	12000000 	and	w0, w0, #0x1
  21031c:	d28fffe4 	mov	x4, #0x7fff                	// #32767
  210320:	d280006e 	mov	x14, #0x3                   	// #3
  210324:	17ffff5b 	b	210090 <__multf3+0x78>
  210328:	f251005f 	tst	x2, #0x800000000000
  21032c:	b24005ad 	orr	x13, x13, #0x3
  210330:	1a9f1400 	csinc	w0, w0, wzr, ne  // ne = any
  210334:	d2800067 	mov	x7, #0x3                   	// #3
  210338:	17ffff6a 	b	2100e0 <__multf3+0xc8>
  21033c:	d503201f 	nop
  210340:	b24001ad 	orr	x13, x13, #0x1
  210344:	d2800002 	mov	x2, #0x0                   	// #0
  210348:	d2800003 	mov	x3, #0x0                   	// #0
  21034c:	d2800027 	mov	x7, #0x1                   	// #1
  210350:	17ffff64 	b	2100e0 <__multf3+0xc8>
  210354:	d503201f 	nop
  210358:	f10015bf 	cmp	x13, #0x5
  21035c:	54fffb6d 	b.le	2102c8 <__multf3+0x2b0>
  210360:	52800009 	mov	w9, #0x0                   	// #0
  210364:	92ffffe1 	mov	x1, #0xffffffffffff        	// #281474976710655
  210368:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  21036c:	52800020 	mov	w0, #0x1                   	// #1
  210370:	528fffe4 	mov	w4, #0x7fff                	// #32767
  210374:	17ffffa6 	b	21020c <__multf3+0x1f4>
  210378:	aa0103e2 	mov	x2, x1
  21037c:	aa0803e3 	mov	x3, x8
  210380:	aa0b03ec 	mov	x12, x11
  210384:	aa0e03e7 	mov	x7, x14
  210388:	17ffff97 	b	2101e4 <__multf3+0x1cc>
  21038c:	d503201f 	nop
  210390:	b2510021 	orr	x1, x1, #0x800000000000
  210394:	528fffe4 	mov	w4, #0x7fff                	// #32767
  210398:	9240bc21 	and	x1, x1, #0xffffffffffff
  21039c:	17ffff9c 	b	21020c <__multf3+0x1f4>
  2103a0:	aa1003ec 	mov	x12, x16
  2103a4:	17ffff90 	b	2101e4 <__multf3+0x1cc>
  2103a8:	926a054a 	and	x10, x10, #0xc00000
  2103ac:	f150015f 	cmp	x10, #0x400, lsl #12
  2103b0:	540018c0 	b.eq	2106c8 <__multf3+0x6b0>  // b.none
  2103b4:	f160015f 	cmp	x10, #0x800, lsl #12
  2103b8:	54002000 	b.eq	2107b8 <__multf3+0x7a0>  // b.none
  2103bc:	f100015f 	cmp	x10, #0x0
  2103c0:	528fffe4 	mov	w4, #0x7fff                	// #32767
  2103c4:	da9f03e8 	csetm	x8, ne  // ne = any
  2103c8:	1a841024 	csel	w4, w1, w4, ne  // ne = any
  2103cc:	92ffffe1 	mov	x1, #0xffffffffffff        	// #281474976710655
  2103d0:	9a8103e1 	csel	x1, xzr, x1, eq  // eq = none
  2103d4:	52800282 	mov	w2, #0x14                  	// #20
  2103d8:	2a020000 	orr	w0, w0, w2
  2103dc:	d2800003 	mov	x3, #0x0                   	// #0
  2103e0:	9e670101 	fmov	d1, x8
  2103e4:	b340bc23 	bfxil	x3, x1, #0, #48
  2103e8:	b3503883 	bfi	x3, x4, #48, #15
  2103ec:	b34100c3 	bfi	x3, x6, #63, #1
  2103f0:	9eaf0061 	fmov	v1.d[1], x3
  2103f4:	3d800ba1 	str	q1, [x29, #32]
  2103f8:	94000510 	bl	211838 <__sfp_handle_exceptions>
  2103fc:	3dc00ba1 	ldr	q1, [x29, #32]
  210400:	a8c37bfd 	ldp	x29, x30, [sp], #48
  210404:	4ea11c20 	mov	v0.16b, v1.16b
  210408:	d65f03c0 	ret
  21040c:	d503201f 	nop
  210410:	5100f4e2 	sub	w2, w7, #0x3d
  210414:	9ac22062 	lsl	x2, x3, x2
  210418:	d2800003 	mov	x3, #0x0                   	// #0
  21041c:	17ffff67 	b	2101b8 <__multf3+0x1a0>
  210420:	5100f461 	sub	w1, w3, #0x3d
  210424:	d2800008 	mov	x8, #0x0                   	// #0
  210428:	9ac12001 	lsl	x1, x0, x1
  21042c:	17ffff94 	b	21027c <__multf3+0x264>
  210430:	92407c70 	and	x16, x3, #0xffffffff
  210434:	d360fd1e 	lsr	x30, x8, #32
  210438:	d360fc63 	lsr	x3, x3, #32
  21043c:	92407d08 	and	x8, x8, #0xffffffff
  210440:	92407c45 	and	x5, x2, #0xffffffff
  210444:	d360fc42 	lsr	x2, x2, #32
  210448:	9b107fcd 	mul	x13, x30, x16
  21044c:	a90153b3 	stp	x19, x20, [x29, #16]
  210450:	9b087e12 	mul	x18, x16, x8
  210454:	d360fc31 	lsr	x17, x1, #32
  210458:	9b083469 	madd	x9, x3, x8, x13
  21045c:	92407c21 	and	x1, x1, #0xffffffff
  210460:	9b057d13 	mul	x19, x8, x5
  210464:	d2c0002b 	mov	x11, #0x100000000           	// #4294967296
  210468:	9b037fc7 	mul	x7, x30, x3
  21046c:	8b528129 	add	x9, x9, x18, lsr #32
  210470:	92407e52 	and	x18, x18, #0xffffffff
  210474:	eb0901bf 	cmp	x13, x9
  210478:	9b057fcd 	mul	x13, x30, x5
  21047c:	9b083448 	madd	x8, x2, x8, x13
  210480:	8b0b00ee 	add	x14, x7, x11
  210484:	9a8781c7 	csel	x7, x14, x7, hi  // hi = pmore
  210488:	8b098252 	add	x18, x18, x9, lsl #32
  21048c:	9b017e0e 	mul	x14, x16, x1
  210490:	8b538108 	add	x8, x8, x19, lsr #32
  210494:	92407e73 	and	x19, x19, #0xffffffff
  210498:	8b088273 	add	x19, x19, x8, lsl #32
  21049c:	9b107e30 	mul	x16, x17, x16
  2104a0:	8b498269 	add	x9, x19, x9, lsr #32
  2104a4:	9b057e34 	mul	x20, x17, x5
  2104a8:	8b0900e9 	add	x9, x7, x9
  2104ac:	9b014067 	madd	x7, x3, x1, x16
  2104b0:	9b057c25 	mul	x5, x1, x5
  2104b4:	eb0801bf 	cmp	x13, x8
  2104b8:	9b027fde 	mul	x30, x30, x2
  2104bc:	9b015041 	madd	x1, x2, x1, x20
  2104c0:	8b4e80ed 	add	x13, x7, x14, lsr #32
  2104c4:	9b117c63 	mul	x3, x3, x17
  2104c8:	92407dc7 	and	x7, x14, #0xffffffff
  2104cc:	9b117c51 	mul	x17, x2, x17
  2104d0:	8b0b03c2 	add	x2, x30, x11
  2104d4:	8b458021 	add	x1, x1, x5, lsr #32
  2104d8:	9a9e805e 	csel	x30, x2, x30, hi  // hi = pmore
  2104dc:	8b0b0062 	add	x2, x3, x11
  2104e0:	eb0d021f 	cmp	x16, x13
  2104e4:	9a838043 	csel	x3, x2, x3, hi  // hi = pmore
  2104e8:	8b0d80e7 	add	x7, x7, x13, lsl #32
  2104ec:	eb01029f 	cmp	x20, x1
  2104f0:	92407ca5 	and	x5, x5, #0xffffffff
  2104f4:	8b0b022b 	add	x11, x17, x11
  2104f8:	8b07012e 	add	x14, x9, x7
  2104fc:	8b0180a5 	add	x5, x5, x1, lsl #32
  210500:	8b4883c8 	add	x8, x30, x8, lsr #32
  210504:	9a918171 	csel	x17, x11, x17, hi  // hi = pmore
  210508:	eb13013f 	cmp	x9, x19
  21050c:	9a9f27e2 	cset	x2, cc  // cc = lo, ul, last
  210510:	8b0800a5 	add	x5, x5, x8
  210514:	eb0701df 	cmp	x14, x7
  210518:	8b4d8067 	add	x7, x3, x13, lsr #32
  21051c:	9a9f27e9 	cset	x9, cc  // cc = lo, ul, last
  210520:	8b0200a3 	add	x3, x5, x2
  210524:	eb0800bf 	cmp	x5, x8
  210528:	8b070065 	add	x5, x3, x7
  21052c:	fa422060 	ccmp	x3, x2, #0x0, cs  // cs = hs, nlast
  210530:	d360fc22 	lsr	x2, x1, #32
  210534:	8b0900a3 	add	x3, x5, x9
  210538:	9a822442 	cinc	x2, x2, cc  // cc = lo, ul, last
  21053c:	eb0700bf 	cmp	x5, x7
  210540:	aa0e3652 	orr	x18, x18, x14, lsl #13
  210544:	fa492060 	ccmp	x3, x9, #0x0, cs  // cs = hs, nlast
  210548:	9a912621 	cinc	x1, x17, cc  // cc = lo, ul, last
  21054c:	f100025f 	cmp	x18, #0x0
  210550:	8b010042 	add	x2, x2, x1
  210554:	9a9f07e1 	cset	x1, ne  // ne = any
  210558:	aa4ecc2e 	orr	x14, x1, x14, lsr #51
  21055c:	93c3cc42 	extr	x2, x2, x3, #51
  210560:	aa0335c3 	orr	x3, x14, x3, lsl #13
  210564:	b7a00462 	tbnz	x2, #52, 2105f0 <__multf3+0x5d8>
  210568:	a94153b3 	ldp	x19, x20, [x29, #16]
  21056c:	aa0403ef 	mov	x15, x4
  210570:	d287ffe1 	mov	x1, #0x3fff                	// #16383
  210574:	8b0101e4 	add	x4, x15, x1
  210578:	f100009f 	cmp	x4, #0x0
  21057c:	5400046d 	b.le	210608 <__multf3+0x5f0>
  210580:	f240087f 	tst	x3, #0x7
  210584:	540001e0 	b.eq	2105c0 <__multf3+0x5a8>  // b.none
  210588:	926a0541 	and	x1, x10, #0xc00000
  21058c:	321c0000 	orr	w0, w0, #0x10
  210590:	f150003f 	cmp	x1, #0x400, lsl #12
  210594:	54000aa0 	b.eq	2106e8 <__multf3+0x6d0>  // b.none
  210598:	f160003f 	cmp	x1, #0x800, lsl #12
  21059c:	540010a0 	b.eq	2107b0 <__multf3+0x798>  // b.none
  2105a0:	b5000101 	cbnz	x1, 2105c0 <__multf3+0x5a8>
  2105a4:	92400c61 	and	x1, x3, #0xf
  2105a8:	f100103f 	cmp	x1, #0x4
  2105ac:	540000a0 	b.eq	2105c0 <__multf3+0x5a8>  // b.none
  2105b0:	91001061 	add	x1, x3, #0x4
  2105b4:	eb03003f 	cmp	x1, x3
  2105b8:	aa0103e3 	mov	x3, x1
  2105bc:	9a822442 	cinc	x2, x2, cc  // cc = lo, ul, last
  2105c0:	b6a00062 	tbz	x2, #52, 2105cc <__multf3+0x5b4>
  2105c4:	924bf842 	and	x2, x2, #0xffefffffffffffff
  2105c8:	914011e4 	add	x4, x15, #0x4, lsl #12
  2105cc:	d28fffc1 	mov	x1, #0x7ffe                	// #32766
  2105d0:	eb01009f 	cmp	x4, x1
  2105d4:	54ffeeac 	b.gt	2103a8 <__multf3+0x390>
  2105d8:	d343c841 	ubfx	x1, x2, #3, #48
  2105dc:	93c30c48 	extr	x8, x2, x3, #3
  2105e0:	12003884 	and	w4, w4, #0x7fff
  2105e4:	2a0603e9 	mov	w9, w6
  2105e8:	17ffff09 	b	21020c <__multf3+0x1f4>
  2105ec:	d503201f 	nop
  2105f0:	92400061 	and	x1, x3, #0x1
  2105f4:	aa430423 	orr	x3, x1, x3, lsr #1
  2105f8:	aa02fc63 	orr	x3, x3, x2, lsl #63
  2105fc:	d341fc42 	lsr	x2, x2, #1
  210600:	a94153b3 	ldp	x19, x20, [x29, #16]
  210604:	17ffffdb 	b	210570 <__multf3+0x558>
  210608:	d2800021 	mov	x1, #0x1                   	// #1
  21060c:	cb040024 	sub	x4, x1, x4
  210610:	f101d09f 	cmp	x4, #0x74
  210614:	540003ac 	b.gt	210688 <__multf3+0x670>
  210618:	f100fc9f 	cmp	x4, #0x3f
  21061c:	540008ac 	b.gt	210730 <__multf3+0x718>
  210620:	52800801 	mov	w1, #0x40                  	// #64
  210624:	4b040021 	sub	w1, w1, w4
  210628:	9ac42465 	lsr	x5, x3, x4
  21062c:	9ac12063 	lsl	x3, x3, x1
  210630:	f100007f 	cmp	x3, #0x0
  210634:	9a9f07e8 	cset	x8, ne  // ne = any
  210638:	9ac42444 	lsr	x4, x2, x4
  21063c:	9ac12042 	lsl	x2, x2, x1
  210640:	aa050042 	orr	x2, x2, x5
  210644:	aa080042 	orr	x2, x2, x8
  210648:	f240085f 	tst	x2, #0x7
  21064c:	54000100 	b.eq	21066c <__multf3+0x654>  // b.none
  210650:	926a0541 	and	x1, x10, #0xc00000
  210654:	321c0000 	orr	w0, w0, #0x10
  210658:	f150003f 	cmp	x1, #0x400, lsl #12
  21065c:	54000e40 	b.eq	210824 <__multf3+0x80c>  // b.none
  210660:	f160003f 	cmp	x1, #0x800, lsl #12
  210664:	54000d20 	b.eq	210808 <__multf3+0x7f0>  // b.none
  210668:	b40004e1 	cbz	x1, 210704 <__multf3+0x6ec>
  21066c:	b69808c4 	tbz	x4, #51, 210784 <__multf3+0x76c>
  210670:	321c0000 	orr	w0, w0, #0x10
  210674:	52800024 	mov	w4, #0x1                   	// #1
  210678:	d2800001 	mov	x1, #0x0                   	// #0
  21067c:	d2800008 	mov	x8, #0x0                   	// #0
  210680:	321d0000 	orr	w0, w0, #0x8
  210684:	17ffff56 	b	2103dc <__multf3+0x3c4>
  210688:	aa020068 	orr	x8, x3, x2
  21068c:	b4000148 	cbz	x8, 2106b4 <__multf3+0x69c>
  210690:	926a054a 	and	x10, x10, #0xc00000
  210694:	321c0000 	orr	w0, w0, #0x10
  210698:	f150015f 	cmp	x10, #0x400, lsl #12
  21069c:	54000ae0 	b.eq	2107f8 <__multf3+0x7e0>  // b.none
  2106a0:	d2800008 	mov	x8, #0x0                   	// #0
  2106a4:	f160015f 	cmp	x10, #0x800, lsl #12
  2106a8:	54000061 	b.ne	2106b4 <__multf3+0x69c>  // b.any
  2106ac:	f100019f 	cmp	x12, #0x0
  2106b0:	9a9f07e8 	cset	x8, ne  // ne = any
  2106b4:	321d0000 	orr	w0, w0, #0x8
  2106b8:	52800004 	mov	w4, #0x0                   	// #0
  2106bc:	d2800001 	mov	x1, #0x0                   	// #0
  2106c0:	17ffff47 	b	2103dc <__multf3+0x3c4>
  2106c4:	d503201f 	nop
  2106c8:	f100019f 	cmp	x12, #0x0
  2106cc:	528fffe4 	mov	w4, #0x7fff                	// #32767
  2106d0:	da9f03e8 	csetm	x8, ne  // ne = any
  2106d4:	1a841024 	csel	w4, w1, w4, ne  // ne = any
  2106d8:	92ffffe1 	mov	x1, #0xffffffffffff        	// #281474976710655
  2106dc:	9a9f1021 	csel	x1, x1, xzr, ne  // ne = any
  2106e0:	17ffff3d 	b	2103d4 <__multf3+0x3bc>
  2106e4:	d503201f 	nop
  2106e8:	b5fff6cc 	cbnz	x12, 2105c0 <__multf3+0x5a8>
  2106ec:	91002061 	add	x1, x3, #0x8
  2106f0:	eb03003f 	cmp	x1, x3
  2106f4:	aa0103e3 	mov	x3, x1
  2106f8:	9a822442 	cinc	x2, x2, cc  // cc = lo, ul, last
  2106fc:	17ffffb1 	b	2105c0 <__multf3+0x5a8>
  210700:	d2800004 	mov	x4, #0x0                   	// #0
  210704:	92400c41 	and	x1, x2, #0xf
  210708:	f100103f 	cmp	x1, #0x4
  21070c:	54fffb00 	b.eq	21066c <__multf3+0x654>  // b.none
  210710:	91001041 	add	x1, x2, #0x4
  210714:	eb01005f 	cmp	x2, x1
  210718:	aa0103e2 	mov	x2, x1
  21071c:	9a849484 	cinc	x4, x4, hi  // hi = pmore
  210720:	17ffffd3 	b	21066c <__multf3+0x654>
  210724:	d503201f 	nop
  210728:	2a0903e6 	mov	w6, w9
  21072c:	17ffff91 	b	210570 <__multf3+0x558>
  210730:	52801001 	mov	w1, #0x80                  	// #128
  210734:	4b040021 	sub	w1, w1, w4
  210738:	f101009f 	cmp	x4, #0x40
  21073c:	51010084 	sub	w4, w4, #0x40
  210740:	9ac12041 	lsl	x1, x2, x1
  210744:	aa010061 	orr	x1, x3, x1
  210748:	9a831023 	csel	x3, x1, x3, ne  // ne = any
  21074c:	9ac42442 	lsr	x2, x2, x4
  210750:	f100007f 	cmp	x3, #0x0
  210754:	9a9f07e8 	cset	x8, ne  // ne = any
  210758:	aa020102 	orr	x2, x8, x2
  21075c:	f240085f 	tst	x2, #0x7
  210760:	540003a0 	b.eq	2107d4 <__multf3+0x7bc>  // b.none
  210764:	926a0541 	and	x1, x10, #0xc00000
  210768:	321c0000 	orr	w0, w0, #0x10
  21076c:	f150003f 	cmp	x1, #0x400, lsl #12
  210770:	54000580 	b.eq	210820 <__multf3+0x808>  // b.none
  210774:	f160003f 	cmp	x1, #0x800, lsl #12
  210778:	54000460 	b.eq	210804 <__multf3+0x7ec>  // b.none
  21077c:	d2800004 	mov	x4, #0x0                   	// #0
  210780:	b4fffc01 	cbz	x1, 210700 <__multf3+0x6e8>
  210784:	d343c881 	ubfx	x1, x4, #3, #48
  210788:	93c20c88 	extr	x8, x4, x2, #3
  21078c:	37200040 	tbnz	w0, #4, 210794 <__multf3+0x77c>
  210790:	3658008a 	tbz	w10, #11, 2107a0 <__multf3+0x788>
  210794:	52800004 	mov	w4, #0x0                   	// #0
  210798:	321d0000 	orr	w0, w0, #0x8
  21079c:	17ffff10 	b	2103dc <__multf3+0x3c4>
  2107a0:	2a0603e9 	mov	w9, w6
  2107a4:	52800004 	mov	w4, #0x0                   	// #0
  2107a8:	17fffe99 	b	21020c <__multf3+0x1f4>
  2107ac:	d503201f 	nop
  2107b0:	b4fff08c 	cbz	x12, 2105c0 <__multf3+0x5a8>
  2107b4:	17ffffce 	b	2106ec <__multf3+0x6d4>
  2107b8:	f100019f 	cmp	x12, #0x0
  2107bc:	528fffe4 	mov	w4, #0x7fff                	// #32767
  2107c0:	da9f13e8 	csetm	x8, eq  // eq = none
  2107c4:	1a840024 	csel	w4, w1, w4, eq  // eq = none
  2107c8:	92ffffe1 	mov	x1, #0xffffffffffff        	// #281474976710655
  2107cc:	9a9f0021 	csel	x1, x1, xzr, eq  // eq = none
  2107d0:	17ffff01 	b	2103d4 <__multf3+0x3bc>
  2107d4:	d343fc48 	lsr	x8, x2, #3
  2107d8:	d2800001 	mov	x1, #0x0                   	// #0
  2107dc:	365ffe2a 	tbz	w10, #11, 2107a0 <__multf3+0x788>
  2107e0:	17ffffed 	b	210794 <__multf3+0x77c>
  2107e4:	d503201f 	nop
  2107e8:	b2510041 	orr	x1, x2, #0x800000000000
  2107ec:	aa0303e8 	mov	x8, x3
  2107f0:	9240bc21 	and	x1, x1, #0xffffffffffff
  2107f4:	17fffe4f 	b	210130 <__multf3+0x118>
  2107f8:	f100019f 	cmp	x12, #0x0
  2107fc:	9a9f17e8 	cset	x8, eq  // eq = none
  210800:	17ffffad 	b	2106b4 <__multf3+0x69c>
  210804:	d2800004 	mov	x4, #0x0                   	// #0
  210808:	b4fff32c 	cbz	x12, 21066c <__multf3+0x654>
  21080c:	91002041 	add	x1, x2, #0x8
  210810:	eb02003f 	cmp	x1, x2
  210814:	aa0103e2 	mov	x2, x1
  210818:	9a842484 	cinc	x4, x4, cc  // cc = lo, ul, last
  21081c:	17ffff94 	b	21066c <__multf3+0x654>
  210820:	d2800004 	mov	x4, #0x0                   	// #0
  210824:	b5fff24c 	cbnz	x12, 21066c <__multf3+0x654>
  210828:	17fffff9 	b	21080c <__multf3+0x7f4>
  21082c:	00000000 	.inst	0x00000000 ; undefined

0000000000210830 <__subtf3>:
  210830:	9e660000 	fmov	x0, d0
  210834:	9e660022 	fmov	x2, d1
  210838:	9eae0023 	fmov	x3, v1.d[1]
  21083c:	9eae0001 	fmov	x1, v0.d[1]
  210840:	aa0003ec 	mov	x12, x0
  210844:	aa0203ed 	mov	x13, x2
  210848:	aa0303e0 	mov	x0, x3
  21084c:	d53b4407 	mrs	x7, fpcr
  210850:	d370f862 	ubfx	x2, x3, #48, #15
  210854:	d37ffc26 	lsr	x6, x1, #63
  210858:	d370f823 	ubfx	x3, x1, #48, #15
  21085c:	92403c4b 	and	x11, x2, #0xffff
  210860:	d37ffc04 	lsr	x4, x0, #63
  210864:	12001cc6 	and	w6, w6, #0xff
  210868:	d37dbc21 	ubfiz	x1, x1, #3, #48
  21086c:	d37dbc00 	ubfiz	x0, x0, #3, #48
  210870:	d28fffef 	mov	x15, #0x7fff                	// #32767
  210874:	12003c68 	and	w8, w3, #0xffff
  210878:	12003c45 	and	w5, w2, #0xffff
  21087c:	92403c63 	and	x3, x3, #0xffff
  210880:	92401cc9 	and	x9, x6, #0xff
  210884:	aa4cf421 	orr	x1, x1, x12, lsr #61
  210888:	d37df18a 	lsl	x10, x12, #3
  21088c:	12001c84 	and	w4, w4, #0xff
  210890:	aa4df402 	orr	x2, x0, x13, lsr #61
  210894:	d37df1ae 	lsl	x14, x13, #3
  210898:	eb0f017f 	cmp	x11, x15
  21089c:	54000aa0 	b.eq	2109f0 <__subtf3+0x1c0>  // b.none
  2108a0:	52000084 	eor	w4, w4, #0x1
  2108a4:	4b050105 	sub	w5, w8, w5
  2108a8:	92401c84 	and	x4, x4, #0xff
  2108ac:	eb09009f 	cmp	x4, x9
  2108b0:	54000ac0 	b.eq	210a08 <__subtf3+0x1d8>  // b.none
  2108b4:	710000bf 	cmp	w5, #0x0
  2108b8:	54000d4d 	b.le	210a60 <__subtf3+0x230>
  2108bc:	b5000f6b 	cbnz	x11, 210aa8 <__subtf3+0x278>
  2108c0:	aa0e0040 	orr	x0, x2, x14
  2108c4:	b4001420 	cbz	x0, 210b48 <__subtf3+0x318>
  2108c8:	710004a5 	subs	w5, w5, #0x1
  2108cc:	54001921 	b.ne	210bf0 <__subtf3+0x3c0>  // b.any
  2108d0:	cb0e014e 	sub	x14, x10, x14
  2108d4:	eb0e015f 	cmp	x10, x14
  2108d8:	aa0e03ea 	mov	x10, x14
  2108dc:	da020021 	sbc	x1, x1, x2
  2108e0:	9240c825 	and	x5, x1, #0x7ffffffffffff
  2108e4:	b6981381 	tbz	x1, #51, 210b54 <__subtf3+0x324>
  2108e8:	dac01141 	clz	x1, x10
  2108ec:	f10000bf 	cmp	x5, #0x0
  2108f0:	11010021 	add	w1, w1, #0x40
  2108f4:	dac010a0 	clz	x0, x5
  2108f8:	1a800020 	csel	w0, w1, w0, eq  // eq = none
  2108fc:	51003001 	sub	w1, w0, #0xc
  210900:	7100fc3f 	cmp	w1, #0x3f
  210904:	540021ac 	b.gt	210d38 <__subtf3+0x508>
  210908:	52800800 	mov	w0, #0x40                  	// #64
  21090c:	4b010000 	sub	w0, w0, w1
  210910:	9ac120a5 	lsl	x5, x5, x1
  210914:	9ac02540 	lsr	x0, x10, x0
  210918:	aa050000 	orr	x0, x0, x5
  21091c:	9ac1214a 	lsl	x10, x10, x1
  210920:	93407c22 	sxtw	x2, w1
  210924:	eb03005f 	cmp	x2, x3
  210928:	5400200b 	b.lt	210d28 <__subtf3+0x4f8>  // b.tstop
  21092c:	4b030021 	sub	w1, w1, w3
  210930:	11000421 	add	w1, w1, #0x1
  210934:	7100fc3f 	cmp	w1, #0x3f
  210938:	540025cc 	b.gt	210df0 <__subtf3+0x5c0>
  21093c:	52800802 	mov	w2, #0x40                  	// #64
  210940:	4b010042 	sub	w2, w2, w1
  210944:	9ac12543 	lsr	x3, x10, x1
  210948:	9ac2214a 	lsl	x10, x10, x2
  21094c:	f100015f 	cmp	x10, #0x0
  210950:	9ac12401 	lsr	x1, x0, x1
  210954:	9a9f07ea 	cset	x10, ne  // ne = any
  210958:	9ac22000 	lsl	x0, x0, x2
  21095c:	aa030000 	orr	x0, x0, x3
  210960:	aa0a000a 	orr	x10, x0, x10
  210964:	aa010148 	orr	x8, x10, x1
  210968:	b4001008 	cbz	x8, 210b68 <__subtf3+0x338>
  21096c:	92400940 	and	x0, x10, #0x7
  210970:	d2800003 	mov	x3, #0x0                   	// #0
  210974:	52800025 	mov	w5, #0x1                   	// #1
  210978:	b4005460 	cbz	x0, 211404 <__subtf3+0xbd4>
  21097c:	926a04e0 	and	x0, x7, #0xc00000
  210980:	f150001f 	cmp	x0, #0x400, lsl #12
  210984:	54001ca0 	b.eq	210d18 <__subtf3+0x4e8>  // b.none
  210988:	f160001f 	cmp	x0, #0x800, lsl #12
  21098c:	54001b60 	b.eq	210cf8 <__subtf3+0x4c8>  // b.none
  210990:	b40017c0 	cbz	x0, 210c88 <__subtf3+0x458>
  210994:	52800200 	mov	w0, #0x10                  	// #16
  210998:	924d0022 	and	x2, x1, #0x8000000000000
  21099c:	34000045 	cbz	w5, 2109a4 <__subtf3+0x174>
  2109a0:	321d0000 	orr	w0, w0, #0x8
  2109a4:	b4001d22 	cbz	x2, 210d48 <__subtf3+0x518>
  2109a8:	91000463 	add	x3, x3, #0x1
  2109ac:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  2109b0:	eb02007f 	cmp	x3, x2
  2109b4:	540013a0 	b.eq	210c28 <__subtf3+0x3f8>  // b.none
  2109b8:	924cf821 	and	x1, x1, #0xfff7ffffffffffff
  2109bc:	12003864 	and	w4, w3, #0x7fff
  2109c0:	93ca0c2a 	extr	x10, x1, x10, #3
  2109c4:	d343c821 	ubfx	x1, x1, #3, #48
  2109c8:	d2800003 	mov	x3, #0x0                   	// #0
  2109cc:	9e670141 	fmov	d1, x10
  2109d0:	b340bc23 	bfxil	x3, x1, #0, #48
  2109d4:	b3503883 	bfi	x3, x4, #48, #15
  2109d8:	b34100c3 	bfi	x3, x6, #63, #1
  2109dc:	9eaf0061 	fmov	v1.d[1], x3
  2109e0:	35001440 	cbnz	w0, 210c68 <__subtf3+0x438>
  2109e4:	4ea11c20 	mov	v0.16b, v1.16b
  2109e8:	d65f03c0 	ret
  2109ec:	d503201f 	nop
  2109f0:	aa0e0040 	orr	x0, x2, x14
  2109f4:	b4fff560 	cbz	x0, 2108a0 <__subtf3+0x70>
  2109f8:	92401c84 	and	x4, x4, #0xff
  2109fc:	4b050105 	sub	w5, w8, w5
  210a00:	eb09009f 	cmp	x4, x9
  210a04:	54fff581 	b.ne	2108b4 <__subtf3+0x84>  // b.any
  210a08:	710000bf 	cmp	w5, #0x0
  210a0c:	5400152d 	b.le	210cb0 <__subtf3+0x480>
  210a10:	b500074b 	cbnz	x11, 210af8 <__subtf3+0x2c8>
  210a14:	aa0e0040 	orr	x0, x2, x14
  210a18:	b4000980 	cbz	x0, 210b48 <__subtf3+0x318>
  210a1c:	710004a5 	subs	w5, w5, #0x1
  210a20:	54002940 	b.eq	210f48 <__subtf3+0x718>  // b.none
  210a24:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  210a28:	eb00007f 	cmp	x3, x0
  210a2c:	540006e1 	b.ne	210b08 <__subtf3+0x2d8>  // b.any
  210a30:	aa0a0020 	orr	x0, x1, x10
  210a34:	b4002960 	cbz	x0, 210f60 <__subtf3+0x730>
  210a38:	d372fc20 	lsr	x0, x1, #50
  210a3c:	52800005 	mov	w5, #0x0                   	// #0
  210a40:	d2400000 	eor	x0, x0, #0x1
  210a44:	12000000 	and	w0, w0, #0x1
  210a48:	924d0022 	and	x2, x1, #0x8000000000000
  210a4c:	34fffac5 	cbz	w5, 2109a4 <__subtf3+0x174>
  210a50:	365ffaa7 	tbz	w7, #11, 2109a4 <__subtf3+0x174>
  210a54:	321d0000 	orr	w0, w0, #0x8
  210a58:	17ffffd3 	b	2109a4 <__subtf3+0x174>
  210a5c:	d503201f 	nop
  210a60:	54000901 	b.ne	210b80 <__subtf3+0x350>  // b.any
  210a64:	91000460 	add	x0, x3, #0x1
  210a68:	92403800 	and	x0, x0, #0x7fff
  210a6c:	f100041f 	cmp	x0, #0x1
  210a70:	5400198d 	b.le	210da0 <__subtf3+0x570>
  210a74:	cb0e0140 	sub	x0, x10, x14
  210a78:	eb00015f 	cmp	x10, x0
  210a7c:	da020025 	sbc	x5, x1, x2
  210a80:	b7981d45 	tbnz	x5, #51, 210e28 <__subtf3+0x5f8>
  210a84:	aa050008 	orr	x8, x0, x5
  210a88:	b5002bc8 	cbnz	x8, 211000 <__subtf3+0x7d0>
  210a8c:	926a04e7 	and	x7, x7, #0xc00000
  210a90:	d280000a 	mov	x10, #0x0                   	// #0
  210a94:	f16000ff 	cmp	x7, #0x800, lsl #12
  210a98:	52800000 	mov	w0, #0x0                   	// #0
  210a9c:	1a9f17e6 	cset	w6, eq  // eq = none
  210aa0:	d2800003 	mov	x3, #0x0                   	// #0
  210aa4:	14000034 	b	210b74 <__subtf3+0x344>
  210aa8:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  210aac:	b24d0042 	orr	x2, x2, #0x8000000000000
  210ab0:	eb00007f 	cmp	x3, x0
  210ab4:	54000a40 	b.eq	210bfc <__subtf3+0x3cc>  // b.none
  210ab8:	7101d0bf 	cmp	w5, #0x74
  210abc:	5400162c 	b.gt	210d80 <__subtf3+0x550>
  210ac0:	7100fcbf 	cmp	w5, #0x3f
  210ac4:	54001e6c 	b.gt	210e90 <__subtf3+0x660>
  210ac8:	52800800 	mov	w0, #0x40                  	// #64
  210acc:	4b050000 	sub	w0, w0, w5
  210ad0:	9ac525c4 	lsr	x4, x14, x5
  210ad4:	9ac021ce 	lsl	x14, x14, x0
  210ad8:	f10001df 	cmp	x14, #0x0
  210adc:	9ac52445 	lsr	x5, x2, x5
  210ae0:	cb050021 	sub	x1, x1, x5
  210ae4:	9ac02042 	lsl	x2, x2, x0
  210ae8:	9a9f07e0 	cset	x0, ne  // ne = any
  210aec:	aa040042 	orr	x2, x2, x4
  210af0:	aa000042 	orr	x2, x2, x0
  210af4:	140000a6 	b	210d8c <__subtf3+0x55c>
  210af8:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  210afc:	b24d0042 	orr	x2, x2, #0x8000000000000
  210b00:	eb00007f 	cmp	x3, x0
  210b04:	54fff960 	b.eq	210a30 <__subtf3+0x200>  // b.none
  210b08:	7101d0bf 	cmp	w5, #0x74
  210b0c:	540019ac 	b.gt	210e40 <__subtf3+0x610>
  210b10:	7100fcbf 	cmp	w5, #0x3f
  210b14:	540027ac 	b.gt	211008 <__subtf3+0x7d8>
  210b18:	52800800 	mov	w0, #0x40                  	// #64
  210b1c:	4b050000 	sub	w0, w0, w5
  210b20:	9ac525c8 	lsr	x8, x14, x5
  210b24:	9ac021ce 	lsl	x14, x14, x0
  210b28:	f10001df 	cmp	x14, #0x0
  210b2c:	9ac52445 	lsr	x5, x2, x5
  210b30:	8b050021 	add	x1, x1, x5
  210b34:	9ac02040 	lsl	x0, x2, x0
  210b38:	9a9f07e2 	cset	x2, ne  // ne = any
  210b3c:	aa080000 	orr	x0, x0, x8
  210b40:	aa020000 	orr	x0, x0, x2
  210b44:	140000c2 	b	210e4c <__subtf3+0x61c>
  210b48:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  210b4c:	eb00007f 	cmp	x3, x0
  210b50:	54001440 	b.eq	210dd8 <__subtf3+0x5a8>  // b.none
  210b54:	aa010148 	orr	x8, x10, x1
  210b58:	92400940 	and	x0, x10, #0x7
  210b5c:	52800005 	mov	w5, #0x0                   	// #0
  210b60:	b5fff0c3 	cbnz	x3, 210978 <__subtf3+0x148>
  210b64:	b5fff048 	cbnz	x8, 21096c <__subtf3+0x13c>
  210b68:	d280000a 	mov	x10, #0x0                   	// #0
  210b6c:	d2800003 	mov	x3, #0x0                   	// #0
  210b70:	52800000 	mov	w0, #0x0                   	// #0
  210b74:	9240bd01 	and	x1, x8, #0xffffffffffff
  210b78:	12003864 	and	w4, w3, #0x7fff
  210b7c:	17ffff93 	b	2109c8 <__subtf3+0x198>
  210b80:	2a0403e6 	mov	w6, w4
  210b84:	b40019e3 	cbz	x3, 210ec0 <__subtf3+0x690>
  210b88:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  210b8c:	4b0503e5 	neg	w5, w5
  210b90:	b24d0021 	orr	x1, x1, #0x8000000000000
  210b94:	eb00017f 	cmp	x11, x0
  210b98:	54002900 	b.eq	2110b8 <__subtf3+0x888>  // b.none
  210b9c:	7101d0bf 	cmp	w5, #0x74
  210ba0:	54002c0c 	b.gt	211120 <__subtf3+0x8f0>
  210ba4:	7100fcbf 	cmp	w5, #0x3f
  210ba8:	540031cc 	b.gt	2111e0 <__subtf3+0x9b0>
  210bac:	52800803 	mov	w3, #0x40                  	// #64
  210bb0:	4b050063 	sub	w3, w3, w5
  210bb4:	9ac52548 	lsr	x8, x10, x5
  210bb8:	9ac32140 	lsl	x0, x10, x3
  210bbc:	f100001f 	cmp	x0, #0x0
  210bc0:	9ac52425 	lsr	x5, x1, x5
  210bc4:	cb050042 	sub	x2, x2, x5
  210bc8:	9ac32020 	lsl	x0, x1, x3
  210bcc:	9a9f07e1 	cset	x1, ne  // ne = any
  210bd0:	aa080000 	orr	x0, x0, x8
  210bd4:	aa010000 	orr	x0, x0, x1
  210bd8:	cb0001ca 	sub	x10, x14, x0
  210bdc:	aa0b03e3 	mov	x3, x11
  210be0:	eb0a01df 	cmp	x14, x10
  210be4:	aa0403e9 	mov	x9, x4
  210be8:	da1f0041 	sbc	x1, x2, xzr
  210bec:	17ffff3d 	b	2108e0 <__subtf3+0xb0>
  210bf0:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  210bf4:	eb00007f 	cmp	x3, x0
  210bf8:	54fff601 	b.ne	210ab8 <__subtf3+0x288>  // b.any
  210bfc:	aa0a0020 	orr	x0, x1, x10
  210c00:	b5fff1c0 	cbnz	x0, 210a38 <__subtf3+0x208>
  210c04:	d2800003 	mov	x3, #0x0                   	// #0
  210c08:	92503c60 	and	x0, x3, #0xffff000000000000
  210c0c:	d2800002 	mov	x2, #0x0                   	// #0
  210c10:	b2503803 	orr	x3, x0, #0x7fff000000000000
  210c14:	9e670041 	fmov	d1, x2
  210c18:	b34100c3 	bfi	x3, x6, #63, #1
  210c1c:	9eaf0061 	fmov	v1.d[1], x3
  210c20:	17ffff71 	b	2109e4 <__subtf3+0x1b4>
  210c24:	d503201f 	nop
  210c28:	f26a04e7 	ands	x7, x7, #0xc00000
  210c2c:	54000a60 	b.eq	210d78 <__subtf3+0x548>  // b.none
  210c30:	f15000ff 	cmp	x7, #0x400, lsl #12
  210c34:	54001a60 	b.eq	210f80 <__subtf3+0x750>  // b.none
  210c38:	f16000ff 	cmp	x7, #0x800, lsl #12
  210c3c:	52800281 	mov	w1, #0x14                  	// #20
  210c40:	fa400924 	ccmp	x9, #0x0, #0x4, eq  // eq = none
  210c44:	54001a20 	b.eq	210f88 <__subtf3+0x758>  // b.none
  210c48:	2a010000 	orr	w0, w0, w1
  210c4c:	d2800003 	mov	x3, #0x0                   	// #0
  210c50:	92503c61 	and	x1, x3, #0xffff000000000000
  210c54:	d2800002 	mov	x2, #0x0                   	// #0
  210c58:	b2503823 	orr	x3, x1, #0x7fff000000000000
  210c5c:	9e670041 	fmov	d1, x2
  210c60:	b34100c3 	bfi	x3, x6, #63, #1
  210c64:	9eaf0061 	fmov	v1.d[1], x3
  210c68:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  210c6c:	910003fd 	mov	x29, sp
  210c70:	3d8007a1 	str	q1, [x29, #16]
  210c74:	940002f1 	bl	211838 <__sfp_handle_exceptions>
  210c78:	3dc007a1 	ldr	q1, [x29, #16]
  210c7c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  210c80:	4ea11c20 	mov	v0.16b, v1.16b
  210c84:	d65f03c0 	ret
  210c88:	92400d42 	and	x2, x10, #0xf
  210c8c:	52800200 	mov	w0, #0x10                  	// #16
  210c90:	f100105f 	cmp	x2, #0x4
  210c94:	54ffe820 	b.eq	210998 <__subtf3+0x168>  // b.none
  210c98:	91001142 	add	x2, x10, #0x4
  210c9c:	eb0a005f 	cmp	x2, x10
  210ca0:	aa0203ea 	mov	x10, x2
  210ca4:	9a812421 	cinc	x1, x1, cc  // cc = lo, ul, last
  210ca8:	17ffff3c 	b	210998 <__subtf3+0x168>
  210cac:	d503201f 	nop
  210cb0:	54001781 	b.ne	210fa0 <__subtf3+0x770>  // b.any
  210cb4:	91000468 	add	x8, x3, #0x1
  210cb8:	92403900 	and	x0, x8, #0x7fff
  210cbc:	f100041f 	cmp	x0, #0x1
  210cc0:	5400184d 	b.le	210fc8 <__subtf3+0x798>
  210cc4:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  210cc8:	eb00011f 	cmp	x8, x0
  210ccc:	540014e0 	b.eq	210f68 <__subtf3+0x738>  // b.none
  210cd0:	8b0e014e 	add	x14, x10, x14
  210cd4:	8b020020 	add	x0, x1, x2
  210cd8:	eb0e015f 	cmp	x10, x14
  210cdc:	aa0803e3 	mov	x3, x8
  210ce0:	9a809400 	cinc	x0, x0, hi  // hi = pmore
  210ce4:	d341fc01 	lsr	x1, x0, #1
  210ce8:	93ce040a 	extr	x10, x0, x14, #1
  210cec:	92400940 	and	x0, x10, #0x7
  210cf0:	17ffff22 	b	210978 <__subtf3+0x148>
  210cf4:	d503201f 	nop
  210cf8:	52800200 	mov	w0, #0x10                  	// #16
  210cfc:	b4ffe4e9 	cbz	x9, 210998 <__subtf3+0x168>
  210d00:	91002142 	add	x2, x10, #0x8
  210d04:	eb0a005f 	cmp	x2, x10
  210d08:	aa0203ea 	mov	x10, x2
  210d0c:	9a812421 	cinc	x1, x1, cc  // cc = lo, ul, last
  210d10:	17ffff22 	b	210998 <__subtf3+0x168>
  210d14:	d503201f 	nop
  210d18:	52800200 	mov	w0, #0x10                  	// #16
  210d1c:	b4ffff29 	cbz	x9, 210d00 <__subtf3+0x4d0>
  210d20:	17ffff1e 	b	210998 <__subtf3+0x168>
  210d24:	d503201f 	nop
  210d28:	cb020063 	sub	x3, x3, x2
  210d2c:	924cf801 	and	x1, x0, #0xfff7ffffffffffff
  210d30:	17ffff89 	b	210b54 <__subtf3+0x324>
  210d34:	d503201f 	nop
  210d38:	51013000 	sub	w0, w0, #0x4c
  210d3c:	9ac02140 	lsl	x0, x10, x0
  210d40:	d280000a 	mov	x10, #0x0                   	// #0
  210d44:	17fffef7 	b	210920 <__subtf3+0xf0>
  210d48:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  210d4c:	93ca0c2a 	extr	x10, x1, x10, #3
  210d50:	d343fc28 	lsr	x8, x1, #3
  210d54:	eb02007f 	cmp	x3, x2
  210d58:	54fff0e1 	b.ne	210b74 <__subtf3+0x344>  // b.any
  210d5c:	aa080141 	orr	x1, x10, x8
  210d60:	b4003821 	cbz	x1, 211464 <__subtf3+0xc34>
  210d64:	b2510101 	orr	x1, x8, #0x800000000000
  210d68:	528fffe4 	mov	w4, #0x7fff                	// #32767
  210d6c:	9240bc21 	and	x1, x1, #0xffffffffffff
  210d70:	17ffff16 	b	2109c8 <__subtf3+0x198>
  210d74:	d503201f 	nop
  210d78:	52800281 	mov	w1, #0x14                  	// #20
  210d7c:	17ffffb3 	b	210c48 <__subtf3+0x418>
  210d80:	aa0e0042 	orr	x2, x2, x14
  210d84:	f100005f 	cmp	x2, #0x0
  210d88:	9a9f07e2 	cset	x2, ne  // ne = any
  210d8c:	cb020142 	sub	x2, x10, x2
  210d90:	eb02015f 	cmp	x10, x2
  210d94:	aa0203ea 	mov	x10, x2
  210d98:	da1f0021 	sbc	x1, x1, xzr
  210d9c:	17fffed1 	b	2108e0 <__subtf3+0xb0>
  210da0:	aa0a002f 	orr	x15, x1, x10
  210da4:	aa0e0048 	orr	x8, x2, x14
  210da8:	b5000a03 	cbnz	x3, 210ee8 <__subtf3+0x6b8>
  210dac:	b5001daf 	cbnz	x15, 211160 <__subtf3+0x930>
  210db0:	b4002648 	cbz	x8, 211278 <__subtf3+0xa48>
  210db4:	2a0403e6 	mov	w6, w4
  210db8:	aa0203e1 	mov	x1, x2
  210dbc:	aa0e03ea 	mov	x10, x14
  210dc0:	aa0403e9 	mov	x9, x4
  210dc4:	d2800003 	mov	x3, #0x0                   	// #0
  210dc8:	52800000 	mov	w0, #0x0                   	// #0
  210dcc:	52800025 	mov	w5, #0x1                   	// #1
  210dd0:	17ffff1e 	b	210a48 <__subtf3+0x218>
  210dd4:	d503201f 	nop
  210dd8:	aa0a0020 	orr	x0, x1, x10
  210ddc:	b5ffe2e0 	cbnz	x0, 210a38 <__subtf3+0x208>
  210de0:	d280000a 	mov	x10, #0x0                   	// #0
  210de4:	d2800008 	mov	x8, #0x0                   	// #0
  210de8:	52800000 	mov	w0, #0x0                   	// #0
  210dec:	17ffffdc 	b	210d5c <__subtf3+0x52c>
  210df0:	52801002 	mov	w2, #0x80                  	// #128
  210df4:	4b010042 	sub	w2, w2, w1
  210df8:	7101003f 	cmp	w1, #0x40
  210dfc:	51010021 	sub	w1, w1, #0x40
  210e00:	9ac22002 	lsl	x2, x0, x2
  210e04:	aa020142 	orr	x2, x10, x2
  210e08:	9a8a104a 	csel	x10, x2, x10, ne  // ne = any
  210e0c:	9ac12400 	lsr	x0, x0, x1
  210e10:	f100015f 	cmp	x10, #0x0
  210e14:	d2800001 	mov	x1, #0x0                   	// #0
  210e18:	9a9f07ea 	cset	x10, ne  // ne = any
  210e1c:	aa00014a 	orr	x10, x10, x0
  210e20:	aa0a03e8 	mov	x8, x10
  210e24:	17fffed1 	b	210968 <__subtf3+0x138>
  210e28:	cb0a01ca 	sub	x10, x14, x10
  210e2c:	2a0403e6 	mov	w6, w4
  210e30:	eb0a01df 	cmp	x14, x10
  210e34:	aa0403e9 	mov	x9, x4
  210e38:	da010045 	sbc	x5, x2, x1
  210e3c:	17fffeab 	b	2108e8 <__subtf3+0xb8>
  210e40:	aa0e0042 	orr	x2, x2, x14
  210e44:	f100005f 	cmp	x2, #0x0
  210e48:	9a9f07e0 	cset	x0, ne  // ne = any
  210e4c:	8b0a0000 	add	x0, x0, x10
  210e50:	eb00015f 	cmp	x10, x0
  210e54:	aa0003ea 	mov	x10, x0
  210e58:	9a819421 	cinc	x1, x1, hi  // hi = pmore
  210e5c:	b69fe7c1 	tbz	x1, #51, 210b54 <__subtf3+0x324>
  210e60:	91000463 	add	x3, x3, #0x1
  210e64:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  210e68:	eb00007f 	cmp	x3, x0
  210e6c:	540007e0 	b.eq	210f68 <__subtf3+0x738>  // b.none
  210e70:	92400140 	and	x0, x10, #0x1
  210e74:	924cf822 	and	x2, x1, #0xfff7ffffffffffff
  210e78:	aa4a0400 	orr	x0, x0, x10, lsr #1
  210e7c:	d341fc41 	lsr	x1, x2, #1
  210e80:	aa02fc0a 	orr	x10, x0, x2, lsl #63
  210e84:	52800005 	mov	w5, #0x0                   	// #0
  210e88:	92400940 	and	x0, x10, #0x7
  210e8c:	17fffebb 	b	210978 <__subtf3+0x148>
  210e90:	52801000 	mov	w0, #0x80                  	// #128
  210e94:	4b050000 	sub	w0, w0, w5
  210e98:	710100bf 	cmp	w5, #0x40
  210e9c:	510100a5 	sub	w5, w5, #0x40
  210ea0:	9ac02040 	lsl	x0, x2, x0
  210ea4:	aa0001c0 	orr	x0, x14, x0
  210ea8:	9a8e100e 	csel	x14, x0, x14, ne  // ne = any
  210eac:	9ac52440 	lsr	x0, x2, x5
  210eb0:	f10001df 	cmp	x14, #0x0
  210eb4:	9a9f07e2 	cset	x2, ne  // ne = any
  210eb8:	aa000042 	orr	x2, x2, x0
  210ebc:	17ffffb4 	b	210d8c <__subtf3+0x55c>
  210ec0:	aa0a0020 	orr	x0, x1, x10
  210ec4:	b5000ee0 	cbnz	x0, 2110a0 <__subtf3+0x870>
  210ec8:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  210ecc:	eb00017f 	cmp	x11, x0
  210ed0:	54001f00 	b.eq	2112b0 <__subtf3+0xa80>  // b.none
  210ed4:	aa0203e1 	mov	x1, x2
  210ed8:	aa0e03ea 	mov	x10, x14
  210edc:	aa0b03e3 	mov	x3, x11
  210ee0:	aa0403e9 	mov	x9, x4
  210ee4:	17ffff1c 	b	210b54 <__subtf3+0x324>
  210ee8:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  210eec:	eb00007f 	cmp	x3, x0
  210ef0:	54001900 	b.eq	211210 <__subtf3+0x9e0>  // b.none
  210ef4:	eb00017f 	cmp	x11, x0
  210ef8:	54001cc0 	b.eq	211290 <__subtf3+0xa60>  // b.none
  210efc:	b4001aef 	cbz	x15, 211258 <__subtf3+0xa28>
  210f00:	52800000 	mov	w0, #0x0                   	// #0
  210f04:	b40012a8 	cbz	x8, 211158 <__subtf3+0x928>
  210f08:	9240f18a 	and	x10, x12, #0x1fffffffffffffff
  210f0c:	d343fc23 	lsr	x3, x1, #3
  210f10:	aa01f54a 	orr	x10, x10, x1, lsl #61
  210f14:	b67800e3 	tbz	x3, #47, 210f30 <__subtf3+0x700>
  210f18:	d343fc41 	lsr	x1, x2, #3
  210f1c:	b77800a1 	tbnz	x1, #47, 210f30 <__subtf3+0x700>
  210f20:	9240f1aa 	and	x10, x13, #0x1fffffffffffffff
  210f24:	aa0103e3 	mov	x3, x1
  210f28:	aa02f54a 	orr	x10, x10, x2, lsl #61
  210f2c:	aa0403e9 	mov	x9, x4
  210f30:	12000126 	and	w6, w9, #0x1
  210f34:	93caf461 	extr	x1, x3, x10, #61
  210f38:	d37df14a 	lsl	x10, x10, #3
  210f3c:	d28fffe3 	mov	x3, #0x7fff                	// #32767
  210f40:	17fffec2 	b	210a48 <__subtf3+0x218>
  210f44:	d503201f 	nop
  210f48:	8b0e014e 	add	x14, x10, x14
  210f4c:	8b020021 	add	x1, x1, x2
  210f50:	eb0e015f 	cmp	x10, x14
  210f54:	aa0e03ea 	mov	x10, x14
  210f58:	9a819421 	cinc	x1, x1, hi  // hi = pmore
  210f5c:	17ffffc0 	b	210e5c <__subtf3+0x62c>
  210f60:	2a0403e6 	mov	w6, w4
  210f64:	17ffff28 	b	210c04 <__subtf3+0x3d4>
  210f68:	f26a04e0 	ands	x0, x7, #0xc00000
  210f6c:	54000be1 	b.ne	2110e8 <__subtf3+0x8b8>  // b.any
  210f70:	2a0403e6 	mov	w6, w4
  210f74:	52800280 	mov	w0, #0x14                  	// #20
  210f78:	17ffff35 	b	210c4c <__subtf3+0x41c>
  210f7c:	d503201f 	nop
  210f80:	b4ffefc9 	cbz	x9, 210d78 <__subtf3+0x548>
  210f84:	52800281 	mov	w1, #0x14                  	// #20
  210f88:	9280000a 	mov	x10, #0xffffffffffffffff    	// #-1
  210f8c:	2a010000 	orr	w0, w0, w1
  210f90:	92fc0008 	mov	x8, #0x1fffffffffffffff    	// #2305843009213693951
  210f94:	d28fffc3 	mov	x3, #0x7ffe                	// #32766
  210f98:	17fffef7 	b	210b74 <__subtf3+0x344>
  210f9c:	d503201f 	nop
  210fa0:	b50004c3 	cbnz	x3, 211038 <__subtf3+0x808>
  210fa4:	aa0a0020 	orr	x0, x1, x10
  210fa8:	b5000f40 	cbnz	x0, 211190 <__subtf3+0x960>
  210fac:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  210fb0:	eb00017f 	cmp	x11, x0
  210fb4:	54001ea0 	b.eq	211388 <__subtf3+0xb58>  // b.none
  210fb8:	aa0203e1 	mov	x1, x2
  210fbc:	aa0e03ea 	mov	x10, x14
  210fc0:	aa0b03e3 	mov	x3, x11
  210fc4:	17fffee4 	b	210b54 <__subtf3+0x324>
  210fc8:	aa0a002f 	orr	x15, x1, x10
  210fcc:	b5000b23 	cbnz	x3, 211130 <__subtf3+0x900>
  210fd0:	aa0e0048 	orr	x8, x2, x14
  210fd4:	b400174f 	cbz	x15, 2112bc <__subtf3+0xa8c>
  210fd8:	b4ffef68 	cbz	x8, 210dc4 <__subtf3+0x594>
  210fdc:	8b0e014e 	add	x14, x10, x14
  210fe0:	8b020021 	add	x1, x1, x2
  210fe4:	eb0e015f 	cmp	x10, x14
  210fe8:	9a819421 	cinc	x1, x1, hi  // hi = pmore
  210fec:	b7982321 	tbnz	x1, #51, 211450 <__subtf3+0xc20>
  210ff0:	aa0101c8 	orr	x8, x14, x1
  210ff4:	aa0e03ea 	mov	x10, x14
  210ff8:	17fffe5c 	b	210968 <__subtf3+0x138>
  210ffc:	d503201f 	nop
  211000:	aa0003ea 	mov	x10, x0
  211004:	17fffe39 	b	2108e8 <__subtf3+0xb8>
  211008:	52801000 	mov	w0, #0x80                  	// #128
  21100c:	4b050000 	sub	w0, w0, w5
  211010:	710100bf 	cmp	w5, #0x40
  211014:	510100a5 	sub	w5, w5, #0x40
  211018:	9ac02040 	lsl	x0, x2, x0
  21101c:	aa0001c0 	orr	x0, x14, x0
  211020:	9a8e100e 	csel	x14, x0, x14, ne  // ne = any
  211024:	9ac52442 	lsr	x2, x2, x5
  211028:	f10001df 	cmp	x14, #0x0
  21102c:	9a9f07e0 	cset	x0, ne  // ne = any
  211030:	aa020000 	orr	x0, x0, x2
  211034:	17ffff86 	b	210e4c <__subtf3+0x61c>
  211038:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  21103c:	4b0503e5 	neg	w5, w5
  211040:	b24d0021 	orr	x1, x1, #0x8000000000000
  211044:	eb00017f 	cmp	x11, x0
  211048:	54000b00 	b.eq	2111a8 <__subtf3+0x978>  // b.none
  21104c:	7101d0bf 	cmp	w5, #0x74
  211050:	54000c0c 	b.gt	2111d0 <__subtf3+0x9a0>
  211054:	7100fcbf 	cmp	w5, #0x3f
  211058:	5400180c 	b.gt	211358 <__subtf3+0xb28>
  21105c:	52800803 	mov	w3, #0x40                  	// #64
  211060:	4b050063 	sub	w3, w3, w5
  211064:	9ac52548 	lsr	x8, x10, x5
  211068:	9ac32140 	lsl	x0, x10, x3
  21106c:	f100001f 	cmp	x0, #0x0
  211070:	9ac52425 	lsr	x5, x1, x5
  211074:	8b050042 	add	x2, x2, x5
  211078:	9ac32020 	lsl	x0, x1, x3
  21107c:	9a9f07e1 	cset	x1, ne  // ne = any
  211080:	aa080000 	orr	x0, x0, x8
  211084:	aa010000 	orr	x0, x0, x1
  211088:	8b0e000a 	add	x10, x0, x14
  21108c:	aa0b03e3 	mov	x3, x11
  211090:	eb0a01df 	cmp	x14, x10
  211094:	9a829441 	cinc	x1, x2, hi  // hi = pmore
  211098:	17ffff71 	b	210e5c <__subtf3+0x62c>
  21109c:	d503201f 	nop
  2110a0:	310004bf 	cmn	w5, #0x1
  2110a4:	54000fa0 	b.eq	211298 <__subtf3+0xa68>  // b.none
  2110a8:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  2110ac:	2a2503e5 	mvn	w5, w5
  2110b0:	eb00017f 	cmp	x11, x0
  2110b4:	54ffd741 	b.ne	210b9c <__subtf3+0x36c>  // b.any
  2110b8:	aa0e0040 	orr	x0, x2, x14
  2110bc:	b4ffda40 	cbz	x0, 210c04 <__subtf3+0x3d4>
  2110c0:	d372fc40 	lsr	x0, x2, #50
  2110c4:	aa0203e1 	mov	x1, x2
  2110c8:	d2400000 	eor	x0, x0, #0x1
  2110cc:	aa0e03ea 	mov	x10, x14
  2110d0:	12000000 	and	w0, w0, #0x1
  2110d4:	aa0b03e3 	mov	x3, x11
  2110d8:	aa0403e9 	mov	x9, x4
  2110dc:	52800005 	mov	w5, #0x0                   	// #0
  2110e0:	17fffe5a 	b	210a48 <__subtf3+0x218>
  2110e4:	d503201f 	nop
  2110e8:	f150001f 	cmp	x0, #0x400, lsl #12
  2110ec:	54000ee0 	b.eq	2112c8 <__subtf3+0xa98>  // b.none
  2110f0:	f160001f 	cmp	x0, #0x800, lsl #12
  2110f4:	540010a0 	b.eq	211308 <__subtf3+0xad8>  // b.none
  2110f8:	f150001f 	cmp	x0, #0x400, lsl #12
  2110fc:	540019c0 	b.eq	211434 <__subtf3+0xc04>  // b.none
  211100:	f160001f 	cmp	x0, #0x800, lsl #12
  211104:	540018c1 	b.ne	21141c <__subtf3+0xbec>  // b.any
  211108:	92800001 	mov	x1, #0xffffffffffffffff    	// #-1
  21110c:	d28fffc3 	mov	x3, #0x7ffe                	// #32766
  211110:	aa0103ea 	mov	x10, x1
  211114:	52800005 	mov	w5, #0x0                   	// #0
  211118:	52800280 	mov	w0, #0x14                  	// #20
  21111c:	17fffef8 	b	210cfc <__subtf3+0x4cc>
  211120:	aa0a0020 	orr	x0, x1, x10
  211124:	f100001f 	cmp	x0, #0x0
  211128:	9a9f07e0 	cset	x0, ne  // ne = any
  21112c:	17fffeab 	b	210bd8 <__subtf3+0x3a8>
  211130:	d28fffe8 	mov	x8, #0x7fff                	// #32767
  211134:	eb08007f 	cmp	x3, x8
  211138:	54000f20 	b.eq	21131c <__subtf3+0xaec>  // b.none
  21113c:	eb08017f 	cmp	x11, x8
  211140:	54001440 	b.eq	2113c8 <__subtf3+0xb98>  // b.none
  211144:	b40014ef 	cbz	x15, 2113e0 <__subtf3+0xbb0>
  211148:	52800000 	mov	w0, #0x0                   	// #0
  21114c:	aa0e004e 	orr	x14, x2, x14
  211150:	b5ffedce 	cbnz	x14, 210f08 <__subtf3+0x6d8>
  211154:	aa0403e9 	mov	x9, x4
  211158:	d28fffe3 	mov	x3, #0x7fff                	// #32767
  21115c:	17fffe3b 	b	210a48 <__subtf3+0x218>
  211160:	b4ffe328 	cbz	x8, 210dc4 <__subtf3+0x594>
  211164:	cb0e0145 	sub	x5, x10, x14
  211168:	eb05015f 	cmp	x10, x5
  21116c:	da02002b 	sbc	x11, x1, x2
  211170:	b69811eb 	tbz	x11, #51, 2113ac <__subtf3+0xb7c>
  211174:	cb0a01ca 	sub	x10, x14, x10
  211178:	2a0403e6 	mov	w6, w4
  21117c:	eb0a01df 	cmp	x14, x10
  211180:	aa0403e9 	mov	x9, x4
  211184:	da010041 	sbc	x1, x2, x1
  211188:	aa010148 	orr	x8, x10, x1
  21118c:	17fffdf7 	b	210968 <__subtf3+0x138>
  211190:	310004bf 	cmn	w5, #0x1
  211194:	54001000 	b.eq	211394 <__subtf3+0xb64>  // b.none
  211198:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  21119c:	2a2503e5 	mvn	w5, w5
  2111a0:	eb00017f 	cmp	x11, x0
  2111a4:	54fff541 	b.ne	21104c <__subtf3+0x81c>  // b.any
  2111a8:	aa0e0040 	orr	x0, x2, x14
  2111ac:	b4ffeda0 	cbz	x0, 210f60 <__subtf3+0x730>
  2111b0:	d372fc40 	lsr	x0, x2, #50
  2111b4:	aa0203e1 	mov	x1, x2
  2111b8:	d2400000 	eor	x0, x0, #0x1
  2111bc:	aa0e03ea 	mov	x10, x14
  2111c0:	12000000 	and	w0, w0, #0x1
  2111c4:	aa0b03e3 	mov	x3, x11
  2111c8:	52800005 	mov	w5, #0x0                   	// #0
  2111cc:	17fffe1f 	b	210a48 <__subtf3+0x218>
  2111d0:	aa0a0020 	orr	x0, x1, x10
  2111d4:	f100001f 	cmp	x0, #0x0
  2111d8:	9a9f07e0 	cset	x0, ne  // ne = any
  2111dc:	17ffffab 	b	211088 <__subtf3+0x858>
  2111e0:	52801000 	mov	w0, #0x80                  	// #128
  2111e4:	4b050000 	sub	w0, w0, w5
  2111e8:	710100bf 	cmp	w5, #0x40
  2111ec:	510100a5 	sub	w5, w5, #0x40
  2111f0:	9ac02020 	lsl	x0, x1, x0
  2111f4:	aa000140 	orr	x0, x10, x0
  2111f8:	9a8a100a 	csel	x10, x0, x10, ne  // ne = any
  2111fc:	9ac52421 	lsr	x1, x1, x5
  211200:	f100015f 	cmp	x10, #0x0
  211204:	9a9f07e0 	cset	x0, ne  // ne = any
  211208:	aa010000 	orr	x0, x0, x1
  21120c:	17fffe73 	b	210bd8 <__subtf3+0x3a8>
  211210:	b400020f 	cbz	x15, 211250 <__subtf3+0xa20>
  211214:	d372fc20 	lsr	x0, x1, #50
  211218:	eb03017f 	cmp	x11, x3
  21121c:	d2400000 	eor	x0, x0, #0x1
  211220:	12000000 	and	w0, w0, #0x1
  211224:	54ffe701 	b.ne	210f04 <__subtf3+0x6d4>  // b.any
  211228:	b40005a8 	cbz	x8, 2112dc <__subtf3+0xaac>
  21122c:	f24e005f 	tst	x2, #0x4000000000000
  211230:	1a9f1400 	csinc	w0, w0, wzr, ne  // ne = any
  211234:	b5ffe6af 	cbnz	x15, 210f08 <__subtf3+0x6d8>
  211238:	2a0403e6 	mov	w6, w4
  21123c:	aa0203e1 	mov	x1, x2
  211240:	aa0e03ea 	mov	x10, x14
  211244:	aa0403e9 	mov	x9, x4
  211248:	d28fffe3 	mov	x3, #0x7fff                	// #32767
  21124c:	17fffdff 	b	210a48 <__subtf3+0x218>
  211250:	eb03017f 	cmp	x11, x3
  211254:	540001e0 	b.eq	211290 <__subtf3+0xa60>  // b.none
  211258:	b4000448 	cbz	x8, 2112e0 <__subtf3+0xab0>
  21125c:	2a0403e6 	mov	w6, w4
  211260:	aa0203e1 	mov	x1, x2
  211264:	aa0e03ea 	mov	x10, x14
  211268:	aa0403e9 	mov	x9, x4
  21126c:	52800000 	mov	w0, #0x0                   	// #0
  211270:	d28fffe3 	mov	x3, #0x7fff                	// #32767
  211274:	17fffdf5 	b	210a48 <__subtf3+0x218>
  211278:	926a04e7 	and	x7, x7, #0xc00000
  21127c:	d280000a 	mov	x10, #0x0                   	// #0
  211280:	f16000ff 	cmp	x7, #0x800, lsl #12
  211284:	52800000 	mov	w0, #0x0                   	// #0
  211288:	1a9f17e6 	cset	w6, eq  // eq = none
  21128c:	17fffe3a 	b	210b74 <__subtf3+0x344>
  211290:	52800000 	mov	w0, #0x0                   	// #0
  211294:	17ffffe5 	b	211228 <__subtf3+0x9f8>
  211298:	cb0a01ca 	sub	x10, x14, x10
  21129c:	aa0b03e3 	mov	x3, x11
  2112a0:	eb0a01df 	cmp	x14, x10
  2112a4:	aa0403e9 	mov	x9, x4
  2112a8:	da010041 	sbc	x1, x2, x1
  2112ac:	17fffd8d 	b	2108e0 <__subtf3+0xb0>
  2112b0:	aa0e0040 	orr	x0, x2, x14
  2112b4:	b4ffd960 	cbz	x0, 210de0 <__subtf3+0x5b0>
  2112b8:	17ffff82 	b	2110c0 <__subtf3+0x890>
  2112bc:	aa0203e1 	mov	x1, x2
  2112c0:	aa0e03ea 	mov	x10, x14
  2112c4:	17fffda9 	b	210968 <__subtf3+0x138>
  2112c8:	52800026 	mov	w6, #0x1                   	// #1
  2112cc:	b5000149 	cbnz	x9, 2112f4 <__subtf3+0xac4>
  2112d0:	52800006 	mov	w6, #0x0                   	// #0
  2112d4:	52800280 	mov	w0, #0x14                  	// #20
  2112d8:	17fffe5d 	b	210c4c <__subtf3+0x41c>
  2112dc:	b5fff3ef 	cbnz	x15, 211158 <__subtf3+0x928>
  2112e0:	52800020 	mov	w0, #0x1                   	// #1
  2112e4:	92ffffe8 	mov	x8, #0xffffffffffff        	// #281474976710655
  2112e8:	52800006 	mov	w6, #0x0                   	// #0
  2112ec:	9280000a 	mov	x10, #0xffffffffffffffff    	// #-1
  2112f0:	17fffe9d 	b	210d64 <__subtf3+0x534>
  2112f4:	92800001 	mov	x1, #0xffffffffffffffff    	// #-1
  2112f8:	d28fffc3 	mov	x3, #0x7ffe                	// #32766
  2112fc:	aa0103ea 	mov	x10, x1
  211300:	52800280 	mov	w0, #0x14                  	// #20
  211304:	17fffda9 	b	2109a8 <__subtf3+0x178>
  211308:	52800006 	mov	w6, #0x0                   	// #0
  21130c:	b4ffff49 	cbz	x9, 2112f4 <__subtf3+0xac4>
  211310:	52800026 	mov	w6, #0x1                   	// #1
  211314:	52800280 	mov	w0, #0x14                  	// #20
  211318:	17fffe4d 	b	210c4c <__subtf3+0x41c>
  21131c:	b40006cf 	cbz	x15, 2113f4 <__subtf3+0xbc4>
  211320:	d372fc20 	lsr	x0, x1, #50
  211324:	eb03017f 	cmp	x11, x3
  211328:	d2400000 	eor	x0, x0, #0x1
  21132c:	12000000 	and	w0, w0, #0x1
  211330:	54fff0e1 	b.ne	21114c <__subtf3+0x91c>  // b.any
  211334:	aa0e0043 	orr	x3, x2, x14
  211338:	b4fff0e3 	cbz	x3, 211154 <__subtf3+0x924>
  21133c:	f24e005f 	tst	x2, #0x4000000000000
  211340:	1a9f1400 	csinc	w0, w0, wzr, ne  // ne = any
  211344:	b5ffde2f 	cbnz	x15, 210f08 <__subtf3+0x6d8>
  211348:	aa0203e1 	mov	x1, x2
  21134c:	aa0e03ea 	mov	x10, x14
  211350:	aa0403e9 	mov	x9, x4
  211354:	17ffff81 	b	211158 <__subtf3+0x928>
  211358:	52801000 	mov	w0, #0x80                  	// #128
  21135c:	4b050000 	sub	w0, w0, w5
  211360:	710100bf 	cmp	w5, #0x40
  211364:	510100a5 	sub	w5, w5, #0x40
  211368:	9ac02020 	lsl	x0, x1, x0
  21136c:	aa000140 	orr	x0, x10, x0
  211370:	9a8a100a 	csel	x10, x0, x10, ne  // ne = any
  211374:	9ac52421 	lsr	x1, x1, x5
  211378:	f100015f 	cmp	x10, #0x0
  21137c:	9a9f07e0 	cset	x0, ne  // ne = any
  211380:	aa010000 	orr	x0, x0, x1
  211384:	17ffff41 	b	211088 <__subtf3+0x858>
  211388:	aa0e0040 	orr	x0, x2, x14
  21138c:	b4ffd2a0 	cbz	x0, 210de0 <__subtf3+0x5b0>
  211390:	17ffff88 	b	2111b0 <__subtf3+0x980>
  211394:	8b0e014a 	add	x10, x10, x14
  211398:	8b020021 	add	x1, x1, x2
  21139c:	eb0a01df 	cmp	x14, x10
  2113a0:	aa0b03e3 	mov	x3, x11
  2113a4:	9a819421 	cinc	x1, x1, hi  // hi = pmore
  2113a8:	17fffead 	b	210e5c <__subtf3+0x62c>
  2113ac:	aa0b00a8 	orr	x8, x5, x11
  2113b0:	b4fff648 	cbz	x8, 211278 <__subtf3+0xa48>
  2113b4:	924008a0 	and	x0, x5, #0x7
  2113b8:	aa0503ea 	mov	x10, x5
  2113bc:	aa0b03e1 	mov	x1, x11
  2113c0:	52800025 	mov	w5, #0x1                   	// #1
  2113c4:	17fffd6d 	b	210978 <__subtf3+0x148>
  2113c8:	aa0e0040 	orr	x0, x2, x14
  2113cc:	b5000240 	cbnz	x0, 211414 <__subtf3+0xbe4>
  2113d0:	52800000 	mov	w0, #0x0                   	// #0
  2113d4:	b4ffd06f 	cbz	x15, 210de0 <__subtf3+0x5b0>
  2113d8:	aa0403e9 	mov	x9, x4
  2113dc:	17ffff5f 	b	211158 <__subtf3+0x928>
  2113e0:	aa0203e1 	mov	x1, x2
  2113e4:	aa0e03ea 	mov	x10, x14
  2113e8:	52800000 	mov	w0, #0x0                   	// #0
  2113ec:	aa0803e3 	mov	x3, x8
  2113f0:	17fffd96 	b	210a48 <__subtf3+0x218>
  2113f4:	eb03017f 	cmp	x11, x3
  2113f8:	540000a0 	b.eq	21140c <__subtf3+0xbdc>  // b.none
  2113fc:	aa0203e1 	mov	x1, x2
  211400:	aa0e03ea 	mov	x10, x14
  211404:	52800000 	mov	w0, #0x0                   	// #0
  211408:	17fffd90 	b	210a48 <__subtf3+0x218>
  21140c:	aa0e0040 	orr	x0, x2, x14
  211410:	b4ffce80 	cbz	x0, 210de0 <__subtf3+0x5b0>
  211414:	52800000 	mov	w0, #0x0                   	// #0
  211418:	17ffffc9 	b	21133c <__subtf3+0xb0c>
  21141c:	92800001 	mov	x1, #0xffffffffffffffff    	// #-1
  211420:	d28fffc3 	mov	x3, #0x7ffe                	// #32766
  211424:	aa0103ea 	mov	x10, x1
  211428:	52800005 	mov	w5, #0x0                   	// #0
  21142c:	52800280 	mov	w0, #0x14                  	// #20
  211430:	17fffd5a 	b	210998 <__subtf3+0x168>
  211434:	92800001 	mov	x1, #0xffffffffffffffff    	// #-1
  211438:	d28fffc3 	mov	x3, #0x7ffe                	// #32766
  21143c:	aa0103ea 	mov	x10, x1
  211440:	52800005 	mov	w5, #0x0                   	// #0
  211444:	52800280 	mov	w0, #0x14                  	// #20
  211448:	b4ffc5c9 	cbz	x9, 210d00 <__subtf3+0x4d0>
  21144c:	17fffd53 	b	210998 <__subtf3+0x168>
  211450:	924cf821 	and	x1, x1, #0xfff7ffffffffffff
  211454:	924009c0 	and	x0, x14, #0x7
  211458:	aa0e03ea 	mov	x10, x14
  21145c:	d2800023 	mov	x3, #0x1                   	// #1
  211460:	17fffd46 	b	210978 <__subtf3+0x148>
  211464:	d280000a 	mov	x10, #0x0                   	// #0
  211468:	528fffe4 	mov	w4, #0x7fff                	// #32767
  21146c:	d2800001 	mov	x1, #0x0                   	// #0
  211470:	17fffd56 	b	2109c8 <__subtf3+0x198>
  211474:	00000000 	.inst	0x00000000 ; undefined

0000000000211478 <__fixtfsi>:
  211478:	9e660001 	fmov	x1, d0
  21147c:	9eae0002 	fmov	x2, v0.d[1]
  211480:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  211484:	910003fd 	mov	x29, sp
  211488:	aa0103e0 	mov	x0, x1
  21148c:	f9000bf3 	str	x19, [sp, #16]
  211490:	aa0203e1 	mov	x1, x2
  211494:	d53b4402 	mrs	x2, fpcr
  211498:	d370f822 	ubfx	x2, x1, #48, #15
  21149c:	d287ffc5 	mov	x5, #0x3ffe                	// #16382
  2114a0:	92403c44 	and	x4, x2, #0xffff
  2114a4:	d37ffc33 	lsr	x19, x1, #63
  2114a8:	eb05009f 	cmp	x4, x5
  2114ac:	d340bc21 	ubfx	x1, x1, #0, #48
  2114b0:	5400018c 	b.gt	2114e0 <__fixtfsi+0x68>
  2114b4:	b5000524 	cbnz	x4, 211558 <__fixtfsi+0xe0>
  2114b8:	aa000021 	orr	x1, x1, x0
  2114bc:	52800013 	mov	w19, #0x0                   	// #0
  2114c0:	b4000061 	cbz	x1, 2114cc <__fixtfsi+0x54>
  2114c4:	52800200 	mov	w0, #0x10                  	// #16
  2114c8:	940000dc 	bl	211838 <__sfp_handle_exceptions>
  2114cc:	2a1303e0 	mov	w0, w19
  2114d0:	f9400bf3 	ldr	x19, [sp, #16]
  2114d4:	a8c27bfd 	ldp	x29, x30, [sp], #32
  2114d8:	d65f03c0 	ret
  2114dc:	d503201f 	nop
  2114e0:	d28803a5 	mov	x5, #0x401d                	// #16413
  2114e4:	12001e63 	and	w3, w19, #0xff
  2114e8:	eb05009f 	cmp	x4, x5
  2114ec:	540001ad 	b.le	211520 <__fixtfsi+0xa8>
  2114f0:	d28803c2 	mov	x2, #0x401e                	// #16414
  2114f4:	eb02009f 	cmp	x4, x2
  2114f8:	12b00013 	mov	w19, #0x7fffffff            	// #2147483647
  2114fc:	1a9f0062 	csel	w2, w3, wzr, eq  // eq = none
  211500:	0b130073 	add	w19, w3, w19
  211504:	34000322 	cbz	w2, 211568 <__fixtfsi+0xf0>
  211508:	d351fc22 	lsr	x2, x1, #17
  21150c:	b50002e2 	cbnz	x2, 211568 <__fixtfsi+0xf0>
  211510:	aa01bc00 	orr	x0, x0, x1, lsl #47
  211514:	b4fffdc0 	cbz	x0, 2114cc <__fixtfsi+0x54>
  211518:	52800200 	mov	w0, #0x10                  	// #16
  21151c:	17ffffeb 	b	2114c8 <__fixtfsi+0x50>
  211520:	12003c42 	and	w2, w2, #0xffff
  211524:	b2500021 	orr	x1, x1, #0x1000000000000
  211528:	528805f3 	mov	w19, #0x402f                	// #16431
  21152c:	1287fdc4 	mov	w4, #0xffffc011            	// #-16367
  211530:	0b040044 	add	w4, w2, w4
  211534:	4b020262 	sub	w2, w19, w2
  211538:	7100007f 	cmp	w3, #0x0
  21153c:	9ac22433 	lsr	x19, x1, x2
  211540:	5a930673 	cneg	w19, w19, ne  // ne = any
  211544:	9ac42023 	lsl	x3, x1, x4
  211548:	aa000060 	orr	x0, x3, x0
  21154c:	b4fffc00 	cbz	x0, 2114cc <__fixtfsi+0x54>
  211550:	52800200 	mov	w0, #0x10                  	// #16
  211554:	17ffffdd 	b	2114c8 <__fixtfsi+0x50>
  211558:	52800013 	mov	w19, #0x0                   	// #0
  21155c:	52800200 	mov	w0, #0x10                  	// #16
  211560:	940000b6 	bl	211838 <__sfp_handle_exceptions>
  211564:	17ffffda 	b	2114cc <__fixtfsi+0x54>
  211568:	52800020 	mov	w0, #0x1                   	// #1
  21156c:	17ffffd7 	b	2114c8 <__fixtfsi+0x50>

0000000000211570 <__fixunstfsi>:
  211570:	9e660000 	fmov	x0, d0
  211574:	9eae0001 	fmov	x1, v0.d[1]
  211578:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  21157c:	910003fd 	mov	x29, sp
  211580:	f9000bf3 	str	x19, [sp, #16]
  211584:	aa0003f3 	mov	x19, x0
  211588:	aa0103e0 	mov	x0, x1
  21158c:	d53b4401 	mrs	x1, fpcr
  211590:	aa1303e3 	mov	x3, x19
  211594:	d370f813 	ubfx	x19, x0, #48, #15
  211598:	92403e64 	and	x4, x19, #0xffff
  21159c:	d287ffc5 	mov	x5, #0x3ffe                	// #16382
  2115a0:	d37ffc02 	lsr	x2, x0, #63
  2115a4:	eb05009f 	cmp	x4, x5
  2115a8:	d340bc00 	ubfx	x0, x0, #0, #48
  2115ac:	5400012c 	b.gt	2115d0 <__fixunstfsi+0x60>
  2115b0:	b50003c4 	cbnz	x4, 211628 <__fixunstfsi+0xb8>
  2115b4:	aa030000 	orr	x0, x0, x3
  2115b8:	52800013 	mov	w19, #0x0                   	// #0
  2115bc:	b5000360 	cbnz	x0, 211628 <__fixunstfsi+0xb8>
  2115c0:	2a1303e0 	mov	w0, w19
  2115c4:	f9400bf3 	ldr	x19, [sp, #16]
  2115c8:	a8c27bfd 	ldp	x29, x30, [sp], #32
  2115cc:	d65f03c0 	ret
  2115d0:	12001c42 	and	w2, w2, #0xff
  2115d4:	35000322 	cbnz	w2, 211638 <__fixunstfsi+0xc8>
  2115d8:	d28803c2 	mov	x2, #0x401e                	// #16414
  2115dc:	eb02009f 	cmp	x4, x2
  2115e0:	5400032c 	b.gt	211644 <__fixunstfsi+0xd4>
  2115e4:	12003e61 	and	w1, w19, #0xffff
  2115e8:	528805e2 	mov	w2, #0x402f                	// #16431
  2115ec:	b2500013 	orr	x19, x0, #0x1000000000000
  2115f0:	1287fdc0 	mov	w0, #0xffffc011            	// #-16367
  2115f4:	0b000020 	add	w0, w1, w0
  2115f8:	4b010041 	sub	w1, w2, w1
  2115fc:	9ac02260 	lsl	x0, x19, x0
  211600:	aa030000 	orr	x0, x0, x3
  211604:	9ac12673 	lsr	x19, x19, x1
  211608:	b4fffdc0 	cbz	x0, 2115c0 <__fixunstfsi+0x50>
  21160c:	52800200 	mov	w0, #0x10                  	// #16
  211610:	9400008a 	bl	211838 <__sfp_handle_exceptions>
  211614:	2a1303e0 	mov	w0, w19
  211618:	f9400bf3 	ldr	x19, [sp, #16]
  21161c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  211620:	d65f03c0 	ret
  211624:	d503201f 	nop
  211628:	52800200 	mov	w0, #0x10                  	// #16
  21162c:	52800013 	mov	w19, #0x0                   	// #0
  211630:	94000082 	bl	211838 <__sfp_handle_exceptions>
  211634:	17fffff8 	b	211614 <__fixunstfsi+0xa4>
  211638:	52800020 	mov	w0, #0x1                   	// #1
  21163c:	52800013 	mov	w19, #0x0                   	// #0
  211640:	17fffff4 	b	211610 <__fixunstfsi+0xa0>
  211644:	52800020 	mov	w0, #0x1                   	// #1
  211648:	12800013 	mov	w19, #0xffffffff            	// #-1
  21164c:	17fffff1 	b	211610 <__fixunstfsi+0xa0>

0000000000211650 <__floatsitf>:
  211650:	7100001f 	cmp	w0, #0x0
  211654:	540002a0 	b.eq	2116a8 <__floatsitf+0x58>  // b.none
  211658:	5a80a404 	cneg	w4, w0, lt  // lt = tstop
  21165c:	528807c1 	mov	w1, #0x403e                	// #16446
  211660:	dac01083 	clz	x3, x4
  211664:	528805e2 	mov	w2, #0x402f                	// #16431
  211668:	4b030021 	sub	w1, w1, w3
  21166c:	531f7c00 	lsr	w0, w0, #31
  211670:	4b010042 	sub	w2, w2, w1
  211674:	12003821 	and	w1, w1, #0x7fff
  211678:	9ac22084 	lsl	x4, x4, x2
  21167c:	9240bc84 	and	x4, x4, #0xffffffffffff
  211680:	d2800003 	mov	x3, #0x0                   	// #0
  211684:	d2800002 	mov	x2, #0x0                   	// #0
  211688:	b340bc83 	bfxil	x3, x4, #0, #48
  21168c:	9e670041 	fmov	d1, x2
  211690:	b3503823 	bfi	x3, x1, #48, #15
  211694:	b3410003 	bfi	x3, x0, #63, #1
  211698:	9eaf0061 	fmov	v1.d[1], x3
  21169c:	4ea11c20 	mov	v0.16b, v1.16b
  2116a0:	d65f03c0 	ret
  2116a4:	d503201f 	nop
  2116a8:	52800000 	mov	w0, #0x0                   	// #0
  2116ac:	52800001 	mov	w1, #0x0                   	// #0
  2116b0:	d2800004 	mov	x4, #0x0                   	// #0
  2116b4:	17fffff3 	b	211680 <__floatsitf+0x30>

00000000002116b8 <__floatunsitf>:
  2116b8:	34000280 	cbz	w0, 211708 <__floatunsitf+0x50>
  2116bc:	2a0003e0 	mov	w0, w0
  2116c0:	528807c1 	mov	w1, #0x403e                	// #16446
  2116c4:	dac01003 	clz	x3, x0
  2116c8:	528805e2 	mov	w2, #0x402f                	// #16431
  2116cc:	4b030021 	sub	w1, w1, w3
  2116d0:	4b010042 	sub	w2, w2, w1
  2116d4:	12003821 	and	w1, w1, #0x7fff
  2116d8:	9ac22000 	lsl	x0, x0, x2
  2116dc:	9240bc00 	and	x0, x0, #0xffffffffffff
  2116e0:	d2800003 	mov	x3, #0x0                   	// #0
  2116e4:	d2800002 	mov	x2, #0x0                   	// #0
  2116e8:	b340bc03 	bfxil	x3, x0, #0, #48
  2116ec:	9e670041 	fmov	d1, x2
  2116f0:	b3503823 	bfi	x3, x1, #48, #15
  2116f4:	9240f863 	and	x3, x3, #0x7fffffffffffffff
  2116f8:	9eaf0061 	fmov	v1.d[1], x3
  2116fc:	4ea11c20 	mov	v0.16b, v1.16b
  211700:	d65f03c0 	ret
  211704:	d503201f 	nop
  211708:	52800001 	mov	w1, #0x0                   	// #0
  21170c:	d2800000 	mov	x0, #0x0                   	// #0
  211710:	17fffff4 	b	2116e0 <__floatunsitf+0x28>
  211714:	00000000 	.inst	0x00000000 ; undefined

0000000000211718 <__extenddftf2>:
  211718:	9e660000 	fmov	x0, d0
  21171c:	d53b4401 	mrs	x1, fpcr
  211720:	d374f801 	ubfx	x1, x0, #52, #11
  211724:	d37ffc05 	lsr	x5, x0, #63
  211728:	91000422 	add	x2, x1, #0x1
  21172c:	d340cc00 	ubfx	x0, x0, #0, #52
  211730:	92402842 	and	x2, x2, #0x7ff
  211734:	12001ca5 	and	w5, w5, #0xff
  211738:	f100045f 	cmp	x2, #0x1
  21173c:	540001ed 	b.le	211778 <__extenddftf2+0x60>
  211740:	d344fc04 	lsr	x4, x0, #4
  211744:	52878002 	mov	w2, #0x3c00                	// #15360
  211748:	9240bc84 	and	x4, x4, #0xffffffffffff
  21174c:	0b020021 	add	w1, w1, w2
  211750:	d3440c00 	lsl	x0, x0, #60
  211754:	d2800003 	mov	x3, #0x0                   	// #0
  211758:	9e670001 	fmov	d1, x0
  21175c:	b340bc83 	bfxil	x3, x4, #0, #48
  211760:	b3503823 	bfi	x3, x1, #48, #15
  211764:	b34100a3 	bfi	x3, x5, #63, #1
  211768:	9eaf0061 	fmov	v1.d[1], x3
  21176c:	4ea11c20 	mov	v0.16b, v1.16b
  211770:	d65f03c0 	ret
  211774:	d503201f 	nop
  211778:	b40002c1 	cbz	x1, 2117d0 <__extenddftf2+0xb8>
  21177c:	b4000420 	cbz	x0, 211800 <__extenddftf2+0xe8>
  211780:	d344fc01 	lsr	x1, x0, #4
  211784:	d2800003 	mov	x3, #0x0                   	// #0
  211788:	b2510021 	orr	x1, x1, #0x800000000000
  21178c:	d3440c02 	lsl	x2, x0, #60
  211790:	9e670041 	fmov	d1, x2
  211794:	b340bc23 	bfxil	x3, x1, #0, #48
  211798:	b2503863 	orr	x3, x3, #0x7fff000000000000
  21179c:	b34100a3 	bfi	x3, x5, #63, #1
  2117a0:	9eaf0061 	fmov	v1.d[1], x3
  2117a4:	b79ffe40 	tbnz	x0, #51, 21176c <__extenddftf2+0x54>
  2117a8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  2117ac:	52800020 	mov	w0, #0x1                   	// #1
  2117b0:	910003fd 	mov	x29, sp
  2117b4:	3d8007a1 	str	q1, [x29, #16]
  2117b8:	94000020 	bl	211838 <__sfp_handle_exceptions>
  2117bc:	3dc007a1 	ldr	q1, [x29, #16]
  2117c0:	a8c27bfd 	ldp	x29, x30, [sp], #32
  2117c4:	4ea11c20 	mov	v0.16b, v1.16b
  2117c8:	d65f03c0 	ret
  2117cc:	d503201f 	nop
  2117d0:	b4000200 	cbz	x0, 211810 <__extenddftf2+0xf8>
  2117d4:	dac01002 	clz	x2, x0
  2117d8:	7100385f 	cmp	w2, #0xe
  2117dc:	5400022d 	b.le	211820 <__extenddftf2+0x108>
  2117e0:	51003c44 	sub	w4, w2, #0xf
  2117e4:	9ac42004 	lsl	x4, x0, x4
  2117e8:	d2800000 	mov	x0, #0x0                   	// #0
  2117ec:	52878181 	mov	w1, #0x3c0c                	// #15372
  2117f0:	4b020021 	sub	w1, w1, w2
  2117f4:	9240bc84 	and	x4, x4, #0xffffffffffff
  2117f8:	12003821 	and	w1, w1, #0x7fff
  2117fc:	17ffffd6 	b	211754 <__extenddftf2+0x3c>
  211800:	528fffe1 	mov	w1, #0x7fff                	// #32767
  211804:	d2800004 	mov	x4, #0x0                   	// #0
  211808:	17ffffd3 	b	211754 <__extenddftf2+0x3c>
  21180c:	d503201f 	nop
  211810:	52800001 	mov	w1, #0x0                   	// #0
  211814:	d2800004 	mov	x4, #0x0                   	// #0
  211818:	17ffffcf 	b	211754 <__extenddftf2+0x3c>
  21181c:	d503201f 	nop
  211820:	528001e4 	mov	w4, #0xf                   	// #15
  211824:	1100c441 	add	w1, w2, #0x31
  211828:	4b020084 	sub	w4, w4, w2
  21182c:	9ac42404 	lsr	x4, x0, x4
  211830:	9ac12000 	lsl	x0, x0, x1
  211834:	17ffffee 	b	2117ec <__extenddftf2+0xd4>

0000000000211838 <__sfp_handle_exceptions>:
  211838:	36000080 	tbz	w0, #0, 211848 <__sfp_handle_exceptions+0x10>
  21183c:	0f000401 	movi	v1.2s, #0x0
  211840:	1e211820 	fdiv	s0, s1, s1
  211844:	d53b4421 	mrs	x1, fpsr
  211848:	360800a0 	tbz	w0, #1, 21185c <__sfp_handle_exceptions+0x24>
  21184c:	1e2e1001 	fmov	s1, #1.000000000000000000e+00
  211850:	0f000402 	movi	v2.2s, #0x0
  211854:	1e221820 	fdiv	s0, s1, s2
  211858:	d53b4421 	mrs	x1, fpsr
  21185c:	361000e0 	tbz	w0, #2, 211878 <__sfp_handle_exceptions+0x40>
  211860:	f0000002 	adrp	x2, 214000 <syscall_table+0x800>
  211864:	f0000001 	adrp	x1, 214000 <syscall_table+0x800>
  211868:	bd48b841 	ldr	s1, [x2, #2232]
  21186c:	bd48bc22 	ldr	s2, [x1, #2236]
  211870:	1e222820 	fadd	s0, s1, s2
  211874:	d53b4421 	mrs	x1, fpsr
  211878:	361800a0 	tbz	w0, #3, 21188c <__sfp_handle_exceptions+0x54>
  21187c:	f0000001 	adrp	x1, 214000 <syscall_table+0x800>
  211880:	bd48c021 	ldr	s1, [x1, #2240]
  211884:	1e210820 	fmul	s0, s1, s1
  211888:	d53b4421 	mrs	x1, fpsr
  21188c:	362000c0 	tbz	w0, #4, 2118a4 <__sfp_handle_exceptions+0x6c>
  211890:	f0000000 	adrp	x0, 214000 <syscall_table+0x800>
  211894:	1e2e1002 	fmov	s2, #1.000000000000000000e+00
  211898:	bd48b801 	ldr	s1, [x0, #2232]
  21189c:	1e223820 	fsub	s0, s1, s2
  2118a0:	d53b4420 	mrs	x0, fpsr
  2118a4:	d65f03c0 	ret

00000000002118a8 <_init>:
  2118a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  2118ac:	910003fd 	mov	x29, sp
  2118b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  2118b4:	d65f03c0 	ret

00000000002118b8 <_fini>:
  2118b8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  2118bc:	910003fd 	mov	x29, sp
  2118c0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  2118c4:	d65f03c0 	ret
  2118c8:	002118b8 	.word	0x002118b8
  2118cc:	00000000 	.word	0x00000000
  2118d0:	002118a8 	.word	0x002118a8
	...
  2118f8:	706d6f63 	.word	0x706d6f63
  2118fc:	6974656c 	.word	0x6974656c
  211900:	00006e6f 	.word	0x00006e6f
  211904:	00000000 	.word	0x00000000
  211908:	20746553 	.word	0x20746553
  21190c:	6c626f6e 	.word	0x6c626f6e
  211910:	696b636f 	.word	0x696b636f
  211914:	6520676e 	.word	0x6520676e
  211918:	726f7272 	.word	0x726f7272
  21191c:	00000021 	.word	0x00000021
  211920:	61657243 	.word	0x61657243
  211924:	6c206574 	.word	0x6c206574
  211928:	65747369 	.word	0x65747369
  21192c:	2064666e 	.word	0x2064666e
  211930:	6b636f73 	.word	0x6b636f73
  211934:	65207465 	.word	0x65207465
  211938:	726f7272 	.word	0x726f7272
  21193c:	7325203a 	.word	0x7325203a
  211940:	72726528 	.word	0x72726528
  211944:	203a6f6e 	.word	0x203a6f6e
  211948:	0a296425 	.word	0x0a296425
  21194c:	00000000 	.word	0x00000000
  211950:	73746553 	.word	0x73746553
  211954:	6f6b636f 	.word	0x6f6b636f
  211958:	72207470 	.word	0x72207470
  21195c:	65737565 	.word	0x65737565
  211960:	20646461 	.word	0x20646461
  211964:	6c696166 	.word	0x6c696166
  211968:	00006465 	.word	0x00006465
  21196c:	00000000 	.word	0x00000000
  211970:	646e6942 	.word	0x646e6942
  211974:	636f7320 	.word	0x636f7320
  211978:	2074656b 	.word	0x2074656b
  21197c:	6f727265 	.word	0x6f727265
  211980:	25203a72 	.word	0x25203a72
  211984:	72652873 	.word	0x72652873
  211988:	3a6f6e72 	.word	0x3a6f6e72
  21198c:	29642520 	.word	0x29642520
  211990:	6466202c 	.word	0x6466202c
  211994:	0a64253d 	.word	0x0a64253d
	...
  2119a0:	7473694c 	.word	0x7473694c
  2119a4:	73206e65 	.word	0x73206e65
  2119a8:	656b636f 	.word	0x656b636f
  2119ac:	72652074 	.word	0x72652074
  2119b0:	3a726f72 	.word	0x3a726f72
  2119b4:	28732520 	.word	0x28732520
  2119b8:	6e727265 	.word	0x6e727265
  2119bc:	25203a6f 	.word	0x25203a6f
  2119c0:	000a2964 	.word	0x000a2964
  2119c4:	00000000 	.word	0x00000000
  2119c8:	61657243 	.word	0x61657243
  2119cc:	63206574 	.word	0x63206574
  2119d0:	6e65696c 	.word	0x6e65696c
  2119d4:	20646674 	.word	0x20646674
  2119d8:	6b636f73 	.word	0x6b636f73
  2119dc:	65207465 	.word	0x65207465
  2119e0:	726f7272 	.word	0x726f7272
  2119e4:	7325203a 	.word	0x7325203a
  2119e8:	72726528 	.word	0x72726528
  2119ec:	203a6f6e 	.word	0x203a6f6e
  2119f0:	0a296425 	.word	0x0a296425
  2119f4:	00000000 	.word	0x00000000
  2119f8:	656c6573 	.word	0x656c6573
  2119fc:	65207463 	.word	0x65207463
  211a00:	726f7272 	.word	0x726f7272
  211a04:	00000000 	.word	0x00000000
  211a08:	746e6f63 	.word	0x746e6f63
  211a0c:	65756e69 	.word	0x65756e69
	...
  211a18:	69745f75 	.word	0x69745f75
  211a1c:	0072656d 	.word	0x0072656d
  211a20:	5f6d7475 	.word	0x5f6d7475
  211a24:	6574756d 	.word	0x6574756d
  211a28:	00000078 	.word	0x00000078
  211a2c:	00000000 	.word	0x00000000
  211a30:	00007325 	.word	0x00007325
  211a34:	00000000 	.word	0x00000000
  211a38:	72657355 	.word	0x72657355
  211a3c:	3a505041 	.word	0x3a505041
  211a40:	73252820 	.word	0x73252820
  211a44:	73612029 	.word	0x73612029
  211a48:	74726573 	.word	0x74726573
  211a4c:	206e6f69 	.word	0x206e6f69
  211a50:	6c696166 	.word	0x6c696166
  211a54:	61206465 	.word	0x61206465
  211a58:	75662074 	.word	0x75662074
  211a5c:	6974636e 	.word	0x6974636e
  211a60:	253a6e6f 	.word	0x253a6e6f
  211a64:	6c202c73 	.word	0x6c202c73
  211a68:	20656e69 	.word	0x20656e69
  211a6c:	626d756e 	.word	0x626d756e
  211a70:	253a7265 	.word	0x253a7265
  211a74:	000a2064 	.word	0x000a2064
  211a78:	656d6974 	.word	0x656d6974
  211a7c:	72635f72 	.word	0x72635f72
  211a80:	65746165 	.word	0x65746165
  211a84:	69616620 	.word	0x69616620
  211a88:	3a64656c 	.word	0x3a64656c
  211a8c:	0a732520 	.word	0x0a732520
	...
  211a98:	656d6974 	.word	0x656d6974
  211a9c:	65735f72 	.word	0x65735f72
  211aa0:	6d697474 	.word	0x6d697474
  211aa4:	61662065 	.word	0x61662065
  211aa8:	64656c69 	.word	0x64656c69
  211aac:	7325203a 	.word	0x7325203a
  211ab0:	0000000a 	.word	0x0000000a
  211ab4:	00000000 	.word	0x00000000
  211ab8:	65732031 	.word	0x65732031
  211abc:	646e6f63 	.word	0x646e6f63
  211ac0:	6c652073 	.word	0x6c652073
  211ac4:	65737061 	.word	0x65737061
  211ac8:	00002e64 	.word	0x00002e64
  211acc:	00000000 	.word	0x00000000
  211ad0:	002151f8 	.word	0x002151f8
  211ad4:	00000000 	.word	0x00000000
  211ad8:	00215200 	.word	0x00215200
	...

0000000000211ae8 <errid>:
  211ae8:	19222154 0302010d 0c1c4b11 1d0b0410     T!"......K......
  211af8:	68271e12 71706f6e 06052062 1514130f     ..'hnopqb ......
  211b08:	0716081a 18172428 1b0e0a09 8323251f     ....($.......%#.
  211b18:	2a267d82 3e3d3c2b 4a47433f 5a59584d     .}&*+<=>?CGJMXYZ
  211b28:	5e5d5c5b 6361605f 67666564 6c6b6a69     [\]^_`acdefgijkl
  211b38:	79747372 487c7b7a 00000000 00000000     rstyz{|H........

0000000000211b48 <errmsg>:
  211b48:	656c6c49 206c6167 65747962 71657320     Illegal byte seq
  211b58:	636e6575 6f440065 6e69616d 72726520     uence.Domain err
  211b68:	5200726f 6c757365 6f6e2074 65722074     or.Result not re
  211b78:	73657270 61746e65 00656c62 20746f4e     presentable.Not 
  211b88:	74742061 65500079 73696d72 6e6f6973     a tty.Permission
  211b98:	6e656420 00646569 7265704f 6f697461      denied.Operatio
  211ba8:	6f6e206e 65702074 74696d72 00646574     n not permitted.
  211bb8:	73206f4e 20686375 656c6966 20726f20     No such file or 
  211bc8:	65726964 726f7463 6f4e0079 63757320     directory.No suc
  211bd8:	72702068 7365636f 69460073 6520656c     h process.File e
  211be8:	74736978 61560073 2065756c 206f6f74     xists.Value too 
  211bf8:	6772616c 6f662065 61642072 74206174     large for data t
  211c08:	00657079 73206f4e 65636170 66656c20     ype.No space lef
  211c18:	6e6f2074 76656420 00656369 2074754f     t on device.Out 
  211c28:	6d20666f 726f6d65 65520079 72756f73     of memory.Resour
  211c38:	62206563 00797375 65746e49 70757272     ce busy.Interrup
  211c48:	20646574 74737973 63206d65 006c6c61     ted system call.
  211c58:	6f736552 65637275 6d657420 61726f70     Resource tempora
  211c68:	796c6972 616e7520 6c696176 656c6261     rily unavailable
  211c78:	766e4900 64696c61 65657320 7243006b     .Invalid seek.Cr
  211c88:	2d73736f 69766564 6c206563 006b6e69     oss-device link.
  211c98:	64616552 6c6e6f2d 69662079 7320656c     Read-only file s
  211ca8:	65747379 6944006d 74636572 2079726f     ystem.Directory 
  211cb8:	20746f6e 74706d65 6f430079 63656e6e     not empty.Connec
  211cc8:	6e6f6974 73657220 62207465 65702079     tion reset by pe
  211cd8:	4f007265 61726570 6e6f6974 6d697420     er.Operation tim
  211ce8:	6f206465 43007475 656e6e6f 6f697463     ed out.Connectio
  211cf8:	6572206e 65737566 6f480064 69207473     n refused.Host i
  211d08:	6f642073 48006e77 2074736f 75207369     s down.Host is u
  211d18:	6165726e 62616863 4100656c 65726464     nreachable.Addre
  211d28:	69207373 7375206e 72420065 6e656b6f     ss in use.Broken
  211d38:	70697020 2f490065 7265204f 00726f72      pipe.I/O error.
  211d48:	73206f4e 20686375 69766564 6f206563     No such device o
  211d58:	64612072 73657264 6c420073 206b636f     r address.Block 
  211d68:	69766564 72206563 69757165 00646572     device required.
  211d78:	73206f4e 20686375 69766564 4e006563     No such device.N
  211d88:	6120746f 72696420 6f746365 49007972     ot a directory.I
  211d98:	20612073 65726964 726f7463 65540079     s a directory.Te
  211da8:	66207478 20656c69 79737562 65784500     xt file busy.Exe
  211db8:	6f662063 74616d72 72726520 4900726f     c format error.I
  211dc8:	6c61766e 61206469 6d756772 00746e65     nvalid argument.
  211dd8:	75677241 746e656d 73696c20 6f742074     Argument list to
  211de8:	6f6c206f 5300676e 6f626d79 2063696c     o long.Symbolic 
  211df8:	6b6e696c 6f6f6c20 69460070 616e656c     link loop.Filena
  211e08:	7420656d 6c206f6f 00676e6f 206f6f54     me too long.Too 
  211e18:	796e616d 65706f20 6966206e 2073656c     many open files 
  211e28:	73206e69 65747379 6f4e006d 6c696620     in system.No fil
  211e38:	65642065 69726373 726f7470 76612073     e descriptors av
  211e48:	616c6961 00656c62 20646142 656c6966     ailable.Bad file
  211e58:	73656420 70697263 00726f74 63206f4e      descriptor.No c
  211e68:	646c6968 6f727020 73736563 64614200     hild process.Bad
  211e78:	64646120 73736572 6c694600 6f742065      address.File to
  211e88:	616c206f 00656772 206f6f54 796e616d     o large.Too many
  211e98:	6e696c20 4e00736b 6f6c206f 20736b63      links.No locks 
  211ea8:	69617661 6c62616c 65520065 72756f73     available.Resour
  211eb8:	64206563 6c646165 206b636f 6c756f77     ce deadlock woul
  211ec8:	636f2064 00727563 74617453 6f6e2065     d occur.State no
  211ed8:	65722074 65766f63 6c626172 72500065     t recoverable.Pr
  211ee8:	6f697665 6f207375 72656e77 65696420     evious owner die
  211ef8:	704f0064 74617265 206e6f69 636e6163     d.Operation canc
  211f08:	64656c65 6e754600 6f697463 6f6e206e     eled.Function no
  211f18:	6d692074 6d656c70 65746e65 6f4e0064     t implemented.No
  211f28:	73656d20 65676173 20666f20 69736564      message of desi
  211f38:	20646572 65707974 65644900 6669746e     red type.Identif
  211f48:	20726569 6f6d6572 00646576 69766544     ier removed.Devi
  211f58:	6e206563 6120746f 72747320 006d6165     ce not a stream.
  211f68:	64206f4e 20617461 69617661 6c62616c     No data availabl
  211f78:	65440065 65636976 6d697420 74756f65     e.Device timeout
  211f88:	74754f00 20666f20 65727473 20736d61     .Out of streams 
  211f98:	6f736572 65637275 694c0073 68206b6e     resources.Link h
  211fa8:	62207361 206e6565 65766573 00646572     as been severed.
  211fb8:	746f7250 6c6f636f 72726520 4200726f     Protocol error.B
  211fc8:	6d206461 61737365 46006567 20656c69     ad message.File 
  211fd8:	63736564 74706972 6920726f 6162206e     descriptor in ba
  211fe8:	74732064 00657461 20746f4e 6f732061     d state.Not a so
  211ff8:	74656b63 73654400 616e6974 6e6f6974     cket.Destination
  212008:	64646120 73736572 71657220 65726975      address require
  212018:	654d0064 67617373 6f742065 616c206f     d.Message too la
  212028:	00656772 746f7250 6c6f636f 6f727720     rge.Protocol wro
  212038:	7420676e 20657079 20726f66 6b636f73     ng type for sock
  212048:	50007465 6f746f72 206c6f63 20746f6e     et.Protocol not 
  212058:	69617661 6c62616c 72500065 636f746f     available.Protoc
  212068:	6e206c6f 7320746f 6f707075 64657472     ol not supported
  212078:	636f5300 2074656b 65707974 746f6e20     .Socket type not
  212088:	70757320 74726f70 4e006465 7320746f      supported.Not s
  212098:	6f707075 64657472 6f725000 6f636f74     upported.Protoco
  2120a8:	6166206c 796c696d 746f6e20 70757320     l family not sup
  2120b8:	74726f70 41006465 65726464 66207373     ported.Address f
  2120c8:	6c696d61 6f6e2079 75732074 726f7070     amily not suppor
  2120d8:	20646574 70207962 6f746f72 006c6f63     ted by protocol.
  2120e8:	72646441 20737365 20746f6e 69617661     Address not avai
  2120f8:	6c62616c 654e0065 726f7774 7369206b     lable.Network is
  212108:	776f6420 654e006e 726f7774 6e75206b      down.Network un
  212118:	63616572 6c626168 6f430065 63656e6e     reachable.Connec
  212128:	6e6f6974 73657220 62207465 656e2079     tion reset by ne
  212138:	726f7774 6f43006b 63656e6e 6e6f6974     twork.Connection
  212148:	6f626120 64657472 206f4e00 66667562      aborted.No buff
  212158:	73207265 65636170 61766120 62616c69     er space availab
  212168:	5300656c 656b636f 73692074 6e6f6320     le.Socket is con
  212178:	7463656e 53006465 656b636f 6f6e2074     nected.Socket no
  212188:	6f632074 63656e6e 00646574 6e6e6143     t connected.Cann
  212198:	7320746f 20646e65 65746661 6f732072     ot send after so
  2121a8:	74656b63 75687320 776f6474 704f006e     cket shutdown.Op
  2121b8:	74617265 206e6f69 65726c61 20796461     eration already 
  2121c8:	70206e69 72676f72 00737365 7265704f     in progress.Oper
  2121d8:	6f697461 6e69206e 6f727020 73657267     ation in progres
  2121e8:	74530073 20656c61 656c6966 6e616820     s.Stale file han
  2121f8:	00656c64 6f6d6552 49206574 65204f2f     dle.Remote I/O e
  212208:	726f7272 6f755100 65206174 65656378     rror.Quota excee
  212218:	00646564 6d206f4e 75696465 6f66206d     ded.No medium fo
  212228:	00646e75 6e6f7257 656d2067 6d756964     und.Wrong medium
  212238:	70797420 754d0065 6869746c 6120706f      type.Multihop a
  212248:	6d657474 64657470 206f4e00 6f727265     ttempted.No erro
  212258:	6e692072 6d726f66 6f697461 0000006e     r information...
  212268:	00215208 00000000 00215200 00000000     .R!......R!.....

0000000000212278 <__FUNCTION__.5030>:
  212278:	63737973 5f6c6c61 74736572 5f747261     syscall_restart_
  212288:	63737973 006c6c61                       syscall.

0000000000212290 <__FUNCTION__.5056>:
  212290:	63737973 5f6c6c61 61657263 00000074     syscall_creat...

00000000002122a0 <__FUNCTION__.5059>:
  2122a0:	63737973 5f6c6c61 6b6e696c 00000000     syscall_link....

00000000002122b0 <__FUNCTION__.5073>:
  2122b0:	63737973 5f6c6c61 6f6e6b6d 00000064     syscall_mknod...

00000000002122c0 <__FUNCTION__.5076>:
  2122c0:	63737973 5f6c6c61 6f6d6863 00000064     syscall_chmod...

00000000002122d0 <__FUNCTION__.5079>:
  2122d0:	63737973 5f6c6c61 6f68636c 00006e77     syscall_lchown..

00000000002122e0 <__FUNCTION__.5095>:
  2122e0:	63737973 5f6c6c61 6e756f6d 00000074     syscall_mount...

00000000002122f0 <__FUNCTION__.5098>:
  2122f0:	63737973 5f6c6c61 75746573 00006469     syscall_setuid..

0000000000212300 <__FUNCTION__.5101>:
  212300:	63737973 5f6c6c61 75746567 00006469     syscall_getuid..

0000000000212310 <__FUNCTION__.5104>:
  212310:	63737973 5f6c6c61 61727470 00006563     syscall_ptrace..

0000000000212320 <__FUNCTION__.5107>:
  212320:	63737973 5f6c6c61 73756170 00000065     syscall_pause...

0000000000212330 <__FUNCTION__.5114>:
  212330:	63737973 5f6c6c61 6563696e 00000000     syscall_nice....

0000000000212340 <__FUNCTION__.5117>:
  212340:	63737973 5f6c6c61 636e7973 00000000     syscall_sync....

0000000000212350 <__FUNCTION__.5141>:
  212350:	63737973 5f6c6c61 656d6974 00000073     syscall_times...

0000000000212360 <__FUNCTION__.5147>:
  212360:	63737973 5f6c6c61 67746573 00006469     syscall_setgid..

0000000000212370 <__FUNCTION__.5150>:
  212370:	63737973 5f6c6c61 67746567 00006469     syscall_getgid..

0000000000212380 <__FUNCTION__.5153>:
  212380:	63737973 5f6c6c61 65746567 00646975     syscall_geteuid.

0000000000212390 <__FUNCTION__.5156>:
  212390:	63737973 5f6c6c61 65746567 00646967     syscall_getegid.

00000000002123a0 <__FUNCTION__.5159>:
  2123a0:	63737973 5f6c6c61 74636361 00000000     syscall_acct....

00000000002123b0 <__FUNCTION__.5162>:
  2123b0:	63737973 5f6c6c61 756f6d75 0032746e     syscall_umount2.

00000000002123c0 <__FUNCTION__.5175>:
  2123c0:	63737973 5f6c6c61 70746573 00646967     syscall_setpgid.

00000000002123d0 <__FUNCTION__.5178>:
  2123d0:	63737973 5f6c6c61 73616d75 0000006b     syscall_umask...

00000000002123e0 <__FUNCTION__.5181>:
  2123e0:	63737973 5f6c6c61 6f726863 0000746f     syscall_chroot..

00000000002123f0 <__FUNCTION__.5184>:
  2123f0:	63737973 5f6c6c61 61747375 00000074     syscall_ustat...

0000000000212400 <__FUNCTION__.5191>:
  212400:	63737973 5f6c6c61 70746567 00646970     syscall_getppid.

0000000000212410 <__FUNCTION__.5194>:
  212410:	63737973 5f6c6c61 70746567 00707267     syscall_getpgrp.

0000000000212420 <__FUNCTION__.5205>:
  212420:	63737973 5f6c6c61 72746573 64697565     syscall_setreuid
	...

0000000000212438 <__FUNCTION__.5208>:
  212438:	63737973 5f6c6c61 72746573 64696765     syscall_setregid
	...

0000000000212450 <__FUNCTION__.5211>:
  212450:	63737973 5f6c6c61 73676973 65707375     syscall_sigsuspe
  212460:	0000646e 00000000                       nd......

0000000000212468 <__FUNCTION__.5214>:
  212468:	63737973 5f6c6c61 70676973 69646e65     syscall_sigpendi
  212478:	0000676e 00000000                       ng......

0000000000212480 <__FUNCTION__.5217>:
  212480:	63737973 5f6c6c61 68746573 6e74736f     syscall_sethostn
  212490:	00656d61 00000000                       ame.....

0000000000212498 <__FUNCTION__.5224>:
  212498:	63737973 5f6c6c61 72746567 67617375     syscall_getrusag
  2124a8:	00000065 00000000                       e.......

00000000002124b0 <__FUNCTION__.5227>:
  2124b0:	63737973 5f6c6c61 74746567 6f656d69     syscall_gettimeo
  2124c0:	79616466 00000000                       fday....

00000000002124c8 <__FUNCTION__.5230>:
  2124c8:	63737973 5f6c6c61 74746573 6f656d69     syscall_settimeo
  2124d8:	79616466 00000000                       fday....

00000000002124e0 <__FUNCTION__.5233>:
  2124e0:	63737973 5f6c6c61 67746567 70756f72     syscall_getgroup
  2124f0:	00000073 00000000                       s.......

00000000002124f8 <__FUNCTION__.5236>:
  2124f8:	63737973 5f6c6c61 67746573 70756f72     syscall_setgroup
  212508:	00000073 00000000                       s.......

0000000000212510 <__FUNCTION__.5239>:
  212510:	63737973 5f6c6c61 6c6d7973 006b6e69     syscall_symlink.

0000000000212520 <__FUNCTION__.5247>:
  212520:	63737973 5f6c6c61 6c657375 00006269     syscall_uselib..

0000000000212530 <__FUNCTION__.5250>:
  212530:	63737973 5f6c6c61 70617773 00006e6f     syscall_swapon..

0000000000212540 <__FUNCTION__.5253>:
  212540:	63737973 5f6c6c61 6f626572 0000746f     syscall_reboot..

0000000000212550 <__FUNCTION__.5260>:
  212550:	63737973 5f6c6c61 6e757274 65746163     syscall_truncate
	...

0000000000212568 <__FUNCTION__.5263>:
  212568:	63737973 5f6c6c61 75727466 7461636e     syscall_ftruncat
  212578:	00000065 00000000                       e.......

0000000000212580 <__FUNCTION__.5266>:
  212580:	63737973 5f6c6c61 6d686366 0000646f     syscall_fchmod..

0000000000212590 <__FUNCTION__.5269>:
  212590:	63737973 5f6c6c61 6f686366 00006e77     syscall_fchown..

00000000002125a0 <__FUNCTION__.5272>:
  2125a0:	63737973 5f6c6c61 70746567 726f6972     syscall_getprior
  2125b0:	00797469 00000000                       ity.....

00000000002125b8 <__FUNCTION__.5275>:
  2125b8:	63737973 5f6c6c61 70746573 726f6972     syscall_setprior
  2125c8:	00797469 00000000                       ity.....

00000000002125d0 <__FUNCTION__.5281>:
  2125d0:	63737973 5f6c6c61 74617473 00007366     syscall_statfs..

00000000002125e0 <__FUNCTION__.5287>:
  2125e0:	63737973 5f6c6c61 61747366 00736674     syscall_fstatfs.

00000000002125f0 <__FUNCTION__.5290>:
  2125f0:	63737973 5f6c6c61 6c737973 0000676f     syscall_syslog..

0000000000212600 <__FUNCTION__.5293>:
  212600:	63737973 5f6c6c61 69746573 656d6974     syscall_setitime
  212610:	00000072 00000000                       r.......

0000000000212618 <__FUNCTION__.5296>:
  212618:	63737973 5f6c6c61 69746567 656d6974     syscall_getitime
  212628:	00000072 00000000                       r.......

0000000000212630 <__FUNCTION__.5309>:
  212630:	63737973 5f6c6c61 61747366 00000074     syscall_fstat...

0000000000212640 <__FUNCTION__.5312>:
  212640:	63737973 5f6c6c61 6e616876 00707567     syscall_vhangup.

0000000000212650 <__FUNCTION__.5315>:
  212650:	63737973 5f6c6c61 74696177 00000034     syscall_wait4...

0000000000212660 <__FUNCTION__.5318>:
  212660:	63737973 5f6c6c61 70617773 0066666f     syscall_swapoff.

0000000000212670 <__FUNCTION__.5321>:
  212670:	63737973 5f6c6c61 69737973 006f666e     syscall_sysinfo.

0000000000212680 <__FUNCTION__.5327>:
  212680:	63737973 5f6c6c61 72676973 72757465     syscall_sigretur
  212690:	0000006e 00000000                       n.......

0000000000212698 <__FUNCTION__.5330>:
  212698:	63737973 5f6c6c61 6e6f6c63 00000065     syscall_clone...

00000000002126a8 <__FUNCTION__.5333>:
  2126a8:	63737973 5f6c6c61 64746573 69616d6f     syscall_setdomai
  2126b8:	6d616e6e 00000065                       nname...

00000000002126c0 <__FUNCTION__.5336>:
  2126c0:	63737973 5f6c6c61 6d616e75 00000065     syscall_uname...

00000000002126d0 <__FUNCTION__.5339>:
  2126d0:	63737973 5f6c6c61 746a6461 78656d69     syscall_adjtimex
	...

00000000002126e8 <__FUNCTION__.5342>:
  2126e8:	63737973 5f6c6c61 6f72706d 74636574     syscall_mprotect
	...

0000000000212700 <__FUNCTION__.5351>:
  212700:	63737973 5f6c6c61 74696e69 646f6d5f     syscall_init_mod
  212710:	00656c75 00000000                       ule.....

0000000000212718 <__FUNCTION__.5354>:
  212718:	63737973 5f6c6c61 656c6564 6d5f6574     syscall_delete_m
  212728:	6c75646f 00000065                       odule...

0000000000212730 <__FUNCTION__.5357>:
  212730:	63737973 5f6c6c61 746f7571 6c746361     syscall_quotactl
	...

0000000000212748 <__FUNCTION__.5360>:
  212748:	63737973 5f6c6c61 70746567 00646967     syscall_getpgid.

0000000000212758 <__FUNCTION__.5363>:
  212758:	63737973 5f6c6c61 64686366 00007269     syscall_fchdir..

0000000000212768 <__FUNCTION__.5366>:
  212768:	63737973 5f6c6c61 6c666462 00687375     syscall_bdflush.

0000000000212778 <__FUNCTION__.5369>:
  212778:	63737973 5f6c6c61 66737973 00000073     syscall_sysfs...

0000000000212788 <__FUNCTION__.5372>:
  212788:	63737973 5f6c6c61 73726570 6c616e6f     syscall_personal
  212798:	00797469 00000000                       ity.....

00000000002127a0 <__FUNCTION__.5375>:
  2127a0:	63737973 5f6c6c61 66746573 64697573     syscall_setfsuid
	...

00000000002127b8 <__FUNCTION__.5378>:
  2127b8:	63737973 5f6c6c61 66746573 64696773     syscall_setfsgid
	...

00000000002127d0 <__FUNCTION__.5400>:
  2127d0:	63737973 5f6c6c61 636f6c66 0000006b     syscall_flock...

00000000002127e0 <__FUNCTION__.5403>:
  2127e0:	63737973 5f6c6c61 6e79736d 00000063     syscall_msync...

00000000002127f0 <__FUNCTION__.5428>:
  2127f0:	63737973 5f6c6c61 73746567 00006469     syscall_getsid..

0000000000212800 <__FUNCTION__.5431>:
  212800:	63737973 5f6c6c61 74616466 6e797361     syscall_fdatasyn
  212810:	00000063 00000000                       c.......

0000000000212818 <__FUNCTION__.5434>:
  212818:	63737973 5f6c6c61 7379735f 006c7463     syscall__sysctl.

0000000000212828 <__FUNCTION__.5437>:
  212828:	63737973 5f6c6c61 636f6c6d 0000006b     syscall_mlock...

0000000000212838 <__FUNCTION__.5440>:
  212838:	63737973 5f6c6c61 6c6e756d 006b636f     syscall_munlock.

0000000000212848 <__FUNCTION__.5443>:
  212848:	63737973 5f6c6c61 636f6c6d 6c6c616b     syscall_mlockall
	...

0000000000212860 <__FUNCTION__.5446>:
  212860:	63737973 5f6c6c61 6c6e756d 616b636f     syscall_munlocka
  212870:	00006c6c 00000000                       ll......

0000000000212878 <__FUNCTION__.5467>:
  212878:	63737973 5f6c6c61 65686373 69795f64     syscall_sched_yi
  212888:	00646c65 00000000                       eld.....

0000000000212890 <__FUNCTION__.5476>:
  212890:	63737973 5f6c6c61 65686373 72725f64     syscall_sched_rr
  2128a0:	7465675f 746e695f 61767265 0000006c     _get_interval...

00000000002128b0 <__FUNCTION__.5490>:
  2128b0:	63737973 5f6c6c61 72746573 69757365     syscall_setresui
  2128c0:	00000064 00000000                       d.......

00000000002128c8 <__FUNCTION__.5493>:
  2128c8:	63737973 5f6c6c61 72746567 69757365     syscall_getresui
  2128d8:	00000064 00000000                       d.......

00000000002128e0 <__FUNCTION__.5501>:
  2128e0:	63737973 5f6c6c61 7373666e 63767265     syscall_nfsservc
  2128f0:	00006c74 00000000                       tl......

00000000002128f8 <__FUNCTION__.5504>:
  2128f8:	63737973 5f6c6c61 72746573 69677365     syscall_setresgi
  212908:	00000064 00000000                       d.......

0000000000212910 <__FUNCTION__.5507>:
  212910:	63737973 5f6c6c61 72746567 69677365     syscall_getresgi
  212920:	00000064 00000000                       d.......

0000000000212928 <__FUNCTION__.5510>:
  212928:	63737973 5f6c6c61 74637270 0000006c     syscall_prctl...

0000000000212938 <__FUNCTION__.5513>:
  212938:	63737973 5f6c6c61 735f7472 65726769     syscall_rt_sigre
  212948:	6e727574 00000000                       turn....

0000000000212950 <__FUNCTION__.5530>:
  212950:	63737973 5f6c6c61 735f7472 65706769     syscall_rt_sigpe
  212960:	6e69646e 00000067                       nding...

0000000000212968 <__FUNCTION__.5533>:
  212968:	63737973 5f6c6c61 735f7472 69746769     syscall_rt_sigti
  212978:	7764656d 00746961                       medwait.

0000000000212980 <__FUNCTION__.5536>:
  212980:	63737973 5f6c6c61 735f7472 75716769     syscall_rt_sigqu
  212990:	69657565 006f666e                       eueinfo.

0000000000212998 <__FUNCTION__.5539>:
  212998:	63737973 5f6c6c61 735f7472 75736769     syscall_rt_sigsu
  2129a8:	6e657073 00000064                       spend...

00000000002129b0 <__FUNCTION__.5542>:
  2129b0:	63737973 5f6c6c61 61657270 00343664     syscall_pread64.

00000000002129c0 <__FUNCTION__.5545>:
  2129c0:	63737973 5f6c6c61 69727770 34366574     syscall_pwrite64
	...

00000000002129d8 <__FUNCTION__.5548>:
  2129d8:	63737973 5f6c6c61 776f6863 0000006e     syscall_chown...

00000000002129e8 <__FUNCTION__.5555>:
  2129e8:	63737973 5f6c6c61 67706163 00007465     syscall_capget..

00000000002129f8 <__FUNCTION__.5558>:
  2129f8:	63737973 5f6c6c61 73706163 00007465     syscall_capset..

0000000000212a08 <__FUNCTION__.5561>:
  212a08:	63737973 5f6c6c61 61676973 7473746c     syscall_sigaltst
  212a18:	006b6361 00000000                       ack.....

0000000000212a20 <__FUNCTION__.5564>:
  212a20:	63737973 5f6c6c61 646e6573 656c6966     syscall_sendfile
	...

0000000000212a38 <__FUNCTION__.5581>:
  212a38:	63737973 5f6c6c61 6e757274 65746163     syscall_truncate
  212a48:	00003436 00000000                       64......

0000000000212a50 <__FUNCTION__.5584>:
  212a50:	63737973 5f6c6c61 75727466 7461636e     syscall_ftruncat
  212a60:	00343665 00000000                       e64.....

0000000000212a68 <__FUNCTION__.5599>:
  212a68:	63737973 5f6c6c61 6f68636c 32336e77     syscall_lchown32
	...

0000000000212a80 <__FUNCTION__.5602>:
  212a80:	63737973 5f6c6c61 75746567 32336469     syscall_getuid32
	...

0000000000212a98 <__FUNCTION__.5605>:
  212a98:	63737973 5f6c6c61 67746567 32336469     syscall_getgid32
	...

0000000000212ab0 <__FUNCTION__.5608>:
  212ab0:	63737973 5f6c6c61 65746567 33646975     syscall_geteuid3
  212ac0:	00000032 00000000                       2.......

0000000000212ac8 <__FUNCTION__.5611>:
  212ac8:	63737973 5f6c6c61 65746567 33646967     syscall_getegid3
  212ad8:	00000032 00000000                       2.......

0000000000212ae0 <__FUNCTION__.5614>:
  212ae0:	63737973 5f6c6c61 72746573 64697565     syscall_setreuid
  212af0:	00003233 00000000                       32......

0000000000212af8 <__FUNCTION__.5617>:
  212af8:	63737973 5f6c6c61 72746573 64696765     syscall_setregid
  212b08:	00003233 00000000                       32......

0000000000212b10 <__FUNCTION__.5620>:
  212b10:	63737973 5f6c6c61 67746567 70756f72     syscall_getgroup
  212b20:	00323373 00000000                       s32.....

0000000000212b28 <__FUNCTION__.5623>:
  212b28:	63737973 5f6c6c61 67746573 70756f72     syscall_setgroup
  212b38:	00323373 00000000                       s32.....

0000000000212b40 <__FUNCTION__.5626>:
  212b40:	63737973 5f6c6c61 6f686366 32336e77     syscall_fchown32
	...

0000000000212b58 <__FUNCTION__.5629>:
  212b58:	63737973 5f6c6c61 72746573 69757365     syscall_setresui
  212b68:	00323364 00000000                       d32.....

0000000000212b70 <__FUNCTION__.5632>:
  212b70:	63737973 5f6c6c61 72746567 69757365     syscall_getresui
  212b80:	00323364 00000000                       d32.....

0000000000212b88 <__FUNCTION__.5635>:
  212b88:	63737973 5f6c6c61 72746573 69677365     syscall_setresgi
  212b98:	00323364 00000000                       d32.....

0000000000212ba0 <__FUNCTION__.5638>:
  212ba0:	63737973 5f6c6c61 72746567 69677365     syscall_getresgi
  212bb0:	00323364 00000000                       d32.....

0000000000212bb8 <__FUNCTION__.5641>:
  212bb8:	63737973 5f6c6c61 776f6863 0032336e     syscall_chown32.

0000000000212bc8 <__FUNCTION__.5644>:
  212bc8:	63737973 5f6c6c61 75746573 32336469     syscall_setuid32
	...

0000000000212be0 <__FUNCTION__.5647>:
  212be0:	63737973 5f6c6c61 67746573 32336469     syscall_setgid32
	...

0000000000212bf8 <__FUNCTION__.5650>:
  212bf8:	63737973 5f6c6c61 66746573 64697573     syscall_setfsuid
  212c08:	00003233 00000000                       32......

0000000000212c10 <__FUNCTION__.5653>:
  212c10:	63737973 5f6c6c61 66746573 64696773     syscall_setfsgid
  212c20:	00003233 00000000                       32......

0000000000212c28 <__FUNCTION__.5661>:
  212c28:	63737973 5f6c6c61 6f766970 6f725f74     syscall_pivot_ro
  212c38:	0000746f 00000000                       ot......

0000000000212c40 <__FUNCTION__.5664>:
  212c40:	63737973 5f6c6c61 636e696d 0065726f     syscall_mincore.

0000000000212c50 <__FUNCTION__.5679>:
  212c50:	63737973 5f6c6c61 64616572 61656861     syscall_readahea
  212c60:	00000064 00000000                       d.......

0000000000212c68 <__FUNCTION__.5682>:
  212c68:	63737973 5f6c6c61 78746573 72747461     syscall_setxattr
	...

0000000000212c80 <__FUNCTION__.5685>:
  212c80:	63737973 5f6c6c61 7465736c 74746178     syscall_lsetxatt
  212c90:	00000072 00000000                       r.......

0000000000212c98 <__FUNCTION__.5688>:
  212c98:	63737973 5f6c6c61 74657366 74746178     syscall_fsetxatt
  212ca8:	00000072 00000000                       r.......

0000000000212cb0 <__FUNCTION__.5691>:
  212cb0:	63737973 5f6c6c61 78746567 72747461     syscall_getxattr
	...

0000000000212cc8 <__FUNCTION__.5694>:
  212cc8:	63737973 5f6c6c61 7465676c 74746178     syscall_lgetxatt
  212cd8:	00000072 00000000                       r.......

0000000000212ce0 <__FUNCTION__.5697>:
  212ce0:	63737973 5f6c6c61 74656766 74746178     syscall_fgetxatt
  212cf0:	00000072 00000000                       r.......

0000000000212cf8 <__FUNCTION__.5700>:
  212cf8:	63737973 5f6c6c61 7473696c 74746178     syscall_listxatt
  212d08:	00000072 00000000                       r.......

0000000000212d10 <__FUNCTION__.5703>:
  212d10:	63737973 5f6c6c61 73696c6c 74617874     syscall_llistxat
  212d20:	00007274 00000000                       tr......

0000000000212d28 <__FUNCTION__.5706>:
  212d28:	63737973 5f6c6c61 73696c66 74617874     syscall_flistxat
  212d38:	00007274 00000000                       tr......

0000000000212d40 <__FUNCTION__.5709>:
  212d40:	63737973 5f6c6c61 6f6d6572 61786576     syscall_removexa
  212d50:	00727474 00000000                       ttr.....

0000000000212d58 <__FUNCTION__.5712>:
  212d58:	63737973 5f6c6c61 6d65726c 7865766f     syscall_lremovex
  212d68:	72747461 00000000                       attr....

0000000000212d70 <__FUNCTION__.5715>:
  212d70:	63737973 5f6c6c61 6d657266 7865766f     syscall_fremovex
  212d80:	72747461 00000000                       attr....

0000000000212d88 <__FUNCTION__.5722>:
  212d88:	63737973 5f6c6c61 646e6573 656c6966     syscall_sendfile
  212d98:	00003436 00000000                       64......

0000000000212da0 <__FUNCTION__.5738>:
  212da0:	63737973 5f6c6c61 65686373 65675f64     syscall_sched_ge
  212db0:	66666174 74696e69 00000079 00000000     taffinity.......

0000000000212dc0 <__FUNCTION__.5741>:
  212dc0:	63737973 5f6c6c61 735f6f69 70757465     syscall_io_setup
	...

0000000000212dd8 <__FUNCTION__.5744>:
  212dd8:	63737973 5f6c6c61 645f6f69 72747365     syscall_io_destr
  212de8:	0000796f 00000000                       oy......

0000000000212df0 <__FUNCTION__.5747>:
  212df0:	63737973 5f6c6c61 675f6f69 76657465     syscall_io_getev
  212e00:	73746e65 00000000                       ents....

0000000000212e08 <__FUNCTION__.5750>:
  212e08:	63737973 5f6c6c61 735f6f69 696d6275     syscall_io_submi
  212e18:	00000074 00000000                       t.......

0000000000212e20 <__FUNCTION__.5753>:
  212e20:	63737973 5f6c6c61 635f6f69 65636e61     syscall_io_cance
  212e30:	0000006c 00000000                       l.......

0000000000212e38 <__FUNCTION__.5759>:
  212e38:	63737973 5f6c6c61 6b6f6f6c 645f7075     syscall_lookup_d
  212e48:	6b6f6f63 00006569                       cookie..

0000000000212e50 <__FUNCTION__.5762>:
  212e50:	63737973 5f6c6c61 6c6f7065 72635f6c     syscall_epoll_cr
  212e60:	65746165 00000000                       eate....

0000000000212e68 <__FUNCTION__.5765>:
  212e68:	63737973 5f6c6c61 6c6f7065 74635f6c     syscall_epoll_ct
  212e78:	0000006c 00000000                       l.......

0000000000212e80 <__FUNCTION__.5768>:
  212e80:	63737973 5f6c6c61 6c6f7065 61775f6c     syscall_epoll_wa
  212e90:	00007469 00000000                       it......

0000000000212e98 <__FUNCTION__.5771>:
  212e98:	63737973 5f6c6c61 616d6572 69665f70     syscall_remap_fi
  212ea8:	705f656c 73656761 00000000 00000000     le_pages........

0000000000212eb8 <__FUNCTION__.5819>:
  212eb8:	63737973 5f6c6c61 74617473 34367366     syscall_statfs64
	...

0000000000212ed0 <__FUNCTION__.5825>:
  212ed0:	63737973 5f6c6c61 61747366 36736674     syscall_fstatfs6
  212ee0:	00000034 00000000                       4.......

0000000000212ee8 <__FUNCTION__.5828>:
  212ee8:	63737973 5f6c6c61 696b6774 00006c6c     syscall_tgkill..

0000000000212ef8 <__FUNCTION__.5831>:
  212ef8:	63737973 5f6c6c61 6d697475 00007365     syscall_utimes..

0000000000212f08 <__FUNCTION__.5834>:
  212f08:	63737973 5f6c6c61 5f6d7261 76646166     syscall_arm_fadv
  212f18:	36657369 34365f34 00000000 00000000     ise64_64........

0000000000212f28 <__FUNCTION__.5837>:
  212f28:	63737973 5f6c6c61 63696370 69666e6f     syscall_pciconfi
  212f38:	6f695f67 65736162 00000000 00000000     g_iobase........

0000000000212f48 <__FUNCTION__.5840>:
  212f48:	63737973 5f6c6c61 63696370 69666e6f     syscall_pciconfi
  212f58:	65725f67 00006461                       g_read..

0000000000212f60 <__FUNCTION__.5843>:
  212f60:	63737973 5f6c6c61 63696370 69666e6f     syscall_pciconfi
  212f70:	72775f67 00657469                       g_write.

0000000000212f78 <__FUNCTION__.5881>:
  212f78:	63737973 5f6c6c61 74696177 00006469     syscall_waitid..

0000000000212f88 <__FUNCTION__.5918>:
  212f88:	63737973 5f6c6c61 6b636f73 61707465     syscall_socketpa
  212f98:	00007269 00000000                       ir......

0000000000212fa0 <__FUNCTION__.5949>:
  212fa0:	63737973 5f6c6c61 74756873 6e776f64     syscall_shutdown
	...

0000000000212fb8 <__FUNCTION__.5966>:
  212fb8:	63737973 5f6c6c61 646e6573 0067736d     syscall_sendmsg.

0000000000212fc8 <__FUNCTION__.5969>:
  212fc8:	63737973 5f6c6c61 76636572 0067736d     syscall_recvmsg.

0000000000212fd8 <__FUNCTION__.5972>:
  212fd8:	63737973 5f6c6c61 6f6d6573 00000070     syscall_semop...

0000000000212fe8 <__FUNCTION__.5975>:
  212fe8:	63737973 5f6c6c61 676d6573 00007465     syscall_semget..

0000000000212ff8 <__FUNCTION__.5978>:
  212ff8:	63737973 5f6c6c61 636d6573 00006c74     syscall_semctl..

0000000000213008 <__FUNCTION__.5981>:
  213008:	63737973 5f6c6c61 7367736d 0000646e     syscall_msgsnd..

0000000000213018 <__FUNCTION__.5984>:
  213018:	63737973 5f6c6c61 7267736d 00007663     syscall_msgrcv..

0000000000213028 <__FUNCTION__.5987>:
  213028:	63737973 5f6c6c61 6767736d 00007465     syscall_msgget..

0000000000213038 <__FUNCTION__.5990>:
  213038:	63737973 5f6c6c61 6367736d 00006c74     syscall_msgctl..

0000000000213048 <__FUNCTION__.6011>:
  213048:	63737973 5f6c6c61 5f646461 0079656b     syscall_add_key.

0000000000213058 <__FUNCTION__.6014>:
  213058:	63737973 5f6c6c61 75716572 5f747365     syscall_request_
  213068:	0079656b 00000000                       key.....

0000000000213070 <__FUNCTION__.6017>:
  213070:	63737973 5f6c6c61 6379656b 00006c74     syscall_keyctl..

0000000000213080 <__FUNCTION__.6020>:
  213080:	63737973 5f6c6c61 746d6573 64656d69     syscall_semtimed
  213090:	0000706f 00000000                       op......

0000000000213098 <__FUNCTION__.6023>:
  213098:	63737973 5f6c6c61 72657376 00726576     syscall_vserver.

00000000002130a8 <__FUNCTION__.6026>:
  2130a8:	63737973 5f6c6c61 72706f69 735f6f69     syscall_ioprio_s
  2130b8:	00007465 00000000                       et......

00000000002130c0 <__FUNCTION__.6029>:
  2130c0:	63737973 5f6c6c61 72706f69 675f6f69     syscall_ioprio_g
  2130d0:	00007465 00000000                       et......

00000000002130d8 <__FUNCTION__.6032>:
  2130d8:	63737973 5f6c6c61 746f6e69 5f796669     syscall_inotify_
  2130e8:	74696e69 00000000                       init....

00000000002130f0 <__FUNCTION__.6035>:
  2130f0:	63737973 5f6c6c61 746f6e69 5f796669     syscall_inotify_
  213100:	5f646461 63746177 00000068 00000000     add_watch.......

0000000000213110 <__FUNCTION__.6038>:
  213110:	63737973 5f6c6c61 746f6e69 5f796669     syscall_inotify_
  213120:	775f6d72 68637461 00000000 00000000     rm_watch........

0000000000213130 <__FUNCTION__.6041>:
  213130:	63737973 5f6c6c61 6e69626d 00000064     syscall_mbind...

0000000000213140 <__FUNCTION__.6044>:
  213140:	63737973 5f6c6c61 5f746567 706d656d     syscall_get_memp
  213150:	63696c6f 00000079                       olicy...

0000000000213158 <__FUNCTION__.6047>:
  213158:	63737973 5f6c6c61 5f746573 706d656d     syscall_set_memp
  213168:	63696c6f 00000079                       olicy...

0000000000213170 <__FUNCTION__.6050>:
  213170:	63737973 5f6c6c61 6e65706f 00007461     syscall_openat..

0000000000213180 <__FUNCTION__.6053>:
  213180:	63737973 5f6c6c61 69646b6d 00746172     syscall_mkdirat.

0000000000213190 <__FUNCTION__.6056>:
  213190:	63737973 5f6c6c61 6f6e6b6d 00746164     syscall_mknodat.

00000000002131a0 <__FUNCTION__.6059>:
  2131a0:	63737973 5f6c6c61 6f686366 74616e77     syscall_fchownat
	...

00000000002131b8 <__FUNCTION__.6062>:
  2131b8:	63737973 5f6c6c61 69747566 6173656d     syscall_futimesa
  2131c8:	00000074 00000000                       t.......

00000000002131d0 <__FUNCTION__.6065>:
  2131d0:	63737973 5f6c6c61 61747366 36746174     syscall_fstatat6
  2131e0:	00000034 00000000                       4.......

00000000002131e8 <__FUNCTION__.6068>:
  2131e8:	63737973 5f6c6c61 696c6e75 74616b6e     syscall_unlinkat
	...

0000000000213200 <__FUNCTION__.6071>:
  213200:	63737973 5f6c6c61 616e6572 7461656d     syscall_renameat
	...

0000000000213218 <__FUNCTION__.6074>:
  213218:	63737973 5f6c6c61 6b6e696c 00007461     syscall_linkat..

0000000000213228 <__FUNCTION__.6077>:
  213228:	63737973 5f6c6c61 6c6d7973 616b6e69     syscall_symlinka
  213238:	00000074 00000000                       t.......

0000000000213240 <__FUNCTION__.6080>:
  213240:	63737973 5f6c6c61 64616572 6b6e696c     syscall_readlink
  213250:	00007461 00000000                       at......

0000000000213258 <__FUNCTION__.6083>:
  213258:	63737973 5f6c6c61 6d686366 7461646f     syscall_fchmodat
	...

0000000000213270 <__FUNCTION__.6086>:
  213270:	63737973 5f6c6c61 63636166 61737365     syscall_faccessa
  213280:	00000074 00000000                       t.......

0000000000213288 <__FUNCTION__.6089>:
  213288:	63737973 5f6c6c61 6c657370 36746365     syscall_pselect6
	...

00000000002132a0 <__FUNCTION__.6092>:
  2132a0:	63737973 5f6c6c61 6c6f7070 0000006c     syscall_ppoll...

00000000002132b0 <__FUNCTION__.6095>:
  2132b0:	63737973 5f6c6c61 68736e75 00657261     syscall_unshare.

00000000002132c0 <__FUNCTION__.6098>:
  2132c0:	63737973 5f6c6c61 5f746573 75626f72     syscall_set_robu
  2132d0:	6c5f7473 00747369                       st_list.

00000000002132d8 <__FUNCTION__.6101>:
  2132d8:	63737973 5f6c6c61 5f746567 75626f72     syscall_get_robu
  2132e8:	6c5f7473 00747369                       st_list.

00000000002132f0 <__FUNCTION__.6104>:
  2132f0:	63737973 5f6c6c61 696c7073 00006563     syscall_splice..

0000000000213300 <__FUNCTION__.6107>:
  213300:	63737973 5f6c6c61 5f6d7261 636e7973     syscall_arm_sync
  213310:	6c69665f 61725f65 0065676e 00000000     _file_range.....

0000000000213320 <__FUNCTION__.6110>:
  213320:	63737973 5f6c6c61 00656574 00000000     syscall_tee.....

0000000000213330 <__FUNCTION__.6113>:
  213330:	63737973 5f6c6c61 70736d76 6563696c     syscall_vmsplice
	...

0000000000213348 <__FUNCTION__.6116>:
  213348:	63737973 5f6c6c61 65766f6d 6761705f     syscall_move_pag
  213358:	00007365 00000000                       es......

0000000000213360 <__FUNCTION__.6119>:
  213360:	63737973 5f6c6c61 63746567 00007570     syscall_getcpu..

0000000000213370 <__FUNCTION__.6122>:
  213370:	63737973 5f6c6c61 6c6f7065 77705f6c     syscall_epoll_pw
  213380:	00746961 00000000                       ait.....

0000000000213388 <__FUNCTION__.6125>:
  213388:	63737973 5f6c6c61 6578656b 6f6c5f63     syscall_kexec_lo
  213398:	00006461 00000000                       ad......

00000000002133a0 <__FUNCTION__.6128>:
  2133a0:	63737973 5f6c6c61 6d697475 61736e65     syscall_utimensa
  2133b0:	00000074 00000000                       t.......

00000000002133b8 <__FUNCTION__.6131>:
  2133b8:	63737973 5f6c6c61 6e676973 64666c61     syscall_signalfd
	...

00000000002133d0 <__FUNCTION__.6134>:
  2133d0:	63737973 5f6c6c61 656d6974 5f646672     syscall_timerfd_
  2133e0:	61657263 00006574                       create..

00000000002133e8 <__FUNCTION__.6137>:
  2133e8:	63737973 5f6c6c61 6e657665 00646674     syscall_eventfd.

00000000002133f8 <__FUNCTION__.6140>:
  2133f8:	63737973 5f6c6c61 6c6c6166 7461636f     syscall_fallocat
  213408:	00000065 00000000                       e.......

0000000000213410 <__FUNCTION__.6143>:
  213410:	63737973 5f6c6c61 656d6974 5f646672     syscall_timerfd_
  213420:	74746573 00656d69                       settime.

0000000000213428 <__FUNCTION__.6146>:
  213428:	63737973 5f6c6c61 656d6974 5f646672     syscall_timerfd_
  213438:	74746567 00656d69                       gettime.

0000000000213440 <__FUNCTION__.6149>:
  213440:	63737973 5f6c6c61 6e676973 64666c61     syscall_signalfd
  213450:	00000034 00000000                       4.......

0000000000213458 <__FUNCTION__.6152>:
  213458:	63737973 5f6c6c61 6e657665 32646674     syscall_eventfd2
	...

0000000000213470 <__FUNCTION__.6155>:
  213470:	63737973 5f6c6c61 6c6f7065 72635f6c     syscall_epoll_cr
  213480:	65746165 00000031                       eate1...

0000000000213488 <__FUNCTION__.6158>:
  213488:	63737973 5f6c6c61 33707564 00000000     syscall_dup3....

0000000000213498 <__FUNCTION__.6161>:
  213498:	63737973 5f6c6c61 65706970 00000032     syscall_pipe2...

00000000002134a8 <__FUNCTION__.6164>:
  2134a8:	63737973 5f6c6c61 746f6e69 5f796669     syscall_inotify_
  2134b8:	74696e69 00000031                       init1...

00000000002134c0 <__FUNCTION__.6167>:
  2134c0:	63737973 5f6c6c61 61657270 00007664     syscall_preadv..

00000000002134d0 <__FUNCTION__.6170>:
  2134d0:	63737973 5f6c6c61 69727770 00766574     syscall_pwritev.

00000000002134e0 <__FUNCTION__.6173>:
  2134e0:	63737973 5f6c6c61 745f7472 67697367     syscall_rt_tgsig
  2134f0:	75657571 666e6965 0000006f 00000000     queueinfo.......

0000000000213500 <__FUNCTION__.6176>:
  213500:	63737973 5f6c6c61 66726570 6576655f     syscall_perf_eve
  213510:	6f5f746e 006e6570                       nt_open.

0000000000213518 <__FUNCTION__.6179>:
  213518:	63737973 5f6c6c61 76636572 67736d6d     syscall_recvmmsg
	...

0000000000213530 <__FUNCTION__.6182>:
  213530:	63737973 5f6c6c61 65636361 00347470     syscall_accept4.

0000000000213540 <__FUNCTION__.6185>:
  213540:	63737973 5f6c6c61 6f6e6166 79666974     syscall_fanotify
  213550:	696e695f 00000074                       _init...

0000000000213558 <__FUNCTION__.6188>:
  213558:	63737973 5f6c6c61 6f6e6166 79666974     syscall_fanotify
  213568:	72616d5f 0000006b                       _mark...

0000000000213570 <__FUNCTION__.6198>:
  213570:	63737973 5f6c6c61 656d616e 5f6f745f     syscall_name_to_
  213580:	646e6168 615f656c 00000074 00000000     handle_at.......

0000000000213590 <__FUNCTION__.6201>:
  213590:	63737973 5f6c6c61 6e65706f 5f79625f     syscall_open_by_
  2135a0:	646e6168 615f656c 00000074 00000000     handle_at.......

00000000002135b0 <__FUNCTION__.6204>:
  2135b0:	63737973 5f6c6c61 636f6c63 64615f6b     syscall_clock_ad
  2135c0:	6d69746a 00000065                       jtime...

00000000002135c8 <__FUNCTION__.6207>:
  2135c8:	63737973 5f6c6c61 636e7973 00007366     syscall_syncfs..

00000000002135d8 <__FUNCTION__.6210>:
  2135d8:	63737973 5f6c6c61 646e6573 67736d6d     syscall_sendmmsg
	...

00000000002135f0 <__FUNCTION__.6213>:
  2135f0:	63737973 5f6c6c61 6e746573 00000073     syscall_setns...

0000000000213600 <__FUNCTION__.6216>:
  213600:	63737973 5f6c6c61 636f7270 5f737365     syscall_process_
  213610:	725f6d76 76646165 00000000 00000000     vm_readv........

0000000000213620 <__FUNCTION__.6219>:
  213620:	63737973 5f6c6c61 636f7270 5f737365     syscall_process_
  213630:	775f6d76 65746972 00000076 00000000     vm_writev.......

0000000000213640 <__FUNCTION__.6222>:
  213640:	63737973 5f6c6c61 706d636b 00000000     syscall_kcmp....

0000000000213650 <__FUNCTION__.6225>:
  213650:	63737973 5f6c6c61 696e6966 6f6d5f74     syscall_finit_mo
  213660:	656c7564 00000000                       dule....

0000000000213668 <__FUNCTION__.6228>:
  213668:	63737973 5f6c6c61 65686373 65735f64     syscall_sched_se
  213678:	74746174 00000072                       tattr...

0000000000213680 <__FUNCTION__.6231>:
  213680:	63737973 5f6c6c61 65686373 65675f64     syscall_sched_ge
  213690:	74746174 00000072                       tattr...

0000000000213698 <__FUNCTION__.6234>:
  213698:	63737973 5f6c6c61 616e6572 7461656d     syscall_renameat
  2136a8:	00000032 00000000                       2.......

00000000002136b0 <__FUNCTION__.6237>:
  2136b0:	63737973 5f6c6c61 63636573 00706d6f     syscall_seccomp.

00000000002136c0 <__FUNCTION__.6245>:
  2136c0:	63737973 5f6c6c61 666d656d 72635f64     syscall_memfd_cr
  2136d0:	65746165 00000000                       eate....

00000000002136d8 <__FUNCTION__.6248>:
  2136d8:	63737973 5f6c6c61 00667062 00000000     syscall_bpf.....

00000000002136e8 <__FUNCTION__.6251>:
  2136e8:	63737973 5f6c6c61 63657865 74616576     syscall_execveat
	...

0000000000213700 <__FUNCTION__.6254>:
  213700:	63737973 5f6c6c61 72657375 6c756166     syscall_userfaul
  213710:	00646674 00000000                       tfd.....

0000000000213718 <__FUNCTION__.6257>:
  213718:	63737973 5f6c6c61 626d656d 69727261     syscall_membarri
  213728:	00007265 00000000                       er......

0000000000213730 <__FUNCTION__.6260>:
  213730:	63737973 5f6c6c61 636f6c6d 0000326b     syscall_mlock2..

0000000000213740 <__FUNCTION__.6263>:
  213740:	63737973 5f6c6c61 79706f63 6c69665f     syscall_copy_fil
  213750:	61725f65 0065676e                       e_range.

0000000000213758 <__FUNCTION__.6266>:
  213758:	63737973 5f6c6c61 61657270 00327664     syscall_preadv2.

0000000000213768 <__FUNCTION__.6269>:
  213768:	63737973 5f6c6c61 69727770 32766574     syscall_pwritev2
	...

0000000000213780 <__FUNCTION__.6272>:
  213780:	63737973 5f6c6c61 79656b70 72706d5f     syscall_pkey_mpr
  213790:	6365746f 00000074                       otect...

0000000000213798 <__FUNCTION__.6275>:
  213798:	63737973 5f6c6c61 79656b70 6c6c615f     syscall_pkey_all
  2137a8:	0000636f 00000000                       oc......

00000000002137b0 <__FUNCTION__.6278>:
  2137b0:	63737973 5f6c6c61 79656b70 6572665f     syscall_pkey_fre
  2137c0:	00000065 00000000                       e.......

00000000002137c8 <__FUNCTION__.6281>:
  2137c8:	63737973 5f6c6c61 74617473 00000078     syscall_statx...

00000000002137d8 <__FUNCTION__.6284>:
  2137d8:	63737973 5f6c6c61 71657372 00000000     syscall_rseq....

00000000002137e8 <__FUNCTION__.6287>:
  2137e8:	63737973 5f6c6c61 705f6f69 65746567     syscall_io_pgete
  2137f8:	746e6576 00000073                       vents...

0000000000213800 <syscall_table>:
  213800:	00205a58 00000000 002039e8 00000000     XZ ......9 .....
  213810:	00206290 00000000 00205fd8 00000000     .b ......_ .....
  213820:	00205fc0 00000000 00205fa8 00000000     ._ ......_ .....
  213830:	002039d8 00000000 00000000 00000000     .9 .............
  213840:	00205a38 00000000 00205a18 00000000     8Z ......Z .....
  213850:	002039c8 00000000 00205f90 00000000     .9 ......_ .....
  213860:	002039b8 00000000 00000000 00000000     .9 .............
  213870:	002059f8 00000000 002059d8 00000000     .Y ......Y .....
  213880:	002059b8 00000000 00000000 00000000     .Y .............
	...
  213898:	002062c0 00000000 00206288 00000000     .b ......b .....
  2138a8:	00205998 00000000 00000000 00000000     .Y .............
  2138b8:	00205978 00000000 00205958 00000000     xY .....XY .....
	...
  2138d0:	00205938 00000000 00000000 00000000     8Y .............
	...
  2138e8:	00205918 00000000 00000000 00000000     .Y .............
	...
  213908:	00205be0 00000000 002058f8 00000000     .[ ......X .....
	...
  213920:	002058d8 00000000 00205bd0 00000000     .X ......[ .....
  213930:	00205bc0 00000000 00205bb0 00000000     .[ ......[ .....
  213940:	002039a8 00000000 00203998 00000000     .9 ......9 .....
  213950:	00203988 00000000 002058b8 00000000     .9 ......X .....
	...
  213968:	00203978 00000000 00205898 00000000     x9 ......X .....
  213978:	00205878 00000000 00000000 00000000     xX .............
  213988:	00205858 00000000 00205838 00000000     XX .....8X .....
  213998:	00205818 00000000 002057f8 00000000     .X ......W .....
	...
  2139b0:	00206298 00000000 00205f70 00000000     .b .....p_ .....
	...
  2139c8:	002057d8 00000000 00000000 00000000     .W .............
	...
  2139e0:	002057b8 00000000 00205798 00000000     .W ......W .....
  2139f0:	00205778 00000000 00205ba0 00000000     xW ......[ .....
  213a00:	00205758 00000000 00205738 00000000     XW .....8W .....
  213a10:	00206280 00000000 002060f8 00000000     .b ......` .....
	...
  213a30:	00205718 00000000 002056f8 00000000     .W ......V .....
  213a40:	002056d8 00000000 002056b8 00000000     .V ......V .....
  213a50:	00205698 00000000 00205b90 00000000     .V ......[ .....
	...
  213a68:	00205678 00000000 00205658 00000000     xV .....XV .....
  213a78:	00205638 00000000 00205618 00000000     8V ......V .....
  213a88:	002055f8 00000000 00000000 00000000     .U .............
  213a98:	002055d8 00000000 00000000 00000000     .U .............
  213aa8:	00205f58 00000000 002055b8 00000000     X_ ......U .....
  213ab8:	00205598 00000000 00205578 00000000     .U .....xU .....
	...
  213ad8:	00205b80 00000000 00205558 00000000     .[ .....XU .....
  213ae8:	00205538 00000000 00205518 00000000     8U ......U .....
  213af8:	002054f8 00000000 002054d8 00000000     .T ......T .....
  213b08:	002054b8 00000000 00000000 00000000     .T .............
  213b18:	00205498 00000000 00205478 00000000     .T .....xT .....
	...
  213b38:	00205458 00000000 00205438 00000000     XT .....8T .....
  213b48:	00205418 00000000 00205b58 00000000     .T .....X[ .....
  213b58:	00205b68 00000000 002053f8 00000000     h[ ......S .....
	...
  213b78:	002053d8 00000000 00000000 00000000     .S .............
	...
  213b90:	002053b8 00000000 00205398 00000000     .S ......S .....
  213ba0:	00205378 00000000 00000000 00000000     xS .............
  213bb0:	00203968 00000000 00205358 00000000     h9 .....XS .....
  213bc0:	00205338 00000000 00205318 00000000     8S ......S .....
  213bd0:	002052f8 00000000 00000000 00000000     .R .............
  213be0:	002052d8 00000000 002052b8 00000000     .R ......R .....
  213bf0:	002060d0 00000000 00000000 00000000     .` .............
  213c00:	00205298 00000000 00205278 00000000     .R .....xR .....
	...
  213c18:	00205258 00000000 00205238 00000000     XR .....8R .....
  213c28:	00205218 00000000 002051f8 00000000     .R ......Q .....
  213c38:	002051d8 00000000 002051b8 00000000     .Q ......Q .....
	...
  213c50:	00205198 00000000 00205178 00000000     .Q .....xQ .....
  213c60:	00205f28 00000000 00205f08 00000000     (_ ......_ .....
  213c70:	002061c0 00000000 00205158 00000000     .a .....XQ .....
  213c80:	00205138 00000000 00205e58 00000000     8Q .....X^ .....
  213c90:	00205d98 00000000 00205118 00000000     .] ......Q .....
  213ca0:	002050f8 00000000 002050d8 00000000     .P ......P .....
  213cb0:	002050b8 00000000 00205098 00000000     .P ......P .....
  213cc0:	00205078 00000000 00205058 00000000     xP .....XP .....
  213cd0:	00205b48 00000000 00205b38 00000000     H[ .....8[ .....
  213ce0:	00205d80 00000000 00205d68 00000000     .] .....h] .....
  213cf0:	00205038 00000000 00203958 00000000     8P .....X9 .....
  213d00:	00203948 00000000 00205018 00000000     H9 ......P .....
  213d10:	00205b28 00000000 002061a0 00000000     ([ ......a .....
  213d20:	00204ff8 00000000 00204fd8 00000000     .O ......O .....
	...
  213d40:	00205d50 00000000 00204fb8 00000000     P] ......O .....
  213d50:	00204f98 00000000 00204f78 00000000     .O .....xO .....
  213d60:	00204f58 00000000 00204f38 00000000     XO .....8O .....
  213d70:	002060a8 00000000 00206080 00000000     .` ......` .....
  213d80:	00204f18 00000000 00204ef8 00000000     .O ......N .....
  213d90:	00204ed8 00000000 00204eb8 00000000     .N ......N .....
  213da0:	00204e98 00000000 00204e78 00000000     .N .....xN .....
  213db0:	00204e58 00000000 00205b18 00000000     XN ......[ .....
  213dc0:	00204e38 00000000 00204e18 00000000     8N ......N .....
  213dd0:	00204df8 00000000 00204dd8 00000000     .M ......M .....
	...
  213df0:	00206278 00000000 00205b08 00000000     xb ......[ .....
  213e00:	00206250 00000000 00204db8 00000000     Pb ......M .....
  213e10:	00204d98 00000000 00205b70 00000000     .M .....p[ .....
  213e20:	00205b78 00000000 00205af8 00000000     x[ ......Z .....
  213e30:	00204d78 00000000 00204d58 00000000     xM .....XM .....
  213e40:	00204d38 00000000 00204d18 00000000     8M ......M .....
  213e50:	00204cf8 00000000 00204cd8 00000000     .L ......L .....
  213e60:	00204cb8 00000000 00204c98 00000000     .L ......L .....
  213e70:	00204c78 00000000 00204c58 00000000     xL .....XL .....
  213e80:	00204c38 00000000 00204c18 00000000     8L ......L .....
  213e90:	00204bf8 00000000 00204bd8 00000000     .K ......K .....
  213ea0:	00204bb8 00000000 00204b98 00000000     .K ......K .....
  213eb0:	00204b78 00000000 00204b58 00000000     xK .....XK .....
  213ec0:	00204b38 00000000 00205f20 00000000     8K ..... _ .....
  213ed0:	00204b18 00000000 00204af8 00000000     .K ......J .....
  213ee0:	00205d38 00000000 00205f88 00000000     8] ......_ .....
	...
  213f00:	00206270 00000000 00204ad8 00000000     pb ......J .....
  213f10:	00204ab8 00000000 00204a98 00000000     .J ......J .....
  213f20:	00204a78 00000000 00204a58 00000000     xJ .....XJ .....
  213f30:	00204a38 00000000 00204a18 00000000     8J ......J .....
  213f40:	002049f8 00000000 002049d8 00000000     .I ......I .....
  213f50:	002049b8 00000000 00204998 00000000     .I ......I .....
  213f60:	00204978 00000000 00204958 00000000     xI .....XI .....
  213f70:	00205ad8 00000000 00204938 00000000     .Z .....8I .....
  213f80:	00206220 00000000 00205d10 00000000      b ......] .....
  213f90:	00204918 00000000 002048f8 00000000     .I ......H .....
  213fa0:	002048d8 00000000 002048b8 00000000     .H ......H .....
  213fb0:	00204898 00000000 00204878 00000000     .H .....xH .....
  213fc0:	00203938 00000000 00204858 00000000     89 .....XH .....
  213fd0:	00204838 00000000 00204818 00000000     8H ......H .....
  213fe0:	002047f8 00000000 002047d8 00000000     .G ......G .....
	...
  214000:	00203928 00000000 00205cf8 00000000     (9 ......\ .....
  214010:	00206068 00000000 00205ac8 00000000     h` ......Z .....
  214020:	00203918 00000000 00203908 00000000     .9 ......9 .....
  214030:	00205ab8 00000000 00205aa8 00000000     .Z ......Z .....
  214040:	00205a98 00000000 00206050 00000000     .Z .....P` .....
  214050:	002047b8 00000000 00204798 00000000     .G ......G .....
  214060:	00204778 00000000 00204758 00000000     xG .....XG .....
  214070:	00204738 00000000 00204718 00000000     8G ......G .....
  214080:	002046f8 00000000 002046d8 00000000     .F ......F .....
  214090:	00206038 00000000 002038f8 00000000     8` ......8 .....
  2140a0:	00206180 00000000 00206160 00000000     .a .....`a .....
  2140b0:	00205a88 00000000 00205ce0 00000000     .Z ......\ .....
  2140c0:	002046b8 00000000 00205cc8 00000000     .F ......\ .....
  2140d0:	00205cb0 00000000 00205c98 00000000     .\ ......\ .....
  2140e0:	00205a78 00000000 00205c80 00000000     xZ ......\ .....
  2140f0:	00205c68 00000000 00205c50 00000000     h\ .....P\ .....
  214100:	00204698 00000000 00206020 00000000     .F ..... ` .....
  214110:	00206200 00000000 00206008 00000000     .b ......` .....
  214120:	002061e0 00000000 00204678 00000000     .a .....xF .....
  214130:	00206140 00000000 00206120 00000000     @a ..... a .....
  214140:	00204658 00000000 00204638 00000000     XF .....8F .....
  214150:	00204618 00000000 002045f8 00000000     .F ......E .....
  214160:	002045d8 00000000 002045b8 00000000     .E ......E .....
  214170:	00204598 00000000 00204578 00000000     .E .....xE .....
  214180:	00204558 00000000 00205c38 00000000     XE .....8\ .....
  214190:	002038e8 00000000 00205c20 00000000     .8 ..... \ .....
  2141a0:	00205c08 00000000 00204538 00000000     .\ .....8E .....
  2141b0:	00204518 00000000 002044f8 00000000     .E ......D .....
  2141c0:	002044d8 00000000 002044b8 00000000     .D ......D .....
  2141d0:	00204498 00000000 00204478 00000000     .D .....xD .....
  2141e0:	00204458 00000000 00204438 00000000     XD .....8D .....
  2141f0:	00204418 00000000 002043f8 00000000     .D ......C .....
  214200:	002043d8 00000000 002043b8 00000000     .C ......C .....
  214210:	00204398 00000000 00204378 00000000     .C .....xC .....
  214220:	00204358 00000000 00204338 00000000     XC .....8C .....
  214230:	00204318 00000000 002042f8 00000000     .C ......B .....
  214240:	002042d8 00000000 002042b8 00000000     .B ......B .....
  214250:	00204298 00000000 00204278 00000000     .B .....xB .....
  214260:	00204258 00000000 00204238 00000000     XB .....8B .....
  214270:	00204218 00000000 002041f8 00000000     .B ......A .....
  214280:	002041d8 00000000 002041b8 00000000     .A ......A .....
  214290:	00204198 00000000 00204178 00000000     .A .....xA .....
  2142a0:	00204158 00000000 00204138 00000000     XA .....8A .....
  2142b0:	00204118 00000000 002040f8 00000000     .A ......@ .....
  2142c0:	002040d8 00000000 002040b8 00000000     .@ ......@ .....
  2142d0:	00204098 00000000 00204078 00000000     .@ .....x@ .....
  2142e0:	00204058 00000000 00204038 00000000     X@ .....8@ .....
  2142f0:	00204018 00000000 00203ff8 00000000     .@ ......? .....
  214300:	00203fd8 00000000 00203fb8 00000000     .? ......? .....
  214310:	00203f98 00000000 00203f78 00000000     .? .....x? .....
  214320:	00203f58 00000000 00203f38 00000000     X? .....8? .....
  214330:	00203f18 00000000 00203ef8 00000000     .? ......> .....
  214340:	00203ed8 00000000 00203eb8 00000000     .> ......> .....
  214350:	00203e98 00000000 00203e78 00000000     .> .....x> .....
  214360:	00203e58 00000000 00203e38 00000000     X> .....8> .....
  214370:	00203e18 00000000 00203df8 00000000     .> ......= .....
  214380:	00203dd8 00000000 00205ff0 00000000     .= ......_ .....
  214390:	00203db8 00000000 00203d98 00000000     .= ......= .....
  2143a0:	00203d78 00000000 00203d58 00000000     x= .....X= .....
  2143b0:	00203d38 00000000 00203d18 00000000     8= ......= .....
  2143c0:	00203cf8 00000000 00203cd8 00000000     .< ......< .....
  2143d0:	00203cb8 00000000 00203c98 00000000     .< ......< .....
  2143e0:	00203c78 00000000 00203c58 00000000     x< .....X< .....
  2143f0:	00203c38 00000000 00203c18 00000000     8< ......< .....
  214400:	00205bf0 00000000 00203bf8 00000000     .[ ......; .....
  214410:	00203bd8 00000000 00203bb8 00000000     .; ......; .....
  214420:	00203b98 00000000 00203b78 00000000     .; .....x; .....
  214430:	00203b58 00000000 00203b38 00000000     X; .....8; .....
  214440:	00203b18 00000000 00203af8 00000000     .; ......: .....
  214450:	00203ad8 00000000 00203ab8 00000000     .: ......: .....
  214460:	00203a98 00000000 00203a78 00000000     .: .....x: .....
  214470:	00203a58 00000000 00203a38 00000000     X: .....8: .....
  214480:	002038d8 00000000 335b1b0a 5b206d31     .8 .......[31m [
  214490:	74706d65 79732079 6c616373 203a5d6c     empty syscall]: 
  2144a0:	6d305b1b 00000000                       .[0m....

00000000002144a8 <bin_tab>:
  2144a8:	23222120 25252424 27272626 28282828      !"#$$%%&&''((((
  2144b8:	29292929 2a2a2a2a 2b2b2b2b 2c2c2c2c     ))))****++++,,,,
  2144c8:	2c2c2c2c 2d2d2d2d 2d2d2d2d 2e2e2e2e     ,,,,--------....
  2144d8:	2e2e2e2e 2f2f2f2f 2f2f2f2f 00000000     ....////////....

00000000002144e8 <stderr>:
  2144e8:	00215008 00000000                       .P!.....

00000000002144f0 <stdout>:
  2144f0:	002150f8 00000000 020b3302 143c0202     .P!......3....<.
  214500:	02024f2a 02020202 0000451d 00000000     *O.......E......
	...
  21451c:	40030000 00000000 00000000 00000000     ...@............
  21452c:	40700000 00000001 00000000 00000000     ..p@............
  21453c:	40700000 00000000 00000000 00000000     ..p@............
  21454c:	3ffe0000 00000000 00000000 00000000     ...?............
  21455c:	3fff0000 00000000 00000000 00000000     ...?............
  21456c:	3fff8000 00000000 00000000 00000000     ...?............
  21457c:	401b0000 00000000 00000000 50000000     ...@...........P
  21458c:	401cdcd6 ff960014 ff9600d2 00140014     ...@............
  21459c:	ff960014 ff96ff96 ff96ff96 ff96ff96     ................
  2145ac:	ff96ff96 ff96ff96 ff9600ed ff96ff96     ................
  2145bc:	00f2ff96 ff96ff96 ff96ff96 ff96ff96     ................
  2145cc:	ff96ff96 ff960014 013100b5 00140014     ..........1.....
  2145dc:	ff960014 ff960131 ff96ff96 01280121     ....1.......!.(.
  2145ec:	0107010e ff96ff96 ff9600c4 ff96008c     ................
  2145fc:	00f2ff96 2b58302d 30205830 78302d58     ....-0X+0X 0X-0x
  21460c:	2078302b 00007830 00000000 00666e69     +0x 0x......inf.
  21461c:	00000000 00464e49 00000000 004e414e     ....INF.....NAN.
  21462c:	00000000 006e616e 00000000 0000002e     ....nan.........
  21463c:	00000000 20202b2d 30583020 00000078     ....-+   0X0x...
  21464c:	00000000 6c756e28 0000296c              ....(null)..

0000000000214658 <states>:
  214658:	000a0019 00191919 05000000 00000000     ................
  214668:	00090000 0b000000 00000000 00000000     ................
  214678:	0a110019 03191919 0100070a 180b091b     ................
  214688:	06090000 0b00000b 00190600 19190000     ................
  214698:	00000019 00000000 00000000 00000000     ................
  2146a8:	00000e00 00000000 00190000 19190d0a     ................
  2146b8:	000d0019 09000200 0000000e 000e0009     ................
  2146c8:	00000e00 00000000 00000000 00000000     ................
	...
  2146e0:	0c000000 00000000 00000000 13000000     ................
  2146f0:	00000000 00000013 000c0900 00000000     ................
  214700:	0c00000c 00000000 00000000 00000000     ................
	...
  21471c:	00001000 00000000 00000000 00000f00     ................
  21472c:	000f0400 09000000 00000010 00100000     ................
  21473c:	00001000 00000000 00000000 00000000     ................
	...
  214754:	12000000 00000000 00000000 11000000     ................
  214764:	00000000 00000011 00120900 00000000     ................
  214774:	12000012 001a0000 1a1a0000 0000001a     ................
	...
  214798:	001a0000 1a1a0000 0000001a 09000000     ................
	...
  2147c8:	14000000 00000000 00000000 17000000     ................
  2147d8:	00000000 00000017 00140900 00000000     ................
  2147e8:	14000014 00000000 00000000 00000000     ................
	...
  214804:	00001600 00000000 00000000 00001500     ................
  214814:	00150000 09000000 00000016 00160000     ................
  214824:	00001600                                ....

0000000000214828 <xdigits>:
  214828:	33323130 37363534 42413938 46454443     0123456789ABCDEF
	...
  21487c:	40770000                                ..w@

0000000000214880 <all_mask>:
  214880:	ffffffff ffffffff                       ........

0000000000214888 <app_mask>:
  214888:	7fffffff fffffffc 656b5f5f 6c656e72     ........__kernel
  214898:	6f6c635f 675f6b63 69747465 0000656d     _clock_gettime..
  2148a8:	554e494c 2e325f58 39332e36 00000000     LINUX_2.6.39....
  2148b8:	7f7fffff 749dc5ae 00800000              .......t....

00000000002148c4 <__EH_FRAME_BEGIN__>:
  2148c4:	00000000                                ....
