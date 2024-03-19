.data
len:        .word 8
datos:      .word 8,-3,4,-7,9,-7,6,-1
res:        .word 0
 
.text
.global main
main:
	ldr r0, =len
	ldr r1, [r0]
	ldr r2, =datos
	@ r3=max; r4=min
	ldr r3, [r2]
	ldr r4, [r2], #4
	sub r1, #1

for: cmp r1, #0
	beq end
	ldr r5, [r2], #4
	cmp r5, r3
	movgt r3, r5
	cmp r5, r4
	movlt r4, r5
	sub r1, #1
	b for
	
end: 
	ldr r0, =res
	sub r5, r3, r4
	str r5, [r0]
	bx lr