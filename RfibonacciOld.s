.data
minumr: .word 7
res: .word 0
	
.text
.global main
main: 
ldr r1, =minumr
ldr r0, [r1]
push {lr}
bl fib
pop {lr}
ldr r1, =res
str r0, [r1]
bx lr

fib:
	cmp r0, #1
	ble base
	
	push {r0}
	sub r0, #1
	push {lr}
	bl fib
	pop {lr}
	mov r1, r0
	pop {r0}
	
	sub r0, #2
	push {lr}
	push {r1}
	bl fib
	pop {r1}
	pop {lr}
	mov r2, r0
	
	add r0, r1, r2
	
	
	base:
		bx lr
		