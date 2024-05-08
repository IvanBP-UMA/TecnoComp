.data
search: .word 8
res: .word 0
	
.text
.global main
main: 
ldr r1, =search
ldr r0, [r1]
mov r1, #0
mov r2, #1
push {lr}
bl Rfibonacci
pop {lr}
ldr r1, =res
str r0, [r1]
bx lr

Rfibonacci:
	cmp r0, #0
	ble base
	
	push {lr}
	add r1, r1, r2
	mov r3, r1
	mov r1, r2
	mov r2, r3
	sub r0, #1
	bl Rfibonacci
	pop {lr}
	
	
	base:
		mov r0, r1
		bx lr
		