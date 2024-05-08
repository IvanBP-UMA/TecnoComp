.data
tam: .word 8
pos: .word 0
vector: .word 2, -3, 6, 5, -4, 8, 1, 0
val: .word -4

.text
.global main
@ r1=tam r2=valorBuscado
main: ldr r0, =tam
	ldr r1, [r0]
	ldr r0, =val
	ldr r2, [r0]
	ldr r0, =vector
	ldr r3, [r0]
	mov r4, #-1
	
for: cmp r1, #0
	beq end
	cmp r2, r3
	beq exit
	
	ldr r3, [r0, #4]!
	sub r1, #1
	b for
	
exit: ldr r0, =tam
	ldr r2, [r0]
	sub r4, r2, r1
	b end
	
end: ldr r0, =pos
	str r4, [r0]
	bx lr