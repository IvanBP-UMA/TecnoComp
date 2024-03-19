.data
vector1:  .word 1,2,3,4,5,6,7,8
vector2:  .word 0,0,0,0,0,0,0,0
len:      .word 8
 
.text
  push {lr}
  ldr r0, =vector1
  ldr r1, =len
  ldr r1, [r1]
  ldr r2, =vector2
  bl reverse
  pop {lr}
  bx lr
 
reverse: mov r3, #0
		sub r1, #1
	for: cmp r1, #0
		blt exit
		ldr r3, [r0, r1, lsl #2]
		str r3, [r2], #4
		sub r1, #1
		b for
	exit: mov pc, lr
	