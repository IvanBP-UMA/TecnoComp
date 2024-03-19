.data
tam:   .word 8
datos: .word 2, 4, 6, 8, -2, -4, -6, -7
res:   .word 0

.text
.global main
main:
	ldr r0, =tam
	ldr r1, [r0]
	ldr r2, =datos
	ldr r3, [r2], #4
	sub r1, #1
	
for: cmp r1, #0
	beq end
	ldr r4, [r2], #4
	cmp r4, r3
	movgt r3, r4
	sub r1, r1, #1
	b for

end:
	ldr r0, =res
	str r3, [r0]
	bx lr



	
	