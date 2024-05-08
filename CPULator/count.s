.data
tam: .word 10
vector: .word 1, 2, 3, 4, 1, 2, 1, 2, 5, 6
val: .word 1
res: .word 0

.text
 push {lr}
 ldr r0, =vector // en r0 cargamos direccion del vector
 ldr r1, =tam 
 ldr r1, [r1] // en r1 el tamaño del vector
 ldr r2, =val
 ldr r2, [r2] // en r2 el valor a buscar
 bl count // llamamos a la funcion
 ldr r1, =res 
 str r0, [r1] // almacenamos en res el valor devuelto por la funcion (r0)
 pop {lr}
 bx lr

count:
	mov r3, #0
	push {r4}
	for: cmp r1, #0
		beq exit
		ldr r4, [r0], #4
		cmp r4, r2
		addeq r3, #1
		sub r1, #1
		b for
		
	exit: mov r0,r3
		pop {r4}
		mov pc, lr
	
	
	