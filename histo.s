.data
tam: .word 11
vector1: .word 1, 2
vector2: .word 1, 2, 1, 2, 3, 2, 4, 1, 2, 2, 3
vector3: .word 0, 0

.text
	push {lr}
	ldr r0, =vector1 // en r0 cargamos direccion del vector1
	ldr r1, =vector2 // en r1 cargamos direccion del vector2
	ldr r2, =tam 
	ldr r2, [r2] // en r2 el tamaño del vector
	ldr r3, =vector3 // en r3 cargamos direccion del vector3
	bl histo // llamamos a la funcion
	pop {lr}
	bx lr

histo: 
	push {lr}
	push {r4-r5}
	mov r5, #2
	mov r4, r0
	loop: 
		cmp r5, #0
		beq exitHisto
		push {r1-r3}
		mov r3, r2
		ldr r2, [r4], #4
		mov r0, r1
		mov r1, r3
		bl count
		pop {r1-r3}
		str r0, [r3], #4
		sub r5, #1
		b loop
		
	exitHisto:
		pop {r4-r5}
		pop {lr}
		bx lr

count: 
	mov r3, #0
	push {r4}
	for: cmp r1, #0
		beq exitCount
		ldr r4, [r0], #4
		cmp r4, r2
		addeq r3, #1
		sub r1, #1
		b for
		
	exitCount: mov r0,r3
		pop {r4}
		mov pc, lr
 	