.data
len: .word 8
A: .word 8,-3,4,-7,1,-7,6,-1

.text
.global main
main:
	push {lr}
    ldr r0, =A		@Array
    ldr r1, =len  
    ldr r1, [r1]	@Longitud array
    bl sort
    pop {lr}
    bx lr

sort:
	push {r4-r6}
	mov r4, r1
	sub r4, #1		@r4 -> Array.lenght - 1
	mov r2, #0		@r2 -> i
	mov r3, #0		@r3 -> j
	fori:
		cmp r2, r4
		beq exitSort
		mov r3, r2
		add r3, #1
		forj:
			cmp r3, r1
			beq continueFori
			ldr r5, [r0, r2, LSL #2]
			ldr r6, [r0, r3, LSL #2]
			
			cmp r5, r6
			ble continueForj
			
			push {lr}
			push {r1-r3}
			mov r1, r2
			mov r2, r3
			bl switch
			pop {r1-r3}
			pop {lr}
			
			continueForj:
			add r3, #1
			b forj
			
		continueFori:
		add r2, #1
		b fori
	
	exitSort:
		pop {r4-r6}
		bx lr
		
switch:
	push {r4}
	
	ldr r3, [r0, r1, LSL #2]
	ldr r4, [r0, r2, LSL #2]
	str r4, [r0, r1, LSL #2]
	str r3, [r0, r2, LSL #2]
	
	pop {r4}
	bx lr