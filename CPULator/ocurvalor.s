.data
tam: .word 8
ocur: .word 0
vector: .word 2, 2, 2, 5, -4, 8, 2, 0
val: .word 2

.text
.global main
main: ldr r0, =tam
	ldr r1, [r0]
	ldr r0, =val
	ldr r2, [r0]
	ldr r3, =vector
	mov r0, #0
	
for: cmp r1, #0
	beq end
	ldr r4, [r3], #4
	cmp r4, r2
	addeq r0, #1
	sub r1, #1
	b for
	
end: ldr r1, =ocur
	str r0, [r1]
	bx lr
	
	