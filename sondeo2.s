.data
leds: .word 1, 2, 4, 8, 16, 32, 64, 128, 256, 512
tam: .word 10

.text
.global main
main:
push {lr}
ldr r0, =leds
ldr r1, =tam
ldr r1, [r1]

bl ledseq

pop {lr}
bx lr

ledseq:
	push {r4}
	mov r2, #0
	mov r4, #0
	loop:
		cmp r2, r1
		subeq r2, r2, r1
		ldr r3, [r0, r2, LSL #2]
		
		push {r0-r3}
		push {lr}
		mov r0, r3
		bl setLEDsStatus
		pop {lr}
		pop {r0-r3}
		
		push {r0-r3}
		push {lr}
		mov r0, #0
		bl isButtonPressed
		cmp r0, r4
		pop {lr}
		pop {r0-r3}
		bgt isPressed
		blt isReleased
		b continue
		
		isPressed: add r4, #1
					b continue
		isReleased: add r2, #1
					sub r4, #1
					b continue
	
		continue:
		push {r0-r3}
		push {lr}
		mov r0, #3
		bl isButtonPressed
		cmp r0, #0
		pop {lr}
		pop {r0-r3}
		bne exit
		b loop
		
	exit:
		pop {r4}
		bx lr
		