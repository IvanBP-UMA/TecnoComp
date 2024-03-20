.data
len: .word 8
A: .word 8,-3,4,-7,1,-7,6,-1

.text
.global main
main:
	push {lr}
    ldr r0, =A
    ldr r1, =len
    ldr r1, [r1]
    bl sort
    pop {lr}
    bx lr

sort: 
	push {r4-r6}
	mov r4, r1
	sub r4, #1
	mov r2, #0
	mov r3, #0
	fori:
		cmp r4, r2
		beq exitSort
		forj:
			cmp r1, r3
			ldr r5, [r0, r3, lsl #2]
			add r3, #1
			ldr r6, [r0, r3, lsl #2]
			cmp r5, r6
			push {r0-r3}
			mov r1, r5
			bgt switch
			
	
	exitSort:
		pop {r4}
		bx lr
	