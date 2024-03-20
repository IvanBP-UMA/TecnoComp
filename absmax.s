.data
mytam:      .word 8
myvect:     .word 8,-9,4,-2,5,7,6,1
myres:      .word 0
 
.text
.global main
main: 
	push {lr}
    ldr r0, =myvect
    ldr r1, =mytam
    ldr r1, [r1]
    bl absmax
    ldr r1, =myres
    str r0, [r1]
    pop {lr}
    mov pc, lr
 
abs:
	mov r1, #0
    cmp r0, r1
    sublt r0, r1, r0
    mov pc, lr
                 
absmax:
	push {lr}
	push {r4}
	ldr r2, [r0], #4
	push {r0-r1}
	mov r0, r2
	bl abs
	mov r4, r0
	pop {r0-r1}
	ldr r2, [r0]
	
	for:
		cmp r1, #0
		beq exitAbsmax
		push {r0-r1}
		mov r0, r2
		bl abs
		mov r3, r0
		cmp r3, r4
		movgt r4, r3
		pop {r0-r1}
		ldr r2, [r0], #4
		sub r1, #1
		b for
	
	exitAbsmax:
		mov r0, r4
		pop {r4}
		pop {lr}
		bx lr
		
	
	