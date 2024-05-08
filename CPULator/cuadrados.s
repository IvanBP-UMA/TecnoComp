.data
num: .word 5
res: .word 0

.text
.global main
main:
ldr r1, =num
ldr r0, [r1]
push {lr}
bl cuad
pop {lr}
ldr r1, =res
str r0, [r1]
bx lr

cuad:
	cmp r0, #1
	mov r1, #1
	beq base
	mul r1, r0, r0
	push {lr}
	push {r1}
	sub r0, #1
	bl cuad
	pop {r1}
	pop {lr}
	add r1, r1, r0
	
	base:
		mov r0, r1
		bx lr
	
	