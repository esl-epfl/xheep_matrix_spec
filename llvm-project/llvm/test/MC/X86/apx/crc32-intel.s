# RUN: llvm-mc -triple x86_64 -x86-asm-syntax=intel -output-asm-variant=1 --show-encoding %s | FileCheck %s

# CHECK: {evex}	crc32	ebx, al
# CHECK: encoding: [0x62,0xf4,0x7c,0x08,0xf0,0xd8]
         {evex}	crc32	ebx, al

# CHECK: {evex}	crc32	rbx, al
# CHECK: encoding: [0x62,0xf4,0xfc,0x08,0xf0,0xd8]
         {evex}	crc32	rbx, al

# CHECK: {evex}	crc32	ebx, ax
# CHECK: encoding: [0x62,0xf4,0x7d,0x08,0xf1,0xd8]
         {evex}	crc32	ebx, ax

# CHECK: {evex}	crc32	ebx, eax
# CHECK: encoding: [0x62,0xf4,0x7c,0x08,0xf1,0xd8]
         {evex}	crc32	ebx, eax

# CHECK: {evex}	crc32	rbx, rax
# CHECK: encoding: [0x62,0xf4,0xfc,0x08,0xf1,0xd8]
         {evex}	crc32	rbx, rax

# CHECK: {evex}	crc32	ecx, word ptr [rax + 4*rbx + 291]
# CHECK: encoding: [0x62,0xf4,0x7d,0x08,0xf1,0x8c,0x98,0x23,0x01,0x00,0x00]
         {evex}	crc32	ecx, word ptr [rax + 4*rbx + 291]

# CHECK: {evex}	crc32	ecx, dword ptr [rax + 4*rbx + 291]
# CHECK: encoding: [0x62,0xf4,0x7c,0x08,0xf1,0x8c,0x98,0x23,0x01,0x00,0x00]
         {evex}	crc32	ecx, dword ptr [rax + 4*rbx + 291]

# CHECK: {evex}	crc32	rcx, byte ptr [rax + 4*rbx + 291]
# CHECK: encoding: [0x62,0xf4,0xfc,0x08,0xf0,0x8c,0x98,0x23,0x01,0x00,0x00]
         {evex}	crc32	rcx, byte ptr [rax + 4*rbx + 291]

# CHECK: {evex}	crc32	rcx, qword ptr [rax + 4*rbx + 291]
# CHECK: encoding: [0x62,0xf4,0xfc,0x08,0xf1,0x8c,0x98,0x23,0x01,0x00,0x00]
         {evex}	crc32	rcx, qword ptr [rax + 4*rbx + 291]

# CHECK: crc32	r22d, r16b
# CHECK: encoding: [0x62,0xec,0x7c,0x08,0xf0,0xf0]
         crc32	r22d, r16b

# CHECK: crc32	r23, r16b
# CHECK: encoding: [0x62,0xec,0xfc,0x08,0xf0,0xf8]
         crc32	r23, r16b

# CHECK: crc32	r22d, r17w
# CHECK: encoding: [0x62,0xec,0x7d,0x08,0xf1,0xf1]
         crc32	r22d, r17w

# CHECK: crc32	r22d, r18d
# CHECK: encoding: [0x62,0xec,0x7c,0x08,0xf1,0xf2]
         crc32	r22d, r18d

# CHECK: crc32	r23, r19
# CHECK: encoding: [0x62,0xec,0xfc,0x08,0xf1,0xfb]
         crc32	r23, r19

# CHECK: crc32	r18d, word ptr [r28 + 4*r29 + 291]
# CHECK: encoding: [0x62,0x8c,0x79,0x08,0xf1,0x94,0xac,0x23,0x01,0x00,0x00]
         crc32	r18d, word ptr [r28 + 4*r29 + 291]

# CHECK: crc32	r18d, dword ptr [r28 + 4*r29 + 291]
# CHECK: encoding: [0x62,0x8c,0x78,0x08,0xf1,0x94,0xac,0x23,0x01,0x00,0x00]
         crc32	r18d, dword ptr [r28 + 4*r29 + 291]

# CHECK: crc32	r19, byte ptr [r28 + 4*r29 + 291]
# CHECK: encoding: [0x62,0x8c,0xf8,0x08,0xf0,0x9c,0xac,0x23,0x01,0x00,0x00]
         crc32	r19, byte ptr [r28 + 4*r29 + 291]

# CHECK: crc32	r19, qword ptr [r28 + 4*r29 + 291]
# CHECK: encoding: [0x62,0x8c,0xf8,0x08,0xf1,0x9c,0xac,0x23,0x01,0x00,0x00]
         crc32	r19, qword ptr [r28 + 4*r29 + 291]

# CHECK: crc32	r18d, word ptr [r28 + 4*r29 + 123]
# CHECK: encoding: [0x62,0x8c,0x79,0x08,0xf1,0x54,0xac,0x7b]
         crc32	r18d, word ptr [r28 + 4*r29 + 123]

# CHECK: crc32	r18d, dword ptr [r28 + 4*r29 + 123]
# CHECK: encoding: [0x62,0x8c,0x78,0x08,0xf1,0x54,0xac,0x7b]
         crc32	r18d, dword ptr [r28 + 4*r29 + 123]

# CHECK: crc32	r19, byte ptr [r28 + 4*r29 + 123]
# CHECK: encoding: [0x62,0x8c,0xf8,0x08,0xf0,0x5c,0xac,0x7b]
         crc32	r19, byte ptr [r28 + 4*r29 + 123]

# CHECK: crc32	r19, qword ptr [r28 + 4*r29 + 123]
# CHECK: encoding: [0x62,0x8c,0xf8,0x08,0xf1,0x5c,0xac,0x7b]
         crc32	r19, qword ptr [r28 + 4*r29 + 123]